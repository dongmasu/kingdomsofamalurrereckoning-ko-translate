# Disposition Batch: `default` IDs 35001-35050

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical decisions,
  terminology, values, markers, and structure.
- Evidence caution: Japanese wording below refers to immutable
  `src/csv/ja_jp/`; the Korean migration copy in `work/ja_jp/` was not treated
  as independent evidence.
- Decisions: two accepted, four `not an issue`, and thirteen uncertain.
- CSV changes: IDs 35028 and 35049 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35002 | Rhyming food-demand verse | Uncertain: the wine/meat/ale demand and raw-food-with-bread image are retained, but the comic rhyme and its register are not reproduced; Japanese also drops the rhyme. |
| 35006 | `Warsworn Hireling` | Uncertain: the first assignment and patrol sequence are retained, but `Hireling` may be a formal rank or a generic paid role; the localized role term is not established. |
| 35010 | `Hanged Men crew` | Uncertain: D-3145 and D-3665 support `교수형 사내들(The Hanged Men)` for the identified Dead Kel crew, but the nearby D-11239 and other historical findings leave this row's group identity/context unresolved. Do not apply that form mechanically here. |
| 35011 | `Hierophant` | Uncertain: both rumors about failing eyesight and untruthful words are retained; the source does not settle whether Hierophant is a person, rank, or formal title. |
| 35015 | Capitalized `Hero` | Uncertain: the letter, hesitation, and earlier arrival are preserved, but this row alone does not establish whether Hero is a formal title or generic description. |
| 35017 | Finesse-based Daggers / moves | Uncertain: the collection-of-moves meaning is retained; the canonical Korean Finesse category and moves/abilities terminology remain unsettled. |
| 35020 | Ynadon keeps the addressee strong | Uncertain: the strength comparison is retained, but Korean and Japanese make Ynadon an explicit giver of strength while English is less specific; Ynadon's role is unresolved. |
| 35023 | Quay, oldest castaway | Uncertain: Korean's “longest-lived” reading is plausible, but English may mean age or time stranded; standard names for Quay and Gallows End are also open. |
| 35025 | `Fateless One` | Uncertain: the repeated contrast between fatal danger and an unharmed return is retained, but the formal epithet's Korean form is not settled in the project glossary. |
| 35027 | `Take a walk, stranger` | Uncertain: the dismissal is retained, but `썩 꺼져` may be harsher than the English idiom; Japanese is harsher while Chinese is more literal, and speaker context is unavailable. |
| 35028 | `Can I buy a title?` | Accepted: change `칭호를 구매하시겠습니까?` to `칭호를 살 수 있을까?`; English, Japanese, and Chinese present the speaker's first-person inquiry/request, not a second-person purchase confirmation. Preserve the cost variable and gold label. |
| 35029 | Localized `Resistance` marker | Not an issue: the `{*3...}` wrapper and position are preserved, and the visible `저항` payload is localized consistently with Japanese and Chinese. The +3 resistance effect remains intact. |
| 35030 | Torn page in a monster's cache | Not an issue: Korean repairs the malformed English `stuffed o in` without importing a conflicting interpretation; the torn page and hoarded cache relation are retained. |
| 35035 | Echostone / Fae Cairns | Uncertain: the experiment series, Hallam, and preservation of songs are retained, but the named artifacts/structures and canonical `Cairns` rendering remain unresolved. |
| 35038 | Fateweaver / weave | Uncertain: the differing perception of the weave and resulting unique cards are retained; the lore-term relationship and canonical display forms remain open. |
| 35043 | `The Cast Anvil` | Uncertain: English, Japanese, and Chinese support conflicting interpretations of `Cast`; the isolated label does not establish whether this is a named item, spellcasting feature, or forging station. |
| 35049 | Solace in the place seems unsettling | Accepted: change `불편하게 들릴지도` to `불안하게 느껴질지도`; English, Japanese, and Chinese describe the speaker's solace as unsettling/strange, not merely as words that sound uncomfortable to a listener. |
| 35050 | Fate-reading offer | Not an issue: `운세라도 봐줄까?` naturally conveys the offer to read someone's fate from cards; the exact game practice remains context-dependent but no supported correction is needed. |
| Remaining ordinary text in IDs 35001-35050 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 32 IDs. |

## Historical Audit Reconciliation

- D-3145 and D-3665 support the bilingual named-crew form at their established
  contexts. D-11239 at ID 34680 and other historical entries still leave
  identity/context differences open, so ID 35010 remains uncertain rather than
  receiving an automatic terminology replacement.
- The historical source-keyed questions for the food verse, Warsworn
  Hireling, Hierophant, Hero, Finesse, Ynadon, Quay, Fateless One, Fae
  Cairns, Fateweaver/weave, Cast Anvil, and fate-reading were reconciled with
  this batch; unresolved questions remain explicitly open.
- No global name or glossary normalization is inferred from this batch.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35001-35050
  in matching order. No physical line-break discrepancy or runtime-marker
  identity/order issue was found in this range.
- The `{*3Resistance}` marker at ID 35029 is localized only in its payload.
- Numeric/cost data and other variable-bearing text were not changed.
- Only the `Texto` values at IDs 35028 and 35049 changed. The UTF-8 BOM,
  72,046 CRLF endings, and 39 original bare-LF endings remain intact.
- Active default CSV SHA-256:
  `426b444cdea7b911998b993cddbd0205c64f4b4023b055b5a2bdf56b105aa00f`.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35051; 30,084 IDs remain through ID 65134.
