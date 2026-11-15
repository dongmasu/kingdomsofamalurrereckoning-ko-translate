# Sequential `default` Revalidation: IDs `27750`-`27999`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 73 recorded IDs and added 177 new IDs. Twelve correction
  candidates (nine new and three reclassified existing entries) and three
  new evidence-limited holds are recorded. Five earlier candidates and two
  earlier title holds remain.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

These findings await separate approval/application.

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `27803` | Meaning / naturalness | English `Pull and hold` and Japanese `引いたままにする` require holding both controls. Korean `당겨 누르기 ... 눌러` does not clearly convey the sustained action. Consider `{LINE_CENTER}{*1당긴 채로 유지하기}: {1}과 {2}를 당긴 채로 유지해 운명의 힘으로 지금 {*1레코닝 모드}에 진입하세요.` Preserve the English/Chinese/Korean token order; Japanese places the button tokens earlier. | High |
| `27833` | Name / meaning | The same Syllareta is first `실라리타 바우너(Syllareta Vauner)` and later unpaired `실라레타` within one journal. Align the latter to `실라리타(Syllareta)`. Also, English `the surrounding Webwood` and Japanese `周囲のウェブウッド` describe Webwood surrounding Canneroc, not spiders around the outside of Webwood. Consider `주변 웹우드(Webwood)의 거미에게서 독샘을 모아야 했다`. Existing row reclassified. | High |
| `27859` | Meaning / place terminology | The sentence explicitly discusses gambling and earning a living at `the Den`, as does `27631`, which uses `도박장(The Den)`. `소굴(The Den)` obscures that this is the gambling venue, not the Hierophant's hideout. Consider the established gambling-venue form here; do not globally replace every Den. | High |
| `27874` | Meaning / terminology | English `uncovered the Missives from the Shroud of Omission` and Japanese `書から隠れ蓑を取り除いた` mean removing the concealing shroud from the book. Korean `장막에서 밀서들을 찾아냈다` wrongly describes finding letters inside the shroud. Consider `세이블의 서신(Sable's Missives)을 덮은 망각의 장막(Shroud of Omission)을 벗겼다`, checking the full established book title before application. Preserve the transported guards, disturbance, meeting Grim, and escape. Align `프레토리안 근위병` with established `프레토리안 근위대(Praetorians)` if this denotes the collective force. | High |
| `27886` | Name / format | English `Summer ... Fae` and Japanese `サマー・フェイ` distinguish Summer from Winter. Korean has the correct `여름 페이` but annotates only `(Fae)`, unlike `(Winter Fae)`. Consider `여름 페이(Summer Fae)`; preserve the shared-nature statement and comradeship. Existing row reclassified. | High |
| `27888` | Meaning | `Fae or not` means regardless of the quarry being Fae; Korean `페이가 아니더라도` selects the negative conditional and leaves the subject ambiguous. Consider `상대가 페이(Fae)든 아니든, 술만 깨 있었다면 그 투아사(Tuatha)를 추적할 수 있었어`. Preserve the moonless-night/smell boast and all names. English is primary where Japanese drops the sobriety condition. | High |
| `27908` | Name / format | English explicitly spells the person `Byrnes`, but the Korean annotation is `(Burns)`. Correct only that annotation to `(Byrnes)` while retaining `번즈`, the speaker's doubts, the supplies, and the refugees. The honorific/rank wording needs context before expansion to a new personal title. | High |
| `27957` | Name / format | `Grave of Lieutenant Colad` lacks the person's English pairing. Consider `코라드 부관(Lieutenant Colad)의 무덤`, keeping it a grave label. The rank/age is not inferred from surrounding records. | High |
| `27968` | Name / format | `Apotyre sickness` is `아포티르 병`; established source-identical place occurrences use `아포타이어(Apotyre)`, including `27472`. Consider `아포타이어(Apotyre)의 병`, preserving the disease/topic label without inventing a named diagnosis. | High |
| `27983` | Creature terminology | English `sprites` and Japanese `スプライト` name the creature type; Korean generic `요정들` loses it. Consider `둥지에 있던 스프라이트(Sprite)들을 모두 처치했다`, preserving the completed objective and intention to collect the reward. Existing row reclassified. | High |
| `27984` | Name / format | Source is the complete epithet `Maire, Queen of Cups`. Korean pairs only Maire. Consider `컵의 여왕 메어(Maire, Queen of Cups)`, preserving the source-local epithet rather than inventing a new character or changing Cups without a terminology decision. | High |
| `27995` | Place terminology / format | `Champion` and Japanese `賭博場` place this Den in the gambling-venue context. Korean unpaired `소굴` should follow `도박장(The Den)` as at `27631`, consistent with the candidate at `27859`. Preserve the request to remain, and do not apply this to the separate Hierophant's Den. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `27838` | Meaning / sibling age | English says `sister` without relative age; Japanese says younger sister and Chinese says older sister. Korean selects younger. Preserve pending direct family context rather than silently establishing the sibling's age. |
| `27916` | Meaning / context | `replenish my store` follows an invitation for a drink. It may mean supplies/reserves, while Korean `창고를 다시 채워야겠어` specifies a warehouse. Japanese/Chinese also choose a storehouse; check scene/person context before changing this to liquor or stamina. |
| `27937` | Speech level | Japanese is plain but Korean uses consistent polite `-요`. A service refusal can plausibly be polite; the excerpt does not establish the speaker's identity or service stage. Do not enforce plain speech from asset association alone. |

## Earlier Findings And Checks

- Retain `27767` (singular Templar terminology), `27798` (archaic stranger
  address), `27915` (disjointed parallel expression), `27929` (Sun Stone
  pairing), and `27930` (magic phrase/spell terminology).
- Retain the singular-Templar title holds at `27822` and `27992`. The
  established plural-faction name is not automatic approval for singular
  personal titles.
- 65 exact-English duplicate groups touch this range (984 corpus rows).
  Only `What is this about?` differs in Korean; Japanese distinguishes
  `一体何の話だ？` from this ID's `何の用だ？`, supporting `무슨 용건이지?`
  versus `대체 무슨 얘기야?`. No automatic unification is proposed.
- Newline counts agree across all four languages. Verse at `27815`,
  `27853`, and `27909` preserves the reference line count.
- Normalized runtime/localized-markup signatures agree except for the
  documented Japanese-only token order at `27803`; Korean matches English
  and Chinese there. Reordering tokens is not needed to fix its wording.
- No per-key speaker or playback order was derived from numeric order,
  NPC symbols, asset association, or handler serialization.

After this range, 37,737 of 65,135 unique IDs are recorded (57.94%),
leaving 27,398. Sequential coverage reaches `27999`; next: `28000`-`28249`.
