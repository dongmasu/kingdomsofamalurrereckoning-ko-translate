# Sequential `default` Revalidation: IDs `35500`-`35749`

- Date: 2026-11-12.
- Compared all 250 in-range rows in English, Japanese, Chinese, and active
  Korean.
- Rechecked 55 existing ledger entries and reviewed the other 195 in-range
  IDs.
- Findings are proposals, not approved translation edits. No translation
  CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `35510`, `35568`, `35581`, `35613`, `35644`, `35706` | Objective form | The English entries are actions (`Explore`, `Recover`, `Begin`, `Speak`, `Explore`), while Korean uses bare noun labels such as `탐험`, `회수`, `시작`, and `대화`. Japanese also phrases these as actions. Consider consistent objective forms: `지하 방 탐험하기`, `도난당한 국경 통행증 회수하기`, `용맹의 의식(Rite of Valor) 시작하기`, `힐러레드(Hillared)와 대화하기`, `그림쇼(Grimshaw)와 대화하기`, and `샤드폴(Shardfall) 탐험하기`. | High |
| `35517` | Title / format | The standalone capitalized label `The Raid` is rendered `습격` without its English form. If this is the named entry, pair the complete label as `습격(The Raid)`. | Medium |
| `35537` | Location terminology | `Mudhold Fasting` is rendered by transliteration as `머드홀드 패스팅`, which does not convey the underground passage described by Japanese `地下通路` and Chinese `通道`. Related entries `32325`, `32740`, and `54487` support considering `머드홀드 지하 통로(Mudhold Fasting)`. Treat this as a terminology proposal, not a global replacement. | Medium-high |
| `35544` | Naturalness | `죽여` currently takes `그 못생긴 얼굴` as its grammatical object in `다음에 데드 켈이 그 못생긴 얼굴을 보이면 죽여`. Consider `다음에 데드 켈(Dead Kel)이 그 못생긴 얼굴을 또 들이밀면 죽여`, retaining the insult while making the target clear. | Medium-high |
| `35546` | Naturalness | `what was left of him` is rendered as the awkward `남아 있던 부분`. Consider `얼마 전에 그를 묻었어… 정확히는 남은 시신을.` English supports the remains reading; Japanese and Chinese also describe his state differently, so avoid adding details beyond what remained. | Medium |
| `35549` | Naturalness | In the card-game exchange, `That's higher I'm afraid` becomes `아쉽지만 높은 패네`, which is awkward after the named card `포`. Consider `아쉽지만 네가 고른 쪽보다 높은 카드네` or another concise game-natural form. | Medium-high |
| `35552` | Name / format | `Farhal` is rendered only as `파르할`, while all three source-language entries retain the Latin name. Consider `파르할(Farhal)`. | High |
| `35565` | Meaning | English `Poor folk? Make amends.` and Japanese `気の毒な民？ 償いとは何だ` read as a questioning reaction. Korean `그들에게 보상이라도 해` instead sounds like an instruction. Consider `불쌍한 사람들? 보상이라도 하라는 거야?` | Medium-high |
| `35580` | Naturalness / consistency | Retain the existing candidate with `22613` and `25368`. The same English, Japanese, and Chinese sentence is phrased differently in Korean. Consider the shared form `클라우드크레스트 산(Cloudcrest Mountain)은 여기서 서쪽에 있으며, 남부 할로우랜드(Hollowlands)를 내려다봐`, preserving each row's distinct continuation. | High |
| `35588` | Naturalness / register | `Be warned: a Fae's been spotted` is rendered `경고한다. 페이가 목격됐어`, shifting from a marked warning to casual speech mid-line. Japanese uses a direct informal warning. Consider a consistent form such as `조심해. 페이가 목격됐어.` | Medium-high |
| `35593` | Naturalness / register | The authoritative introduction shifts from `내가 이 마을의 법이야` to `머물러도 좋다` and then `떠나는 게 좋을 거야`. Consider keeping the blunt authority while making the sentence endings consistent; do not infer a specific speaker from the asset alone. | Medium |
| `35594` | Meaning / syntax | Retain the existing candidate: English and Japanese attach `flesh and blood` to Anokatos, but Korean's `살과 피를 지닌 아노카토스의 뜻만으로` is difficult to parse. Recast the contrast so it is clear that the speaker came by the will of the mortal Anokatos, not by the gods' will. | Medium |
| `35604` | Terminology | `Oracle` is rendered `예언자`, which conflates it with the distinct `Prophet` term. The established distinction is `신탁자(Oracle)` versus `예언자(Prophet)`. Consider `신탁자로서의 신념은 한 번도 흔들리지 않았어...` | High |
| `35608` | Name / title format | The line names both W. Emundas and his shop, `Oddities and Curios, by W. Emundas`. Korean repeats `W. 에문다스(Emundas)` without the initial in the pairing and leaves the shop name unpaired. Pair the complete person and shop labels while preserving the speaker's self-important repetition. | Medium-high |
| `35615` | Item-name format | `Mitharan Dreadscale Mitt` is only partially paired as `미타란(Mitharan) 공포비늘 장갑`. Consider pairing the complete item label: `미타란 공포비늘 장갑(Mitharan Dreadscale Mitt)`. | High |
| `35617` | Title / format | The standalone capitalized title `Crime Doesn't Pay` is translated as `범죄는 이득이 되지 않는다` without its English form. Consider pairing the complete title: `범죄는 이득이 되지 않는다(Crime Doesn't Pay)`. | Medium-high |
| `35618` | Name / format | `Keloren's Legion` is a named unit; Korean `켈로렌 군단` omits the English form. Consider `켈로렌 군단(Keloren's Legion)`. | High |
| `35621` | Title / format | The standalone capitalized label `Valorous Intercept` appears only as `용맹한 요격`. Consider pairing the complete label as `용맹한 요격(Valorous Intercept)`. | Medium-high |
| `35623` | Naturalness | `I am a student of the world, my friend. The world!` is rendered `나는 이 세상을 배우는 사람이야, 친구. 이 세상이라고!`, which is stiff and loses the emphatic repetition. Consider `나는 세상을 공부하는 사람이야, 친구. 세상 말이야!` | Medium |
| `35625` | Naturalness | `All I have to show for my time is this map` is rendered as `여기서 시간을 들여 얻은 건 이 지도뿐`, an awkward construction. Consider `여기 와서 건진 거라곤 이 지도뿐이야… 여기서는 별 쓸모도 없겠지만.` | Medium-high |
| `35631` | Name / format | Retain the existing candidate: the named ring `Maisie's Luck` appears as `메이지의 행운` without the English pairing used in related quest entries. Consider `메이지의 행운(Maisie's Luck)`. | High |
| `35633` | Terminology / naturalness | Retain the existing candidate for `Sacred Pools`: Korean `다섯 성스러운 샘` is awkward and differs from the project's other pool/spring renderings. Consider `성스러운 연못(Sacred Pools) 다섯 곳`. Keep the count at five because English and Chinese say five; Japanese alone says four. | Medium |
| `35645` | Naturalness / format | The letter closing `Yours, Luminitsa` is rendered `그대의, 루미니차`, an unnatural Korean sign-off. Japanese uses a formal closing and Chinese a conventional letter closing. Consider `루미니차 드림`. | High |
| `35655` | Shared-source consistency | Retain the existing candidate with `25157` and `31547`. The repeated sentence `I believe this, as well, but I would never resort to violence` has a different Korean rendering here. Consider aligning the shared sentence to `나도 이 점은 믿어. 하지만 폭력을 쓰진 않겠어.` while retaining the distinct continuation. | High |
| `35663` | Name / format | `Testament` is capitalized and appears as `테스타먼트` without English pairing. Consider `테스타먼트(Testament)`. Its exact referent remains on hold below. | Medium |
| `35666` | Creature label / format | `Tuatha Archer` is only partially paired as `투아사(Tuatha) 궁수`. Consider pairing the complete creature label as `투아사 궁수(Tuatha Archer)`. | High |
| `35667` | Faction name / format | `Sons of Laz` is a named group rendered `라즈의 자손` without its English form. Consider `라즈의 자손(Sons of Laz)`. | High |
| `35675` | Naturalness | `ethereal matters` is rendered `초월적인 문제`, which reads as abstract problems rather than otherworldly or spiritual concerns. The equipment label `손목붕대` also sounds like a medical bandage for `handwraps`. Consider a natural equipment term and a phrase such as `영적인 일에 정신을 집중하도록`. | Medium-high |
| `35689` | Item-name format | The standalone item label `The Goliath Ring` is rendered `골리앗의 반지` without its English form. Consider `골리앗의 반지(The Goliath Ring)`. | High |
| `35715` | Name / format | The named plant `Gallows' Bloom` appears only as `교수대 꽃`. Consider `교수대 꽃(Gallows' Bloom)`. | High |
| `35729` | Location / format | `Warden's Bridge` is a named destination but appears without its English form. The established Korean spelling is `워든스 브리지`; consider `워든스 브리지(Warden's Bridge)`. | High |
| `35739` | Creature label / format | `Ariad Scout Corpse` is rendered `아리아드(Ariad) 정찰병의 시신`, pairing only the place/faction element. Consider pairing the complete label as `아리아드 정찰병의 시신(Ariad Scout Corpse)`. | Medium-high |
| `35744` | Location / format | `Star Camp` is rendered only as `별 야영지`, while the same location is consistently paired elsewhere as `별 야영지(Star Camp)`. Add the English name here. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `35542` | Speech level | Retain the prior hold: Japanese `何ですか？` is polite while Korean `무슨 일이야?` is casual. The asset does not map this key to a speaker or dialogue stage. |
| `35555` | Meaning / entity | English and Chinese say `scrying mirror`, while Japanese identifies it as `Tyrnoch's Eye`. The available key/asset association does not establish whether this is a specific named device; do not add the Japanese-only identification without stronger evidence. |
| `35577` | Meaning / intent | `My blades will always be at your back` may promise support, while Japanese explicitly says the blades are aimed at the listener's back. The full quest asset does not map this key to a dialogue turn or resolve the intended threat/support reading. Retain the Korean pending context. |
| `35663` | Meaning / term | English has capitalized `Testament`; Japanese says `trial`, and Chinese says `covenant`. Korean transliterates it as `테스타먼트`, avoiding an unsupported choice; retain pending context. |
| `35674` | Term / item type | `augmentations` is rendered as `증강물`, but Japanese says armor and Chinese says equipment. The historical terminology review also left this subtype unresolved. Do not substitute a specific gear category without evidence. |
| `35695` | Speech level | Japanese `お好きにどうぞ` is polite, while Korean `마음대로 하시오` uses marked 하오체. With the speaker/stage unmapped, do not normalize the register from this row alone. |
| `35698` | Meaning / title | `Glass of Ambient` is paired in Korean as `앰비언트의 거울`, but Japanese and Chinese give materially different title readings. Keep the current text until context identifies the object and intended title. |
| `35730` | Entity / terminology | English says `dwarf mariners`; Japanese and Chinese also use generic dwarves, while Korean identifies them as `드베르가`. The isolated line does not establish whether the specific Dverga identification is intended. |

