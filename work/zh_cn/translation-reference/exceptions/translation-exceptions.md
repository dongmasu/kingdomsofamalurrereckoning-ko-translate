# Approved and Scoped Translation Decisions

This is an index of reusable terminology/formatting boundaries and
key-scoped decisions that could regress, not a chronological log of every
accepted sentence edit. Full evidence and routine edit history remain in
`work/zh_cn/audit/`. Entries below state whether a decision is confirmed,
working, or unresolved; do not promote a scoped example into a global rule.

## Key-Scoped Dialogue Wording

**`default:24636` rare item and old ways:** Use `이 마지막 희귀품을 챙기고
푹 쉬어. 옛 방식도 마땅히 존중받았어.` The English anchors the item and due
respect; Japanese `休むといいわ` says to rest, and `古いやり方は…扱われた`
keeps the old ways as the passive subject of respect. This supersedes the
interim D-21883 wording and the older D-8023 keep-current disposition only
for this key. See the
[edit record](../../audit/translation-edit-default-24636-20261116.md).

## Key-Scoped Item-Label Consistency

For the four exact labels `The Valley Handwraps`, `The Valley Shoes`,
`The Valley Robes`, and `The Valley Cowl` at `base:524:11`, `1154:11`,
`3358:11`, and `3447:11`, respectively, use the shared Korean modifier
`계곡의`. This corrects the missing particle at `base:1154:11` only; it does
not establish that these items form a named equipment set. See the
[edit record](../../audit/translation-edit-base-1154-20261116.md).

**`Locksmithing` labels (`default:59325`, `62108`, `63755`):** Keep
`자물쇠 따기` for these three game-context labels. Japanese `開錠術` and the
game's separate `Lockpicking` labels (`開錠` / `开锁`) support the
lock-opening reading. Chinese `制锁` suggests lockmaking and conflicts; retain
that discrepancy as source evidence, not as a reason to change the Korean.
This scoped choice does not apply to the craft/product wording at
`default:47902`, which remains `자물쇠 제작품`. See the
[full locksmith terminology review](../../audit/locksmith-term-review-20261116.md).

**Establishment-list sense of `locksmith` (current scope: `default:11842`,
`14712`, `15506`, `37598`, `39425`; originating decision D-4462):** Use
`자물쇠공방` when `locksmith`
is one of the welcoming services/places listed with an inn, trader, and
sanctuary. The wording at `default:14712` was explicitly approved by the
user; the four same-sense occurrences were aligned by changing only this
term and preserving their distinct sentence voice. At `default:14712`, also
use `여관이든 상점이든 자물쇠공방이든 성소든, 지친 여행자라면 누구나
기꺼이 환영합니다.` with the preceding sentence `그래도 치료가 필요하다면
제가 도와드리죠.` This is a scoped venue sense, not a global translation
for `locksmith`; person/occupation, premises, craft, and skill uses remain
separate. See the [full sense classification and occurrence review](../../audit/locksmith-term-review-20261116.md)
and the [14712 edit record](../../audit/translation-edit-default-14712-20261116.md).

**Person and occupation sense of `locksmith` (approved 2026-11-16):** Use
`자물쇠공` for a locksmith as a worker or occupation. Use `자물쇠 장인` when
the source explicitly says `master locksmith`; do not add the artisan/master
nuance to ordinary `locksmith` references. Possessive premises remain
`자물쇠공의 집` or `자물쇠공의 연구실`. The related titles `Lockmaster
Tarion` (`default:33969`) and `Lockmaster Jorielle` (`default:41572`) remain
`자물쇠 장인`, supported by their own Japanese and Chinese evidence. At
standalone `default:24621`, Chinese `锁匠` and Japanese `鍵鍛冶屋` support the
person/trade reading; the existing `자물쇠공` is retained. Do not apply
these forms to the service-list venue, craft/product, or the scoped
`Locksmithing` lock-opening labels. See the
[full locksmith terminology review](../../audit/locksmith-term-review-20261116.md).

## Plain Wording for Forging

For the 80 keys reviewed at the user's request, replace difficult `벼리다`
forms with familiar wording appropriate to the sentence, such as `만들다`,
`제작하다`, or `다듬다`. This is not a blanket translation of English
`forge`: distinguish crafting, honing, and figurative uses by context.
The affected keys and duplicate groups are recorded in the
[review](../../audit/forge-plain-language-review-20261115.md).

## Fate and Destiny

**Approved under D-21882 (2026-11-16):** Translate the standalone English
term `Fate` as `운명` and `Destiny` as `숙명`. Apply the distinction to the
source term in context; do not replace every Korean `운명` in a row merely
because that row also contains `Destiny`. When both occur, preserve both
meanings separately. Japanese `運命`/`宿命` supports the distinction; Chinese
is supplementary evidence.

Use `운명의 서(Codex of Fate)`, `숙명의 서(Codex of Destiny)`, and
`숙명의 돌(Destiny Stone)`. This wording distinction does not establish
whether the two Codex names refer to the same physical object. The gameplay
term `Destiny`, including its type and tier labels, uses `숙명`. For
`affix:304` (`of Destiny`), use `*숙명*` in all six active variants and
preserve the asterisk delimiters.

Use `운명` for the gameplay concept `Fate`, but do not force it onto every
ordinary English use of `fate`: translate by sense, such as `운세` for
`fate-reading` or `행방` for learning what happened to someone. Keep
established compounds distinct rather than normalizing them to `숙명`:
`Fateweaver` is `페이트위버`, `Fateless One` is `운명 없는 자`, and the
named practice `Fateweaving` is `운명 엮기(Fateweaving)`. Other established
names such as `Twists of Fate`, `Essence of Fate`, and `Tapestry of Fate`
retain their own glossary forms. This decision supersedes only the Korean
terminology in D-21512 (`Codex of Destiny`) and D-21736 (`Destiny Stone`);
their historical records remain unchanged. The scoped cross-resource
application and mixed-source exceptions are documented in the
[Fate/Destiny terminology review](../../audit/fate-destiny-terminology-review-20261116.md).

## Alfar Lineages

**Approved:** `Alfar` is `알파르`; the derived races are `Dokkalfar =
도크알파르` and `Ljosalfar = 료스알파르`.

This deliberately overrides the older Korean manual spellings `도크알브`
and `료스알브` for these two lineage names only. In-game pronunciation and
Japanese preserve their audible relationship; Chinese `暗精灵` / `光精灵`
corroborates the dark/light distinction (`default:59389`). Do not extend this
exception to unrelated terms or rewrite historical audit records and
read-only sources.

**Decision date:** 2026-10-25. **Recorded:** moved from
`work/zh_cn/TRANSLATION_PROGRESS.md` on 2026-11-15.

The accepted `도크알브` form from the October 20 consistency review was
superseded by this October 25 decision for the two lineage names only.
[Earlier review](../../audit/translation-consistency-20261020.md).

## Affix Composition Labels

The listed decisions cover all six active target variants (`11`, `12`, `14`,
`21`, `22`, `24`). The colon is part of the specified displayed Korean
labels; these decisions do not make every affix colon-terminated. IDs `55`
and `444` are accepted working dispositions, not independent final
linguistic approvals.

