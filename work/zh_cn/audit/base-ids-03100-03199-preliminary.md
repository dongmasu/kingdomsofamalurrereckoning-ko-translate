# Preliminary Language Scan: `base` IDs 3100-3199

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3100-3199.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked source meaning, item context, and recurring names.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3115 | 오운(Ohn)의 거점 | Confirm whether `Ohn's Stand` is a named place/stronghold and whether `거점` captures its established sense. | English names `Ohn's Stand`; Japanese specifies a fortress, while Chinese is closer to Ohn's territory/land. Korean `거점` is plausible but generalizes the location type. | Medium |
| 3121 | 왕의 실패 | Recheck `Kingsfoil` as a single plant/item name rather than splitting it into “king's failure.” | English writes the compound `Kingsfoil`; Japanese renders it as “king's failure,” but Chinese identifies a king's leaf/plant. Korean follows the misleading Japanese/English word-break and produces a nonsensical item label. Verify the in-game ingredient before choosing a Korean name. | High |
| 3135 | DLC2 개발용 폼 단검 | Remove or verify `DLC2`, and account for the source's `Fancy` modifier in the item name. | English says `DEV Fancy Foam Daggers`; Japanese and Chinese mark development/test content but do not identify DLC2. The Korean adds `DLC2` without source support and omits `Fancy`. | High |
| 3140 | 혼돈의 영역에서만 발견되는 원소로 벼려낸 빛나는 차크람이다. ... 몇 안 되는 무기다. | Preserve the source's plural/pair count and reconcile the Japanese singular rendering. | English and Chinese describe `Chakrams` as “two” and then as one of a few weapons; Korean rewrites this as a singular chakram. Japanese is singular, so the exact item count should be checked against the object/context. | High |
| 3155 | 페이(Fae)의 "말돌" | Choose a natural Korean term for `speakstone` and retain the communication function. | English names a `speakstone`; Chinese says a voice-transmitting stone, while Japanese uses a “chirping stone.” Korean `말돌` is a direct compound that may not clearly communicate the object's function. | Medium |
| 3158 | 성 에드릭(St. Eadric)의 석관 | Align `St. Eadric` with the other active Korean spellings and the project's display convention. | English, Japanese, and Chinese identify Saint Eadric; other active rows vary between `에드릭` and `에이드릭`, with inconsistent treatment of the `St.` title. | Medium |

## Other Checks

- The historical source-keyed audit questions for IDs 3109, 3115, 3121, 3123,
  3130, 3170, 3172, 3179, 3185, 3187, 3188, and 3192 were checked against
  these active rows. They remain open; `Ohn's Stand`, `Kingsfoil`, `Solstice`,
  and `On Drink` are reiterated above or below.
- IDs 3100-3101 preserve the chakram and Pteryx equipment references; ID 3109
  `Robes of Sorrow` may need the same named-group/literal-sorrow distinction
  already noted elsewhere.
- IDs 3123 and 3185 identify Ethene and Mitharu; retain the established
  `미사루` deity spelling while checking whether `연도문`/`신전` are the
  intended object types.
- ID 3132 `Amrynthian Band` reasonably uses `반지`; ID 3154 keeps
  `Livrarium` as a proper name.
- ID 3159 uses `발라드 가문`, differing from the transliteration-plus-English
  form at ID 3092; this recurs in the House of Ballads display question.
- ID 3130 `Akara-Tor` remains an unresolved proper name; ID 3170 `Ash Limb`
  remains unclear as a component versus a literal limb.
- ID 3187 `Solstice` is translated as `동지`; verify whether it is a common
  seasonal term or a named item/title in context.
- The remaining inspected rows preserve their principal item, location, and
  name meanings. No structure or target keys were changed.

## Batch Status

IDs 3100-3199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
