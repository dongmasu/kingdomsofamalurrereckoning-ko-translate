# Disposition Batch: `default` IDs 34651-34700

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: four accepted, ten `not an issue`, and ten uncertain.
- CSV changes: IDs 34659, 34681, 34688, and 34699 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34652 | Forbidden love / House of Ballads / not carrying a sword | Not an issue: the unusual destination, forbidden-love explanation, and lack of a sword are all retained. |
| 34658 | Fae twilight / Prismere corruption among their kin | Not an issue: the declining age, shelter, and spreading corruption within the Fae kin are preserved; broader lore wording remains a glossary concern. |
| 34659 | Agency in “Before they can regain control of the creature” | Accepted: replace `저 괴물이 다시 통제권을 되찾기 전에` with `저들이 그 괴물을 다시 통제하기 전에`. English and Chinese make the enemies the agents who regain control; the current Korean incorrectly makes the creature regain control itself. |
| 34661 | Glass of Ambient / Blackened Hall trial | Uncertain: the named object is rendered as ordinary surrounding glass, but prior decisions record conflicting mirror, viewing-glass, and Korean name forms. Do not guess a canonical item name here. |
| 34663 | Bruten / “one of your own” | Not an issue: the line identifies Bruten as one of the addressee's own people; the insult and name are retained. Canonical faction identity remains a broader lore question. |
| 34668 | Chaos Barrier source typo and protection condition | Not an issue: despite the English typo `too withstand`, Korean correctly conveys that the barrier cannot be endured without protection and is lethal to the exposed. |
| 34670 | “Caught because the light … is gone” / sharp knives, soft feet | Uncertain: the light's loss and theft remain, but the compressed source fragment leaves who was caught unclear, and Korean changes the paired sharp/quiet imagery into swiftly wielded knives. No safe full-line correction is established. |
| 34671 | Ljosalfar/Dokkalfar and Fae generalization | Not an issue: Korean preserves the claim about how the Fae classify people by bloodline and origin; canonical ethnonym forms remain governed by separate terminology work. |
| 34672 | Primos-led Kollossae worship/prayer | Uncertain: the prayer and history are retained, but the role/status of `Primos` and the label's intended UI/lore sense are not resolved by this row. |
| 34679 | Adept Ignas | Uncertain: possession is correctly conveyed, but `Adept` is a recurring formal rank with no approved Korean equivalent. |
| 34680 | Baronett / last of the Hanged Men | Uncertain: the last-member relationship is retained, but prior sources and decisions disagree on whether the named group is pirates, a crew, or another entity; Korean's executioner reading is not established. |
| 34681 | Sandstone Villa | Accepted: replace `사암 별장` with `샌드스톤 저택(Sandstone Villa)`, reusing the named-estate form accepted at IDs 2842 (D-535) and 32656 (D-10603). |
| 34683 | Family / race / like-minded members | Uncertain: the family, race/people, shared talents, and protective bastion remain, but the source does not establish whether `race` is literal, cultural, or rhetorical. |
| 34684 | The Preordained and named peoples | Uncertain: the rejected groups and coming dawn remain, but `the Preordained` may be a named collective rather than generic predetermined fate. |
| 34685 | The Maid | Uncertain: the warning and imminent attack are preserved, but the Maid's identity/title remains unresolved in prior records. |
| 34688 | Omitted “trusting” characterization | Accepted: replace `미타란 사람들은 속수무책이었고` with `순진한 미타란 사람들은 저항도 못 해 보고`. English, Japanese, and Chinese all describe the Mitharans as trusting/easily deceived; Korean had omitted that characterization. |
| 34689 | Special ring / willingness to part for the right price | Not an issue: Korean retains the speaker's attachment and conditional willingness to sell/part with the ring. |
| 34690 | Sinsear key / Bisarane / Tuatha | Not an issue: the return of the key, urgency, recipient, and purpose are preserved; unresolved proper-name spellings do not justify an isolated rewrite. |
| 34692 | Ms. Crosse and “fascinating translations” | Not an issue: Korean retains the speaker's curiosity and the translations' intriguing quality; no supported wordplay or pragmatic reversal is established. |
| 34694 | Fae Cairns / `고분` | Uncertain: `Cairns` can denote stone-pile markers, while `고분` implies burial mounds. Chinese favors stone markers and Japanese transliterates the term, but prior decisions leave the landmark's identity and canonical Korean form open. |
| 34695 | “leagues of yellow wheat” / Grian's smile | Not an issue: the expansive wheat fields and blindingly bright smile are retained in natural Korean. |
| 34699 | “a higher source” | Accepted: replace `더 높은 곳에서 내려온 지시였지` with `윗선에서 내려온 지시였지`. This preserves the chain-of-command meaning supported by Japanese without suggesting a literal higher place. |
| 34700 | “ask to hold court with me” | Uncertain: Korean's `독대` follows Japanese's private-meeting interpretation, while Chinese reads a formal court appearance; English alone does not settle which was intended. |
| Remaining ordinary text in IDs 34651-34700 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local translation defect was identified in the other 27 IDs. |

## Historical Audit Reconciliation

- Prior decisions were checked for Glass of Ambient (D-090, D-1106,
  D-2361, D-3720, D-10164), Adept (D-117, D-1163, D-9944, D-10534),
  Hanged Men/Baronett (D-1659, D-2369, D-3145, D-3665, D-10559),
  Fae Cairns (D-2335, D-3034, D-9291), and Sandstone Villa (D-535,
  D-10603). The accepted Sandstone Villa form is reused only for this
  clearly named estate occurrence.
- The source-keyed historical note also flags Bruten, the Ljosalfar/
  Dokkalfar claim, Primos/Kollossae worship, the ring sale, the Sinsear
  key, and Ms. Crosse's translation line. These were dispositioned above;
  unresolved setting terminology remains provisional.
- The Japanese row at ID 34700 adds “two people”; that detail is absent from
  English, so the Korean private-meeting reading remains uncertain rather
  than accepted.
- The preliminary report's recorded CSV hash is an earlier snapshot and is
  not treated as the active post-edit hash.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. The Japanese-derived `work/ja_jp/` Korean
  draft was not treated as independent Japanese evidence.
- No embedded line-break, runtime-marker, or numeric-value discrepancy was
  found in this range.
- Accepted corrections are limited to IDs 34659, 34681, 34688, and 34699.
- Active default CSV SHA-256:
  `da725dd574a2fff37de6563487e2bdb2fdb088a66fc97f67b26b50c7434f6e7e`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34701; 30,434 default IDs remain through ID 65134.
