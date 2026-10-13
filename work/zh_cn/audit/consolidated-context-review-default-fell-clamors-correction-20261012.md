# Audit Correction: `fell clamors` at `default` ID 48358

- Date: 2026-10-12.
- Decision: D-19464.
- Scope: Revisit only the phrase changed in D-19463 at ID 48358. The approved
  House of Valor and Engard name corrections remain in place.

## Finding

English says `the fell clamors of the combatants`. Japanese describes the
combatants' `狂暴` commotion/noise, while Chinese describes their low,
rumbling commotion. These support harsh, forceful, or disturbing noise; they
do not specifically establish that the sound is an omen. Korean `불길한`
added that narrower implication. Restore the pre-D-19463 `거친 함성`, which
preserves the source's force without inventing foreboding.

| ID | Previous active phrase | Corrected phrase |
| ---: | --- | --- |
| 48358 | `싸움꾼들의 불길한 함성` | `싸움꾼들의 거친 함성` |

This is a correction to the wording of an already accepted key, not a new
disposition. Do not recount ID 48358 or alter the D-19463 totals.

## Verification

- Compared English, Japanese source and preserved draft, Chinese, and active
  Korean by `ID_Linha`.
- Only the exact Korean phrase above changed. Reversing that substitution
  reconstructs the pre-edit active file byte-for-byte.
- BOM remains present; 72,011 CRLF and 73 pre-existing bare-LF endings remain.
- Pre-edit SHA-256:
  `a65f8fddb68d8fc333593f488344ec2f6f707ad49b5a621020371d0c00068717`.
- Post-edit SHA-256:
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-fell-claim-revision-D19464/locatexts_zh_cn.koalocatext_default.csv`.
- Totals remain **2,349 accepted / 25,007 not an issue / 11,168 uncertain**
  (38,524). Continue at D-19465.
