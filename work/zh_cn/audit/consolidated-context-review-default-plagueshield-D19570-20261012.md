# Plagueshield Term and Context Review (D-19570)

- Date: 2026-10-12.
- Scope: all 30 open default Plagueshield findings, plus a linked spelling
  correction at ID 60756.
- Evidence: English is the semantic anchor; Japanese provides voice and
  terminology support; Chinese, German, Spanish, French, and Italian are
  cross-checks. Official Korean manual pages 6, 8, and 9 were read for
  inventory, consumables, potion-making, and disease context. No PAK or
  PAK-derived material was used.

## Findings

English repeatedly identifies Plagueshield as a finite supply that is
delivered in parcels, replenished, consumed, depleted, made by a healer, and
used to treat people with a plague. ID 4574 explicitly calls it medicine;
IDs 12465, 18131, and 41687 explicitly connect it with treating sick people
or medicinal parcels. English, Japanese, Chinese, German, Spanish, French,
and Italian agree on the medicinal/remedy sense. The official manual does
not name Plagueshield, but pages 6 and 8 describe consumables and
alchemy-made potions, while page 9 describes disease and treatment. This
context rules out interpreting the Didenhil Plagueshield as a person, rank,
or physical shield.

Use `역병 방호제` for the general Plagueshield supply in the reviewed hold
set. Keep the already accepted, explicitly composed `역병 방패 팅크제`
label at IDs 19347 and 25484 as the established tincture-item wording;
ID 19347 is source-faithful and is closed without changing its text.
`Pledgeshield` is a distinct term. At ID 63752, English, Japanese, and
Chinese say Plagueshield; the Korean `서약방패병(Pledgeshield)` was a
source-term mix-up and is corrected.

| Finding | IDs | Disposition | Decision |
| --- | --- | --- | --- |
| General supply name and its inflected uses | 3761, 4574, 7553, 8947, 9871, 10361, 12465, 12914, 15337, 16063, 28211, 31671, 33430, 33724, 34919, 36638, 39541, 39762, 40597, 48782, 55054, 56239 | accepted | Replace inconsistent transliterations and literal forms with `역병 방호제`; retain source names in parentheses where already present. |
| Kaharine's response to the medicine | 47275 | accepted | Render `taking well to it` as `치료에 잘 반응하고 있대`, supported by the English treatment idiom, Japanese recovery wording, and Spanish treatment-response wording; Chinese's adaptation wording is compatible. |
| Plagueshield / Pledgeshield mix-up | 63752 | accepted | Correct `다른 서약방패병(Pledgeshield)` to `다른 역병 방호제(Plagueshield)`, matching the English, Japanese, and Chinese row. |
| Extra Plagueshield | 64448 | accepted | Replace the unsupported count of one person with additional medicine: `역병 방호제가 더 마련됐으니`. |
| Duration question | 7553 | not an issue | English leaves the object of `how long` unstated. Korean preserves that omission; no patient-lifespan or supply-duration claim is added. |
| Remaining held rows | 176, 18131, 19347, 25755, 37622 | not an issue | The objective, parcel recovery, explicitly named tincture, found item, and replenishment line all preserve the source meaning and voice. |
| Previously closed linked row | 60756 | accepted; supersedes its D-17919 `not an issue` entry | Correct the misleading `플래그실드` rendering to `역병 방호제`; the English, Japanese, and Chinese identify the same medicine as in the Didenhil exchange. |

At ID 48782, Japanese and the linked quest objective support that the three
parcels are missing; the Korean's `사라졌어` does not add an unsupported
event. At ID 7553, the medicine's identity is now settled, while the
English's separate duration ellipsis remains intentionally unexpanded.

## Edits and Verification

- The 25 edited uncertain rows are IDs 3761, 4574, 7553, 8947, 9871, 10361,
  12465, 12914, 15337, 16063, 28211, 31671, 33430, 33724, 34919, 36638,
  39541, 39762, 40597, 47275, 48782, 55054, 56239, 63752, and 64448.
- ID 60756 was additionally corrected from an already closed row.
- Only `Texto` cells changed. There are 65,135 records in the same ID order;
  all other fields and bytes reconstruct exactly from the pre-edit backup.
- UTF-8 BOM is preserved. Mixed outer line endings remain 72,011 CRLF and
  73 bare LF records.
- Pre-edit default SHA-256:
  `6d6b31f9d1fae61826541a1d3176dad6f18a896b7b87ea44e4c7c05b364fe122`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-plagueshield-D19570/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `6b9d5d63ab5197057bcb30dc58cf5d35e2ee52bd91aa1cd737d1a7a6c2faedb6`.
- The 30 previously uncertain rows resolve as 25 accepted and five `not an
  issue`; ID 60756 changes one previously counted `not an issue` row to
  accepted. Totals: **2,490 accepted / 25,372 not an issue / 10,662
  uncertain** (38,524).
- Next hold: **D-052, default ID 180**, `Fear Gorta` / `Sons of Laz`.

This closes the Plagueshield review cluster, not the wider default audit.
