# Disposition Batch: `default` IDs 34601-34650

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: zero accepted, four `not an issue`, and sixteen uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34602 | Kindred spirits / Mitharu in gems / holiness through refining | Uncertain: all three ideas are present, but formal creed versus personal metaphor and the exact “kindred spirits” relation need lore context. |
| 34604 | Memory paradox | Not an issue: the paradox of forgetting memory's presence and forgetting everything after its loss is retained with the trailing pause. |
| 34608 | Identity and full costume | Uncertain: English appears to affirm identity before saying the role cannot be assumed without the costume; Japanese/Chinese frame impersonation. The source-level tension cannot safely be resolved in Korean. |
| 34612 | Chapterhouse in Rathir | Uncertain: nearest location is preserved, but whether the institution is a chapterhouse, branch hall, or religious building remains unsettled. |
| 34614 | Reverie / Calovar walking the sands | Uncertain: longing, sleep, and concurrent walking are preserved, but Reverie and Calovar's identities differ across sources. |
| 34617 | `Strife` | Uncertain: generic conflict is plausible, but the standalone label does not establish a named event, condition, or ability. |
| 34620 | Concourse | Uncertain: the warning is preserved, but Concourse may be a named location and locale translations remain generic. |
| 34622 | Pledgeshield | Uncertain: the label is transliterated, while Japanese treats it as a mercenary rank and English/Chinese suggest a formal shield-bearing title; no canonical Korean term is established. |
| 34624 | Cathedral Caster | Uncertain: compositional Korean is plausible, but this may be a named enemy/class rather than a descriptive caster label. |
| 34626 | `{*1Cross Slash}` / `{*1Cyclone}` | Uncertain: wrappers, order, paragraphs, and mechanics are preserved, but the Korean payload names remain English while Japanese/Chinese localize them; approved Korean ability names are not established here. |
| 34628 | NATC Compliance Test Leads | Uncertain: the role is translated, but the acronym and capitalization suggest an internal/test string and player-facing status is unknown. |
| 34629 | Flawless Mitharan Enchanted Grip | Uncertain: item type is retained, but modifier grouping and Mitharan's material/quality relation differ across locales. |
| 34632 | Aodh | Uncertain: Korean preserves the name phonetically, but locale spellings and the person's identity are not settled. |
| 34636 | Beckoned / Jottun / Pteryx | Uncertain: all three threatening groups and their conditional attack are retained, but `Beckoned` is rendered as a generic invited person rather than an established title; canonical title usage remains unresolved. |
| 34642 | Serving the Summer Court through the House of Ballads' telling | Uncertain: service and House of Ballads content remain, but Korean may imply enjoying the story rather than actively telling/performing it; “Telling” terminology and the source's intent need context. |
| 34645 | Fateweaving | Uncertain: semantic compound is clear, but the named ability/system's Korean form is not established. |
| 34647 | Vengal / Tavvy / sword / Merchant's Guild | Not an issue: sword provenance, apprenticeship, wealth, and feared ability in battle or bargaining are retained. |
| 34648 | `+7` / `+27%` Longbow piercing damage | Not an issue: both values, damage type, weapon scope, and two-line stat layout match. |
| 34649 | House of Valor | Uncertain: the named House is preserved with a mixed translated/transliterated form; Japanese and Chinese do not establish a canonical Korean rendering. |
| Remaining ordinary text in IDs 34601-34650 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 31 IDs. |

## Historical Audit Reconciliation

- Historical notes explicitly flag Mitharu/gem refining, Calovar/Reverie,
  Strife, Pledgeshield, Cathedral Caster, ability markers, the NATC test
  label, Mitharan Grip, Aodh, Beckoned/Jottun/Pteryx, Fateweaving, Longbow
  stats, and House of Valor. Each was checked against the immutable locales
  and prior decisions.
- Prior entries leave Pledgeshield, Aodh, Fateweaving, and House of Valor
  unresolved; no isolated terminology normalization is authorized.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  source tables in identical key order. The Japanese-derived `work/ja_jp/`
  Korean draft was not treated as independent evidence.
- ID 34626 retains both `{*1...}` wrappers, their order, and the instructional
  paragraph layout. ID 34648 retains two lines and exact `+7` / `+27%` values.
- No CSV text or source file was edited. The active default CSV SHA-256
  remains `1a60972628f8607a1d24b109b71e866f2f15d967dd3223e567e74b5fde6b18b7`;
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34651; 30,484 default IDs remain through ID 65134.
