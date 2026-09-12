# LinnStrument light schemes: shared spec

Shared by linnkit (Go, `~/code/linnkit`, `internal/lights`) and linn.lights (Max, `patchers/linn.lights.js`).
linnkit implements first; its `grid` command output is the reference that linn.lights is tested against pad by pad
(`patchers/tests/fixtures/linnkit-grids/`). Written 2026-09-12. These are first versions for the user's
experiments; colours and rules may change afterwards, and schemes that don't prove useful will be dropped.

## Common ground

- Everything is per scale degree: a scheme gives every degree `d` in `0..n-1` a colour and a short label.
  Pads are painted as now (linnkit `lights.Paint`): a pad playing MIDI note `m` shows degree
  `((m - root) mod n)`; pads outside MIDI 0..127 are off with label `!!`.
- Terms, as in linnkit `internal/theory`:
  - `cents[d]`: degree `d` in cents above the root (`cents[0] = 0`); `period` = the last pitch of the `.scl`.
  - `step = period / n` (linnkit `Structure.EqualStep`).
  - `ratio[d]`: the exact ratio when the `.scl` writes one, else none.
  - `nearestDegree(c)`: linnkit's (smallest |error| over degrees `0..n-1`, first one wins on ties).
  - `tol = min(15, 0.35 * step)`: the ji tolerance.
  - `g`: the generator in degrees. The `generator` setting when > 0, else `nearestDegree(1200*log2(3/2))`.
  - `t = nearestDegree(1200*log2(5/4))`.
  - chain: degree of chain position `k` is `(k * g) mod n` (index arithmetic, as linnkit's names/MOS do).
- The root (degree 0) takes the root colour (magenta by default) with its usual label, in every scheme except
  `factors` (see there). Unlit = CC22 0.
- CC22 colours: red 1, yellow 2, green 3, cyan 4, blue 5, magenta 6, white 8, orange 9, lime 10, pink 11.
- New per-scale settings (next to `limit`, `root`, `offset`):
  - `generator` (degrees, 0 = automatic, the degree nearest 3/2)
  - `mossize` (notes, 0 = automatic, linnkit's `DefaultMOS` size)
  - `harmonics` (16 = harmonics 1..16, 32 = harmonics 16..32; default 16)
  - `subharmonics` (0/1, default 1)
- New schemes, in this order after the existing `root ji names mos`:
  `chain moskeys wijmenga kite factors steps nested consonance harmonics`.

## chain (Lumatone 31-EDO, after Kite's colour notation)

Source: https://www.31edo.com/keyboard. Colours by position on the chain of fifths from the root.

- Chain position of degree `d`: the `k` with `(k * g) mod n == d`, taken in the range
  `[2 - floor((n-1)/2), 2 + ceil((n-1)/2)]` (centred on D, the middle of C G D A E).
  Degrees the chain never reaches (when `gcd(g, n) > 1`) are unlit, no label.
- Colours by `k`: `0..4` white, `5..8` yellow, `-1..-4` green, `9..12` blue, `-5..-8` red, `13..16` cyan,
  `-9..-12` pink, anything else unlit.
- Label: the chain note name. `k = -1..5` are F C G D A E B; name index `(k + 1) mod 7`, accidentals
  `floor((k + 1) / 7)`: 1 = `#`, 2 = `x`, -1 = `b`, -2 = `bb`, beyond that repeat the sign (`###`, `bbb`).
- Examples:
  - 12-EDO (`g = 7`), `k` in `[-3, 8]`: C G D A E white, B F# C# G# yellow, F Bb Eb green.
  - 31-EDO (`g = 18`), `k` in `[-13, 17]`: white 5, yellow 4, green 4, blue 4, red 4, cyan 4, pink 4,
    2 unlit (k = 17 `Ax`, k = -13 `Gbb`).

## moskeys (a MOS as white keys: Lumatone Valentine 15L1s, Stephen Weigel's MOS keyboards)

- The MOS: linnkit `MOSChoice{Generator: g, Size: m, Down: 1}` with `m` = `mossize` when > 0, else
  `DefaultMOS`'s size (7, else 5, 6, 8..12). A user-chosen `(g, m)` is lit even if it isn't a MOS.
- Colours: MOS degrees white, all other degrees blue.
- Labels: none (root keeps its root label).
- Example: 31-EDO, generator 2, size 16 outlines Valentine 15L1s (the degrees 0, 2, ..., 28 and 29).

## wijmenga (Wijmenga, "The fringe world of microtonal keyboards", Huygens-Fokker 2013)

Source: https://www.huygens-fokker.org/docs/Wijmenga_Microtonal_Keyboards.pdf (pages 19-22).

- Syntonic comma in degrees: `c = 4g - 2n - t`. Meantone when `c mod n == 0` (12, 19, 31, 43 EDO).
- Meantone pattern, by chain position `k` (same range as `chain`), rows of 7-5-7-5-7:
  - `-1..5` naturals: green (Wijmenga: green is the middle)
  - `6..10` sharps: white
  - `-6..-2` flats: unlit (his black)
  - `11..17` outer sharp side: yellow (near)
  - `-13..-7` outer flat side: blue (distant)
  - anything else unlit.
- Non-meantone pattern ("four seasons", Vos/Hanson keyboards), with `N` = the naturals `k = -1..5` as degrees
  and `s = 2t - g` (25/24 in degrees):
  - `N`, `N + c`, `N - c` (three rows of fifths a comma apart): white
  - `N + s`: green (sharps); `N - s`: orange (flats, his brown)
  - precedence white, green, orange; everything else unlit.
- Labels: none.
- Example: 53-EDO (`g = 31`, `t = 17`): `c = 1`, `s = 3`.

## kite (Kite Giedraitis's colour notation)

Source: https://en.xen.wiki/w/Color_notation.

- The ratio of each degree: `ratio[d]` when written; else the ratio that ji uses for it: the first entry of
  linnkit's `justRatios(limit, 400)` (sorted by limit, then n*d) whose `nearestDegree` is `d` within `tol`.
  No ratio: unlit.
- Class: the highest prime `p >= 5` in the ratio, over if it is in the numerator, under if in the
  denominator; no prime above 3: wa. Limit: the `limit` setting (as ji).
- Colours and labels: wa (3-limit) white `wa`; 5 over yellow `yo`, under green `gu`; 7 over blue `zo`,
  under red `ru`; 11 over lime `ilo`, under orange `lu`; 13 over pink `tho`, under cyan `thu`.
- Ratios with two primes above 3 (e.g. 35/32) take the highest prime (Kite would name it zoyo).

## factors (Wilson Eikosany Lumatone pack: colours mixed like factors)

Source: https://github.com/diegovdc/wilson-22-tone-eikosany-lumatone-pack.

- The ratio of each degree as in `kite`. The primes 3, 5, 7 in it (numerator or denominator) switch the
  LED channels red, green, blue:
  - 3 red, 5 green, 7 blue, 3·5 yellow, 5·7 cyan, 3·7 magenta, 3·5·7 white; none of them: unlit.
  - 11 and 13 don't count.
- The root (1/1) is unlit here, since magenta already means 3·7; its label stays `R`.
- Label: the product of the primes present, e.g. `3`, `35`, `357`.

## steps (step sizes)

- `stepsize[d] = cents[d+1] - cents[d]` (the last step ends at the period).
- Group sizes as linnkit `groups(steps, 0.5)`; classes ordered largest first.
- Colours by number of classes `k`: 1: white; 2: white, blue; 3: white, green, blue; 4 or more: white, then
  green, cyan, yellow, orange, lime, pink for the middle classes, and blue for the smallest.
- Labels: `k = 1`: `L`; 2: `L s`; 3: `L M s`; 4 or more: `1..k` (1 = largest).

## nested (nested MOS layers along the generator)

- Chain from one generator below the root: positions `-1, 0, 1, 2, ...` (Down 1, as linnkit's MOS).
- Layer sizes: the sizes `m >= 5`, `m < n`, whose chain of `m` notes (positions `-1..m-2`) is a MOS
  (linnkit `isMOS`), smallest first; the first 4 are used.
- A degree belongs to the first layer whose chain contains it. Colours: layer 1 white, 2 yellow, 3 blue,
  4 green; degrees in no layer unlit. Labels `1`-`4`.
- Example: 31-EDO, `g = 18`: layers 5, 7, 12, 19 (pentatonic, diatonic, chromatic, 19 of 31).

## consonance (bands by odd limit)

- The ratio of each degree: `ratio[d]` when written; else linnkit's `NearestRatio(cents[d], tol)`
  (up to 23-limit, odd limit 63, denominator 64).
- Odd limit of `n/d` = `max(odd part of n, odd part of d)`.
- Colours: odd limit `<= 5` white, `<= 9` green, `<= 15` blue, higher cyan; no ratio unlit.
- Label: the ratio, e.g. `3/2`.

## harmonics (harmonic and subharmonic series of the root)

- Harmonics `h` = 1..16 (`harmonics` = 16) or 16..32 (`harmonics` = 32).
- A harmonic's pitch `1200*log2(h)` reduced into `[0, period)`; its degree is the nearest degree with the
  period counted as degree 0 again (so 1190 cents can land on the root), if within `tol`.
  Subharmonics (setting on): the same for `-1200*log2(h)`.
- Colours: harmonic only yellow, subharmonic only blue, both white; root as usual.
- Labels: the smallest harmonic number, e.g. `7`; subharmonic only `u7`.
