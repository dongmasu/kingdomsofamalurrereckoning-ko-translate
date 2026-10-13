# Preliminary Language Scan: `default` IDs 2600-2649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2600-2649.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions and checked long-form meaning, tone, names,
  and dialogue address.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2600 | 카세라(Cassera) 찾기 | Confirm whether this is a completed quest update (“Found Cassera”) or an objective label (“Find Cassera”); if completed, consider `카세라(Cassera)를 찾았다`. | English and Chinese use a found/completed form, while Japanese uses “search for Cassera.” The Korean is an infinitive objective and follows the Japanese reading, so quest-state meaning is unresolved. | Medium |
| 2605 | 투아사(Tuatha)와 볼간(bolgan) ... | Retain the source's lowercase `bolgan` until creature/group usage is reconciled across the corpus; do not capitalize or normalize it globally from this line. | English deliberately presents lowercase `bolgan`; the Korean parenthetical preserves that casing. The surrounding line otherwise conveys the faction's decade-long control and the speaker's indifference. | Medium |
| 2612 | 영웅과 시녀 | Confirm whether `the Maid` is the named Maid of Windemere/title rather than a generic maid; align with the related historical question and ID 2630 without imposing a global replacement. | English capitalizes `Maid`, and ID 2630 explicitly names the Maid of Windemere. Japanese uses a different heroic title, while Chinese says “young woman.” Korean `시녀` may read as an ordinary servant. | Medium |
| 2617 | 그의 지팡이만 있으면 정당한 후계자가 될 수 있어. 최고의 소환사로. | Recast the second fragment so it reads as an apposition/result, e.g. `그의 지팡이만 있으면 정당한 후계자, 최고의 소환사가 될 수 있어.` | English and Japanese say the speaker will become the rightful heir and supreme summoner. The current Korean's sentence-final `최고의 소환사로` is left grammatically suspended and weakens that relationship. | Medium |
| 2629 | `역사가 이레나(Irena) 기록` and the long `The Opponent` account | Correct the climax's subject and causal relation. Candidate for the key clause: `타루크가 테론의 마을을 불태워 폐허로 만들었지만, 마이루도 큰 희생을 치른 끝에 침략자를 물리친 듯하다.` Review `feared debater` and the byline syntax as part of the same passage. | English says “we see” the village devastated and uses “though not without a price” before the Mairu's apparent victory. The Korean instead makes Taruk the subject of “sees the village” and turns the price/contrast into a following event. The essay's six Korean/English/Chinese line segments and five Japanese segments should be reviewed alongside paragraph layout. | High |
| 2630 | ... 이제 시녀(The Maid)가 그 자리를 차지하고 있어. | Resolve `Maid` as a recurring title/name with ID 2612; retain the speaker's condemnation of the court change. | English specifies “Maid of Windemere,” Japanese gives a distinct epithet, and Chinese uses “young woman.” The Korean conveys the complaint but shortens the referent to `시녀`. | Medium |
| 2632 | ... 도브(Dove) ... | Confirm whether `dove` is the addressee's codename/title or an ordinary affectionate form, and keep the Star Camp/Travelers naming policy consistent. | English uses lowercase `dove` as direct address twice; Japanese omits it, while Chinese renders it as “peacekeeper.” Korean treats it as the name `도브(Dove)`, a plausible but unconfirmed reading. | Medium |
| 2639 | ... 선지자의 통치는 굳건하다네. 그림 온윅 ... 대사제가 그를 후회하게 만들 거라고 들었어. | Revisit the line as a compact rumor/rhyme; verify whether `has been assured` means the Seer's reign is secured, and preserve the threat without adding the Japanese-only claim that the coup failed. | English uses a short rhyme and says the Hierophant will make Grim rue his coup. Korean preserves the main rumor but loses the rhyme and shifts “has been assured” to “is firm.” Japanese paraphrases the first half and adds failure/retaliation detail not explicit in English. | Medium |
| 2643 | ... 대성당에서 학자들이 맡는 역할은 꽤 추상적이라 ... | Confirm whether `Scholars` is a formal order/title and which Basilica is meant; `시시한 문제` is a plausible rendering of `banal`. | This repeats the historical question. English/Japanese/Chinese agree on an academic-versus-banal contrast, but the institution and role remain setting-specific. | Medium |
| 2644 | ... 조용히 숙청이 벌어지고 있대. 대사제를 헐뜯기만 해도 ... | Retain the “quiet purge” reading provisionally and verify the political meaning/title `Hierophant` in context. | English `culling` and Chinese's “massacre” suggest a purge; Japanese uses a religious title for the Hierophant, while Korean follows English with `대사제`. This repeats the historical question. | Medium |
| 2646 | ... 끝이 없고, 세월과 시련을 견뎌 낸 사랑이죠. | Preserve the time-and-fire image more directly, e.g. `세월과 불길의 시험을 견뎌 낸 사랑이죠`, if the surrounding voice supports the metaphor. | English says love is “tested by time and fire.” Korean replaces `fire` with general “trials”; Japanese generalizes to difficulties, while Chinese retains “fire.” | Medium |
| 2647 | 투기장 챔피언, 시장에 있는 챔피언 저택으로 가! ... | Translate the address `gladiator` as `검투사`; keep it distinct from the named `Champion's Manor`. | English addresses the listener as “gladiator” and separately names Champion's Manor. Korean's `투기장 챔피언` changes the addressee into an arena champion and duplicates the following “Champion” name. Japanese and Chinese both use their equivalent of gladiator. | High |
| 2648 | 죽어라, 롱레그(longlegs)! | Confirm whether lowercase `longlegs` is a creature type or a generic insult; align with the historical name question. | English uses a lowercase plural-like creature/name label; Japanese translates it literally as “longlegs,” and Chinese says “long legs.” Korean transliteration is plausible but its entity status remains uncertain. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2612, 2624, 2629, 2632,
  2639, 2643-2644, and 2648 against the active Korean and source locales.
  ID 2624 (`The Midden`) is retained provisionally as `미든(The Midden)`;
  the named-location sense remains open.
- Historical entries for other resource types or IDs in the 26,200 range were
  not conflated with this `default` range.

## Other Checks

- ID 2604 retains Quake's +60% damage, 40% final-hit stun chance, 5-second
  duration, and +18 Mana cost. ID 2611 retains both localized runtime
  markers and their vulnerability/resistance senses.
- ID 2629 preserves six Korean line segments, matching English and Chinese;
  Japanese has five. Review paragraph alignment without normalizing breaks
  automatically.
- The remaining inspected rows had no additional high-confidence meaning
  shift. Proper-name parenthetical variation remains a corpus-wide policy
  issue, not authorization for global edits.

## Batch Status

IDs 2600-2649 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
