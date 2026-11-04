# Translation Edit Addendum (2026-11-04)

## Quickling terminology and occurrence review

- Built the full target list from English first and cross-checked all 20 `default` IDs against Japanese, Chinese, and active Korean: `1756`, `7116`, `19585`, `22409`, `34297`, `34323`, `35936`, `37469`, `40388`, `42257`, `42468`, `43780`, `47920`, `48474`, `53441`, `61082`, `61456`, `61777`, `63479`, and `64237`.
- `Quickling` is a Fae way of referring to mortal peoples by their short lifespans, rather than a separate species name or “quick” creature. Japanese often uses `命短き者`, but omits the address in some rows and renders “the curious one” at `42257` as `興味深き者`; Chinese mostly transcribes the term. Standardized Korean as `단명자(Quickling)` / `단명자들(Quicklings)` to preserve the nuance and retain the English term.
- Rechecked every sentence. IDs `1756` and `7116` have the same English source and now use the same Korean translation. ID `40388` now conveys a quickling who learned to become new, rather than one who “learned newness.” The remaining translations retain their source meaning with only the term standardized, except for the sentence-level reviews recorded below.
- At `default:34297`, aligned `quicklings` with `단명자(Quickling)` and clarified that Alyn's dedication is sincere.
- At `default:42257`, aligned the direct address with `단명자(Quickling)`; the curious traveler, destination at the world tree, instruction to rest, and speaker's wish to study the traveler are retained.
- Detailed occurrence scope and sentence review: `quickling-consistency-review-20261104.md`.
- Validation: all 65,135 row starts and their order, the UTF-8 BOM, and the exact existing line-ending sequence (71,885 CRLF, 199 LF) were preserved. All four line-ending-preservation tests and a CRLF-aware diff check passed.

## ID 22903

- Before: `그들에겐 저주이자 축복이자 황홀경이야. 그들을 몰아붙이는 동시에 집어삼키지. 의지가 약한 자는 완전히 타락해.`
- After: `순수한 마법의 피조물들에겐 프리즘미어(Prismere)가 저주이자 축복이며 황홀감이기도 해. 프리즘미어는 그들을 몰아붙이고 집어삼키지. 의지가 약한 자는 완전히 타락해.`
- Rationale: The preceding source sentence identifies `them` as creatures of pure magic, such as Tuatha or Trolls, and names Prismere as the subject. Japanese `歓喜` and Chinese `极乐` support “rapture” as intense pleasure; `황홀감` is more readily understood than `황홀경` in this line.
- Validation: Changed only `default:22903` for this sentence-level edit; the same CSV structure, BOM, and line-ending checks above passed.

## Tender terminology

- At `default:4219`, changed `니랄림의 시종(Tender of Nyralim)` to `니랄림을 돌보는 이(Tender of Nyralim)`.
- English describes the role at `default:24268` as one of many tenders to Nyralim; Chinese `照料者` and Japanese `世話人` likewise mean caretaker. `시종` can imply a personal servant, while `니랄림을 돌보는 이` matches the role and reads naturally. Kept `default:49433` as `돌보는 이들(Tenders)`.

## Grilricas name references

- Added the missing English name at `default:41022`, `41034`, and `58023`: `그릴리카스(Grilricas)`.
- English identifies the family/member at `41022` and `41034`, and the household crest at `58023`; Japanese and Chinese confirm these family references. Existing sentence meanings were retained.

- Validation: Confirmed the four edited IDs against English and checked the matching Japanese and Chinese rows for the Grilricas sentences. The active CSV retains its UTF-8 BOM and CRLF line endings; all four line-ending-preservation tests and the CRLF-aware diff check pass.

## Aergase title consistency

- Built the occurrence list from English and reviewed all 14 `default` IDs: `3267`, `8649`, `9498`, `20691`, `21124`, `25846`, `26883`, `31391`, `33419`, `45470`, `48329`, `49579`, `58154`, and `64033`.
- English IDs `9498` and `64033` both use `Aergase, Hunting Herald`; Japanese and Chinese confirm the same title. Standardized `9498` from `에어가스(Aergase), 사냥 전령` to `사냥의 전령 에어가스(Aergase, Hunting Herald)`, matching `64033`. Kept the other contextual references as `에어가스(Aergase)` and rendered `herald` as `전령`.
- Validation: Checked all 14 English-keyed occurrences against Korean; the working CSV's BOM and CRLF line endings remain intact.

