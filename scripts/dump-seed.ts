import { writeFileSync } from 'node:fs';
import { joinSeed } from '../src/lib/data/seed';
writeFileSync('/tmp/seed.json', JSON.stringify(joinSeed()));
console.log('specials:', joinSeed().length);
