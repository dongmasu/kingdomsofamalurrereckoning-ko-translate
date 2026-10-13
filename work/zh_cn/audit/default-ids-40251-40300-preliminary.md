# Preliminary Language Scan: `default` IDs 40251-40300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40251-40300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40252 | Three-paragraph illness/food journal | Preserve the narrator's worsening condition, inability to move/nourish themself, dead raw fish, and urine-rich water; keep all three paragraphs. | English, Japanese, Chinese, and Korean retain the deliberately grotesque sequence. Korean's “먹을 것을 구할 방법도 없어” is a concise rendering of lacking means to nourish themself; no source-supported cleanup of the imagery is warranted. | Medium |
| 40254-40255 | `닉사로스`; `명장들` | Standardize Nyxaros and Master Makers as named creature/group terms. | English names Nyxaros and the Master Makers; Korean transliterations/semantic form are plausible, while locale forms differ and prior notes leave both terms open. | Medium |
| 40258 | justice/strength aphorism | Preserve the subjectivity qualifier and the contrast between the weak enduring the strong's will and the strong acting as they please. | Korean retains the central contrast. English says “consider that what is just can be subjective”; Japanese and Chinese phrase the opening differently, so retain the source's qualification rather than making it an absolute maxim. | Medium |
| 40260 | `소로스 가문` for `House of Sorrows` | Standardize the named House only through the corpus-wide House/Sorrows decision. | English capitalizes the faction; Korean uses a family-like form. Earlier reports and historical questions leave the Korean name and Sorrows referent open. | Medium |
| 40265 | `EnterRathir1` | Determine whether this is an internal/debug key or a player-facing destination label before localizing it. | English preserves a code-like string; Japanese localizes it as entering Rathir 1, Chinese translates the action, and Korean leaves the identifier unchanged. Historical notes explicitly defer the label. | Medium |
| 40267-40268 | `마운의 열쇠 조립`; Midden corruption | Confirm Maun's Key assembly steps and preserve that the Midden should not be corrupted more than it already is. | Korean retains both the quest objective and the comparative “no more than already” condition. The key's components and the Midden's corruption state remain context questions in the source-keyed log. | Medium |
| 40272-40273 | `시드`; `이야기의 정전`; `윈더미어의 하녀` | Confirm whether Sidhe names a place/realm, and standardize canon, the Maid, and House of Ballads terminology while retaining the theft-risk and lore-history claims. | Korean keeps the three named people, attempted theft, danger, and the House's canonical story conflict. Sidhe and Maid have divergent locale readings; prior questions leave their status open. | Medium |
| 40283 | bodies that “adorn” the thing growing in the Midden | Preserve the likely image of corpses adorning the surviving growth/tree and the speaker's accusation of Tuatha blasphemy. | Korean retains the bodies and blasphemy question, but `장식처럼 매달린 시체들` makes the hanging/decorative image explicit. The exact plant and ritual context remain unresolved. | Medium |
| 40290 | +50% critical damage; +120% dagger/Faeblade sneak damage | Preserve both conditions/bonuses and the blank paragraph separating the two effects. | Korean retains unaware enemies, stealth, both weapon types, +50% and +120%, and the two-line layout. | High |
| 40291 | `2년` versus Japanese `1年間` | Follow the English source's two-year duration and record the Japanese numeric divergence; preserve the Painted Orsks wordplay. | English says two years and Korean retains `2년`; Japanese says one year, while Chinese leaves the duration unspecified. The place-name joke remains unresolved. | High |
| 40297 | single-crystal Klurikon shield | Preserve that the shield was carved from one crystal from eastern Klurikon hills and reinforced by powerful sorcery; confirm the material terminology. | Korean retains the single-crystal source, fragile appearance, and magical reinforcement. Other references agree on the crystal but vary in wording. | Medium |
| 40299-40300 | `더 어두운 무언가에 타락`; `이디라가 무사하길` | Preserve the “something darker” corruption beyond Niskaru and determine whether “find Idylla well” means finding the city safe/thriving or liking it. | Korean retains the darker corruption and reads `well` as safe. Japanese/Chinese read the final line more like hoping the player likes or finds the city agreeable, so the meaning remains context-dependent. | Medium |

IDs 40251, 40253, 40256-40257, 40259, 40261-40266, 40269-40271,
40274-40282, 40284-40289, 40292-40296, and 40298 generally retain the
English meaning on this first reading. Names, lore, source ambiguity, and
fragments remain subject to integrated review.

## Historical Audit Reconciliation

- `work/zh_cn/audit/from-ja_jp/open-questions.md` has a source-keyed entry
  for IDs 40250-40349. The overlapping questions include the three-paragraph
  journal, Nyxaros/Master Makers, EnterRathir1, Maun's Key, Midden
  corruption, Sidhe, canon/Maid, Hollowlands/Scion/Cranalt, the
  corpses-in-Midden image, Wall of Thorns, stealth values, Painted Orsks,
  the Klurikon shield, Idylla's condition, and other names in this range.
- These questions were checked against the active rows. No global
  terminology change is authorized.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40251-40300 once
  and in identical order.
- Embedded line-break counts and runtime-marker identities match.
  ID 40252 retains three paragraphs; ID 40290 retains its blank paragraph
  line and both damage values. At ID 40291 Korean follows English's
  two-year value; Japanese alone says one year.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40251-40300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40301.
