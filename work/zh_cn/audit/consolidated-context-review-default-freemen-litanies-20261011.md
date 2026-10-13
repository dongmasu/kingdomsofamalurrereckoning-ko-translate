# Consolidated Context Review: Freemen, Litanies, Votives, and Follow-ups

- Date: 2026-10-11.
- Scope: previously uncertain `default` IDs 64952, 64954, 64974, 65048,
  65069, 28576, 30318, 30555, 31304, 31802, 29764, 30261, 30974,
  31681, 32165, 25797, 30158, 28999, 29797, 28856, 29318, 28266,
  29973, 29772, 32199, 30459, 31378, 28649, 29267, 31535, 31580,
  28640, 28809, 28239, 31019, 28864, 29921, 29313, 30281, 31985,
  28263, 29859, 31407, 28969, 31349, 28813, 30074, 25617, 27325,
  28872, 30769, 31432, 31458, 26163, 28674, 29689, 31567, 29140,
  30842, 31205, 29057, 30916, 29144, 30834, 25654, 28916, 31050;
  rechecked but retained IDs 65005 and 65101.
- English controls meaning, Japanese informs presentation, and Chinese is
  supporting evidence. The Japanese-derived Korean draft and active Korean
  were checked by ID. These are working dispositions.

## D-18219: The Freemen (64974)

English `The Freemen` and Japanese `フリーマン団` identify the named group.
The active `자유민단` diverged from the earlier accepted named-faction
rendering at D-14185, D-16464, D-16754 and D-16764. The same name occurs
as `프리맨(Freemen)` in active IDs 2450, 3863, 46350, 54379, 55451 and
55521. Change only ID 64974 from `자유민단` to `프리맨(Freemen)`. Do not
infer that generic lower-case `freemen` elsewhere must be transliterated.

## D-18220: Existing Korean Is Adequate (64952, 64954, 65069)

- 64952: English `Saken Plains contract` corresponds to the grave-ring
  contract described at ID 5220 as taking a marriage ring from a grave
  on the `Forsaken Plains`. Japanese also calls it a forsaken plain.
  Current `버림받은 평원 의뢰` preserves the reference without reproducing
  the apparent English abbreviation/typo; its place-name convention
  remains an independent corpus-wide question.
- 64954: English `my custom` in the request for spare iron refers to
  trade/business under the new regime; Japanese mentions saleable iron.
  Current `내 장사` expresses this sense. Chinese's tradition reading
  does not override the English trading context.
- 65069: English `Place the Litanies` is a quest action. IDs 23590 and
  49766 explicitly describe five litanies to place on the Litany Altar;
  Japanese `連祷書を置く` corroborates physical items, while Chinese
  `放置祷文` supports the action. Current `연도문 놓기` accurately
  refers to the collected texts, regardless of whether other entries
  call them books or texts.

## Retained Uncertainty (65101)

`Cillian Keen` at ID 65101 matches the active `킬리언 킨` at ID 589;
the personal-name meaning and the reference to Cape Solace are clear.
However, accepted D-3031 uses `솔라스 곶(Cape Solace)`, while D-14960
uses `케이프 솔러스 마을` and other active occurrences use `솔러스 곶`.
D-752 only calls `솔라스` plausible, not canonical. No local evidence
selects a global place-name form; retain the existing uncertain
disposition and do not edit 65101.

## D-18221: Gravehal Master-at-Arms (65048)

English identifies Ollie Madsen as Gravehal Keep's `master-at-arms`.
IDs 13436 and 34890 explicitly describe the position as training fighters;
ID 17267 has Ollie provide beasts to test the player's combat training,
and ID 35410 links choosing a master-at-arms to the armory. The active
`무술 교관` communicates the demonstrated function without inventing a
military command rank. Retain the current Korean as `not an issue`.
The similarly worded 65005 `kerchief` remains uncertain: Japanese uses
scarf and Chinese handkerchief; additional quest occurrences still vary
on the exact shape of the cloth.

## D-18222: Repeated Standalone UI/Dialogue Labels

The five `Good luck.` rows (28576, 30318, 30555, 31304, 31802) all use
`행운을 빌어.`. English, Chinese `祝你好运`, Japanese `頑張れ` (with the
same exhortation `頑張って` at 31304), the Japanese-derived Korean draft,
and active Korean agree on the wish. No name, object, or lore referent is
present in these exact standalone rows.

