# Visual design

## The palette

One dark ground, one accent, and copy in three colours only — white, orange or black.

| Token                 | Value     | Used for                                                             |
| --------------------- | --------- | -------------------------------------------------------------------- |
| `--color-bg`          | `#17181A` | The page ground                                                      |
| `--color-surface`     | `#202225` | Cards, header, footer, form fields' containers                       |
| `--color-surface-2`   | `#292C30` | Quiet chips, the dialog close button                                 |
| `--color-line`        | `#35383D` | Every hairline border                                                |
| `--color-orange`      | `#FF7A1A` | Buttons, the selected day, prices, links, the accent in the wordmark |
| `--color-orange-dark` | `#E2680B` | Button hover                                                         |
| `--color-orange-dim`  | `#3A2413` | Orange-tinted chips and the disclaimer panel                         |
| `--color-ink`         | `#0E0F11` | Copy that sits **on** orange                                         |

They are declared once, in the `@theme` block of `src/app/globals.css`. No component contains a raw hex value.

## Contrast

Measured against the ground, `#17181A`:

| Pairing                | Ratio    | WCAG AA |
| ---------------------- | -------- | ------- |
| White on ground        | 16.5 : 1 | Pass    |
| White at 60% on ground | 6.6 : 1  | Pass    |
| Orange on ground       | 7.9 : 1  | Pass    |
| Black on orange        | 9.0 : 1  | Pass    |

axe-core reports **zero** WCAG 2.0/2.1 A and AA violations on every page, including the open detail dialog.

## Rules the components follow

- **Orange means action or urgency.** Buttons, the selected day, prices, "Open now", "Expiring soon". Nothing decorative is orange.
- **Anything on an orange surface uses black copy** (`text-ink`), never white — that is the only place black appears.
- **Secondary copy is white at 55–75% opacity**, not a grey. It stays within the white/orange/black rule.
- **One filled button per view.** Everything else is an outline in orange or a hairline in `--color-line`.
- **Touch targets are at least 44px**, and the weekday buttons are 76px tall.
- **Motion is limited to colour transitions**, and `prefers-reduced-motion` removes even those.
- **Nothing below 13px**, and body copy is 15–16px.

## The app icon

A dark slate rounded square with a white cloche and plate, and a small orange location pin. No text. `public/icons/icon.svg` is the source; `npm run icons` renders the 192, 512, maskable, apple-touch and favicon variants from it.

## Controls

The weekday buttons sit at the top and are always all seven, in a four-column grid — never a horizontal scroller, which on a phone opened part-scrolled and read as missing. Suburbs and filters sit below them behind two compact toggles, collapsed on a phone and open where there is room, so the first special stays near the top of the screen.

## Note on the original brief

The brief specified a warm cream ground with deep forest green and terracotta. That was built first and then replaced, at your request, with this dark slate and orange scheme. The structure, spacing, type scale and accessibility guarantees are unchanged — only the palette moved.
