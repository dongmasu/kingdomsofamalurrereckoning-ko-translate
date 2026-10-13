# Preliminary Language Scan: `default` IDs 4150-4199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4150-4199.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions by resource type and checked interface
  markers, lore terminology, titles, and metaphor consistency.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4152 | 그녀가 줄곧 대사제(Hierophant)였대! 선 캠프(Sun Camp)에 무슨 일이 생길지 몰랐을 리가 없잖아? | Standardize `Hierophant` and preserve the speaker's incredulity about the danger to Sun Camp. | English says she was the Hierophant all along; Japanese calls her a Guide and Chinese a High Priest. Korean uses `대사제`, a formal interpretation that should match other Hierophant references. | Medium |
| 4154 | 그게 그녀의 힘의 원천이자 광기의 원인이야. 평소에는 그렇게 끔찍한 사람은 아니야. 음모 꾸미고 배신하는 걸 싫어하지만 않는다면 말이지. | Preserve the speaker's dry, ironic qualification that she is tolerable if one does not mind plotting and treachery. | English/Japanese/Chinese retain the sarcastic final clause. Korean conveys the irony, though `싫어하지만 않는다면` reads as if the listener must like plotting and betrayal; the source only says “if you don't mind” them. | Medium |
| 4157 | 내가 보내는 물건이 쓸모없다면 용맹의 집(House of Valor) 구역의 상인 중 하나가 꽤 괜찮은 값에 기꺼이 사 줄 거야. | Confirm whether `Valor grounds` is the grounds of the House of Valor or a named trading area, and preserve “tidy price.” | English says vendors on Valor grounds; Japanese names the House of Valor, Chinese says Valor-family merchants. Korean adopts the House of Valor reading and describes a good price, but the place relation is unresolved. | Medium |
| 4159 | 전쟁과 교역을 거쳐 먼 땅에서 들어온 이 갑옷은 한때 강대했던 코르티아 제국(Corthian Empire)의 유물이다. | Standardize `Corthian Empire` and whether `remnant` means an artifact/remnant of the empire or surviving armor from it. | English, Japanese, and Chinese identify it as armor from a former empire. Korean calls it a relic, which is plausible but may imply an intentionally preserved artifact. | Medium |
| 4161 | 신비와 음모가 가득한 곳이지! 꼭대기에 뭐가 도사리는지 아는 사람은 없어. 다들 제 나름대로 짐작은 하지만! | Clarify what “the top” refers to and preserve the playful mystery/intrigue tone. | English says no one knows what lurks at the top; Japanese/Chinese keep that location. Korean preserves it, though `음모` can overstate “intrigue” as conspiracy. | Medium |
| 4163 | 전설의 볼건(Bolgan) 챔피언 체르노보그(Chernobog)를 쓰러뜨리고 최고의 보상, 체르노보그의 피 묻은 눈을 손에 넣었다. | Preserve the named trophy as Chernobog's “bloody eye,” not just an eye. | English and Japanese say bloody eye; Chinese omits “bloody.” Korean follows English/Japanese and retains the detail. | Low |
| 4171 | [무기 설명, `{LINE_LEFT}`, `{LINE_SPACE}`, `{LINE_INDENT}`, and named section markers] | Verify rendering, label localization, and marker placement without changing marker identities/order. | English/Japanese/Chinese have two weapon sections and embedded control/layout markers. Korean retains the primary/secondary and four-factor information, but its second heading uses `{LINE_INDENT}` where English uses `{LINE_INDENT}` after the localized label; verify exact token sequence by structural tooling before any edit. | Medium |
| 4172 | [정치 담론에 관한 장문 인용문] | Preserve the speaker's educated/formal voice and Madeleine Menx quotation; determine whether the source's self-deprecating claim is meant as satire. | English says lack of education/engagement is, quoting Menx, a “source of comforting strength.” Chinese appears corrupted; Japanese says “comfortable source of strength.” Korean translates the phrase as `마음의 안정을 주는 힘의 원천`, a plausible rendering, and retains the quote/layout. | Medium |
| 4174 | 그림자 속의 칼날, 다크 헌터(Dark Hunter) 각하를 소개합니다. | Determine whether `his grace` is a formal honorific or part of a theatrical introduction, and preserve the clipped presentation. | English and Japanese introduce the Dark Hunter with an honorific; Chinese has an unusual literal phrase. Korean's `각하` is formal and recognizable, but the whole line may be a title announcement rather than a normal introduction. | Medium |
| 4177 | 시간의 베틀에 얽힌 이 실이 날 여기로 이끌었어... 이제 알겠어... 너에게로 데려왔구나. | Align the metaphor with English `thread in the weave of fate`; decide whether `time` or `fate` is the canonical concept. | English and Japanese specify fate; Chinese says time. Korean follows Chinese here, whereas ID 4145 uses `운명의 베틀`. This is a recurring consistency conflict requiring one terminology decision. | High |
| 4181 | 케어 엘라사(Caer Elatha) 꼭대기로 돌아가 맥센(Maxen)에게 무슨 일이 있었는지 알려야겠다. 할시어(Halcyor)가 긴 겨울(Long Winter)을 끝내려고 크로싱(The Crossing)의 에너지를 몰래 끌어다 쓴 모양이다. 맥센은 그 사실을 몰랐다. | Confirm whether the return point is the top or entrance of Caer Elatha; retain that Maxen did not know about the energy theft. | English says “top,” Japanese says “entrance,” Chinese is less specific. Korean follows English. It keeps the Long Winter/Crossing relation and Maxen's lack of knowledge. | Medium |
| 4187 | 미든(The Midden) | Determine whether `Midden` is a proper place name or a descriptive mound/refuse heap. | English capitalizes it; Japanese transliterates and Chinese translates literally as a midden mound. Korean keeps both transliteration and source spelling, appropriately leaving the sense open. | Medium |
| 4190 | 여기가 바로 리케이오스(Lykeios)에서 모든 토론이 진행되는 방식이지. 먼저 개회 발언을 하고, 전투로 승자를 가려. | Preserve the striking rule that debate is settled by combat and clarify whether the process is literal. | English, Japanese, and Chinese all say opening statements are followed by combat determining the victor. Korean retains the sequence and explicitly names combat. | Low |
| 4193 | 전승에서 주목할 만한 배역을 맡는 것보다 더 큰 영예는 없어. 전승은 우리가 공유하는 경험의 초석이니까. | Determine whether `Telling` is a named Fae tradition/ritual and standardize the term rather than generic `전승`. | English capitalizes Telling and treats a role in it as a foundational shared experience; Japanese calls it a story/tradition, Chinese a divination. Korean uses generic “tradition,” which may lose the formal lore term. | Medium |
| 4196 | 아니. 하지만 그 여자의 힘이 열쇠였어. 사실 그 여자는 널 또 죽이는 걸 반길걸. 이번에는 네 정수를 붙잡아 둘 영혼의 샘도 없으니까. | Identify the referent of `her` and whether the speaker means Tirnoch's power; do not substitute a name without context. | English leaves the referent implicit; Japanese explicitly says Tirnoch, while Chinese also uses a pronoun. Korean preserves the ambiguity as `그 여자`, which can sound generic. | Medium |
| 4199 | 스콜리아 아르카나(Scholia Arcana) | Standardize the named institution and decide whether to transliterate or use the established Korean institution type. | English names the institution; Japanese calls it a university and Chinese an academy. Korean transliterates it, retaining traceability but not institution type. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4152, 4157, 4159, 4171-4172,
  4174, 4177, 4181, 4187, 4190, 4193, 4196, and 4199 against active Korean
  and matching source rows.
- Same-numbered historical questions for `base` items, including IDs 4150,
  4155, 4157, 4160, 4167, 4177, 4187-4188, and 4192-4193, remain separate
  from these `default` entries; no cross-resource finding was merged.
- The repeated `fate/time` rendering at IDs 4145 and 4177 was reconciled as a
  cross-row consistency question, not as two unrelated corrections.
- No historical disposition was treated as approval.

## Other Checks

- ID 4171's named markers and `{LINE_LEFT}`, `{LINE_SPACE}`, and
  `{LINE_INDENT}` tokens remain present in the active text; no token was edited.
- ID 4172 retains its multiline quoted record.
- IDs 4150-4199 map to the same active `default` IDs; no CSV structure changed.

## Batch Status

IDs 4150-4199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
