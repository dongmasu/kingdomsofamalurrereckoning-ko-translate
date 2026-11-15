# Sequential `default` Revalidation: IDs `50000`-`50249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 69 existing four-language fingerprints; all match. Added the
  other 181 IDs to the review ledger without changing existing rows.
- Recorded 18 current correction-candidate IDs; 232 IDs have no current
  finding. Findings are proposals, not approval to edit translation CSVs.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged; this report records the
current revalidation, including reopened findings.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `50014` | Address / naturalness | `honored one` is rendered `고귀한 분`, while Japanese addresses the listener as a hero. Recheck this vocative against the established Korean address style; no speaker identity is inferred. | Medium-high |
| `50016` | Speech level | The line is conversational, but the closing `낯선 이여, 운이 좋아 보이는군` shifts into a stiff, archaic register. Keep the casual tone consistent with the preceding joke. | High |
| `50028` | Name format | `Gastyr` appears as `개스티르` without its English form. Pair the name as `개스티르(Gastyr)` without changing the inheritance meaning. | High |
| `50048` | Name/title format | `브레너 대사(Brenner Ambassador)` reverses the English title/name order inside the annotation. Use the established person-title form `브레너 대사(Ambassador Brenner)`; retain the separate `United Merchants Delegation` organization name. | High |
| `50054` | Rank/name format | The source identifies `Savant Aethan Engar`, but Korean annotates only `Aethan Engar`. Pair the full rank and name, e.g. `사반트 에이선 엥가르(Savant Aethan Engar)`. | High |
| `50058` | Terminology | `great chamber` is rendered `대전`, inconsistent with the established `대전당` for this chamber term. Align the term without changing the locked-and-warded meaning. | Medium-high |
| `50067` | Terminology / prior decision | The current row says `코덱스(Codex)`, but the English lowercase `a true codex` is generic here. An earlier accepted correction chose the neutral book sense `진짜 서책`; restore that approved meaning rather than treating this as a named artifact. | High |
| `50092` | Naturalness | `사람을 무장해제시키는 유머 감각` is an overly literal rendering of `disarming sense of humor`. Consider `긴장을 풀어 주는 유머 감각` or similarly natural wording. | Medium-high |
| `50094` | UI terminology | `Aggressive mode` is translated as `공격 모드`, which can read as a combat stance. Japanese uses `敵対モード`; consider `적대 모드` while retaining the `{1}` prompt and the already accepted `범죄 행각` wording. | Medium-high |
| `50107` | Name/title format | The named `Font`, `Niara`, and `Lifesmith` are left without English pairings. Add the established `샘(The Font)` and pair Niara and her epithet, e.g. `생명의 대장장이 니아라(Niara, the Lifesmith)`. | High |
| `50114` | Rank/name format | Korean gives `템플러 옥티엔(Octienne)`, omitting `Templar` from the English annotation. Pair the complete source title and name as `템플러 옥티엔(Templar Octienne)`. | High |
| `50124` | Naturalness | `갑옷 한 벌을 모두 찾아냈다` is awkward for finding a complete armor set. Use a natural set expression such as `전설적인 드루이드 에이든 오코너(Aiden O'Conor)의 갑옷 세트를 모두 찾아냈다`. | Medium-high |
| `50133` | Meaning | `excuse your inevitable resistance` means the speaker will pardon or overlook the resistance, not merely understand it. Rephrase `이해해 주마` to preserve that meaning. | Medium-high |
| `50147` | Name format | The quest objective `Talk to Ariel` renders Ariel only as `아리엘`. Pair the name as `아리엘(Ariel)` while retaining the objective form. | High |
| `50173` | Meaning / name format | `the Bursar's got` means “the Bursar has”; Korean treats `Bursar's` as part of the title and adds a possessive particle. Use `대회계원(Bursar)이` as the subject. | High |
| `50178` | Proper-name format | The chapter text leaves several source names unpaired, including High Priestess Graf, Eldrith, and Magna Cortis. Add English forms at their Korean occurrences. The Korean eight-break layout matches English and Chinese; Japanese has 12 breaks, so retain the current layout rather than inserting breaks without stronger layout evidence. | High |
| `50193` | Proper-name format | The first mention of `Secandra` is only `세칸드라`; a later mention in the same entry is paired. Add `(Secandra)` at first mention and leave the already paired later mention intact. | High |
| `50204` | Rank/name format | `Praetorian` appears only as `프레토리안`. Pair the source term as `프레토리안(Praetorian)`; do not infer a more specific military rank from this line. | Medium-high |

## Rechecked Decisions and Structure

- The current standalone label at `50160` remains `예정된 자(Preordained)`.
  This is the established singular/member form; collective references use
  `예정된 자들(Preordained)`. Japanese `定められし者` and Chinese `天命者`
  support the current singular label. No correction is proposed.
- The earlier `50067` approval is recorded in
  `decision-register-20261009.md` and
  `edit-batch-20261010-addendum.md`; the current CSV no longer contains that
  accepted wording. Its historical ledger row was not overwritten.
- Exact-English duplicate groups `50027`/`50145` (`Greetings.`),
  `50100`/`50137` (`Goodbye.`), and `50205`/`50235` (`Hey.`) have matching
  Korean within each pair.
- Five entries contain embedded line breaks: `50085` (5), `50174` (1),
  `50178` (8 English/Chinese/Korean; 12 Japanese), `50193` (2), and `50229`
  (4). Korean follows English and Chinese, totaling 20 breaks; Japanese has
  24. Existing Korean breaks were preserved.
- Of 250 IDs, 204 have indexed asset associations, represented by 211
  ID-asset links across 132 assets; 46 have no indexed asset. Of the 181 new
  ledger IDs, 135 have indexed associations and 46 do not. Asset links do
  not establish a specific speaker or playback order.

## Range Result

- This range has 18 current correction-candidate IDs; 232 IDs have no
  current finding.
- After appending 181 IDs, the ledger covers 54,161 of 65,135 unique
  `default` IDs (83.15%), leaving 10,974. Sequential coverage reaches
  `50249`; next is `50250`-`50499`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
