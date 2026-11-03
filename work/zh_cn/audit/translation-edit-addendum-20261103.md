# Translation Edit Addendum (2026-11-03)

## ID 56331

- Before: `장인의 전당(Craft Hall)을 세워 코라(Cora)는 영지 분쟁과 무역 다툼을 해결하고 시장의 여왕이 되었다.`
- After: `코라(Cora)는 장인의 전당(Craft Hall)을 세워 토지 분쟁과 무역 다툼을 해결하고 시장의 여왕이 되었다.`
- Rationale: The English says, “By making the Craft Hall, Cora settled a land dispute, a trade argument, and made herself queen of the market.” Japanese and Chinese likewise make building the Craft Hall the means or occasion for Cora to resolve the disputes and become the market's queen. Put Cora first as the clear subject, and use “토지 분쟁” for the source's “land dispute”; retain the already established bilingual forms `코라(Cora)` and `장인의 전당(Craft Hall)`.
- Validation: Updated only `default:56331`; the UTF-8 BOM and existing line-ending distribution (71,885 CRLF, 199 LF) were preserved.

## ID 14334

- Before: `운명 직조`
- After: `운명 엮기(Fateweaving)`
- Rationale: The English source is the standalone term `Fateweaving`; Japanese `フェイトウィーブ` transliterates it, while Chinese `织命` literally expresses weaving fate. Other standalone Korean labels for this same source term already use `운명 엮기`. In-game descriptions explain that Fateweavers read the threads of fate and provide readings; a separate gameplay description says they can reset a character's Skills and Abilities. Thus this is a fate-reading practice and service, not literal textile-making. Align this isolated label with the established Korean form and include the English term to clarify the otherwise ambiguous UI label. This initial correction was expanded into the complete occurrence review below.
- Validation: This initial ID-scoped correction was followed by a full occurrence review and consistency pass, documented in `audit/fateweaving-consistency-review-20261103.md`.

## Fateweaving Occurrence Review

- Reviewed all 19 English source rows containing `Fateweaving` or descriptive `fate weaving`, matched by ID against Japanese, Chinese, and active Korean.
- Standardized all 18 practice/service uses to `운명 엮기(Fateweaving)`, including the activity label and seven standalone labels. The remaining descriptive phrase at `default:40909` refers to threads of fate weaving around a target, not the named practice, and remains a natural descriptive translation.
- Corrected sentence-level variants at `default:9804`, `14541`, `24692`, `52562`, and `53721`; other sentence translations were retained after cross-check.
- Confirmed the active CSV's 65,135 data rows, UTF-8 BOM, and existing mixed line endings (71,885 CRLF, 199 LF) were preserved. Detailed row dispositions are in `audit/fateweaving-consistency-review-20261103.md`.

## Health and Mana Absorption Effects

- Reviewed matching item-effect entries `default:8171`, `35589`, `55951`, `41433`, `61555`, and `63306` against English, Japanese, and Chinese.
- Standardized health absorption attacks as `생명력 흡수 공격`, mana absorption attacks as `마나 흡수 공격`, and the flat per-hit values as `적중당 생명력/마나 흡수량 +N`.
- English and Chinese give flat `Health/Mana Stolen per Hit` amounts; Japanese alone adds `%`. Kept the English/Chinese values without adding a percent sign.
- Preserved each entry's two-paragraph layout and line endings. Row-level source comparisons are recorded in `audit/health-mana-absorption-consistency-20261103.json`.

## ID 38156

- Before: `미사루(Mitharu)를 섬기기 위해 세운 곳이다. 선교사들은 평화롭게 살지만, 그곳에도 끓어오르는 갈등이 조금은 있다...`
- After: `미사루(Mitharu)를 섬기는 곳이야. 선교사들은 평화롭게 지내지만, 그곳에도 가끔 갈등이 터지곤 하지...`
- Rationale: The English is a conversational fragment describing a place dedicated to Mitharu and missionaries whose peaceful life is occasionally disrupted by tensions. Japanese uses plain speech and says tensions with the surrounding area are not absent; Chinese likewise confirms conflicts have broken out. Recast the stiff written endings into familiar dialogue without adding a new fact.
- Validation: Updated only `default:38156`; retained the three-dot trailing pause, UTF-8 BOM, CSV row order, and existing line-ending distribution.

## ID 9634

- Before: `형 아르하우스(Arhaus)와 나는 도움이 필요한 나그네라면 누구든 도와준다.`
- After: `형 아르하우스(Arhaus)랑 난 도움이 필요한 나그네라면 누구든 도와주고 있어.`
- Rationale: The English says the speaker and their brother Arhaus help any wayfarer who needs it. Japanese uses plain conversational style; recast the stiff written ending as natural first-person dialogue without changing the meaning.
- Validation: Updated only `default:9634`; preserved the UTF-8 BOM, CSV row order, and existing line-ending distribution.