The five `Welcome.` rows (29764, 30261, 30974, 31681, 32165) all use
`어서 오세요.`. English, Japanese `ようこそ`, Chinese `欢迎`, the Korean
draft, and active Korean agree on the welcoming function. The Korean
polite form is suitable without relying on a specific speaker relationship.
Reclassify all ten keys as `not an issue`; no CSV text changes.

Other repeated greetings/farewells remain outside this decision: English
`Hello`, `Goodbye`, and `Farewell` leave register and speaker relationship
less constrained, so their casual Korean forms were not blanket-cleared.

## D-18223: Repeated Plain-Language Lines

The following nine exact English lines recur with identical Korean
translations. ID-aligned English, Japanese, Chinese, Japanese-derived
Korean, and active Korean comparisons support the same standalone speech
act or proposition at every listed ID:

| English | IDs | Current Korean |
| --- | --- | --- |
| `Thief!` | 25797, 30158 | `도둑!` |
| `Murderer!` | 28999, 29797 | `살인자!` |
| `How goes the restoration?` | 28856, 29318 | `복구는 잘돼 가?` |
| `What do you want me to do?` | 28266, 29973 | `내가 뭘 하면 되지?` |
| `Not right now.` | 29772, 32199 | `지금은 안 돼.` |
| `Good day.` | 30459, 31378 | `안녕하세요.` |
| `Be careful.` | 28649, 29267 | `조심해.` |
| `Be well.` | 31535, 31580 | `잘 지내.` |
| `Oh, it's you.` | 28640, 28809 | `아, 너였군.` |

Japanese and Chinese agree on each phrase's core meaning; the Japanese
forms also support the existing plain conversational Korean where
applicable. No locale term, runtime marker, or value in these isolated
rows requires an independent unresolved decision. Reclassify all eighteen
keys as `not an issue`, with no CSV edits. Other short questions and
goodbye/farewell forms remain open where their register or pragmatic force
is not established.

## D-18224: Repeated Conversation Lines

These six additional exact English phrases recur with the same active
Korean translation. All five files agree on the conversational meaning;
Japanese also corroborates the existing register and Chinese independently
supports the sense:

| English | IDs | Current Korean |
| --- | --- | --- |
| `Hello there.` | 28239, 31019 | `안녕하세요.` |
| `Hey there.` | 28864, 29921 | `안녕.` |
| `Nice to see you.` | 29313, 30281, 31985 | `만나서 반가워.` |
| `What are you doing?` | 28263, 29859, 31407 | `뭐 하는 거야?` |
| `Carry on.` | 28969, 31349 | `계속해.` |
| `Good luck out there.` | 28813, 30074 | `밖에서도 행운을 빌어.` |

The source wording at every listed ID is standalone and contains no
unresolved proper name, lore term, runtime marker, or value. In particular,
the Japanese idiom at the last pair is a cautionary wish, while English
and Chinese explicitly wish the listener luck/safety; Korean follows the
English meaning authority. Reclassify these fourteen keys as `not an issue`,
without edits. Other short phrases whose locales disagree in speech act or
whose Korean honorific cannot be assessed remain uncertain.

## D-18225: Champion (25617, 27325, 28872)

Each English row is exactly `Champion.`; Japanese uses `チャンピオン`,
Chinese uses `冠军`, and both the Japanese-derived Korean draft and active
Korean use `챔피언.`. The source is a standalone address/title with no
additional proper name or gameplay effect in the row. The Korean loanword
preserves that address naturally; unrelated proper-name alignment in the
original batch is not a defect in these three cells. Reclassify the three
keys as `not an issue`, without editing the CSV.

## D-18226: Polite Hello (30769, 31432, 31458)

All three English rows are the standalone greeting `Hello.`. Japanese
`こんにちは` and Chinese `你好` match the greeting function, and both
Korean source-derived draft and active Korean use the polite, natural
`안녕하세요.` No speaker/name/lore material occurs in these rows; unrelated
batch-wide terminology uncertainty does not affect this translation.
Reclassify the three keys as `not an issue`, with no CSV edits. Keep the
distinct informal `안녕.` rows and farewells open where speaker relationship
may determine Korean register.

## D-18227: Room and Gambling Den Labels