| English `affix` ID | Recorded Korean | Decision and scope |
| --- | --- | --- |
| `89` (`Harvested`) | `수확:` | Approved 2026-11-05 for the affix-plus-item prefix. Replaces `수확된` for these six variants. [Audit](../../audit/affix-ids-00080-00089-preliminary.md). |
| `102` (`Received`) | `받음:` | Approved 2026-10-26 as the completed-state label. It supersedes the earlier `받기:` proposal for these six variants. [Decision record](../../audit/translation-edit-addendum-20261025.md#affix-102-label-refinement-2026-10-26). |
| `575` (`Removed`) | `제거됨:` | Approved 2026-10-26 as a completed-status label, rather than `제거된` or the proposed action form `제거:`. The colon follows this affix label's display form. [Decision record](../../audit/translation-edit-addendum-20261025.md#affix-575-label-revision-2026-10-26). |
| `55` (`of the Fated`) | `*운명지어진 자*` | Accepted working disposition for all six variants; not independent final linguistic approval. The person-denoting form replaces `*운명*`. [D-19545](../../audit/consolidated-affix-fallback-review-D19545-20261012.md). |
| `444` (`of the Willful`) | `*고집 센 자*` | Accepted working disposition for all six variants; not independent final linguistic approval. Cross-dialogue evidence supersedes the earlier uncertain `*의지가 굳은 자*`. [D-19546](../../audit/consolidated-affix-willful-followup-D19546-20261012.md). |

Do not extend these exact choices to other affix IDs without checking the
composed item label and recording a separate decision.

The Chinese-only fallback keys remain unresolved for IDs `101`, `115`,
`117`, `124`, `255`, `341`, and `496` at variants `12`, `14`, `21`, `22`,
and `24`. These are holds, not approved replacements; do not infer that the
variant-11 decision automatically settles the other variants.
[Current fallback status](../../audit/disposition-affix-extra-variants-20261011.md);
[follow-up](../../audit/consolidated-affix-fallback-review-D19545-20261012.md).

## Scoped UI Labels

These decisions depend on the specific control or menu action; they do not
establish translations for every occurrence of the English words.

| ID | English UI text | Approved Korean | Decision and scope |
| --- | --- | --- | --- |
| `default:25341` | `Map Slot` | `슬롯에 등록` | Quickslot assignment action. Approved 2026-10-20. [Decision record](../../audit/translation-consistency-20261020.md). |
| `default:59732` | `Clear` | `비우기` | Removes the item assigned to a quickslot. Approved 2026-10-20. [Decision record](../../audit/translation-consistency-20261020.md). |
| `default:60043` | `Collapse` | `접기` | Folds/hides a menu; supersedes `붕괴` and the earlier uncertain disposition. Confirmed 2026-10-11. [Review](../../audit/collapse-ui-review-default-60043-20261011.md). |

### Actions, Counters, and Direction Labels

| `default` keys | Recorded distinction | Audit record |
| --- | --- | --- |
| `16532`, `42307`; `16068`, `17865`; `20661`, `22908`, `23146`, `31930` | Keep action objectives (`크루독(Crudok) 처치하기`) distinct from killed-target labels (`처치한 요툰(Jottun)`) and kill counters (`보가트(Boggart) 처치 수`, `처치한 뿌리 골렘(Root Golems) 수`). Do not convert every label to `-하기`. D-6382 originally accepted `20661` as a working disposition, not independent final linguistic approval; the November 9 source-checked duplicate review subsequently confirmed `보가트(Boggart) 처치 수` for both `20661` and `22908`. | [Duplicate review, November 9](../../audit/translation-edit-addendum-20261109.md#resumed-review-indices-8701219); [original counter disposition](../../audit/disposition-batch-default-20651-20700-20261010.md); [follow-up group decisions](../../audit/exact-english-duplicate-review-decisions-20261109.jsonl); [source/ID map](../duplicates/exact-english-default-groups.jsonl). |
| `7018` | `Repair Equipped` is the action `장착한 장비 수리`, not the completed status `장착품 수리 완료` (D-1888). | [Edit batch, October 9](../../audit/edit-batch-20261009.md). |
| `39357` | Use `상호작용/질주` for `Interact/Sprint`; preserve `#NAMED_ICON_360_A#`. Do not collapse the sprint control into generic running. | [D-19869, October 13](../../audit/named-scope-review-D19869-20261013.md). |
| `775`, `38531`, `51747`, `63433` | Use `하수도로 이동 - 동쪽/서쪽/북쪽/남쪽` respectively: destination first, direction after the hyphen. The decision concerns these four `Travel to Sewers` labels, not every direction-bearing phrase. | [Travel-label review, October 26](../../audit/translation-edit-addendum-20261025.md#sewer-terminology-and-travel-label-consistency-2026-10-26). |

### Deity Menu Name-Title Order

D-21568 (2026-10-17) checked the 12 `default` menu labels `2009`, `9504`,
`15781`, `16784`, `21780`, `23706`, `26106`, `29436`, `42685`, `43034`,
`47669`, and `48696`: eight were corrected and four already conformed.
Use `신명(English name), 한국어 칭호`, for example
`로포쿠(Lopoku), 장난의 신`, preserving each current eligibility note and
its markup. This menu-label order does not prescribe the word order of
every deity mention in dialogue. Do not reintroduce superseded lineage
spellings from the historical manifest.
[Decision](../../audit/named-scope-review-D21568-20261017.md);
[exact menu-key manifest](../../audit/proper-name-text-corrections-D21568.tsv).

## Postposed `of ...` Affix Formatting

For the active Korean `affix` resource, English IDs whose source text starts
with `of ` use literal asterisks around the Korean postposed fragment:
`*translated segment*`. The English source determines the scope: 175 IDs and
1,045 active target keys. This is a display delimiter, not Markdown italics
or a runtime rich-text tag.

Remove only a final Korean possessive `의` when it represents the English
postposed `of`; retain internal relations, as in `*폭풍의 분노*`. For
example, `of Storm's Rage` is `*폭풍의 분노*`, not `*폭풍 분노*`.

**Decision:** D-18201, 2026-10-11. The change corrected formatting and
attachment, not lexical meaning; prior semantic dispositions remain in
force. [Audit](../../audit/of-affix-format-review-20261011.md).

## Exact-Key Punctuation Decisions

These corrections are limited to the listed `default` IDs and contexts:

| ID | Source/context | Applied decision |
| --- | --- | --- |
| `11906` | Sentence begins with English source fragment `.With` | Remove the copied leading period; Japanese and Chinese begin without it. [Review](../../audit/disposition-batch-default-11900-11949-20261009.md). |
| `18933` | `Auto. ($STR0)` UI label | Use `자동 ($STR0)`; omit the period after `자동` while preserving the separating space and `$STR0`. [Review](../../audit/punctuation-review-default-18933-42850-20261011.md). |
| `23533` | `The Cradle of Winter` subtitle | Change `광기의 왕` to `미친 왕` and remove the unsupported Korean sentence-final period. A later name-pairing edit added the English subtitle with its own source-final period; that later period does not reverse the Korean punctuation decision. [Review](../../audit/consolidated-context-review-default-23501-23550-20261011.md); [later English pairing](../../audit/translation-edit-addendum-20261025.md). |
| `42850` | `Yes` option in a system Yes/No selector | Use `예` without a terminal period. This is selector-specific, not a global translation for every `Yes`. [Review](../../audit/punctuation-review-default-18933-42850-20261011.md). |

The `18933` and `42850` changes are D-18203 (2026-10-11) and superseded
their earlier `not an issue` dispositions. The other entries are separate,
exact-key corrections; they do not create a general punctuation rule.

### Verified Punctuation Spacing

On 2026-10-26, a targeted scan corrected 16 clear spacing omissions in
`default`: add a space after sentence-ending periods before cost variables
at IDs `8590`, `12945`, `13848`, `16343`, `31551`, `31586`, `43960`,
`54988`, `55021`, `56598`, `59074`, `60688`, and `60806`; add a space after
a comma before `할람(Hallam)` at IDs `13731`, `33911`, and `61455`.
These are verified corrections for the listed cells, not authorization for
blind corpus-wide punctuation rewriting. [Decision record](../../audit/translation-edit-addendum-20261025.md#default-punctuation-spacing-2026-10-26).

This is not a rule to remove periods globally. A scan found rows where Korean
had terminal periods absent from English, but those were candidates only;
complete Korean sentences and imperatives may properly end with a period.
No automatic punctuation stripping was applied. Period-only labels matching
all language sources were separately retained as `not an issue` under
D-19466 at IDs `28424`, `28764`, `29101`, `29901`, `29918`, `30461`,
`31083`, `31211`, and `32072`. See the
[punctuation review](../../audit/punctuation-review-default-18933-42850-20261011.md)
and [period-only label review](../../audit/consolidated-context-review-default-period-only-labels-20261012.md).

## Additional ID-Scoped Decisions

The following accepted edits were recovered from the audit history. Each is
limited to its listed key and text function; punctuation, markup, or wording
must not be changed elsewhere by analogy alone.

### Quotation Boundaries

| `default` ID | Decision | Audit record |
| --- | --- | --- |
| `25435` | Restore the source's scare quotes around `여왕`. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `27030` | Restore the missing opening ASCII apostrophe before the first quoted passage; preserve the other quote boundaries and line breaks. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `31207` | Restore the quotation framing, pair `아테스(Artess)`, and keep the intentionally unfinished ending at `일주일 뒤에...`; do not invent a destination or continuation. | [Dialogue-context edit batch](../../audit/dialogue-context-edit-batch-20261114-31000-31249.md). |
| `35239` | Restore the outer quotation marks around the seven-line passage; preserve the inner quotation and line breaks. | [Edit addendum](../../audit/named-scope-edit-addendum-D19827-20261013.md). |
| `41469` | Restore quotation marks around the claimed new “god” to retain the source's distancing cue. | [Disposition](../../audit/disposition-batch-default-41451-41500-20261010.md). |
| `42078` | Restore the ironic quotation marks around `해방`. | [Disposition](../../audit/disposition-batch-default-42051-42100-20261010.md). |
| `42130` | Restore the skeptical quotation cue around Akara supposedly “guiding” the captives. | [Disposition](../../audit/disposition-batch-default-42101-42150-20261010.md). |
| `6470` | Remove the duplicated quotation delimiters absent from the source; preserve the speech. | [Review](../../audit/consolidated-context-review-default-uncertain-200-D19643-20261012.md). |
| `59959`, `59963` | Restore the source-marked quotation boundaries around the three cited passages and Airmer's three spoken lines; wording and line order stay unchanged. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `62793` | Restore the missing opening quotation mark around the proverb. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `65134` | Quote `세 자루의 검(Three Swords)` as an epithet, so it is not read as a literal count of swords. | [Final-range reconciliation](../../audit/dialogue-context-candidate-reconciliation-followup-64250-65134-20261115.md). |

### Redundant Quote Marks and Literal Backslashes

At these exact keys, remove the surplus quotation pair and retain one pair
around the quoted passage: `5871`, `10487`, `17629`, `17681`, `17799`,
`17827`, `17832`, `18065`, `18166`, `18223`, `18311`, `18681`, `18682`,
and `19028`. This is not permission to collapse repeated quotes globally;
some source rows intentionally contain doubled quote characters. The
individual dispositions are in the reports for
[`05850-05899`](../../audit/disposition-batch-default-05850-05899-20261009.md),
[`10450-10499`](../../audit/disposition-batch-default-10450-10499-20261009.md),
[`17600-17649`](../../audit/disposition-batch-default-17600-17649-20261009.md),
[`17650-17699`](../../audit/disposition-batch-default-17650-17699-20261009.md),
[`17750-17799`](../../audit/disposition-batch-default-17750-17799-20261009.md),
[`17800-17849`](../../audit/disposition-batch-default-17800-17849-20261009.md),
[`18050-18099`](../../audit/disposition-batch-default-18050-18099-20261009.md),
[`18150-18199`](../../audit/disposition-batch-default-18150-18199-20261009.md),
[`18200-18249`](../../audit/disposition-batch-default-18200-18249-20261009.md),
[`18300-18349`](../../audit/disposition-batch-default-18300-18349-20261009.md),
[`18650-18699`](../../audit/disposition-batch-default-18650-18699-20261009.md),
and [`19000-19049`](../../audit/disposition-batch-default-19000-19049-20261009.md).

`default:17772` is not included in this approved cleanup list: D-21569
normalized its doubled quotes, but the November 11 revalidation says not to
normalize its quote style without display-context evidence. Keep that
historical conflict unresolved rather than extending either treatment.
[D-21569](../../audit/named-scope-review-D21569-20261017.md);
[revalidation](../../audit/dialogue-context-default-17750-17999-revalidation-20261111.md).

Remove literal backslashes only at the following keys where the aligned
sources do not contain them:

| Keys | Applied decision | Audit record |
| --- | --- | --- |
| `2202`, `3381`, `3446`, `14818`, `14981`, `23461`, `23487`, `23559`, `23860`, `23870`, `23999`, `24089`, `24125`, `26193`, `26224`, `26246`, `26321`, `26909`, `26971`, `37021`, `37274`, `37372`, `55232`, `56377`, `62064`, `63452`, `63512`, `63522` | Remove 66 literal backslashes immediately before quotation marks; retain the quoted words and quotation marks. | [Quote cleanup, 2026-10-26](../../audit/translation-edit-addendum-20261025.md#literal-quote-cleanup-2026-10-26). |
| `44459` | Remove only the two literal backslashes before the quote marks; retain valid CSV quote escaping and the quoted sentence. Runtime display was not tested. | [Review](../../audit/named-scope-review-D19964-20261013.md). |
| `44747`, `44900` | Remove the two Korean-only backslashes before quotation marks; retain the quote marks and poem/dialogue text. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `50643`, `50761`, `50765`, `50837` | Remove respectively one, one, twelve, and two unsupported literal backslashes; preserve the reviewed line/paragraph breaks, values, and runtime marker at `50837`. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `50880`, `50915` | Remove four unsupported literal backslashes at each key; preserve the section/paragraph breaks and all `{*1}`, `{LINE_SPACE}`, and `{1}` markers at `50880`. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `50993`, `50999`, `51066`, `51079` | Remove respectively two, one, three, and three unsupported literal backslashes; preserve paragraph/line breaks, blank lines, and listed effect values or ingredients. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `51241` | Remove four Korean-only literal backslashes at paragraph boundaries; preserve all three paragraphs and the narrative wording. | [Disposition](../../audit/disposition-batch-default-51201-51250-20261010.md). |
| `63708` | Remove literal backslashes and quotes from inside the two `{*1...}` payloads; preserve marker identities and order. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |

### Other Punctuation and Text-Fragment Decisions

| `default` ID | Applied decision | Audit record |
| --- | --- | --- |
| `2765` | Restore the emphatic fragments `굶주림. 모욕.` rather than smoothing them into a clause. | [Edit batch](../../audit/edit-batch-20261009.md). |
| `27404` | Preserve the deliberately fragmented memorial wording and ellipses; do not imply the Hirelings were fighting when they died. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `3697` | Replace the terminal `...` with `—` to preserve the source interruption. | [Disposition](../../audit/disposition-batch-default-03650-03699-20261009.md). |
| `26153` | Replace the full-width Japanese period `。` with ASCII `.` to match the locale sources. | [Disposition](../../audit/disposition-batch-default-26101-26150-20261010.md). |
| `5043` | Remove the stray punctuation and unsupported `정말`; retain the source's unfinished warning. | [Dialogue-context edit batch](../../audit/dialogue-context-edit-batch-20261113-5000-5999.md). |
| `27523` | Rework the unfinished revenge-plan fragment without adding an explicit repeated-killing agent; retain the spreading-death image and ending fragment. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `30708` | Preserve the unfinished `We have so much` fragment as `우리에겐 정말 많은...`; do not supply an unstated completion. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `34430` | Remove the leading `‒` from Korean dialogue; although present in English, it is absent from Japanese and reads awkwardly as a Korean dialogue prefix. | [November 5 addendum](../../audit/translation-edit-addendum-20261105.md). |
| `34722` | Restore the source's conditional relation and contrast rather than changing the fragment to a causal “no wonder” statement. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `35495` | Render `No mortal, perhaps` as `필멸자에게는 불가능할지도 모르지.`; preserve its elliptical transition rather than asking whether someone is mortal. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `38429` | Restore the standalone `.` present in English, Japanese, and Chinese. | [Edit addendum](../../audit/edit-batch-20261010-addendum.md). |
| `50765`, `58929` | Rework the poem's cane/crutch imagery and wording, remove the misplaced `알아`, and preserve all 12 embedded line breaks; the exact-source duplicate uses the same Korean text. | [November 9 addendum](../../audit/translation-edit-addendum-20261109.md); [candidate reconciliation](../../audit/dialogue-context-50750-50999-candidate-reconciliation-20261115.md). |
| `56900` | Repair the sentence fragment and restore the offer of help without changing the following relationship statement. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |

### Verified Spacing and Parenthetical Boundaries

| Keys | Applied decision | Audit record |
| --- | --- | --- |
| `64685`, `65109` | Insert a space between the runtime price variable and `골드`; preserve the variable exactly. | [Edit addendum](../../audit/edit-batch-20261011-addendum.md). |
| `1461`, `4321`, `8101`, `8552`, `14991`, `17206`, `18319`, `18993`, `22970`, `24246`, `28317`, `28805`, `29492`, `29665`, `34081`, `35035`, `35742`, `37263`, `37475`, `37941`, `39699`, `41079`, `42329`, `43875`, `45796`, `45876`, `49109`, `58224`, `59952`, `61307` | Insert 33 missing spaces immediately before `할람(Hallam)` in these 30 reviewed cells; preserve all other text. | [Hallam boundary correction](../../audit/named-scope-edit-addendum-D21781-20261018.md). |
| `default:36583` | Insert the missing word boundary: `그만 출게`. | [Disposition](../../audit/disposition-batch-default-36551-36600-20261010.md). |
| `default:26929` | Separate the compound as `마녀 기사`. | [Dialogue-context edit batch](../../audit/dialogue-context-edit-batch-20261114-26750-26999.md). |
| `default:4539` | Insert a space after `대회계원(Bursar's)`. | [Candidate reconciliation](../../audit/dialogue-context-04500-04749-candidate-reconciliation-20261114.md). |
| `default:9839` | Insert the missing space before the second reagent quantity; preserve values and line breaks. | [Candidate reconciliation](../../audit/dialogue-context-09750-09999-candidate-reconciliation-20261114.md). |
| `base:3104:11`, `base:1221:11`, `base:1712:11` | Remove the extra space before the already complete English parenthetical; do not change Korean wording. | [Morning Prayer](../../audit/named-scope-edit-addendum-D21820-20261018.md), [Two-Faced Troll](../../audit/named-scope-edit-addendum-D21823-20261018.md), and [White At War](../../audit/named-scope-edit-addendum-D21824-20261018.md). |
| `base:1168:11`, `base:3041:11`, `base:4308:11`, `default:15664` | Use `신의 송곳니(The God Fang)` with no space before the English parenthetical. | [God Fang correction](../../audit/named-scope-edit-addendum-D21816-20261018.md). |

### Runtime Markers and Exact Source Labels

| Keys | Applied decision | Audit record |
| --- | --- | --- |
| `3205`, `3731`, `4524` | Render the visible `[Passive]` marker as `[패시브]` inside the existing `{*1[...]}` wrapper. | [3205](../../audit/consolidated-context-review-default-passive-hospitalis-telling-D19612-20261012.md), [3731](../../audit/consolidated-context-review-default-passive-cycle-D19617-20261012.md), [4524](../../audit/consolidated-context-review-default-scholia-and-passive-D19626-20261012.md). |
| `4672` | Render the visible `[Active]` marker as `[액티브]` inside the existing wrapper. | [Ability/alchemy review](../../audit/consolidated-context-review-default-early-ability-alchemy-D19629-20261012.md). |
| `23654` | Render the visible `[Active]` marker as `[사용 효과]`, following the same-keyed UI precedent at `3502` and `8886`; preserve the wrapper and line break. | [Disposition](../../audit/disposition-batch-default-23651-23700-20261010.md). |
| `16425`, `31138`, `38240`, `39619`, `40523`, `40647`, `52813` | Preserve the exact source label `FAIL LINE`; do not infer whether it is player-facing or diagnostic. | [FAIL LINE review](../../audit/consolidated-context-review-default-fail-line-20261012.md). |
| `6848`, `31235` | Preserve the exact numbered labels `FAIL LINE 2` and `FAIL LINE 1`; do not infer runtime visibility. | [Numbered FAIL LINE review](../../audit/consolidated-context-review-default-numbered-fail-line-20261012.md). |
| `42643` | Preserve the literal development placeholder `TEMP`; do not translate it as `임시`. | [Disposition](../../audit/disposition-batch-default-42601-42650-20261010.md). |

The current working text at `default:27061` is `{*1[패시브]}`, while
D-19343 accepted `{*1[지속 효과]}`. This disagreement is not resolved by
this register; do not treat either form as a new global rule until the
active text and decision record are reconciled. [D-19343 review](../../audit/consolidated-context-review-default-27051-27100-20261011.md).

At `default:29077`, the structural review observed `{1}` before `{2}` in
English, Chinese, and Korean, but the reverse order in Japanese, within the
same `{*6...}` requirement wrapper. This is a recorded cross-language
difference, not an approved Korean defect or proof of runtime argument
semantics. Do not copy the Japanese order mechanically.
[Structural observation, 2026-10-10](../../audit/default-ids-29051-29100-preliminary.md).

### Short Parenthetical Fragments

D-21569 (2026-10-17) classified 113 Japanese-parenthetical candidates,
correcting 77 of the 83 reviewed short fragments. Retain the reviewed
outer parentheses for short condition, weapon, target, and action fragments:
for example, `default:428` is `(레코닝 모드 중)` and `2124` is
`(셉터 사용 시)`. Full-sentence parenthetical explanations/captions were
retained rather than mechanically reformatted into short fragments.
The exact candidate membership and exclusions are in the linked manifest.

Source meaning still controls the fragment: at `26982`, retain English
`to stun enemies`, not Japanese's conflicting paralyzed-target condition.
At `58894`, keep the English-led unworn-boots condition; Japanese instead
says undamaged boots, and runtime semantics remain unresolved. At `45697`,
use `(받아치기 중)` for parrying, not generic blocking.

This records the format boundary, not permission to reapply all historical
replacement text. Later wording decisions remain in force, and the separate
`17772` quote-style conflict recorded above is still unresolved.
[Source-conflict and action distinctions](../../audit/named-scope-review-D21569-20261017.md);
[D-21569 application and classification](../../audit/named-scope-edit-addendum-D21569-20261017.md);
[candidate manifest](../../audit/japanese-parenthetical-review-D21569.tsv).

### Deliberate Differences Within Exact-English Groups

The following reviewed groups intentionally retain different Korean text.
Their English equality is not permission to unify speech acts or register;
the linked Japanese/context evidence supports the distinctions.

| `default` keys | Retained distinction | Audit record |
| --- | --- | --- |
| `14256`, `29817` | `You have come` has different polite/plain delivery. | [Duplicate review, November 9](../../audit/translation-edit-addendum-20261109.md#resumed-review-indices-8701219). |
| `16898`, `18884`; `60779`, `62563` | `All right then`: retain `좋아, 그럼.` for assent in the first pair and `그럼 또 보자.` for farewell in the second; Japanese distinguishes `よし` from `またな` / `またね`. | [November 15 confirmation](../../audit/dialogue-context-62500-62749-candidate-reconciliation-20261115.md). |
| `18967`, `24219` | `Here we are` distinguishes arrival from presence. | [Duplicate review, November 9](../../audit/translation-edit-addendum-20261109.md#resumed-review-indices-8701219). |
| `27293`, `32079` | `You?` retains the Japanese-supported wording difference. | [Reconciliation](../../audit/dialogue-context-32000-32249-candidate-reconciliation-20261114.md). |
| `31562`, `55044` | Retain the Korean distinction supported by differing Japanese rows. | [Reconciliation](../../audit/dialogue-context-31500-31749-candidate-reconciliation-20261114.md). |
| `26624`, `33517` | `Get out of here.` retains different register supported by Japanese. | [Reconciliation](../../audit/dialogue-context-33500-33749-candidate-reconciliation-20261114.md). |
| `31385`, `38762`, `48513`; `37711`, `38993` | `Later.` and `Come to Telogrus.` retain the Japanese-supported register/style differences within their respective groups. | [Reconciliation](../../audit/dialogue-context-38750-38999-candidate-reconciliation-20261114.md). |

Conversely, the exact-source poem pair `default:320` / `42198` was
explicitly aligned on 2026-11-15: remove the extra Korean break before
`너를 붙들지` at `42198`, retaining the identical six-line Korean poem.
All four language tables support the pair. This is a pair-specific layout
decision, not a rule to match every source language's line count.
[Poem reconciliation](../../audit/dialogue-context-42000-42249-candidate-reconciliation-20261115.md).

### Unresolved Source Conflicts

These are retained holds, not approved corrections or permission to override
English by a reference-language majority. Name annotation or a different
correction in the same row does not resolve the held interpretation.

| `default` ID | Conflict and disposition | Audit record |
| --- | --- | --- |
| `46969` | English says the broken sword could be mended; Japanese, Chinese, and related journals `7035`, `9783`, `13362`, `33237`, `53664` say it could not. A possible English error is recorded, but changing `고칠 수 있는` to `고칠 수 없는` remains held pending explicit adjudication. | [Quest-source conflict, November 11](../../audit/dialogue-context-576353-sq46-master-touch-revalidation-20261111.md). |
| `28454` | English/Chinese support `Chamber of Trade Storeroom` / `무역 회관`, while Japanese and related quest text suggest a Customs House. Do not merge the institutions or normalize this row to `36272` / `40127` without resolving the conflict. | [Place-source conflict, November 11](../../audit/dialogue-context-1453969-1556445-revalidation-20261111.md). |
| `32878` | English `Lycium Grove` may be a spelling error for the established `Lyceum Grove` supported by Japanese. The source-spelling conflict remains held; do not silently rewrite the English annotation. | [Source review, November 12](../../audit/dialogue-context-default-32750-32999-revalidation-20261112.md); [hold retained, November 14](../../audit/dialogue-context-32750-32999-candidate-reconciliation-20261114.md). |
| `32891` | The malformed English `Ancient-of -War`, Japanese `大将軍`, and Chinese literal title do not settle the intended office. The Amaldor/Mel Senshir name pairings were corrected separately; the title remains unresolved. | [Partial reconciliation, November 14](../../audit/dialogue-context-32750-32999-candidate-reconciliation-20261114.md). |
| `44778` | Preserve `THIS IS A BUG` provisionally: Japanese reads an insect, Chinese a software-style `BUG`; joke, placeholder, and software-bug interpretations remain unproved. | [Source review, November 12](../../audit/dialogue-context-default-44750-44999-revalidation-20261112.md); [hold retained, November 15](../../audit/dialogue-context-44750-44999-candidate-reconciliation-20261115.md). |
| `44978` | English `keeping them that way` may refer to inability to sustain civil society, while Japanese/Chinese thank the player for defeating/driving the enemies away. Retain the current latter reading provisionally; the idiom remains unresolved. | [Source review, November 12](../../audit/dialogue-context-default-44750-44999-revalidation-20261112.md); [hold retained, November 15](../../audit/dialogue-context-44750-44999-candidate-reconciliation-20261115.md). |

### Ability-Category Labels and Fragments

For this game's reviewed ability terminology, direct category labels use
`힘(Might) 능력`, `재주(Finesse) 능력`, and `마법(Sorcery) 능력`.
Translate an explicit `Ability Tree` as `능력 트리`. The weapon
classification `마법 계열` remains distinct and is retained only for the
reviewed Sorcery-based weapon entries. These are context-sensitive
terminology decisions, not blanket replacements for ordinary words.

At `default:55223`, the November 6 direct-category decision removed `계열`,
superseding the October bonus-fragment form `힘(Might) 계열 능력`. This
later choice is specific to the reviewed ability category; it does not
remove `계열` from the distinct Sorcery weapon classification.
[November 6 decision](../../audit/translation-edit-addendum-20261106.md);
[earlier fragment decision](../../audit/translation-edit-addendum-20261025.md).

When a UI places `+1` before a standalone category fragment, do not add
`-으로` or another case ending to that fragment. This fragment treatment
does not apply mechanically to a complete sentence or phrase; follow its
syntax. The exact reviewed category, tree, weapon, and bonus-fragment keys
and before/after decisions are recorded in the
[2026-11-06 ability review](../../audit/translation-edit-addendum-20261106.md#ability-category-and-tree-terminology)
and [2026-10-26 bonus-fragment review](../../audit/translation-edit-addendum-20261025.md#japanese-cross-checked-ability-bonus-fragments-2026-10-26).

### Other Scoped Terminology Boundaries

| Scope | Recorded decision and exclusions | Audit record |
| --- | --- | --- |
| Game-system `Primal` terms | Use `원시` for the reviewed gameplay family, superseding `원초` (including `Primal Magic`, `Primal Damage`, and `Primal Sprite`). Do not extend it to `Primality`, `Going Primal`, or descriptive prose such as `primal force`. At `default:25241`, this decision changes only `Primal Magic`; the separate `Forward` question remains unresolved. | [Primal terminology revision](../../audit/translation-edit-addendum-20261025.md#primal-terminology-revision-2026-10-26). |
| Religious-site/community `Mission` | Use `선교원` for the classified religious institution/community occurrences. Exclude ordinary missions/tasks and cloisters/monasteries; `default:30627` remains a task use. | [Mission site terminology](../../audit/translation-edit-addendum-20261103.md#mission-site-terminology). |
| `Health` / `vitality` | Render the numeric `Health` attribute as `체력`; lowercase `vitality` may mean general life/healthiness and is `활력`. `default:20690` uses `체력`, while `default:39166` was explicitly retained as `활력`; do not collapse the terms. | [Health terminology](../../audit/translation-edit-addendum-20261106.md#health-terminology-and-cora-banick-dialogue). |
| `base:891:11` (`Lorestone`) | Use `로어스톤` for this generic collectible/category label, following D-133. D-21766's `not-an-issue` disposition covered entity registration and deferred lexical consistency; this entry does not register an entity or settle every `Lorestone` occurrence. | [Decision register](../../audit/decision-register-20261009.md); [D-21766 dispositions](../../audit/proper-name-short-label-dispositions-D21766.tsv); [application review](../../audit/lua-corpus-translation-application-20261115.md). |
| Health/Mana absorption | Use `생명력 흡수 공격`, `마나 흡수 공격`, and flat `적중당 생명력/마나 흡수량 +N` for the reviewed effects. Do not add `%` based only on Japanese when English and Chinese give flat values. | [Effect terminology](../../audit/translation-edit-addendum-20261103.md#health-and-mana-absorption-effects). |
| `Fateweaving` | Use `운명 엮기(Fateweaving)` for the named practice/service, but retain a descriptive translation for `default:40909`, where fate threads are literally weaving around a target. Do not conflate it with the practitioner `Fateweaver`, the `Order of Fateweavers`, generic `운명의 속박`, or the named action `Unbind Destiny` (`숙명의 속박 풀기`). | [Occurrence review](../../audit/translation-edit-addendum-20261103.md#fateweaving-occurrence-review); [term distinctions](../../audit/fateweaver-fateweaving-binding-terms-20261110.md); [Fate/Destiny terminology review](../../audit/fate-destiny-terminology-review-20261116.md). |
| Named `Brother` / `Father` titles | The reviewed forms are `이름 수사(Brother Name)` and `이름 신부(Father Name)`. `default:16993` is the explicit exception `옥티엔 형제(Brother Octienne)`: he is a fellow Templar, not identified as a monk. Bare `Brother`, actual siblings, and unsupported fellowship uses are excluded. | [Title review](../../audit/translation-edit-addendum-20261103.md#brother-and-father-titles). |
| `Developer Relations` at `default:10426` | Use the industry role label `DevRel`, not the literal `개발자 관계`. This exact-key decision supersedes the earlier unresolved “retain or translate” disposition; it does not establish a translation for other uses of `developer relations`. | [Lua-assisted localization review, November 15](../../audit/lua-script-extraction-and-reencoding-20261115.md#translation-evidence-and-scoped-updates); [Toss Tech usage](https://toss.im/career/article/53401). |
| `Security Analyst` at `default:18413` | Use `보안 분석가`, following the English meaning and the Japanese row, which retains `Security Analyst`. The Chinese `证券分析师` means a securities analyst and is a conflicting supporting translation; do not generalize this key-specific discrepancy to other uses of `security`. | [Four-language credit-label revalidation, November 15](../../audit/lua-script-extraction-and-reencoding-20261115.md#four-language-revalidation-of-the-16-credit-labels). |
| `VP Functionality QA` at `default:27496` | Use `기능 QA 담당 부사장`. Here `VP` is the corporate title `Vice President`; `담당` makes its relation to `Functionality QA` clear. This wording is exact-key only and does not resolve whether the string is displayed in-game. | [Lua-assisted localization review, November 15](../../audit/lua-script-extraction-and-reencoding-20261115.md#translation-evidence-and-scoped-updates); [VP definition](https://dictionary.cambridge.org/dictionary/english/vp). |
| `Executive Art Director` at `default:53659` | Use `총괄 아트 디렉터` to retain the executive scope in English/Japanese and Chinese. This exact-key wording does not establish a Lua display link or determine other art-director titles. | [Application review, November 15](../../audit/lua-corpus-translation-application-20261115.md). |
| Equipment terms | Keep `Greaves` (`정강이 보호구`), `Chausses` (`각반`), and `Boots` distinct. Use `셉터` for the equipment term `Sceptre` and `페이블레이드` for `Faeblade(s)`; metaphorical `scepter` at `default:138` and `56581` is excluded. | [Weapon/armor terminology](../../audit/translation-edit-addendum-20261106.md#weapon-and-armor-terminology); [leg armor distinctions](../../audit/translation-edit-addendum-20261106.md#greaves-chausses-and-boots). |
| `Victor's Brew` | Beverage type remains unresolved at `default:8135`, `21338`, `32511`, `46789`, and `57870`. Preserve the reviewed row-specific forms; do not standardize all occurrences to beer, liquor, or brew by analogy. | [Name review](../../audit/translation-edit-addendum-20261109.md#victors-brew-name-review---november-10-2026). |

### Selected Key-Scoped Wording Decisions

These confirmed edits were selected from the additional audit passes because
their source interpretation or hold resolution is useful to preserve. They
record exact reviewed keys, not reusable wording rules; the audit files
remain the complete edit history.

| Keys | Scoped correction | Audit record |
| --- | --- | --- |
| `22903` | Restore Prismere as the subject and use `황홀감` for its intoxicating effect in this line. | [November 4 addendum](../../audit/translation-edit-addendum-20261104.md#id-22903). |
| `41254` | Rephrase the blood-threat idiomatically while preserving its pauses and unfinished dash. | [November 4 addendum](../../audit/translation-edit-addendum-20261104.md#id-41254-threat-wording). |
| `15325`, `33022`, `42600`, `51241`, `52096`, `57512` | Correct the source-specific senses of bliss/ecstasy/rapture; these do not establish one Korean rendering for every related English word. | [November 4 addendum](../../audit/translation-edit-addendum-20261104.md#ecstasy-rapture-bliss-and-related-wording). |
| `55151`, `61609` | Restore the implication “That means” at `55151`; interpret `I guess I can do better` as finding a better partner at `61609`. | [November 5 addendum](../../audit/translation-edit-addendum-20261105.md#curse-warsworn-and-name-consistency). |
| `1037`, `59088`, `8866`, `12766`, `21927`, `28739`, `45395`, `45752`, `52493`, `54737` | Correct the reviewed Sable's Missives sentences for title number, book possession/accusation, planting instructions, route, freedom bargain, and narrative relations. | [November 6 addendum](../../audit/translation-edit-addendum-20261106.md#missives-of-sable-sentence-review). |
| `31227` | Clarify that the book is very important, with its importance compared to the speaker's escape; this follow-up resolves the earlier hold. | [November 6 addendum](../../audit/translation-edit-addendum-20261106.md#book-and-escape-comparison-at-31227). |
| `62177` | Clarify that Ommer's zest for life rivals that of a man half his age. | [November 15 reconciliation](../../audit/dialogue-context-62000-62249-candidate-reconciliation-20261115.md). |
| `62502`, `62730` | Make Akara's choice contrast emphatic at `62502`; render the dice-game wish naturally at `62730`. | [November 15 reconciliation](../../audit/dialogue-context-62500-62749-candidate-reconciliation-20261115.md). |
| `63204`, `63244` | Use `동굴` for the Sinsear hollow; describe the refugees as `우리처럼 불쌍한 난민`. | [November 15 reconciliation](../../audit/dialogue-context-63000-63249-candidate-reconciliation-20261115.md). |
| `64458` | Use `실재해`, not `진실해`, for the Fae being real within stories; this follow-up resolves the earlier hold. | [November 15 follow-up](../../audit/dialogue-context-translation-followup-64458-20261115.md). |

## Bilingual Annotation Boundaries

These are scoped exceptions to mechanical full-name pairing or source-label
normalization. A complete item/book title, a personal epithet, and a
component name are not interchangeable annotation units.

| Keys / scope | Decision and limits | Audit record |
| --- | --- | --- |
| `default:61917` | Pair the whole book title `The Adventures of the One Without a Fate`; do not insert a nested `Fateless One` character-epithet annotation. The separate source typo `fatelessone` at `60700` was explicitly normalized to `(Fateless One)`, not made a literal-spelling rule. | [Fateless review, October 27](../../audit/translation-edit-addendum-20261025.md#fateless-epithet-pairing-and-translation-review-2026-10-27). |
| Exact `Argine, Queen of Staves` labels, including `40340`, `41255`, `47099` | Retain `지팡이 여왕(Queen of Staves) 아르진(Argine)` throughout the reviewed 26-row group. Earlier manifests proposing a combined title/name parenthetical are superseded. | [Manifest-conflict reconciliation, November 15](../../audit/dialogue-context-final-edit-manifest-conflicts-20261115.md). |
| `default:53338` | Use `메로피스(Meropis)의 보물`, without the redundant `(The Treasures of Meropis)`. This user-requested shortening responds to reported quest-list clipping; display after the edit was not verified. Do not strip full-title annotations elsewhere by analogy. | [Meropis title, November 6](../../audit/translation-edit-addendum-20261106.md#meropis-title-at-53338). |
| `default:57264`, `61973` | D-21818 added `행운의 시녀호(Maid of Fortune)` at `57264`, deliberately omitting `The`, while retaining the already paired `(The Maid of Fortune)` at `61973`. It did not globally unify the ship's Korean spellings or remove articles. | [D-21818, October 18](../../audit/named-scope-review-D21818-20261018.md). |
| `default:26209`, `39445` | Keep the separate English labels `(Winter's Embrace)` and `(WintersEmbrace)`, even though the Korean is `겨울의 포옹` at both. No shared entity or permission to repair the source spelling was inferred. | [D-21640, October 18](../../audit/named-scope-review-D21640-20261018.md). |

### Collective Names, Short Forms, and Distinct Entities

| Scope | Decision and exclusions | Audit record |
| --- | --- | --- |
| Travelers faction | Standalone faction labels use collective `트래블러`, without `들`; member-plural sentences may use `들`. Fourteen reviewed headings are `669`, `930`, `1206`, `1816`, `3689`, `7540`, `10252`, `16562`, `21528`, `21638`, `32698`, `46484`, `51845`, `52970`. Preserve row-local English forms, including `(The Travelers)` at `1206` and singular `(Traveler)` in `27134`'s camp modifier. Ordinary travelers at `19474` remain `여행자`. The later `34073` review instead confirms a named class/role, `트래블러(Traveler)`, superseding that row's earlier ordinary-traveler exclusion. | [Number/faction decision, November 3](../../audit/translation-edit-addendum-20261103.md#travelers-number-and-faction-name); [34073 confirmation, November 14](../../audit/dialogue-context-34000-34249-candidate-reconciliation-20261114.md). |
| Sparrows group | Use `참새단(Sparrows)` for the reviewed rag-picker group; `31232`'s singular member is `참새단원(Sparrow)` locally, not a global alias. Keep the full `(The Sparrows)` article where the topic label includes it. `59501` is an ordinary bird comparison and is excluded. Do not infer a new named map site from the group's nest descriptions. | [D-21671, October 18](../../audit/named-scope-review-D21671-20261018.md). |
| `default:12234`, `17474`, `19922`, `47813` | Retain `이쑤시개들(Toothpicks)` in these four exact short-form sources. Use `드라우그의 이쑤시개(Draug's Toothpicks)` only where the source gives the full name; do not expand every short reference. | [Short-form confirmation, November 14](../../audit/dialogue-context-17250-17499-candidate-reconciliation-20261114.md). |
| `Breath of Abra` / `Breath of Arba` | Keep `아브라의 숨결(Breath of Abra)` and `아르바의 숨결(Breath of Arba)` as distinct item titles. Similar Japanese/Chinese renderings do not merge them or establish a person/owner identity. At `default:33403`, the separate staff relationship remains unresolved despite the item annotation. | [D-21681, October 18](../../audit/named-scope-review-D21681-20261018.md). |

### Homonyms and Generic Uses

| `default` keys | Decision and status | Audit record |
| --- | --- | --- |
| `4710`, `40132` | Both English labels are `Mine`, but Japanese distinguishes `鉱山` / `地雷`; retain the current `광산` / `지뢰` difference rather than blindly unifying the group. `40132`'s intended meaning is still explicitly held despite Japanese support; `지뢰` is provisional, not a newly approved disambiguation. | [Reconciliation, November 14](../../audit/dialogue-context-40000-40249-candidate-reconciliation-20261114.md). |
| `1029` | Retain collective `고리(Ring)` under D-20388, reconfirmed without a CSV edit by D-21790. Generic equipment rings remain `반지`; the group name does not redefine the item type. | [Ring short-label review, October 18](../../audit/named-scope-edit-addendum-D21790-20261018.md). |
| `Lorestone` / `Lorestones` | Use the generic game-term translation `로어스톤` in `base` and `default`, including plural occurrences. Do not register the collectible as a proper-name entity or force an English parenthetical into every sentence. Keep named Fae Cairns distinct. | [Terminology reconciliation, November 15](../../audit/terminology-consistency-20261115.md); [D-21766 scope](../../audit/named-scope-edit-addendum-D21766-20261018.md). |
| `40927`; `37577` | At `40927`, the named magical spring is `샘(The Font)` while generic `fountainhead` in the same sentence remains `원천`. Do not extend the proper name to `37577`: lowercase English `font`, Japanese spring, and Chinese holy-water vessel leave that referent unresolved. | [Named-spring correction, November 15](../../audit/dialogue-context-40750-40999-candidate-reconciliation-20261115.md); [generic-font hold, November 12](../../audit/dialogue-context-default-37500-37749-revalidation-20261112.md). |
| `27487`, `27492` | These source-confirmed creature references use `스프라이트(Sprite)`, not generic `요정`. This does not identify every fairy-like being as the same creature type. Preserve the row-specific pool/capture history and the Flowering rite's birth/return details. | [Creature-term confirmation, November 14](../../audit/dialogue-context-27250-27499-candidate-reconciliation-20261114.md). |

Separately, `base:4674:11` is `밴드`, not `반지`. The user confirmed that
this particular `Band` is not a ring, overriding Chinese `戒指` and the
earlier D-003 `not an issue` decision. D-18202 (2026-10-11) supersedes that
decision for this key only; do not extend `밴드` to every `Band`.
[User-confirmed item exception](../../audit/base-band-4674-review-20261011.md).

## Gameplay Meaning and Numeric Boundaries

| Reviewed scope | Decision and limits | Audit record |
| --- | --- | --- |
| Damage-type terminology | Use `물리 피해` (Physical), `관통 피해` (Piercing), `화염 피해` (Fire), `냉기 피해` (Ice), `번개 피해` (Lightning), `독 피해` (Poison), and `출혈 피해` (Bleeding). Additional types are `화상 피해` (Burning), `빙결 피해` (Freezing), and `감전 피해` (Shocking). Preserve distinctions between base damage types and their additional effects. Ordinary fire damage to property, such as `default:4787`, is not the combat type Fire Damage. `Shock enemies when Blocking` at `default:22676` is a separate action/effect, not another damage-type label. | [All ten types, November 15](../../audit/terminology-consistency-20261115.md); [81-row parenthetical review, November 3](../../audit/damage-type-consistency-20261103.json). |
| `default:29062`, `23521` | The +1 bonus increases the level of each already acquired ability in ability-tree tiers 1-2; it does not increase the tree tier or only an ability's first two levels. Keep `힘(Might)` / `마법(Sorcery)` categories distinct. | [Effect review, November 3](../../audit/item-effect-consistency-20261103.json). |
| `default:27214`, `39322`, `43871`, `47260` | Temporary when-attacked freeze/shock/burn effects grant a fixed probability; do not recast them as an increase to an existing probability. Retain each key's own value and trigger. | [27214](../../audit/edit-batch-20261011-addendum.md), [other three dispositions](../../audit/edit-batch-20261010-addendum.md). |
| Reviewed Destiny-card stats | Use stat-first ordering. Absolute evasion/stun probabilities retain their percentages without an invented `+`. `Stun Duration` is `기절 지속 시간`, distinct from stun probability; `Damage While in Stealth` is `은신 중 피해량`, not stealth duration. The unused `39387` retains `[사용 금지]`. Exact stat and follow-up ID lists remain in the linked decision. | [Stats and omission follow-up, October 27](../../audit/translation-edit-addendum-20261025.md#destiny-card-stat-omission-follow-up-2026-10-27). |
| `default:18449` | Replace only the wrapped alternate name `운명 개방 모드` with `{*1레코닝 모드}`, matching the reviewed `Reckoning Mode` term and retaining the wrapper. This does not rename all generic uses of reckoning. | [Mode review, November 5](../../audit/translation-edit-addendum-20261105.md#reckoning-mode-terminology). |

## Register and Text-Function Boundaries

These accepted examples guard against blanket conversion to either plain
speech or formal prose. They do not establish a speaker's identity or the
register of unrelated rows.

| `default` keys | Decision and rationale | Audit record |
| --- | --- | --- |
| `2064`, `23635` | Retain the dramatic ceremonial greeting but replace unsupported `-오/-소` with the reviewed plain commands. Keep the second greeting's distinct recognition response. | [Reconciliation, November 14](../../audit/dialogue-context-02000-02249-candidate-reconciliation-20261114.md). |
| `2033` | Use neutral quest-journal narration, not conversational speech. The separate Warden-title uncertainty is not settled by the register change. | [Reconciliation, November 14](../../audit/dialogue-context-02000-02249-candidate-reconciliation-20261114.md). |
| `53736` | The sarcastic multiline letter uses Japanese-supported familiar plain speech (`네 가족`, `네 아내`), not an invented senior-to-junior `자네` / 하게체 relationship. Preserve the letter's layout. | [Register decisions, October 26](../../audit/translation-edit-addendum-20261025.md). |
| `54064` | Keep the safety warning urgent but polite: `물러서세요` / `저도 모르겠어요`. A warning is not automatically a plain-style order. | [Register decisions, October 26](../../audit/translation-edit-addendum-20261025.md). |
| `54143` | Retain the ceremonial royal plural `우리` while removing the unsupported shift from `보았도다` to casual `잘했어`. Grandeur does not require inconsistent archaic endings. | [Register decisions, October 26](../../audit/translation-edit-addendum-20261025.md). |
| `12347` | Retain `각하` and consistent polite self-reference (`저는`, `도와드릴까요`, `흠모해 왔습니다`). The later source-grounded review preserves the deferential request rather than following Japanese casual register alone; it supersedes the November 10 plain-speech wording. | [Current decision, November 14](../../audit/dialogue-context-12250-12499-candidate-reconciliation-20261114.md); [earlier wording](../../audit/translation-edit-addendum-20261109.md#dialogue-voice-follow-up---november-10-2026). |

## Deliberately Unspecified Relationships and Fragments

The dispositions differ: a supported neutral correction is not the same as
an unresolved reading that remains in the working text.

| `default` keys | Status and boundary | Audit record |
| --- | --- | --- |
| `36929` | Corrected: `내 형제자매 둘 다 아파` does not add younger-sibling ages or infer the speaker's gender. | [Reconciliation, November 14](../../audit/dialogue-context-36750-36999-candidate-reconciliation-20261114.md). |
| `44742` | Partially corrected: remove the unsupported singular vocative `자매` and use the reviewed welcome to a warrior. The kinship/address interpretation itself remains unresolved. | [Reconciliation, November 15](../../audit/dialogue-context-44500-44749-candidate-reconciliation-20261115.md). |
| `62496` | Held: English does not establish whether the sister is older or younger, and Japanese/Chinese conflict. The active Korean still says `언니`; that is the held draft, not an approved resolution or an already neutralized rendering. | [Held kinship, November 15](../../audit/dialogue-context-62250-62499-candidate-reconciliation-20261115.md). |
| `62474` | Held: `the rest of Dolve Arne` does not establish whether the referent is the place, people, or belongings. Do not add an explicit referent to settle it. | [Held referent, November 15](../../audit/dialogue-context-62250-62499-candidate-reconciliation-20261115.md). |
| `41264` | Held: the English fragment ends at `It would be a small matter to`; no missing continuation is evidenced. | [Fragment hold, November 15](../../audit/dialogue-context-41250-41499-candidate-reconciliation-20261115.md). |
| `51527` | Retained: keep the fragmentary title `누군가에겐 쓰레기...`, without supplying the familiar proverb's unattested ending. | [Reconciliation, November 15](../../audit/dialogue-context-51500-51749-candidate-reconciliation-20261115.md). |

## Scope and Status

These decisions document the active Korean localization and apply only to
their stated source IDs, variants, text function, and context. They are not
global Korean style rules and should not be copied unchanged to another game.
When a later decision supersedes one of these forms, update this reference
without rewriting the historical audit record.

The [November 15 recovery report](../../audit/translation-exceptions-recovery-20261115.md)
records the four additional audit rounds, their distinct perspectives,
validation, and remaining evidence limits.
