# Disposition Batch: `default` IDs 33651-33700

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciled against English meaning, Japanese
  voice/register, Chinese supporting evidence, historical audit, active
  Korean, terminology precedents, and structure.
- Decisions: three accepted, one `not an issue`, and seven uncertain
  findings, plus one `not an issue` disposition for remaining ordinary text.
- CSV changes: IDs 33665, 33690, and 33696 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33651 | Brigand Hall Caverns / `브리건드 홀 동굴` | Uncertain: retain the traceable English place name and the speaker's exasperated reaction. The locales disagree on whether `Hall` is a cave/place name or a descriptive element; historical findings leave the location form unresolved. |
| 33653 | Hall of the Firstsworn / `첫 서약자들의 전당` | Uncertain: the reforging location and speaker's hesitation are preserved, but related findings still disagree on Hall versus shrine and on the canonical Firstsworn form. |
| 33665 | Scholia Arcana / `슈콜리아 아르카나` | Accepted: change to `스콜리아 아르카나`. This established proper-name spelling is repeatedly used in the active Korean corpus and is explicitly retained by prior dispositions D-1397, D-3146, and D-9985; the current `슈콜리아` is an isolated inconsistent spelling. |
| 33667 | Five-line war prophecy | Uncertain: all five source lines, the war-engine image, Gadflow, and the contrast with former peace remain. The compressed prophetic syntax and literary phrasing need integrated review; no speculative rewrite is authorized. |
| 33668 | `gift` / `Orison` | Uncertain: the offering and concluding prayer are represented, but English and Japanese capitalize/name `Orison` while Chinese reads it as prayer. Its identity as rite, service, or ordinary prayer remains unresolved. |
| 33669 | `Tender` / `Delver` | Uncertain: the shared witness and first-role claim are retained, but previous decisions leave both formal roles and their canonical Korean names unresolved. |
| 33674 | Eswin bringing the speaker and Beorn “down” from Ironfast Keep | Uncertain: English does not establish whether they were hired, escorted, or brought down from the Keep; Japanese says hired while Chinese says they were driven out. Keep the current wording pending context. |
| 33681 | Court of Summer / remaining Fae | Not an issue: Korean preserves the English claims that the Varani resent the Court's lack of support, seek to overthrow Titarion, and would force the remaining Fae to fight. `여름 궁정` is consistent with the prior English-based disposition at ID 33597. |
| 33690 | `{*2Abilities}` tutorial heading payload | Accepted: change only the localizable payload to `{*2능력}`. Japanese `{*2アビリティ}` and Chinese `{*2能力}` localize it, and the Korean body uses `능력`; preserve both `{LINE_LEFT}` wrappers, `{*2...}` structure, and their order. |
| 33696 | `The Ariad` / `아리아드` | Accepted: change to `아리아드대`, matching the prior disposition D-1449 at ID 5600 and Japanese `アリアド隊`. English names the group; this does not imply any individual member. |
| 33700 | Font in the Gardens of Ysa / `이사의 정원에 있는 샘` | Uncertain: the source's named/capitalized `Font` may be a specific sacred source, while Korean renders it generically. The sentence's sacred-wellspring meaning and three-place relation are otherwise retained; defer the canonical lore term to glossary/context review. |
| Remaining ordinary text in IDs 33651-33700 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was found. The 50 ordered IDs, inspected line breaks, marker structure, and values align with the source rows. |

## Historical Audit Reconciliation

- The actual source-keyed entry for IDs 33600-33799 is present in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` (and its preserved Japanese
  source). It explicitly flags Hall of the Firstsworn, the war prophecy,
  Orison, Tender/Delver, Eswin/Beorn, Court of Summer, Ariad, and Esharra
  sources among the lore and terminology questions in this range.
- The historical entry supports retaining these as review candidates; it
  does not settle the disputed names or authorize edits by itself.
- At ID 33690 the runtime wrappers/order remain intact; only the payload is
  localized, consistent with the Japanese and Chinese rows.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 33651-33700 once
  and in identical order.
- ID 33667 retains five source lines. ID 33690 retains both `{LINE_LEFT}`
  markers and the `{*2...}` wrapper in the same order.
- Active default CSV SHA-256:
  `9456b4113deab0ac9d39b2b5a4105381af0e0df28910a141a1ddec2889234540`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 33701; 31,434 default IDs remain through ID 65134.
