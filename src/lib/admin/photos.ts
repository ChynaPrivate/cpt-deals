'use client';

/**
 * Photographs of specials boards.
 *
 * A phone photo is 3–5 MB, and it is usually taken on mobile data in a
 * restaurant. Everything is downscaled and re-encoded before it leaves the
 * device, which turns a 4 MB photo into roughly 200 KB with no loss of
 * legibility for a printed board.
 */
import type { SupabaseClient } from '@supabase/supabase-js';
import { SUPABASE_URL } from '@/lib/supabase/config';

export const PHOTO_BUCKET = 'special-photos';
const MAX_EDGE = 1600;
const QUALITY = 0.82;

/** Downscale and re-encode in the browser. Falls back to the original on failure. */
export async function compressImage(file: File): Promise<Blob> {
  try {
    const bitmap = await createImageBitmap(file);
    const scale = Math.min(1, MAX_EDGE / Math.max(bitmap.width, bitmap.height));
    const width = Math.round(bitmap.width * scale);
    const height = Math.round(bitmap.height * scale);

    const canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    const context = canvas.getContext('2d');
    if (!context) return file;
    context.drawImage(bitmap, 0, 0, width, height);
    bitmap.close();

    const blob = await new Promise<Blob | null>((resolve) =>
      canvas.toBlob(resolve, 'image/jpeg', QUALITY),
    );
    return blob && blob.size < file.size ? blob : file;
  } catch {
    // HEIC on an older browser, an odd codec — send the original rather than fail.
    return file;
  }
}

export interface UploadedPhoto {
  /** Path inside the bucket, used to mint signed URLs for viewing. */
  path: string;
  /** Canonical object URL. Stored on the record; reading it still needs auth. */
  url: string;
}

export async function uploadPhoto(
  supabase: SupabaseClient,
  file: File,
  slugHint: string,
): Promise<UploadedPhoto> {
  const compressed = await compressImage(file);
  const safeHint =
    slugHint
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '')
      .slice(0, 40) || 'capture';
  // Date and a random suffix: readable in the bucket, no collisions.
  const stamp = new Date().toISOString().slice(0, 10);
  const suffix = crypto.randomUUID().slice(0, 8);
  const path = `${stamp}/${safeHint}-${suffix}.jpg`;

  const { error } = await supabase.storage.from(PHOTO_BUCKET).upload(path, compressed, {
    contentType: 'image/jpeg',
    upsert: false,
  });
  if (error) throw new Error(`Could not upload the photo: ${error.message}`);

  return {
    path,
    url: `${SUPABASE_URL}/storage/v1/object/${PHOTO_BUCKET}/${path}`,
  };
}

/** A short-lived URL an <img> can actually load from the private bucket. */
export async function signedPhotoUrl(
  supabase: SupabaseClient,
  path: string,
  seconds = 3600,
): Promise<string | null> {
  const { data, error } = await supabase.storage.from(PHOTO_BUCKET).createSignedUrl(path, seconds);
  return error ? null : data.signedUrl;
}

/** Recover the bucket path from a stored canonical URL. */
export function pathFromPhotoUrl(url: string | null): string | null {
  if (!url) return null;
  const marker = `/object/${PHOTO_BUCKET}/`;
  const index = url.indexOf(marker);
  return index === -1 ? null : url.slice(index + marker.length);
}
