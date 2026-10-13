# Preliminary Language Scan: `default` IDs 4550-4599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4550-4599.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked meaning, lore,
  equipment, proper names, and display terminology.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4551 | 우리 동굴과 누더기를 보고 코웃음 치고 다니겠지. 그래도 난 라시어 사람이야. 썩어 빠진 외지인이 아니라고. | Confirm the intended force of `wrinkle your nose` and standardize the demonym `Rathiri`. | English is a sneering reproach; Japanese focuses on the smell, while Chinese says to sneer at the caves and rags. Korean preserves contempt but `코웃음 치고 다니겠지` means laugh at them rather than turn up one's nose. `라시어 사람` is understandable but should match the corpus name policy. | Medium |
| 4553 | 그것은 애시무어(Ashmoor)와 이브타이드(Eventide)는 물론, 복수의 집과 위대한 겨울 궁정보다도 오래전부터 황혼의 고개(Twilight Pass)에 존재했어. 웨코나이(Weconai)의 마법은 거칠고 깊지. | Resolve what `It` refers to and standardize the chronology's proper names. | English, Japanese, and Chinese agree that something existed at Twilight Pass before Ashmoor, Eventide, the House of Vengeance, and the Winter Court. The antecedent is absent from this row; Korean retains a pronoun and uses a literal `복수의 집`. | Medium |
| 4554 | 베르차(Bertsa)... 그저 쉽게 돈을 벌려던 용병이었어. 일이 이렇게 끝날 줄은 몰랐겠지... 그래도 암호 조합은 여기 있어. | Confirm what `combination` opens before narrowing it to a code/combination. | English leaves the object unstated; Japanese says only that the combination exists, and Chinese says “password.” Korean's `암호 조합` is plausible but commits to a code-like interpretation without the referenced lock/container context. | Medium |
| 4555 | 신들의 뜻이겠지. 고맙네, 초대받은 자여. 우린 위대한 일을 앞두고 있어. | Confirm the established Korean title for `Beckoned`. | English, Japanese, and Chinese treat `Beckoned` as a form of address/title. Korean's `초대받은 자` conveys the literal sense, but title capitalization and corpus-wide rendering remain unsettled. | Medium |
| 4564 | 볼건(Bolgan)이 이곳에서 처음 피를 흘리게 했다. 새벽 기습 때 에란 가스티르(Erran Gastyr) 경과 그의 아들, 종자들을 죽였지. | Preserve `drew first blood` as initiating hostilities and verify the timing and victims. | English can mean that the Bolgan struck first; Japanese says it attacked first, while Chinese uses a literal “first blood” expression. Korean is similarly literal and could suggest the Bolgan itself was made to bleed. | High |
| 4566 | 감히 나를 심문해? 생각만으로 널 죽일 수도 있어. 물론 꽤 재미있는 생각이긴 하군... | Render `question me` as defiance/challenge rather than a police-style interrogation. | English, Japanese, and Chinese express indignation at being questioned. Korean `심문해` specifically means interrogate and narrows the action; a challenge such as `감히 내게 따져?` may fit the threat better. | High |
| 4567 | 다만 가문의 무기를 가지고 있었다면 모험에 훨씬 더 나설 마음이 생겼을 거야. 거기, 돌브 아른(Dolve Arne)에 있어. | Confirm that `family arms` means weapons here and whether `Dolve Arne` is a place or person. | English and Japanese support “family weapons”; Chinese renders them as family arms. Korean follows the weapon reading, but the final fragment's referent/location remains contextual. | Medium |
| 4573 | 우리는 노움 사회의 중추야. 학자들이 두뇌라면 템플러는 의지지. 하지만 우리는... 그 모든 일을 가능하게 하는 수단이야. | Preserve the brain/will/means analogy and confirm the established faction term for `Templars`. | English and Chinese call the group “the means”; Japanese interprets it as limbs. Korean follows English/Chinese and keeps the contrast, while `템플러` requires corpus-wide terminology review. | Medium |
| 4574 | 잘됐군. 마을 전체에 역병 방패(Plagueshield)가 필요해. 그 늙은 멍청이에게 무슨 일이 있었는지는 됐고, 약이 필요해. 최소 세 꾸러미는 가져와. | Determine whether `that Plagueshield` is a person/title, treatment, or literal protective object. | English capitalizes the term and immediately asks for medicine in three parcels. Chinese translates it literally as a plague shield; Japanese retains the name. Korean's `역병 방패` may falsely identify it as a physical shield. | Medium |
| 4576 | 그 사제가 살해된 건 참으로 비극이야. 어떻게 이 일을 딛고 나아갈지 모르겠어. | Confirm `father` as a priestly title rather than the speaker's parent. | English alone is ambiguous; Japanese and Chinese explicitly read it as a religious father. Korean follows that interpretation with `사제`, which is supported by the references but should be reconciled with setting terminology. | Medium |
| 4578 | 성소들이 내 마음을 꿰뚫고 생각을 괴롭혀. | Determine whether `The Chantries` denotes religious institutions or a supernatural force. | English capitalizes the plural; Japanese and Chinese describe chapels piercing the speaker's mind. Korean uses `성소들`, which can mean sacred places but may not match the formal institution term. | Medium |
| 4585 | 미사란 프리즈미어 흉갑 | Reconcile `Mitharan` with the official Korean manual's `Mitharu` form and standardize `Prismere`. | English names a Mitharan Prismere chestpiece; Japanese transliterates the material, while Chinese renders it as a red-crystal chest armor. Korean has a potentially inconsistent `미사란` and the generic equipment term `흉갑`. | Medium |
| 4587 | 아직 {*1능력}이나 {*1기술}에 포인트를 투자하지 않았습니다.{LINE_SPACE} {1}을 눌러 {*1능력}과 {*1기술}을 업그레이드하세요. | Preserve all ability/skill markup and the button/spacing controls; confirm consistent localized UI labels. | English, Japanese, and Chinese describe unspent upgrade points. Korean preserves the four indexed labels, `{LINE_SPACE}`, and `{1}` in order; wording and spacing should be reconciled with other tutorial entries. | Medium |
| 4590 | 우리는 겨울 페이의 생존자들이야. 바일(Bhaile) 수도에서 온 피난민, 가문에서 쫓겨난 자들, 프리즈미어 칼날을 피해 달아난 자들이지. | Confirm `Houses` as the factional institution and whether `Prismere blades` means weapons or forces. | English, Japanese, and Chinese agree on refugees, House outcasts, and those who escaped Prismere blades. Korean conveys the list; both capitalized terms need consistent corpus-wide treatment. | Medium |
| 4593 | 고맙소, 필멸자여. 여기 남아 다른 애시무어 생존자들을 살펴보겠소. | Clarify whether `look out for` means watch for, search for, or protect survivors. | English permits all three readings; Japanese says wait for them, while Chinese says continue searching. Korean `살펴보겠소` can mean monitor or care for them and leaves the action broad. | Medium |
| 4597 | 프리즈미어 곡괭이 사용하기 | Verify whether `Prismere Pick` is a lock-picking tool or a mining pick. | English is ambiguous; Chinese explicitly describes a lock-picking tool and Japanese transliterates `pick`. Korean's `곡괭이` strongly implies mining equipment and may misidentify the UI action. | High |
| 4598 | 에라티(Erathi)는 이 세계를 떠나기 전 마법 장치를 페이트스원(Fatesworn)에게 맡겼다. | Confirm the collective number and established Korean names for `Erathi` and `Fatesworn`. | English uses the collective `the Erathi`; Japanese and Chinese also describe the people as a group. Korean's singular-looking subject can function collectively, but both names remain subject to the setting glossary. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `default` questions for IDs 4553-4554, 4564,
  4567, 4573, 4576, 4578, 4585, 4587, and 4590 against active Korean and
  matching source rows.
- Same-numbered historical questions for `base` and `affix` remain separate;
  no cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Control-marker sequences and explicit line-break counts match the English
  rows in all three references and active Korean.
- No active CSV structure or text was changed.

## Batch Status

IDs 4550-4599 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