## Arhaus Occurrence and Sentence Recheck

- Rebuilt the inventory from English: all 25 `default` IDs containing `Arhaus` are `128`, `1549`, `4812`, `5634`, `6667`, `7603`, `9634`, `10677`, `18715`, `20414`, `25890`, `26810`, `28080`, `28795`, `30114`, `30386`, `30626`, `32695`, `32713`, `33059`, `33568`, `35838`, `46910`, `49055`, and `64511`. The active Korean rows use the established `아르하우스(Arhaus)` or `아르하우스 보름(Arhaus Vorm)` forms; `9634` was the missing short-name pairing and is now restored.
- Rechecked all 18 sentence rows (`1549`, `5634`, `7603`, `9634`, `10677`, `18715`, `25890`, `28080`, `28795`, `30114`, `30626`, `32695`, `32713`, `33568`, `35838`, `46910`, `49055`, `64511`) against English, Japanese, Chinese, and Korean.
- Corrected `1549` from `누구에게나 저렇게 구는` to `다른 사람 앞에서 저렇게 구는`, matching “act like that around anyone.” Recast `5634` as `여기 올 때` for the journey here, and corrected `46910` from `스레시(Thresh)에 공격당했다` to the grammatical `스레시(Thresh)에게 공격당했다`.
- Retained the other 15 sentence translations after cross-check; their meaning and register were supported by the aligned source rows. The 7 remaining inventory rows are names, labels, or objectives rather than sentences.

## Sihtric's Brother

- `default:467` changes `오빠` to `형`. English says Sihtric's parents died when he was young and that “he” looked out for him; Japanese explicitly identifies the caretaker as `兄貴` (older brother), and other English rows refer to Sihtric as `him`.
- `default:50467` changes both references to Arhaus from `그` to `형`, following the English account of Sihtric accompanying him to sea and settling where he did; Japanese explicitly uses `兄貴` in both clauses. Recast the second clause as `형이 여기에 자리 잡았을 때 나도 그랬지` to make the shared settling-in meaning natural.

## Gunnar Name Consistency

- English-source inventory: 23 IDs across `base` (`1086`, `1902`, `4415`, `4534`) and `default` (`81`, `17679`, `19281`, `22066`, `28475`, `32520`, `32842`, `36298`, `37828`, `40322`, `41239`, `43736`, `45122`, `45151`, `45649`, `48023`, `49754`, `54730`, `55836`).
- Standardized the English name element `Gunnar` as `군나르` in 22 rows; `default:55836` already used `군나르(Gunnar)`. This covers Gunnar Frode and the separately named Ani Gunnar, Gray Gunnar, and Esme Gunnar; their distinct identities and name order are preserved. Added the missing English pairing to the short-name sentence at `default:32520`.
- Rechecked the 10 sentence rows (`81`, `17679`, `22066`, `28475`, `32520`, `32842`, `36298`, `40322`, `48023`, `55836`) against English, Japanese, Chinese, and Korean. Their meanings and register were retained; changes were limited to the consistent name form and the missing pairing.
- Applied and revalidated the exact-ID changes with `audit/apply-gunnar-name-consistency-20261103.rb`; the script checks expected prior/target text and preserves the UTF-8 BOM and line-ending counts.

## Elayen Name Consistency

- Reviewed every active `default` row containing `Elayen`: `4251`, `36350`, `47407`, and `61245`.
- Standardized the Korean name as `엘레이엔(Elayen)` and `엘레이엔 다크(Elayen Dark)`. The active label at `4251` already used `엘레이엔`; `61245` had the inconsistent `엘레이언` spelling. Added the English form to the two full sentences that lacked it.
- Rechecked `36350` against English, Japanese, and Chinese: it says a visitor seeking an answer or rumor came to the right person, who keeps whispers and secrets in case they are needed. The casual Korean voice is supported by Japanese plain, feminine speech; retained the sentence wording and corrected and paired the name only.
- Rechecked `47407` against English, Japanese, and Chinese: it says Elayen Dark knows everything about Star Camp and directs the player to speak with her for information. The Korean meaning and conversational instruction are accurate; retained the sentence wording and added the full English name.
- Validation: Confirmed all four active rows use the same Korean spelling and the three full-name occurrences include `Elayen Dark`; preserved the CSV BOM, row order, and existing mixed line endings.

## Crilgarin, Knave of Coins

