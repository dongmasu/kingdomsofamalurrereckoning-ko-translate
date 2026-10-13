# Disposition Batch: `default` IDs 56751-56800

- Date: 2026-10-11. Rechecked all 50 active Korean rows against the
  English, Japanese, and Chinese source CSVs under `src/csv/`, the
  source-keyed historical notes, prior decisions, and the preliminary scan.
  Japanese informed register; Chinese was supporting evidence. These working
  dispositions are not independent final linguistic approval.
- Two accepted corrections, 36 `not an issue` IDs, and 12 uncertain
  findings. Context-sensitive names, titles, and source differences remain
  open rather than being normalized from isolated lines.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56753 | `그리고 너… 네 보상은 이미 정해졌다. 고통 없이 죽여 주마.` | `그리고 너… 네 보상은 이미 정해졌다. 단숨에 죽여 주마.` | English `Your death will be swift` and Japanese's “a swift death” describe speed, not absence of pain. Chinese also describes a quick/decisive death. The previous Korean added a painless-death promise unsupported by the primary source. |
| 56770 | `다 헛소문일 뿐이야. 아카라는 이 섬 사람들에게 아무 관심도 없어. 관심이 있었다면 왜 우리 어머니를 구하지 않았겠어?` | `그저 이야기일 뿐이야. 아카라는 이 섬 사람들에게 아무 관심도 없어. 관심이 있었다면 왜 우리 어머니를 구하지 않았겠어?` | English says `Nothing but stories`; Japanese and Chinese likewise say stories/talk. `헛소문` additionally asserts that the stories are rumors and false, which the sources do not establish. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56751 | Uncertain | English capitalizes `Hireling`; Japanese specifies a third-class mercenary, while Chinese and Korean use a generic hireling/mercenary sense. Whether this is a formal rank remains unresolved. |
| 56754 | Uncertain | English has the grammatical omission `a group refugees`; Japanese describes returning to rebuild the village, while Chinese says the refugees settled there. The count and resettlement context cannot be settled from this line. |
| 56757 | Uncertain | English and Japanese say the addressee claims to have been summoned; Chinese instead says their request was answered. Korean follows English/Japanese, but the source conflict remains. |
| 56758 | Uncertain | English and Chinese describe passing absurdity off as wisdom; Japanese says the High King would not have written it. The intended accusation depends on context. |
| 56761 | Uncertain | The recruitment appeal and alternatives are preserved, but the historical audit asks whether the proclamation's elevated public register is intended. |
| 56762 | Uncertain | English capitalizes `Maid`; Japanese reads a heroine/warrior and Chinese a maiden. The Korean attendant/title reading needs lore context. |
| 56774 | Uncertain | English names a mummer's troop, Japanese a theater troupe, and Chinese mime performers. The exact performance tradition and Icebrine form remain open. |
| 56775 | Uncertain | English capitalizes `Counsel`; Japanese says advisor and Chinese staff/strategist, while Korean selects a council. Do not choose among a person, body, or counsel without context. |
| 56782 | Uncertain | English and Chinese say Hall, Japanese says shrine; the Korean follows English/Chinese, but `Firstsworn` and the institution's canonical form remain unsettled. |
| 56783 | Uncertain | The sources describe Rahnil as a hollow/cave at the Keening's southern edge. The Korean meaning is plausible, but the place-name spellings and geographic referent need alignment. |
| 56788 | Uncertain | English `Should I have a costume?` is ambiguous between needing/wearing and obtaining one. Japanese asks whether one can receive a costume, Chinese asks whether one should wear it, and Korean selects obtaining it. |
| 56790 | Uncertain | English capitalizes `Flowering`; Japanese explicitly calls it a ceremony, while Chinese is more literal. Korean's `개화제` is plausible, but the named event/season remains unconfirmed. |

## Not an Issue

The remaining 36 IDs are 56752, 56755-56756, 56759-56760, 56763-56769,
56771-56773, 56776-56781, 56784-56787, 56789, and 56791-56800. They
preserve the evident English meaning and Japanese-informed voice/register;
names and terms not listed as uncertain remain provisional where appropriate.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56751-56800
  once in ascending order. Each default file has 65,135 records with
  identical full key order.
- Line-break counts match throughout the batch. No runtime-marker identity
  or ordering discrepancy was found.
- ID 56765 is `3%` in English and `+3%` in the other locales; the numeric
  value is identical, with only an explicit positive sign in three files.
- Reconciled the source-keyed historical range `56750-56849`, including
  Hireling, the refugee appeal, Dokkalfar register, Korrinna/Hystis, the
  mummer's troop, Anokatos' Counsel, House transfer, Flowering, and the
  distressed-speaker/body-possession lines. Historical prompts informed
  review but do not independently confirm a disposition.
- Only the approved `Texto` cells at 56753 and 56770 changed. The active CSV
  retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and
  39 pre-existing bare-LF endings. Post-edit SHA-256:
  `e051f447e5776fc286aaf2d9374391ef67e817189f4a961477f4758abf2d0c09`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56751/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `9a9de031a99b2130e038b93654e5500ae56c40df2bb88239762575f51bc89039`).

Decisions D-17102 and D-17103 record the accepted corrections; D-17104
through D-17115 record the 12 uncertain findings; D-17116 records the
remaining 36 `not an issue` IDs. Direct register totals: 1,668 accepted,
11,818 `not an issue`, and 10,583 uncertain (24,069 total); next D-17117.

Resume at `default` ID 56801; 8,334 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56801-56850-preliminary.md`](default-ids-56801-56850-preliminary.md).
These are working dispositions, not independent final linguistic approval.
