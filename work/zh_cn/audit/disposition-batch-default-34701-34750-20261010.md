# Disposition Batch: `default` IDs 34701-34750

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- New dispositions: three accepted, one `not an issue`, and eleven uncertain.
  ID 34710 was already accepted under D-007 and is not counted again.
- CSV changes: IDs 34722, 34743, and 34745 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34710 | Aesa Alfarinn “at your service” | Previously accepted at D-007. The active CSV already contains `에사 알파린, 무엇이든 맡겨 주게!`; this matches the approved service offer. The preliminary report's old `잘 부탁하네` text is stale and was not reapplied. |
| 34712 | Motus Mining / “such as it is” Aron Excavations aside | Uncertain: the dismissive aside is retained, but its exact force and the company's status are unclear; Japanese expands the aside while Chinese omits it. |
| 34714 | “bring down Ysa” | Uncertain: the warlord's goal is retained, but English does not establish whether Ysa is a person, city, or political power. Do not sharpen “bring down” to conquer or destroy. |
| 34717 | Esharra/Chaos journey / purpose and aspect | Uncertain: the destination and risks to mind, body, and soul remain, but the row's challenge/completion function and the relation between embarking and mastering Chaos are not established. |
| 34718 | `her worship, the Muse of Fate` | Uncertain: the ceremonial introduction is retained, but the honorific's exact office/rank and canonical Korean equivalent remain unsettled. |
| 34722 | Conditional fragment about Maun being a monster and cutthroat | Accepted: replace `괴물에 살인자라니, 그럴 만도 하지.` with `그랬겠지, 마운이 괴물이자 살인자만 아니었다면.` The current Korean changes the source's conditional into a “no wonder” reaction; the proposed text preserves the incomplete antecedent rather than inventing it. |
| 34724 | The Nexus | Uncertain: the standalone title is retained, but English, Japanese, and Chinese do not establish whether it is a place, system, or generic concept. |
| 34726 | First projections / Mystic Hammer | Uncertain: the conditional plan to injure projections and close Besin's door remains, but “projections” and their exact relation to the escaping entity need lore context. |
| 34731 | Chrysalae seeds | Uncertain: the seed-gathering objective is clear, but the named organism/material differs across locales and has no established Korean equivalent. |
| 34734 | Basilica Gnostra | Uncertain: its role as the home of Adessa's leading thinkers is preserved, but the institution's canonical name/category remains unresolved. |
| 34736 | Sidhe | Uncertain: the daggers' safe hiding place is retained, but whether Sidhe is a realm, people, or location remains open. |
| 34740 | Altar of Doubt | Uncertain: the altar as the first step of a journey is retained; named-landmark status and canonical Korean form need terminology alignment. |
| 34743 | Gallows End | Accepted: replace `갤러스 엔드` with `갤로우스 엔드`, matching the established active-corpus spelling used at 45 other rows, including ID 33764 (D-10903). |
| 34745 | Beckoned title/address | Accepted: replace `초대받은 자여` with `부름받은 자여`, reusing the explicit player-title form approved at ID 3368 (D-692); preserve the instruction and the man's need for his people. |
| 34748 | Sorcerer - Circle of Fire | Uncertain: the label's class/category status and canonical treatment of Sorcerer/Circle remain unclear. |
| Remaining ordinary text in IDs 34701-34750 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local translation defect was identified in the other 35 IDs. |

## Historical Audit Reconciliation

- The source-keyed historical questions at IDs 34712, 34714, 34717-34718,
  34722, 34724, 34726, 34731, 34734, 34736, 34740, 34743, and 34745 are
  dispositioned above. Unresolved target, lore, and title questions remain
  explicitly uncertain.
- Existing decision D-007 already authorized and applied the service-offer
  correction at ID 34710; no duplicate decision or edit was created.
- The preliminary report's ID-34710 current-text observation is older than
  the active CSV. Its broader reported CSV hash is likewise a prior snapshot.
- ID 34733 retains Roman numeral `I`; Japanese's Arabic `1` is an equivalent
  display difference, not a changed rank value.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. The Japanese-derived `work/ja_jp/` Korean
  draft was not treated as independent Japanese evidence.
- No embedded line-break discrepancy or runtime-marker discrepancy was
  found. The `$NQD_City_Rathir.ante_low$` variable at ID 34719 remains intact.
- Accepted corrections are limited to IDs 34722, 34743, and 34745.
- Active default CSV SHA-256:
  `326aa42d73c0bf480143862d7176b473f95962c1b0febc656b150137f8ab485f`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34751; 30,384 default IDs remain through ID 65134.