## Rechecked Findings and Structure

- The range contains 38 candidate IDs, eight evidence-limited holds, and 205
  IDs with no finding. ID `35663` has a candidate and a separate hold; the
  two dispositions are not collapsed.
- Existing candidates at `35580`, `35594`, `35631`, `35633`, and `35655`
  remain supported after comparison with the current four-language rows.
  Existing hold `35542` remains open.
- Forty-nine exact-English duplicate groups (1,100 corpus rows) touch this
  range; their Korean strings match within each full-string group. The
  sentence-level consistency findings at `35580` and `35655` are separately
  grounded in their related review records.
- No in-range row has a cross-language embedded-line-break-count mismatch.
  Runtime-token and markup order matches Japanese and Chinese in every row;
  at `35513`, English orders the skill-label wrapper before `{1}`, while
  Japanese, Chinese, and Korean place `{1}` before the localized wrapper.
- Historical preliminary questions at `35663` and `35741` were rechecked:
  Korean at `35663` preserves the separate “hurt” and “frighten” claims, and
  `35741` correctly says the merchant sold farmland shares.
- Asset associations remain grouping evidence only. No per-key speaker or
  playback order is inferred.
- Four-language fingerprints for all 55 pre-existing ledger entries match.
  The new 195 IDs bring the ledger to 43,472 of 65,135 unique `default` IDs
  (66.74%), leaving 21,663. Sequential coverage reaches ID `35749`; the next
  range is `35750`-`35999`.
- The generated 530-asset and 65,135-ID catalogs, ledger fingerprints, nine
  related tests, and audit-scoped diff check passed. Translation CSVs remain
  unchanged.