## Lord of the Hunt title

- Reviewed all 11 Korean title references against English, Japanese, and Chinese: `3345`, `14217`, `16410`, `19142`, `21124`, `21718`, `23126`, `31301`, `37730`, `44412`, and `49138`.
- Standardized the Korean title as `사냥의 군주`. Added `(Lord of the Hunt)` to the ten matching English-source occurrences and `(Hunting Lord)` at `49138`, preserving the source's alternate wording. When paired with Ametair's name, used `아메테어(Ametair, Lord of the Hunt)`.
- At `37730`, retained `내가 섬기는` for “the one whom I herald”; the Japanese source explicitly describes Ametair as the person the speaker serves as a retainer.
- Validation: Confirmed all title IDs and spellings against the English-keyed inventory and checked the parallel Japanese and Chinese rows.

## ID 41254 threat wording

- Changed `네 피를... 흘리겠다` to `피를... 보게 될 것이다`. English says “before... I spill... your blood,” while Japanese uses the idiomatic threat “you'll see blood”; Chinese likewise threatens bloodshed. In Korean, `네 피를 흘리다` awkwardly makes the addressee's blood the direct object of `흘리다`. The revised wording expresses the same threat naturally while preserving the pauses and unfinished dash.
- Validation: Compared ID `41254` across English, Japanese, and Chinese; verified the edited Korean row and preserved the CSV's UTF-8 BOM and line endings.

## Ecstasy, rapture, bliss, and related wording

- Built English-keyed candidates from `ecstasy`, `rapture`, `bliss`, `euphoria`, and inflections, then reverse-searched Korean for `황홀`, `환희`, and `도취`. The union contains 23 `default` IDs: `138`, `8954`, `15325`, `22903`, `23800`, `25447`, `26787`, `31001`, `33022`, `34993`, `39270`, `40628`, `41256`, `42600`, `44218`, `48583`, `49084`, `51241`, `51692`, `52096`, `56581`, `57512`, and `64231`. Each candidate was compared across English, active Korean, Japanese, and Chinese. Japanese and Chinese searches also surfaced broader joy, pleasure, and delight vocabulary; those were checked against the English/Korean context and excluded when they did not express this target concept.
- At `15325` and `33022`, aligned duplicate translations of `a blissful void` as `더없이 행복한 공허`; the Japanese and Chinese also describe a happy/blissful void. This replaces the divergent `황홀한` and `평온한`.
- At `42600`, aligned `저열한 황홀경` with `천박한 황홀경` at `39270`; both are the same source poem and translate `ecstasy so base`.
- At `51241`, changed the awkward `황홀경을 터뜨리며 나누는 동안` to `함께 황홀경에 빠져드는 사이` for `shared an eruption of ecstasy`. Kept the later `욕정의 황홀감` for the distinct `rapture of her wantonness`.
- At `52096`, changed `황홀` to `황홀경` to align the repeated `wicked rapture` passage with `51692`, while retaining each passage's different register.
- At `57512`, changed `정말 황홀하군` to `정말 매혹적이군` for `ravishing`, which describes the woman's beauty; Japanese `魅惑的` and Chinese `令人神魂颠倒` support this reading.
- Retained context-appropriate distinctions: `환희` for `rapture` at `8954`; `황홀감` for the intoxicating effect of Prismere at `22903`; `황홀경` for grief, sensual ecstasy, and the poem's heightened rapture; `더없이 행복하게` for `blissfully` at `23800`; `행복감` for `euphoria` at `25447`; `모르는 게 약` for `ignorance is bliss` at `26787`; `순전한 희열` for `sheer bliss` at `34993`; and `열렬히 빠져 있었다` for `rapturously in love` at `49084`. Korean reverse-search candidates such as `황홀한 음악` (`glorious music`, `31001`), `황홀한 밤` (`one glorious night`, `64231`), `환희` for ordinary joy (`44218`), and `자아도취` for self-satisfaction (`48583`) were reviewed and kept as distinct senses.
- Validation: Checked the six edited IDs against all four language rows; verified the CSV row count/order, UTF-8 BOM, and line-ending sequence, then ran the line-ending-preservation tests and a CRLF-aware diff check.
