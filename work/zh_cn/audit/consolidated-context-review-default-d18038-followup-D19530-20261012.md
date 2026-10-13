# Consolidated Context Review: D-18038 Follow-Up

- Date: 2026-10-12; decision D-19530.
- Scope: all 17 still-open `default` keys in D-18038.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, related source rows, and accepted terminology
  decisions.
- English controls meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.
- The supplied handoff's D-19504 baseline (`2,407 / 25,211 / 10,906`,
  hash `f0531257...`) was already superseded in this workspace: D-19504
  through D-19529 are recorded, and the D-19504 report identifies that hash
  as its pre-edit state. D-19530 therefore resumes the verified D-19529
  checkpoint rather than repeating D-19504.

## Decisions

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 62852 | partial accepted; retain D-18038 | Replace the incorrect player-title form `선택받은 자` with accepted `Beckoned = 부름받은 자` (D-692/D-3115/D-18212/D-19303). The city's “great island of progress” remains materially ambiguous. |
| 62853 | uncertain; retain D-18038 | Reciprocal allegiance, battle image, and “for seasons” are preserved. Airmer's canonical Korean spelling and the exact duration remain unsettled. |
| 62858 | accepted | English's capitalized standalone group `The Freemen` and Japanese group form support the accepted faction name `프리맨(Freemen)` (D-14185/D-16464/D-16754/D-16764/D-18219). |
| 62862 | partial accepted; retain D-18038 | Normalize `Warsworn` to accepted `워스원(Warsworn)` (D-2857) and `Hireling` to `고용병(Hireling)` (D-3509/D-19421). English does not establish whether this is a formal third-class rank; Japanese does, and the Galette spelling is also unresolved. The sentence correction at this ID was already accepted under D-18034 and is not recounted. |
| 62863 | not an issue; close D-18038 key | `교신` preserves the English fragment `Communing with the Hyperian` without inventing a more specific ritual. Japanese and Chinese also support contact/communication, and the need to stop him is retained. |
| 62867 | uncertain; retain D-18038 | The five-line warning and four embedded line breaks are preserved. The exact sense of “fools who fell,” the final Arcane Veil image, and poetic meter remain unresolved. |
| 62869 | uncertain; retain D-18038 | The elemental ice weapons, elite Fae warriors, and patrol of thinning veils are retained; no canonical Korean spelling for Balla Lach is established. |
| 62870 | uncertain; retain D-18038 | The count of fifteen glands and anti-venom purpose are accurate. Canonical Korean spellings for Syllareta and Canneroc remain unresolved. |
| 62871 | not an issue; close D-18038 key | The established proper name `스콜리아 아르카나` is already used; the book's famous members and mage-collective description are preserved. Japanese's academy paraphrase does not override the English institution name. |
| 62882 | not an issue; close D-18038 key | Korean preserves the English sequence: conjured vestiges of the addressee's past were slain, the barrier fell, and the speakers now face each other. Japanese supports the broad reading; no safer correction is established. |
| 62884 | not an issue; close D-18038 key | Prince Cydan's noble tradition, loyalty to the High King, and refusal to bow to the Tuatha are all retained. `고귀한 전통` and `고왕` do not create a demonstrated row-level meaning error. |
| 62888 | not an issue; close D-18038 key | The terrible day, arrogance/desperation, divine disfavor, and followers tending the place since are preserved without supplying the unspecified event or location. |
| 62892 | not an issue; close D-18038 key | The speaker's uncertainty and “big as a man, at least” size comparison are preserved without identifying the creature. |
| 62893 | partial accepted; retain D-18038 | Correct Ghennig to the accepted `게니그(Ghennig)` form (D-5954). Audra Firan and Khleran spellings remain unresolved, so retain the key's uncertainty. |
| 62894 | not an issue; close D-18038 key | Korean preserves the oft-derided, supposedly effective Chaos-reagent/Chaos-Potion method and the extensive Alchemy requirement without adding a recipe detail. |
| 62897 | uncertain; retain D-18038 | The final-match hiring is preserved. English leaves the noun in `the best` implicit; Japanese suggests one fighter while Chinese supports the Korean plural, so singular/team scope remains unsettled. |
| 62899 | uncertain; retain D-18038 | Return to the Great Cycle, self-offering to the Flowering, and ceremony completion are retained. Formal Korean names/status for both lore terms remain open. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Status |
| ---: | --- | --- | --- |
| 62852 | `선택받은 자여` | `부름받은 자여` | Partial correction; city phrase remains uncertain. |
| 62858 | `자유민들` | `프리맨(Freemen)` | Accepted; closes the key. |
| 62862 | `워스워른 용병으로 일했지` | `워스원(Warsworn)의 고용병(Hireling)이었지` | Partial correction; rank and Galette spelling remain uncertain. |
| 62893 | `게닉 성채` | `게니그(Ghennig)의 성채` | Partial correction; Audra Firan and Khleran spellings remain uncertain. |

## Verification

- Results: one accepted, seven `not an issue`, and nine remain uncertain;
  the uncertain set includes the three partial corrections at 62852, 62862,
  and 62893.
- Pre-edit SHA-256:
  `8b63e5b45fde26d2abf7676e12f05694780d82e95c21f2665a5136687ead8004`.
- Post-edit SHA-256:
  `4aef3d9524f80a70211f10c7c7d2f78aa66834d874d5b9ac9bcef59c391b6e23`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-d18038-followup-D19530/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing only the four exact `Texto` substitutions reproduces the backup
  byte-for-byte. UTF-8 BOM, all 65,135 ordered IDs, CRLF 72,011, and the
  73 pre-existing bare-LF endings are preserved.
- Totals: **2,450 accepted / 25,334 not an issue / 10,740 uncertain**
  (38,524). Resume **D-19531** at ID **62755**, the first unresolved key
  in the D-18027 carry-forward cluster.
- Remaining D-18038 uncertainties: 62852, 62853, 62862, 62867, 62869,
  62870, 62893, 62897, and 62899. Other carried default holds include
  D-18032 IDs 62804, 62807, 62811, 62834, 62837, 62839, 62842, 62844,
  62847; D-18027 IDs 62755, 62761, 62763, 62770, 62771, 62789, 62792,
  62796, 62797, 62798; D-18024 IDs 62727, 62744; D-18020 IDs 62651,
  62662, 62677, 62680; D-18014 IDs 62604, 62645, 62648. The separate
  55 provisional Chinese-only `affix` uncertainties remain open.

These are working dispositions, not independent final linguistic approval.
