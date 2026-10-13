# Preliminary Language Scan: `default` IDs 32751-32800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32751-32800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32758 | Ayten journal / Freeman / Ratofer / “all of Ayten's youth, gone” | Preserve the anxious voice and chronology while keeping source errors and the final loss statement visible for contextual review. | English contains fused `haveenough`, missing punctuation, and a compressed final sequence. Korean smooths the prose and renders that all Ayten's youth are gone after the fighters followed Ratofer and he returned alone; Japanese makes the deaths explicit, while English and Chinese leave the exact fate less explicit. Korean preserves the source's zero line breaks. | High |
| 32759 | `이 땅에서 없앴다` for `rid the lands of` Master Kiftal | Keep open whether the euphemism means killed, expelled, or otherwise removed; do not infer a method. | English uses `rid the lands of`; Japanese similarly says to eliminate/remove him, while Chinese says his workshop was destroyed. Korean preserves the broad removal sense but may imply killing. | Medium |
| 32760 | `대회계관의 집무실` / `아르카디움` | Verify the institutional location and preserve that the fifth memoir chapter points to the next portion in Arcadium. | English says the chapter was found in the Grand Bursar's and the next portion is in Arcadium. Korean supplies “office,” supported by Japanese's accounting institution, while Chinese differs on the Arcadium location. | Medium |
| 32761 | `잃어버린 가보` for plural `missing heirlooms` / `turn them in` | Check whether Korean should explicitly mark the recovered heirlooms as plural. | English uses plural `heirlooms` and `them`; Korean uses unmarked `가보` and omits an overt plural marker. Japanese also has an unmarked collective `家宝`, while Chinese explicitly uses a plural pronoun. | Medium |
| 32762 | `트렐리스` / `위대한 여사냥꾼` | Standardize Trellis and Hartwen's title; preserve the restriction on entry and the flirtatious `beautiful` address without inferring the addressee's gender. | Korean retains the title, access prohibition, and address. Japanese reads Trellis as a meeting place and Chinese literally as a trellis/scaffold, so the proper place-name remains open. | Medium |
| 32763 | `침대를 빌릴게` and `$NQD_City_Ysa.m_inn_cost$` | Preserve “bed” rather than generalizing it to a room, and retain the cost variable exactly. | English says “rent the bed”; Korean matches, while Chinese says room. The exact variable and its position are identical in all four locales. | High |
| 32765 | `커(Cur)` for `the Cur` | Determine whether `Cur` is a named creature/person, faction label, or generic insult before standardizing. | Korean and Japanese transliterate; Chinese interprets it as a vicious dog. English capitalization and the historical question do not resolve the referent. | High |
| 32766 | `덴릿이 불태워 버려서` / “its production” | Keep the burned referent open; preserve the consequence to regional grain production without inventing whether the farm, settlement, or source was burned. | English's `it` follows a description of a grain-farming source and is context-dependent. Korean says “this place” and that Dennrit burned it; Japanese/Chinese likewise use a pronoun without naming the object. | High |
| 32771 | `XX일째` for `Day XX` | Preserve the literal `XX` pending confirmation whether this is a placeholder or a numbered day. | Korean retains `XX`; Japanese and Chinese render it as day 20. The row does not establish whether XX is literal, a test value, or a number intended for localization. | Medium |
| 32773 | `가장` for `Pretense` | Confirm the intended standalone UI/status sense and whether Korean `가장` is sufficiently clear in context. | English is a single-word label; Japanese uses `かりそめ` (temporary/assumed) and Chinese `伪装` (disguise). Korean can mean pretense but is context-sensitive as an isolated label. | Medium |
| 32775 | `몽상` for capitalized `Reverie` | Verify whether `Reverie` names a Fae state/place or is ordinary “daydream”; retain the formal request not to disturb the speakers. | English capitalizes the term; Korean renders it generically as “daydream.” Japanese reads it as meditation and Chinese as daydream. The historical audit leaves its lore status open. | Medium |
| 32776 | Sir Sagrell / Thresh / Gorguath poem | Preserve the three-stanza structure, repeated twofold actions, quoted oath, and intentionally comic final line; verify the poem's subject and name/title forms. | Korean keeps all 16 newline characters and the source's 5/5/5-line stanzas. It retains the two beasts, oath, undergrowth, lone Fae, and final rest-today joke. Lore identities and the opening's compressed syntax remain open. | Medium |
| 32782 | Poison effect: `15%`, `80`, `5초`, sustained mana `25%` | Preserve both stat lines and distinguish per-hit chance, damage amount/duration, and sustained cost. | All locales agree on 15%, 80 Poison Damage, five seconds, and 25% Mana. Korean preserves the single line break; Japanese specifies maximum mana, which English does not. | High |
| 32784 | `맹세방패 페넌` / Pledgeshield Fenan | Standardize Fenan's title/name and preserve that he may once have been a soldier but likely is not now. | Korean retains the deception, vault-key forging, uncertain former status, and attack. Japanese instead describes Fenan with a mercenary-rank phrase, leaving the title's function unresolved. | Medium |
| 32794 | `성벽 위에서 그런 일이` / `명예를 되찾으리란` | Preserve the speaker's confidence that she will redeem herself; clarify the wall event and whether redemption means restoring honor or atonement only with context. | English's `redeem herself` is broad. Korean and Japanese read as regaining honor; Chinese reads as atonement. The preceding event is an unfinished reference in all locales. | Medium |
| 32796 | `우물` for capitalized `the Well` | Verify whether this is the named Well and whether Korean should use an established proper-name form; retain the warning that it is delicate. | English capitalizes the term; Korean and Chinese use a generic well, while Japanese says spring/fountain. The source row alone does not identify its function. | Medium |
| 32797 | `알마인` for `Almain` | Standardize the people-name against other active rows and preserve the speaker's visual identification. | Korean retains the human/Almain distinction and the question. This row uses `알마인`; the proper-name form remains a glossary candidate. | Medium |

IDs 32751-32757, 32764, 32767-32770, 32772, 32774, 32777-32781, 32783,
32785-32793, 32795, 32798-32800 generally retain the English meaning on
this first reading. Proper names, register, and setting-specific terms
remain candidates for the integrated pass; no other distinct high-confidence
wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed entry for IDs 32700-32799 flags the Ayten journal's
  fused words and unclear chronology, `Cur`, burned “it,” `Reverie`, the
  three-stanza Sir Sagrell-Thresh poem, Pledgeshield, and the wall event /
  “redeem herself” at ID 32794. These were checked against the four locale
  rows and active Korean.
- Two cost variables at IDs 32763 and 32772 match across the four locales.
  `Day XX` at ID 32771 has a locale divergence not called out in that
  historical range entry; it is recorded here for integrated review.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates, not confirmed corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 32751-32800 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 32758 is
  unbroken in every locale; ID 32776 retains 16 breaks and three stanzas;
  ID 32782 has one stat-line break.
- `$NQD_City_Ysa.m_inn_cost$` at ID 32763 and
  `$SQ30.forgery_cost$` at ID 32772 are preserved exactly and in the same
  position.
- ID 32782 preserves the inspected numeric values `15%`, `80`, `5`, and
  `25%`.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 32751-32800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32801.