- Started from the supplied IDs `18580` and `21264`, resolved them in English, then used English rows to build the full candidate inventory before checking the matching Korean, Japanese, and Chinese rows. The source-first sweep covered 95 IDs, 99 `Crilgarin` name mentions, and 27 `Knave of Coins` title mentions; Korean text searches were used only as a secondary completeness check. The English-derived ID inventory is `3467`, `5324`, `7362`, `7600`, `8269`, `8887`, `10539`, `11140`, `12388`, `12443`, `12905`, `13661`, `13945`, `14181`, `14630`, `14680`, `14740`, `15100`, `16065`, `16110`, `16257`, `16849`, `16890`, `16899`, `17971`, `18512`, `18580`, `18660`, `20753`, `20943`, `21264`, `23460`, `24134`, `26038`, `26496`, `26500`, `26567`, `26770`, `27351`, `27595`, `28191`, `28275`, `28374`, `29263`, `29504`, `29873`, `31167`, `32244`, `33793`, `34253`, `37238`, `37520`, `37619`, `3768`, `38270`, `40030`, `40661`, `41410`, `41545`, `42460`, `43767`, `44067`, `46010`, `46057`, `46134`, `46313`, `46497`, `48213`, `49052`, `49132`, `49361`, `51009`, `53246`, `53405`, `53769`, `54001`, `55124`, `55352`, `55812`, `55915`, `55939`, `56680`, `56732`, `58850`, `59836`, `60618`, `60626`, `60793`, `62179`, `62283`, `63397`, `63600`, `63659`, `63757`, and `64624`.
- Standardized all 26 active `default` labels whose English source is `Crilgarin, Knave of Coins`: `12388`, `12443`, `14181`, `14630`, `14680`, `16110`, `16849`, `16890`, `18512`, `18580`, `21264`, `23460`, `26496`, `28374`, `29873`, `32244`, `38270`, `40661`, `49361`, `51009`, `53769`, `55915`, `58850`, `60793`, `62179`, and `64624`.
- Standardized every label as `동전의 잭 크릴가린(Crilgarin, Knave of Coins)`, preserving the established Korean title rendering while pairing both the name and title with English. This replaces inconsistent `동전의 건달` / `금화의 건달`, missing title pairings, and reversed name/title order. The Japanese reference itself alternates between “金貨のしもべ” and “金貨の主”; the English source is identical across all 26 rows, and Chinese consistently gives the name followed by a coin/rogue title. The English is therefore the deciding source for the shared title.
- Cross-checked `default:63397`, where Crilgarin says she is unfamiliar with the title but understands it makes her responsible for the camp and its Travelers. The existing sentence accurately conveys that meaning and already pairs `동전의 잭(Knave of Coins)`; retained it rather than changing dialogue to the card-label format.
- Rechecked every English-derived name occurrence and corrected eight clear sentence/UI issues: `8269` clarifies guiding new Travelers away from danger; `12905` and `62283` render “making myself scarce” / “going underground” as `잠적`; `14740` restores Grim as the person who recruited the player and Crilgarin as the one reporting his disappearance; `17971` completes the “Speak to Crilgarin” objective wording; `24134` clarifies planting the Missives in Argine's belongings; `43767` corrects the destination particle to `에게`; and `49052` renders “she's no Crilgarin” as a comparison, supported by Japanese. Other reviewed name references were retained where they matched the English source; all explicit name labels remain paired with `Crilgarin`.
- Applied the 26 label and eight sentence/UI edits with `audit/apply-crilgarin-consistency-20261103.rb`. The script validates each of the 34 IDs against its exact prior or target text and preserves all bytes outside those text fields, including row order and mixed line endings.

## Travelers Number and Faction Name

- Matched 321 `default` rows from capitalized English `Traveler` / `Travelers` references by ID, then checked the active Korean and relevant Japanese and Chinese rows. English capitalization at the start of ordinary-noun sentences (including `19474` and `34073`) does not by itself make the reference the Travelers faction; those generic uses remain `여행자`.
- Rule: use `트래블러(Travelers)` for the faction as a collective name, even where English uses a plural form. Add Korean `들` only when the sentence refers to its individual members as a plural group; do not append it to standalone faction labels. Preserve singular English `Traveler` when it is an attributive or generic singular form, and use plural `Travelers` when the source denotes the faction collectively.
- Removed the unnecessary Korean plural suffix from the 14 standalone faction labels: `669`, `930`, `1206`, `1816`, `3689`, `7540`, `10252`, `16562`, `21528`, `21638`, `32698`, `46484`, `51845`, and `52970`.
- Rechecked and corrected four sentences against English, Japanese, and Chinese: `27134` now uses the singular attributive `트래블러(Traveler) 야영지`; `30280` changes plural possessive `들의` to source-matching singular `의`; `54294` corrects the singular `Traveler ship` possessive; and `55399` removes an unsupported Korean plural from the singular possessive.
- Applied the 18 exact-ID changes with `audit/apply-travelers-number-consistency-20261103.rb`; verified the script syntax, target rows, BOM, and existing line-ending counts.

