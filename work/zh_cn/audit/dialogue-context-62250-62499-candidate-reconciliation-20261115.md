# Candidate Reconciliation: IDs `62250`-`62499`

- Date: 2026-11-15.
- Rechecked five new candidates against the active Korean text and English,
  Japanese, and Chinese sources.
- Corrected `62363`; three other candidates already had supported wording.
  `62474` remains held because the sources do not resolve what “the rest of
  Dolve Arne” refers to.
- Rechecked six earlier candidates; corrected the missing English pairing at
  `62327`, retained three supported translations, and kept two source/context
  questions open.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62363` | Corrected | The corresponding `base` item `Flawless Slaughtering Shaft` is `흠 없는 도살 축`. The current `학살 장창` misidentifies the component and does not pair the full item title. The Mitharan shaft family was cross-checked as a group; see below. |
| `62454` | Retained | `Scourge Damage` already uses `역병 피해`, matching `Scourge Resistance` and the Japanese plague terminology. |
| `62459` | Retained | `너희 필멸자 대사들(Mortal Ambassadors)` is a natural plural and pairs the complete English phrase. |
| `62474` | Held | English `with the rest of Dolve Arne` remains ambiguous. Japanese supports leaving the items to decay with Dolve Arne, but other locale readings and the prior context review do not establish whether this means the place, its people, or its belongings. |
| `62486` | Retained | All three formal castes are paired: `학자(Scholars), 템플러(Templars), 프레토리안 근위병(Praetorians)`. |

## Related Term and Pairing Checks

- Cross-checked all 15 `Flawless Mitharan ... Shaft` rows in `default`
  against the corresponding `base` component labels. `base` consistently
  uses `축` for this component, including `Flawless Slaughtering Shaft`
  (`base:3002`). Thirteen inconsistent `default` rows were aligned to `축`
  and given complete English title pairings; `39238` and `54448` already
  matched. No physical object beyond the source term `Shaft` was inferred.
- The existing component-identity uncertainty at `22881` remains open;
  its Korean `확대경` modifier was preserved while aligning only the
  component term and full-title pairing.
- `62327` now pairs the creature term as `스프라이트(Sprite)`. This
  ID-scoped correction does not apply a blind replacement to every use of
  `Sprite`.
- The source confirms `62454` already uses the matching `역병` term; no
  broader replacement was needed.

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62309` | Held | English/Japanese and Chinese still differ in the force of “You're better than this”; preserve the meaning hold. |
| `62312` | Held | Japanese identifies a fire-attack potion, while English leaves “a little fire” implicit and Chinese does not name a potion. Do not add or remove the item without stronger evidence. |
| `62319` | Retained | `그래, 안타까워. 혼자서는 의식을 치를 수 없으니까` is a natural rendering of grieving that the rite cannot be performed alone. |
| `62327` | Corrected | Added the missing English pairing to the creature name without changing the sentence or its casual register. |
| `62380` | Retained | The self-introduction already uses consistent conversational plain style, matching Japanese. |
| `62402` | Retained | The current question, material comment, and promise to await findings consistently use conversational plain style. |

## Holds and Formatting

- The kinship hold at `62496` remains unresolved: English does not specify
  older or younger sister, while Japanese and Chinese conflict.
- Existing component and source holds at `22881`, `62309`, `62312`, and
  `62474` remain recorded; no unsupported object identity, relationship, or
  location reading was added.
- Embedded-line-ending holds remain unchanged. No paragraph or runtime-token
  layout was normalized.
- No speaker attribution or dialogue order was inferred from asset links.

## Result and Verification

- Five new candidates were reconciled: `62363` was corrected, `62454`,
  `62459`, and `62486` already had supported wording, and `62474` remains
  held.
- Six earlier candidates were rechecked. The candidate pool advances only
  for the five new IDs; cumulative reconciliation is `3,446 / 4,026`
  (`85.59%`), with `580` remaining.
- Fourteen Korean rows changed in this pass, including 13 Mitharan shaft
  family rows and `62327`. Their ledger source fingerprints were refreshed.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
