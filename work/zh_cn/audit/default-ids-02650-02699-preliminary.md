# Preliminary Language Scan: `default` IDs 2650-2699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2650-2699.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked dialogue register,
  named entities, item/quest labels, and runtime values.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2650 | ... 더 도전적인 역할을 맡고 싶었지만, 최선을 다하겠습니다. | Recheck the final register against the speaker's surrounding dialogue; the Japanese is casual and feminine (`ベストを尽くすわ`), while Korean ends in the formal `-겠습니다`. | English does not specify honorific level. Korean preserves the meaning but may be more formal than the Japanese voice reference. | Medium |
| 2656 | 간도 크시네. | Check whether the honorific `-시네` fits the speaker; Japanese uses a casual, pointed remark. | English `A lot of nerve you have` and Japanese `いい神経してるわね` are direct. The Korean idiom is apt, but its honorific ending may soften or shift the relationship. | Medium |
| 2657 | 네? 누구세요? | Consider a blunter form such as `네? 누군데?` if surrounding dialogue confirms the Japanese register. | Japanese says `あんたは誰だ？`, an informal/direct “who are you?”, while Korean uses polite `누구세요?`. English leaves register open. | Medium |
| 2667, 2673 | 정해진 자들(Preordained) ... | Treat `the Preordained` consistently as the named Fate-aligned group; verify the established Korean term without replacing generic uses of predestination globally. | This repeats the historical question. Both current lines clearly refer to a group, but the corpus has competing forms such as `정해진 자들` and `예정된 자들`. | Medium |
| 2669 | 하이페리언(Hyperian) ... 우리 민족의 운명 ... | Confirm the identity of `Hyperian` and the people whose fate is meant; retain the current English traceability pending lore context. | English, Japanese, and Chinese agree that the gods brought the addressee to answer a riddle tied to the speaker's people's fate. This repeats the historical question. | Medium |
| 2674 | 파스머(Phasmer) ... 대사제 ... 이리온(Irion) ... | Verify the spellings and the referent/title `Hierophant`; preserve the deceptive instruction that Irion be told Phasmer died. | The active Korean follows the English plot, and Japanese/Chinese support the same deception. Canonical names and title usage remain open. This repeats the historical question. | Medium |
| 2675 | ... 문다운(Moondown) ... | Confirm whether `Moondown` is a place, camp, or objective label; do not translate it from the Japanese descriptive rendering alone. | English capitalizes it as a proper name; Japanese translates it descriptively and Chinese renders a camp/location. Korean transliteration is plausible but unverified. This repeats the historical question. | Medium |
| 2680 | 이게 바로 이빨(The Teeth)... | Confirm whether `The Teeth` is the named Teeth of Naros location and whether Korean should identify a place (`여기가 바로 ...`) rather than use the singular `이게`. | English uses plural `these are`; Japanese also uses “these/fangs,” while Chinese reads it as “here is the Teeth of Naros.” The setting referent determines the natural Korean deixis. This repeats the historical question. | Medium |
| 2683 | 가장 현명한 필멸자, 이사의 수호자. 니랄림(Nyralim)은 지금도 우릴 지켜보고 계십니다. | Review whether the first two fragments are titles/invocation and align the register and `Ysa` spelling with established terminology. | English capitalizes the epithets; Japanese treats them as direct address, while Chinese reads them as descriptive titles. Korean's honorific for Nyralim may be intentional but needs lore context. This repeats the historical question. | Medium |
| 2685 | 운명 없는 자여 ... {*1 20분} ... {*1퀘스트} ... | Confirm the glossary form for `Fateless One` and preserve the indexed markers, 20-minute value, and `{LINE_SPACE}` placement. | The current warning retains the time, quest label, and line-space marker; the historical question remains about title terminology and display convention, not a lost value. | Medium |
| 2686 | 절제 | Keep the intended `Temperance` meaning; record that English spells it `Temperence`. | Japanese and Chinese both mean temperance/moderation. The Korean normalizes the apparent English typo without altering the meaning. This repeats the historical source-spelling question. | High |
| 2687 | ... 사이온(Scion) ... 데드 켈(Dead Kel) ... 아카라(Akara) ... | Reconcile the title `Scion` with its other corpus forms; preserve the duty/blessing/power relationship and the named entities. | English and Japanese support a role/title `Scion`; Chinese instead says “priest.” Korean's `사이온` preserves the title but differs from other draft renderings. This repeats the historical question. | Medium |
| 2690 | ... 전승(Telling) ... | Confirm whether `the Telling` is the named Fae story-cycle/tradition; retain it as a term rather than ordinary narration if that is the established glossary decision. | English capitalizes `Telling`; Japanese says a tradition/story and Chinese a prophecy. Korean's `전승` is plausible. This repeats the historical question. | Medium |
| 2691 | 크로우즈(The Crows) ... 용맹의 군주들(Lords of Valor) ... | Verify both as named Arena teams and align their Korean forms with related team/faction entries. | English identifies opponents and a named group; Korean preserves both names and the contrast between reaching far and lacking the ability to win. This repeats the historical question. | Medium |
| 2693 | 도와주시겠어요? 시간 내주신 대가는 드리겠습니다. | Check whether polite Korean is appropriate for this speaker; Japanese uses casual requests, while the English leaves register open. | The offer and payment are preserved, but `-주시겠어요` / `드리겠습니다` may be more deferential than the Japanese voice. | Medium |
| 2695 | 파르웬(Parwen)의 명령서 | Retain the English-supported `Parwen` reading unless quest context resolves the Japanese conflict; confirm whether `Orders` is a document/title. | English says Parwen, Japanese identifies Irankoto, and Chinese appears to read a war-alliance term. Korean correctly follows the English name but the source-reference conflict remains. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked source-keyed historical `default` questions for IDs 2667, 2669,
  2673-2675, 2680, 2683, 2685-2687, 2690-2691, and 2695. Their terminology
  and context questions remain open; no historical disposition was treated
  as approval.
- Other same-numbered historical rows, including `base` item-name questions,
  were kept separate from this `default` dialogue range.

## Other Checks

- ID 2685 retains the `{*1...}` markers, the 20-minute value, and
  `{LINE_SPACE}`. ID 2697 retains both staff-damage values (+7 and +10%).
- The remaining inspected rows had no additional high-confidence meaning
  shift. Proper-name bilingual marking remains a corpus-wide policy issue.

## Batch Status

IDs 2650-2699 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