## Brother and Father Titles

- Built an English-first ID/variant inventory of 228 named-title rows across `base` and `default`, including the source typo `Brother's Til's` at `default:53444`. Compared the matching Korean, Japanese, and Chinese; excluded the separate item title `Band of Brother Monks` and the actual Krast brothers from personal clergy titles.
- Corrected 63 `default` rows. Standard forms are `이름 수사(Brother Name)` and `이름 신부(Father Name)`; preserve an existing Korean `님` before the English parenthetical. Fixed the remaining title order in 27 Etair, 14 Dynwel, 6 Wulf, and 1 Geoff occurrences, with some names sharing a row. Restored the missing title pairings for Nuk, Marsh, and Til.
- All 19 English `Brother Wulf` rows now use `울프 수사(Brother Wulf)`. This includes the multiline journal at `25468`, where `울프(Wulf) 형제` remained. The same paragraph's `whistle` is the physical instrument called a flute at `21596`, not an act of whistling; corrected it to playing a pipe toward the crystal.
- Replaced literal `형제` with clergy-specific `수사` in 15 clear religious contexts, including Udo's fellow monk, the Mission residents, the temple's Lyria clergy, and supported direct addresses. At `19302`, the later figurative reference to fellow mortals remains `형제자매`.
- Rechecked sentence meaning at the changed rows. At `9805`, the trained scribal hand is a script, not the deity's personal handwriting. At `34405`, the Authority is not a council; use `권능자(Authority)의 뜻` and the funeral-context `장례 의식`. Kept all unrelated Mission terminology unchanged in this pass.
- Corrected `16993` to `옥티엔 형제(Brother Octienne)`: the English explicitly calls him a fellow Templar, not a monk. Japanese also clarifies that `charges` asks for the accusation, so the final question is `고발 내용은 뭐야?`. The earlier saint/name application script is corrected so it cannot reintroduce `수사`; this review supersedes that earlier audit's `after` snapshot for this row.
- Retained the English source's `Father Marsh` and `Father Udo` rather than inventing an alias from the differing Japanese reference. Bare `Brother` at `24227` and `45674`, context-free fellowship, and ambiguous book addresses remain unchanged rather than being assumed to denote monks. Row-level sources, changes, exclusions, and the complete named-title inventory are in `audit/clergy-title-consistency-20261103.json`.
- Validation: the application script passed a second run with zero changes. An independent comparison against the pre-existing staged CSV confirmed exactly the 63 audited ID edits, 65,135 records, unchanged non-text fields/order, UTF-8 BOM, exact line-ending sequence, per-field newlines, and markup tokens. All four line-ending-helper tests and the CRLF-aware diff check passed.

## ID 42205

- Before: `성 이드릭(St. Eadric)은 우리 창조주가 빚은 가장 위대한 경이, 자연과 영적인 유대를 맺었다.`
- After: `성 이드릭(St. Eadric)은 우리 창조주께서 빚으신 가장 위대한 경이인 자연과 영적인 유대를 맺고 있었지.`
- Rationale: English describes Eadric's past spiritual kinship with nature, appositionally calling nature the greatest of the Maker's wonders. Japanese explicitly describes a spiritual connection and the Maker's greatest miracle; Chinese supports the same relationship. Join the apposition grammatically and restore a natural conversational ending without changing the person, relationship, or tense.

## Mission Site Terminology

- Built the candidate inventory from English first: 257 `Mission` rows across the active resources, then checked matching Korean, Japanese, and Chinese by ID/variant. Classified 148 as religious sites or communities; ordinary missions, tasks, and purposes were not converted.
- Standardized religious `Mission` as `선교원`, with `영구 선교원`, `불멸 선교원`, and `선교원 우물(Mission Well)` for the named variants. Added the complete English label to named Saint Mission locations. This is an editorial consistency choice supported by the cross-language context, not a claim that the game defines an official institution category.
- Corrected particles when the noun changed, including after English parentheticals (for example, `선교원(St. Odwig's Mission)과`). At `default:57692`, Japanese and Chinese clarify that “them” means prayer beads; the line now reads `그 염주를 선교원에 돌려줬으면 해. 부탁이야.`
- Kept `default:30627` as a mission/task because Japanese and Chinese support that reading; also excluded unrelated cloister and monastery references. The source inventory, all 148 row-level comparisons, and before/after text are in `audit/mission-site-consistency-20261103.json`.
- Validation: 96 reviewed rows changed; the script reran successfully with no further text changes, and confirmed row IDs, variants, order, BOM, line-ending sequence, per-field newlines, and markup. No active `base` or `default` occurrence of the superseded `선교관`, `선교소`, `선교회`, or `선교단` remains.
