# Disposition Batch: `default` IDs 62851-62900

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Four accepted targeted corrections, 30 `not an issue` IDs, and 17
  uncertain IDs. ID 62862 has an accepted sentence correction and a separate
  unresolved rank/name question, so it appears in both categories. These are
  working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18034 | 62862 | `... 승진에서 몇 번이나 밀려난 끝에 그만뒀어.` | `... 승진에서 너무 여러 번 밀려났어.` | English idiom conveys repeated denial and frustration but does not explicitly state resignation; Japanese likewise omits quitting. Remove the definite added event while retaining “one too many times.” |
| D-18035 | 62866 | `물론 투아타를 몰아내는 거지.` | `물론 투아타를 궤멸시키는 거지.` | English says “Destroying the Tuatha”; Japanese and Chinese also use destruction/annihilation language. “Drive out” weakens the stated objective. |
| D-18036 | 62876 | `... 왕실 근위대에 산악지대로 퇴각하라고 명하셨어.` | `... 왕실 근위대에 산악지대로 들어가라고 명하셨어.` | English says the King ordered them “into the mountains”; Japanese and Chinese say go/enter the mountains. Retreat adds an unsupported prior withdrawal. |
| D-18037 | 62879 | `부인께서 제정신이 아니셔.` | `부인께서 몹시 동요하셨어.` | “Beside herself” describes severe distress/agitation, not necessarily mental illness. Japanese says she has lost composure; the correction avoids an unnecessarily clinical or insulting reading. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18038 | 62852 | The city's “great island of progress” praise and `Beckoned` address are retained; the literal/geopolitical sense and canonical title remain context-dependent. |
| D-18038 | 62853 | Reciprocal allegiance, battle imagery, and “seasons” are retained; Airmer's canonical Korean name and the exact duration remain open. |
| D-18038 | 62858 | `The Freemen` may be a formal faction name; Korean currently reads as a generic plural. |
| D-18038 | 62862 | The sentence's unsupported explicit resignation is corrected under D-18034; `Warsworn hireling` rank and canonical name remain unresolved. |
| D-18038 | 62863 | `Communing with the Hyperian` is rendered as communication; the ritual/lore sense and exact threat remain unclear. |
| D-18038 | 62867 | The five-line warning poem and all four embedded line breaks are preserved; the fallen fools, final image, and meter remain interpretively uncertain. |
| D-18038 | 62869 | Ice weapons, elite Fae patrol, and thinning veils are retained; `Balla Lach` spelling remains provisional. |
| D-18038 | 62870 | The count of 15 glands and anti-venom purpose are correct; Syllareta/Canneroc spellings remain provisional. |
| D-18038 | 62871 | The mage collective and famous members are retained; the canonical Korean form of `Scholia Arcana` remains open. |
| D-18038 | 62882 | The conjured remnants, their defeat, and the fallen barrier are retained; the source's unusual “vestiges of your past” construction remains context-dependent. |
| D-18038 | 62884 | Cydan's loyalty to the High King and refusal to bow to the Tuatha are retained; title and “noble tradition” terminology need lore confirmation. |
| D-18038 | 62888 | The followers' ongoing care and the gods' disfavor are retained; the event and causal context are unspecified. |
| D-18038 | 62892 | The creature remains unidentified and at least human-sized; no identity is inferred. |
| D-18038 | 62893 | The helper, Witch Knight, keep, and Tuatha general role are retained; canonical spellings of Audra Firan, Khleran, and Ghennig remain open. |
| D-18038 | 62894 | The derided Chaos-reagent/Chaos-Potion claim and Alchemy requirement are retained; the exact recipe and skeptical force of “supposedly” need context. |
| D-18038 | 62897 | Korean uses plural “warriors”; English leaves “the best” implicit, while Japanese suggests one fighter and Chinese uses plural. Preserve the current draft pending match context. |
| D-18038 | 62899 | Return to the Great Cycle and self-offering to the Flowering are retained; formal Korean names for the cycle and ceremony remain provisional. |

## Not an Issue

Decision D-18039 records these 30 IDs: 62851, 62854-62857, 62859-62861,
62864-62865, 62868, 62872-62875, 62877-62878, 62880-62881, 62883,
62885-62887, 62889-62891, 62895-62896, 62898, and 62900. These rows
preserve available meaning, voice, labels, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 62851-62900 once,
  in identical ascending order.
- ID 62867 retains its five-line poem and four embedded line breaks in all
  four locales. The 15 poison glands at ID 62870 remain 15. No runtime
  markers occur in this batch.
- Rechecked historical questions for the city/Beckoned, Airmer, Freemen,
  Warsworn hireling, Hyperian communion, Arcane Veil poem, Balla Lach,
  Syllareta/Canneroc, Scholia Arcana, Mitharu blessing, conjured remnants,
  Cydan/High King, divine disfavor, unknown creature, Audra/Khleran/Ghennig,
  Chaos Potion tome, final-match opponent, and Great Cycle/Flowering.
- Pre-edit CSV SHA-256:
  `8195382d5065ec32df5c4b42d1dee026a3e17fdfd11db9a500b3e4115ed19f3a`.
  Post-edit SHA-256:
  `8816ee65510e160de2608425d217dfc07cdce0daa4b56bc77547200e903e622a`.
  Only `Texto` at IDs 62862, 62866, 62876, and 62879 changed. A byte-level
  comparison against the batch-start backup verified the four exact
  replacements and that every other byte is unchanged. UTF-8 BOM, 65,135
  records, key order, and outer record separators are preserved. The poem's
  internal line breaks are unchanged. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62851/locatexts_zh_cn.koalocatext_default.csv`.
- D-18034-D-18037 record four accepted corrections, D-18038 records 17
  uncertain findings (one overlaps accepted ID 62862), and D-18039 records
  30 `not an issue` IDs. Direct register totals: 1,799 accepted, 15,686
  `not an issue`, and 12,205 uncertain (29,690 dispositions total); next
  D-18040.

Resume at `default` ID 62901; 2,234 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
