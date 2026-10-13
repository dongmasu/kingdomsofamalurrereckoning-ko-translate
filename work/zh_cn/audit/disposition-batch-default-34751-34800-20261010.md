# Disposition Batch: `default` IDs 34751-34800

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: four accepted, fifteen `not an issue`, and six uncertain.
- CSV changes: IDs 34775, 34779, 34794, and 34795 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34751 | Malformed English `I don't what happened` | Not an issue: Korean conveys the intended “I don't know what happened,” supported by Japanese and Chinese, without reproducing the source typo. |
| 34753 | Peaceful group / keeping to themselves / noisy priests | Not an issue: all three observations remain, including the comparison with louder priests. |
| 34754 | `stinkers` / scraps and discarded goods | Not an issue: the English is lower-case and reads as a smell-based insult, not an established species name; Korean preserves both the smell and the scavenging contrast. |
| 34758 | Dannestar tower / “filthy” description | Not an issue: the destination, hiding, and period without emerging are retained; `더러운` is a plausible rendering of the hostile description. |
| 34759 | Eselette | Not an issue: the Korean phonetic form follows the identical Latin-script name in the English, Japanese, and Chinese rows; no conflicting canonical form is established. |
| 34760 | Keep him alive until reaching Alabastra | Not an issue: the survival condition and the speaker's withdrawal afterward are preserved. |
| 34761 | Arena tradition / Hroth Magnus / selling seats | Not an issue: the tradition's age, unknown original rationale, and present-day audience draw are all retained. |
| 34763 | Gavroche's progress from no master to one of the best | Uncertain: Korean's “artisan” is plausible, but English does not identify the craft; Japanese and Chinese supply differing craft implications. |
| 34765 | Whitestone/Apotyre threat and Darkvari family's crimes | Not an issue: the threat's removal, region, and end of the family's criminal activity are preserved. |
| 34767 | Wending | Uncertain: Korean transliterates the capitalized term, while Chinese interprets it as a destination/“place of going forward”; the named location's identity and canonical Korean form remain open. |
| 34768 | Arrival too soon / cannot guide yet | Not an issue: both the premature arrival and the explicit “not yet” are retained. |
| 34769 | Unidentified woman / staff / final whisper | Not an issue: the female referent, powerful staff, whispering before victims die, and unknown words are all retained without inventing an identity. |
| 34775 | Neutral “What did Edgar do?” | Accepted: replace `에드가는 무슨 짓을 한 거야?` with `에드가는 뭘 한 거야?` to avoid adding the negative judgment carried by `무슨 짓`; English and Chinese ask neutrally. |
| 34776 | Mystic Hammer / Firstsworn / Besin / journey | Not an issue: reforging, possible defeat, the historical comparison, destination, and urgency remain. Name/lore forms stay provisional. |
| 34779 | “There's a song for you” / one-man-war | Accepted: replace `이야깃거리가 하나 생겼군` with `이거 노래감이군` and render the title as `1인 전쟁`, restoring the song framing and preserving the compact title wordplay. |
| 34785 | Three-part winter/sunset verse | Not an issue: all three images and the two paragraph breaks are preserved. |
| 34787 | Rathir devotion tasks / Lyria's blessing | Not an issue: the comparison with northern practice, three devotional tasks, and blessing in return are retained. |
| 34789 | Understyle / “your kind” | Uncertain: the access exception and generalization are preserved, but `종족` may over-specify a biological/species distinction not settled by the row. |
| 34790 | “lost our alchemist” | Uncertain: Korean says the alchemist left, while Japanese and Chinese say the person died; the English does not resolve the event. |
| 34794 | `fine art` of tapestries and painting | Accepted: replace `세밀한 기법` with `미술` in the field description. English `fine art` and Chinese `美术` identify art, not merely fine/detail-oriented technique; retain the contrast with wartime usefulness. |
| 34795 | “spare one / a tip / a knuckle” finger wordplay | Accepted: replace the money-like `팁` with `손끝`, and make the finger implicit in the first request explicit, supported by Japanese and Chinese. |
| 34796 | Usher of the Gardens | Uncertain: service to the liege and offer of information are retained, but the formal office/title versus generic guide sense is unresolved. |
| 34798 | Hope that the listener is prepared to lose | Not an issue: the direct challenge and speaker's confidence are preserved. |
| 34800 | Lady Ansilla's “topping your wife” comparison | Uncertain: the bawdy comparison and condescending lesson remain, but the exact sexual/martial double meaning and voice differ across locales. |
| Remaining ordinary text in IDs 34751-34800 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local translation defect was identified in the other 26 IDs. |

## Historical Audit Reconciliation

- The historical source-keyed questions at IDs 34751, 34753-34754,
  34758-34761, 34763, 34765, 34767-34769, 34775-34776, 34779, 34785,
  34787, 34789-34790, 34794-34796, and 34798 are dispositioned above.
- The source at ID 34751 is malformed; its intended sense is clear from
  Japanese/Chinese and the Korean draft. The lowercase `stinkers` at 34754
  does not itself establish a proper species/faction name.
- The ID 34800 cross-reference to the following 34800-34999 historical
  entry was included because the row carries Lady Ansilla's signature and
  voice question.
- No unresolved setting/title question was used as authority for a global
  terminology change.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. The Japanese-derived `work/ja_jp/` Korean
  draft was not treated as independent Japanese evidence.
- ID 34785 preserves two line breaks/three verse paragraphs; ID 34800
  preserves both breaks before Lady Ansilla's signature. No other line-break
  or runtime-marker discrepancy was found.
- Numeric forms match: ID 34772 retains `1 - 3`; at ID 34795 Japanese's
  `1本` corresponds to English/Korean's spelled-out one finger.
- Accepted corrections are limited to IDs 34775, 34779, 34794, and 34795.
- Active default CSV SHA-256:
  `cb59196d45599aa3bca91a3e953b86fa0b34651b73ba19f168f81a06405d9df3`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34801; 30,334 default IDs remain through ID 65134.