IDs 26163, 28674, 29689, and 31567 are the standalone English label
`Room`; Japanese `部屋` and Chinese `房间` support the existing Korean
`방`. IDs 29140, 30842, and 31205 are `Gambling Den`; Japanese `賭博場`,
Chinese `赌场`, and Korean `도박장` agree on the facility category.
Other English rows confirm that people work, wager, and drink in the
Gambling Den and describe it as a building in the market/Arena. The
capitalization does not establish a unique proper-name translation. All
five files, including the Korean draft, were compared by ID. Reclassify
these seven keys as `not an issue`; no CSV edit.

## D-18228: The War (29057, 30916)

Both English rows contain only `The War`; Japanese has `戦争`, Chinese
`战争`, and both Korean versions have `전쟁`. The label may refer to a
specific in-world conflict, but none of the locale rows supplies a distinct
name or additional relation that Korean omits. The current generic Korean
meaning is accurate; keep the question of formal event naming separate from
the row-level translation disposition. Reclassify both keys as `not an
issue`, without CSV edits.

## D-18229: Team Tournament (29144, 30834)

Both English rows are the standalone `Team Tournament`; Japanese
`チームトーナメント`, Chinese `团队锦标赛`, and Korean `팀 토너먼트`
all identify the same team-based tournament category. The Korean loanword
is a direct, natural equivalent and no distinct proper-name treatment is
required by these labels. Reclassify both keys as `not an issue`, without
CSV edits.

## D-18230: Repeated Request to Stay (25654, 28916, 31050)

All three English rows are exactly `I want you to stay.`; Japanese
`残ってほしい`, Chinese `我想要你留下来`, and Korean `네가 남았으면 해`
express the same wish/request. No item, sale, or magic terminology occurs
in these lines; those topics in the earlier grouped uncertainty do not
change their standalone meaning. Reclassify all three as `not an issue`,
without CSV edits.

## D-18231: Letter Addressee (65032)

The aligned rows are English `N,`, Japanese `Nへ`, Chinese `N，`, and Korean
draft/active `N에게,`. ID 65031 immediately introduces a letter (`I have a
letter for you.` / `手紙を預かってきた` / `我有一封信要给你。`). English's
comma is a conventional letter salutation; Japanese explicitly marks the
recipient and Korean preserves that recipient relation. The actual name
represented by `N` is outside this fragment, but no row-level mistranslation
is established. Reclassify ID 65032 as `not an issue`; no CSV edit.

## D-18232: Votive Object Name (13358)

English `Find the remaining votives` gives no candle-specific meaning.
Japanese uses `装身具` (ornamental/wearable objects), Chinese uses
`许愿石` (wish stones), and quest context at IDs 27280 and 3278 says these
physical objects are carried/collected and open a wall or doors. The active
`봉헌 초` adds an unsupported candle shape. Change only ID 13358 to
`남은 봉헌물 찾기`, using the established broad object wording in the
related quest rows. Do not generalize this finding to isolated inventory
labels such as `Votive of Water/Leaf/Stone/Flame`, whose item category remains
uncertain.

## D-18233: Sinsear Votives Requirement (14542)

English says the route deeper into Sinsear is closed to anyone not bearing
the proper votives. Japanese identifies them as `装身具`; Chinese says the
matching charms must be carried to pass. Korean `정해진 봉헌물을 지니지
않은 자에게는 길이 열리지 않습니다` preserves both the physical-carriage
condition and access rule without over-specifying their shape. The Sinsear
destination is explicit in English and Japanese and is retained in Korean.
Reclassify ID 14542 as `not an issue`; no CSV edit.

## D-18234: Votive Context Resolved, Other Terms Retained

Repeated quest text at IDs 3278, 27280, 33338, 43083, 44947, 49056, 49738,
57115, and 65058 consistently treats votives as countable physical objects:
they are carried by Fae, collected in multiples, and used to open doors,
walls, or passages or to proceed to the next trial. Japanese repeatedly
uses `装身具`, Chinese repeatedly uses `还愿符`/`许愿石`, and English uses
`votive(s)`. This supports the existing generic `봉헌물` where used and
rules out reading the cluster as the act of offering itself.

This contextual finding does not settle the referent of `the Sorrows` in
IDs 49738 and 65058, nor a canonical Korean name for the `Crying Eyes` trial
at IDs 49056 and 57115. Keep those four rows uncertain, linked to this
evidence without recounting. Keep isolated equipment-like item labels
10550, 11834, 58667, and 59812 uncertain pending inventory/category context.

## D-18235: Court of Enchantments Name (11 Labels)

IDs 158, 5395, 5588, 8114, 11873, 13650, 15635, 16952, 26547, 28140, and
29765 are all the exact English label `Court of Enchantments`. Every aligned
active Korean row already uses `마법의 궁정` (ID 11873 includes the optional
English parenthetical). Chinese consistently uses `魔法廷`. Japanese varies
between `祝福の宮殿` and `英雄院`, reflecting a localization choice rather
than a Korean source mismatch.

Quest context establishes the referent as the House of Ballads' named court
and body of heroes: it resides in the House Oratory, marches together, can be
rescued or kidnapped as a group, and is explicitly described as the House's
home where heroes gather and train (IDs 4452, 5668, 18244, 18334, and
60617). Prior accepted D-1815 already corrects the same name to
`마법의 궁정`. The current labels use that established form and preserve the
source entity; reclassify all eleven as `not an issue`, with no CSV edits.

## D-18236: The Midden Place Name (4187, 9537, 13888, 16310)

All four English rows are the standalone capitalized label `The Midden`;
Japanese consistently gives the phonetic place name `ミッデン`, and both the
Japanese-derived draft and active Korean use `미든(The Midden)`. Chinese
uses the literal `贝冢`, but English context at ID 5467 explicitly calls the
Midden an ancient, magical place and home of beings older than the Fae. ID
64218 says the Eldest can return to the Midden, independently confirming a
destination/community rather than a loose refuse heap. Prior accepted
D-1384 at ID 5467 already treats it as a named place. Reclassify the four
standalone labels as `not an issue`; no CSV edit. The separate Cthongeny
question at ID 16311 remains uncertain.

## Integrity and Checkpoint (D-18219-D-18230)

- D-18219 reclassifies one existing uncertain key as accepted; D-18220
  reclassifies three existing uncertain keys as `not an issue`; D-18221
  reclassifies ID 65048 and D-18222 reclassifies ten standalone label keys
  as `not an issue` without CSV edits. D-18223 reclassifies eighteen
  repeated plain-language rows; D-18224 reclassifies fourteen repeated
  conversation rows; D-18225 reclassifies three standalone `Champion.`
  rows; D-18226 clears three polite `Hello.` rows; D-18227 clears seven
  `Room`/`Gambling Den` labels; D-18228 clears two standalone `The War`
  labels; D-18229 clears two `Team Tournament` labels; D-18230 clears
  three repeated requests to stay. IDs 65005 and 65101 stay uncertain and
  are linked without recounting.
- The only changed `Texto` is ID 64974. No runtime marker, numeric value,
  or embedded line break was changed.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-freemen-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
- Post-edit SHA-256:
  `ea3a78994d8a47dc49ef1a92434be768ae5ea1092d37ee25cf84468ebf0782ee`.
- Byte comparison confirms exactly one replacement, with BOM, 72,011
  CRLF and 73 bare-LF endings unchanged.
- Cross-resource totals through D-18230: 1,919 accepted, 23,041
  `not an issue`, 13,562 uncertain (38,522); next D-18231.

## Follow-up Integrity and Checkpoint (D-18231-D-18236)

- D-18231 reclassifies 65032 and D-18233 reclassifies 14542 from uncertain
  to `not an issue`. D-18232 corrects ID 13358 from `남은 봉헌 초 찾기` to
  `남은 봉헌물 찾기` and reclassifies that key as accepted. D-18234 narrows
  four existing votive uncertainties but does not recount them. D-18235
  reclassifies eleven established `Court of Enchantments` labels as
  `not an issue` without CSV edits. D-18236 reclassifies four standalone
  `The Midden` labels using accepted D-1384 and repeated place context.
- The only changed `Texto` in this follow-up is ID 13358. No runtime marker,
  numeric value, or embedded line break was changed.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-votive-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `ea3a78994d8a47dc49ef1a92434be768ae5ea1092d37ee25cf84468ebf0782ee`.
- Post-edit SHA-256:
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- Byte verification confirms exactly one replacement; the UTF-8 BOM,
  65,135 data rows, ID order, 72,011 CRLF and 73 bare-LF endings are
  unchanged.
- Cross-resource totals through D-18236: 1,920 accepted, 23,058
  `not an issue`, 13,544 uncertain (38,522); next D-18237.
