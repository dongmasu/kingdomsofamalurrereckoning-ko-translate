# Proper-Name Continuation Validation

<!-- current-proper-name-batch:start -->
## Latest Verified Proper-Name Batch

Latest verified proper-name batch: D-21569 (2026-10-17).
Japanese parenthetical scan: 113 candidates classified; 77 `Texto` cells corrected; existing proper-name decisions were not reopened or recounted.
Next batch: D-21570; continue source-discovery/residual closure checks; no unreviewed indexed keys.
Indexed matches: 44016; accepted=29416, excluded=2876, not-an-issue=11628, uncertain=96.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 96, in 93 distinct CSV row keys.
These are focused entity/row index states, not global translation totals. The documented uncertain matches remain reviewed holds, not unreviewed work.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `895ff1e3eb03341d7c026ce3bfbd4cea355705956a1e494e04eed5a2014b1567`.
- default: `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`.
Last batch pre-edit backup and byte validation:
- default: 77 cells; pre `9c07c64ee4762a840d15e0cbaba0e19ae2dbb6babcd73fe6292de5ade0d57ad4`; post `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`; backup `/private/tmp/ko-translate-backups/20261017/before-default-parenthetical-D21569/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 77 changed cells; 65135 ordered rows; BOM, mixed line endings, exact row keys/order, opaque tokens, non-target bytes, and inverse backup reconstruction verified. Index: PASS 16 current-text caches updated; all keys, statuses, and evidence unchanged.
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 1 cells; pre `ab0619937fbb187b356253b9916f3676d2002f8017b25b71cc53be29307aee10`; post `895ff1e3eb03341d7c026ce3bfbd4cea355705956a1e494e04eed5a2014b1567`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21557/locatexts_zh_cn.koalocatext_base.csv`.
- default: 77 cells; pre `9c07c64ee4762a840d15e0cbaba0e19ae2dbb6babcd73fe6292de5ade0d57ad4`; post `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`; backup `/private/tmp/ko-translate-backups/20261017/before-default-parenthetical-D21569/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `9c67a88ce998bf8cb60c5df5c103f7fb0c0900cf5514cde8821a680ebf6e8018`.
Occurrence index: 44016 rows; SHA-256 `8406e714bd989cfb42bcf31afca1156914640b91502dfe766e50a3dcc615b8ef`.
Proper-name glossary: 1838 entries; SHA-256 `693bc8fd6e3a4fd4da14d4898db4d534c740aba9ddc18d453f8386d75e338bf4`.
Report: `work/zh_cn/audit/named-scope-review-D21569-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21569-20261017.md`.
Full Japanese-parenthetical candidate manifest: `work/zh_cn/audit/japanese-parenthetical-review-D21569.tsv`.
<!-- current-proper-name-batch:end -->

### D-21569: Japanese Parenthetical Fragments in `default`

Screened the 65,135 active default rows for Japanese cells whose entire
text is parenthesized, matching the requested `;(...)` shape. Classified
113 candidates by English meaning rather than punctuation alone: 79
condition/weapon/target/location fragments, three short spawn-action
labels, one purpose fragment, and 30 English-parenthesized asides,
comments, or status labels. The 30 already had corresponding Korean
parentheses and were retained. Of the 83 short fragments, six Korean
labels already had the requested form; 77 cells were corrected.

Followed Japanese's compact qualifier form, including `(야간)` and
`(주간)`, and made target/weapon fragments suitable for postposed use.
Normalized the 22 Familiar/Upgrade/Mastery level labels to 사역마,
사역마 강화 and 사역마 숙련도, preserving every level and qualifier.
Used the official Korean manual's 셉터 for Sceptres. At
default:45697, distinguished parrying from ordinary blocking using
default:41891/51696/52709 and Japanese パリィ中. At
default:10487, the existing same-file translation `Sleight of Hand` =
`손재주` at default:16773 supports `(손재주 생성)`. At default:26982,
English says `to stun enemies` while Japanese instead says `vs. paralyzed
enemies`; English meaning controls, and only the Korean fragment's outer
parentheses were added. At default:58894, Japanese refers to undamaged
boots, unlike English's unworn boots; retained the current English-led
Korean meaning and recorded the source conflict without resolving it.
Existing keys and dispositions were not reopened or recounted.

### D-21568: Deity Menu Name-Title Order

Checked the 12 requested default deity menu labels against
`deity name (English), Korean title`, matching the English menu order and
the official Korean manual's deity-name spellings (PDF p. 2). English
identity/meaning was checked with the aligned Japanese and Chinese source
cells. Eight cells needed correction; four already matched the requested
order. Selection notes, race names, footnote markers, and their wording
were preserved exactly. The eight changes affect eight `Texto` cells and
the `korean_current` cache for 22 existing occurrence-index rows. Existing
entity keys, statuses, and evidence remain unchanged; this is a text-only
correction, not a new or reopened proper-name decision and not a tally
recount. No source CSV, PAK, or PAK-derived resource was modified or
inspected.

### D-21567: Qualified High Courts

Reviewed six distinct default rows / seven entity-row matches. Registered
`겨울 상궁정(High Court of Winter)` as a complete organization distinct
from, and not an alias for, the `Winter Court` faction. Registered
`이사에 있는 실리 상궁정(High Court of the Seelie in Ysa)` as a separate
organization; the Ysa-history reference `상궁정(High Court)` is linked
only in that exact context. The three unqualified High Court contexts
at default:14300, 25940 and 57388 do not establish the same institution
and remain unchanged/excluded. Prior decisions on default:7155,
default:31067 and default:57728, including the uncertain Ysa match, were
preserved. The two approved labels were the only Texto changes.
Full proper-name discovery remains incomplete.

### D-21558: Talisman, Prince And Historical Kingdom

Reviewed 11 distinct default keys / 13 entity matches, with no affix
or base matches. Registered `운명의 부적(Talisman of Fate)` across ten
keys, including both written mentions in default:61425, and retained
the source article in two complete standalone headings.

Registered `봄의 왕자(Prince of Spring)` as a title only: adjacent
references to Ysa do not prove the prince's personal identity.
Registered `여름 대왕국(Great Kingdom of Summer)` as the explicitly
named historical polity, not as a Summer Court or Gardens of Ysa alias.
No verse interpretation, lore chronology, prior entity decision,
unresolved Cradle identification, token or line break was changed.
Full proper-name discovery remains incomplete.

### D-21557: The Raven And Distinct Raven Names

Reviewed 12 distinct row/entity keys across base/default, with no affix
matches. The seven inn references are normalized to the existing
base spelling `큰까마귀 여관(The Raven)`, supported by English's inn
description and Japanese 大がらす亭 / Chinese 渡鸦旅馆.
No global Raven alias is introduced.

Registered `Raven Guard`, the `The Ravens` arena team and the isolated
complete `Raven's Aegis` title independently, without merging their
identities or inferring equipment mechanics. The already paired guard
and Aegis cells are unchanged. In the wagering roster, paired the
second explicit `The Ravens` mention while retaining every number,
roster name and prior entity decision. The two poems containing
lowercase `the ravens` are lexical matches but explicitly excluded
from the arena-team identity; ordinary bird imagery remains unchanged.
Full proper-name discovery remains incomplete.

### D-21556: Named Combat Attacks And Unholy Void

Registered seven complete English-led attack/effect names: Comet Strike,
Minotaur Rush, Crushing Blow, Gut Thrust, Riposte, Whirlwind and Unholy
Void, plus the atomic Whirlwind Breastplate item. Reviewed 20 distinct
row keys / 33 entity matches across base/default, with no affix hits.
Reused the standalone Korean labels and paired their named mentions.

At default:32084/41817/41840, explicitly reviewed localized display
text is normalized from 내장/급소 찌르기 to 복부 찌르기 and from 강타
to 분쇄 일격. Each exact marker rewrite is allowlisted; marker numbers,
braces, optional square brackets and all unrelated tokens are preserved.
English annotations are outside the markers. Existing bilingual
default:12187 and default:22754 remain unchanged.
At default:32084, the localized `[반격]` payload for Riposte is also
normalized to `[받아치기]` with its brackets retained. The ordinary
debate retort and three figurative/generic whirlwinds are excluded.
The isolated `Riposte!` imperative at default:62311 remains unchanged
and uncertain for named-attack identity; no gameplay cue is inferred.

The specialized batch gate first validates every changed marker
against its exact approved before/after pair, then uses display-masked
copies for the generic discovery validator. The real review manifest
and CSV editor retain and validate the complete original/revised text.
No generic discovery-validator or shared editor behavior is changed.
Attack/effect descriptions, percentages and line breaks are preserved;
game rendering remains untested. Full proper-name discovery is incomplete.

### D-21555: Oratory And Codex Of Fate

Reviewed 21 distinct row keys / 24 new entity matches across all three
resources (no affix matches). Reused the already paired
`오라토리움(Oratory)` from two English-led location descriptions to
normalize 기도실/연설장/예배당/기도소 in this exact place scope.
The four complete `The Oratory` labels retain their source article.
Full `Ballads Oratory` and `House Oratory` labels are paired atomically,
with their nested Oratory matches excluded; no global location alias
or building-equivalence claim is added.

Registered the complete source name `운명의 서(Codex of Fate)` across
four exact keys, correcting the isolated 법전 variant. This does not
merge it with `Codex of Destiny` or assert separate physical objects.
Their identity relationship remains unproved. All unrelated earlier
name/entity dispositions on shared rows remain unchanged.
Full proper-name discovery remains incomplete.

### D-21554: Generic Court Annotation Correction

Resolved the default:55140 follow-up from D-21549-D-21553.
English says `a court of Winter Fae`, not a complete `Court of Winter`
name. Japanese explicitly refers to the House of Sorrows; Chinese
renders it as Winter Court and does not override the English syntax.
Removed only the unsupported `(Court of Winter)` after `궁정`.
Retained `겨울 페이(Winter Fae)`, Tuatha and all surrounding text.

This is a new, exact-span counterexample to an inherited annotation,
not a repeat of the earlier Winter Fae translation review. Update the
existing `people:winter-fae` occurrence in place, retaining its previous
accepted status/evidence in the manifest. No entity/occurrence was
added; the excluded court occurrence and every unrelated disposition
remain unchanged. The separate base:2353 Imperial title remains deferred.

### D-21549-D-21553: Seasonal Courts And Rat Queen

Registered the English-led court designations `여름 궁정(Summer Court)`
and `겨울 궁정(Winter Court)` with their complete source aliases.
Checked 241 distinct row keys / 250 entity matches across all three
resources in 50/50/50/50/41-key batches; affix has no lexical matches.
Preserve the difference between court organizations, their metonymic
seats and seasonal Fae peoples; this is not a physical-location merger.
Source-local English orders and the hyphenated `Court-of-Winter` are
retained in annotations, and existing unrelated entity decisions remain
unchanged.

The complete `Winter Court Necklace` is paired atomically as
`겨울 궁정 목걸이(Winter Court Necklace)`. The nested court occurrence
is excluded from organization edits. `Summer Court Imperial` at
base:2353 is likewise excluded from nested court edits; the isolated
English label and Japanese court-purveyor wording do not justify its
existing Korean `제국 기사` reading. Its complete item-name translation
remains a documented follow-up, not an approved semantic correction.
The qualified `High Court of Winter` at default:7155 is excluded and
preserved, not asserted to be an alias for the entire Winter Court.

At default:55140, English `a court of Winter Fae` is not a complete
`Court of Winter` name. Exclude this lexical false positive. The
pre-existing `궁정(Court of Winter)` annotation is not endorsed; its
removal needs a separate corrective manifest rather than silently
changing an excluded row in this discovery pass.

Registered the monster designation `쥐 여왕(Rat Queen)` across seven
exact default keys, without inferring that every specimen is one
individual. At default:54505 the second Korean name expands English
`her`; it is paired locally but adds no English occurrence key.
Full proper-name discovery remains incomplete.

D-21548 resume validation: reverse reconstruction through D-21533 passed,
including all D-21547/48 edits; the earlier D-21547 single-batch verification
conflict is resolved. See `proper-name-chain-validation-D21548-20261017.md`.

### D-21547-D-21548: Fae Cairns And Paragon

Registered `item:fae-cairn` as `페이 케언(Fae Cairn)` and
`title:paragon-fate` as `파라곤(Paragon)`. Reviewed 79 distinct
resource/ID/variant keys in consecutive 50/29-key batches: 51 Cairn
source keys and 28 Paragon candidate keys. The Fae objects are explicitly
defined as magical Lorestones in the English corpus; Japanese ケルン and
Chinese 灵球/灵族堆石标 corroborate. Standardized full and contextual
short labels without nesting `Fae` inside the complete `Fae Cairn` name.
The separate Tinniat burial cairn at base:3658 is excluded.

The standalone Paragon fate/title at default:32495/default:62731 is
paired. Existing `Paragon Barghest` and `Paragon Thresh` compound monster
names remain atomic and are excluded from the new title scope. No
generic `paragon` use is treated as this title. The six `Paragon's`
affix variants remain uncertain because the isolated label and aligned
translations do not settle whether they name this fate or describe a
generic exemplar.

Prior dispositions for other entities on shared rows remain intact.
Full proper-name discovery remains incomplete; this candidate pass is
not an exhaustive completion claim.

### D-21528-D-21529: The Offering Rite

Registered `named event:offering-rite` as `봉헌 의식(Offering)` with the
source form `The Offering`. Reviewed 90 exact source matches in 50/40-key
batches: 55 cells changed, 3 already bilingual, 30 generic/item matches
excluded, and 2 identity holds retained. The Scion rite is established by
the complete English-led corpus and aligned Japanese/Chinese; prior exact-row
decisions are not recounted. The separate Chernobog item is excluded.

The saved candidate snapshot is stale: ranks 386-388 were screened under D-21454, and the remaining Helm item scope was reviewed at D-21533. Do not resume at rank 389. Continue with fresh English-source residual checks; the current next batch is D-21549.

### D-21524: Luminitsa And Maxim Masterin

Registered `루미니차(Luminitsa)` across all 25 lexical keys,
including 5 excluded nested-person hits in complete named labels.
Paired Cottage (2 keys), House, Cards and To Luminitsa I separately;
this does not infer a shared or distinct physical building or a
medium for the bare To Luminitsa I label. Registered the thinker
`맥심 마스터린(Maxim Masterin)` at default:33025, pairing its two
full mentions and one explicitly linked local `Maxim` reference.
No global Maxim alias was added.

Reviewed 26 row keys / 31 entity matches; changed 12 cells.
At default:56239 only the name-adjacent 에서 -> 가 is corrected:
Luminitsa is the person sending Plagueshield, not a place.
English, Japanese and Chinese support that attribution.
Letter paragraphs, puzzle instructions, allegations and all earlier
entity dispositions remain unchanged. Historical totals are not recounted.

### D-21521: Chaos Materials And Cores

Reviewed 32 distinct source row keys, with 41 entity/key matches across
Chaos Matter, the neutral title Chaos Matter Delivery, Chaos Flame, three
complete Flame base-item titles, independent Chaos Core, and Chaos Weapon
Core. Exact scopes: Matter 14, Flame 11 (including three atomic item
titles), Core 4, Weapon Core 8, plus the same-row Delivery title and three
separate item-title entity matches. Row-key overlaps are intentional:
Matter/Weapon Core at default:3138, 13857, 22424 and 63443; Flame/Core at
default:56572; Delivery/Matter at default:15427; and Flame/item titles at
base:559, 1036 and 1276. Overlapping labels are represented in one review
row with per-entity dispositions; no nested annotations are produced.

Keep `{*1...}` tokens byte-identical and place English annotations after
them. Chaos Flame Disc, Rod, and Dowel remain distinct; Dowel is rendered
as 다월, not collapsed into Rod/막대. Chaos Matter Delivery is a neutral
title, not presumed to be a quest. Core component descriptions remain
complete atomic phrases. No prior Chaos Essence, Chaos Node, Skald, or
unrelated row decision is reopened or recounted.

### D-21519-D-21520: Chaos Realm And Chaos Portals

Registered `place:chaos-realm` as `혼돈의 영역(Chaos Realm)` and
`place:chaos-portal` as `혼돈 차원문(Chaos Portal)`, with the source
plural `Chaos Portals` as the Portal alias. Reviewed 71 unique CSV row
keys (75 entity matches) in 50/21-key batches: 69 changed cells,
2 unchanged.

Realm denotes the broader dimension, not each dungeon, one particular
place, or Esharra. Portals are distinct from Rifts and remain a class;
individual portals are not merged. Same-row short Portal references
are local only. Opaque tagged terms remain unchanged. Open/Closed and
status/counter attributes are retained. Existing entity/key decisions
remain immutable.


### D-21517: Chaos Node

Registered `lore_term:chaos-node` as `혼돈 노드(Chaos Node)`.
Reviewed 13 exact default keys containing 14 full-name mentions;
annotated 12 cells and retained the existing bilingual default:55107.
Plural forms use source-local `혼돈 노드(Chaos Nodes)`. At
default:12596 both full names, two English short forms and the existing
Korean noun expanding English `destroying it` are paired locally;
the latter is not an extra English name mention. At default:56572/63443 the Korean UI tokens
remain byte-identical and receive English labels outside the tokens.
`Chaos Realm` is unchanged.

### D-21515: Customs House

Registered `place:customs-house` as `세관(Customs House)`, with
the source-attested full form `라시르 세관(Rathir Customs House)`.
Reviewed 20 lexical row keys: 18 named building/office references,
one generic excluded use (default:51377), and one identity hold
(default:41569). Added annotations to 17 cells; the existing
bilingual default:18374 and both exceptions remain unchanged.

English explicitly places the building in Rathir; Japanese 収税局
corroborates. Isolated Chinese mistranslations do not determine
the Korean name. The hidden lair is not merged into the building,
and previous inside/beneath or narrative decisions are preserved.
No broad `Customs` alias or historical translation tally was added.

### D-21513: Peace Edict

Registered `lore_term:peace-edict` as `평화 칙령(Peace Edict)`.
All 15 exact keys are in default; no affix/base matches.
English establishes Ysa's named decree, with Japanese 平和の布告
and Chinese 和平法令 corroboration. Added missing annotations to
12 cells; retained the 3 already paired cells.
The rule descriptions, especially default:63202's weapons-controlled
wording, remain unchanged. This is not a fresh disposition of earlier
sentence-level findings, and no historical translation total changed.

### D-21512: Codex Of Destiny And Tome Of Synthesis

Registered `unique_item:codex-of-destiny` as
`운명의 서(Codex of Destiny)` and `named_work:tome-of-synthesis` as
`합성의 서(Tome of Synthesis)`, without broad short aliases.
Reviewed 33 distinct keys (3 base, 30 default; no affix):
Codex 18 keys/18 mentions and Tome 15 keys/16 mentions, no overlap.
Changed 22 cells (Codex 11, Tome 11); retained 11 already-valid cells.
Japanese 宿命の書/合成の書 and Chinese 命运法典/天命法典/合成之书
corroborate the complete names.

Preserve the forgery distinction at default:5343/48609, the two
Tome mentions and puzzle instructions at default:33025, and the
tutorial markup, warnings and CRLFs at default:20956. Only the
법전은 -> 서는 particle at default:12526 changes. The same-row short
reference `The Codex` at default:13845 becomes `그 서(Codex)에는`,
with no global alias or added key. The copular 지 at default:19649
remains outside the name. Prior entity dispositions,
evidence and historical translation totals are not recounted.

### D-21510-D-21511: Well Of Souls

Register `construct:well-of-souls` as `영혼의 샘(Well of Souls)`.
Reviewed 61 exact entity/resource/ID/variant keys in 50/11-key batches:
42 changed CSV cells and 19 unchanged. English identifies a named
resurrection construct/research project; Japanese 魂の泉 and Chinese
灵魂之井 corroborate. The schema category is `lore term`; this does not
equate the Allestar original, Ventrinio apparatus, and portable comparison
as one physical instance.

Same-row short references at default:57375 (`Well in Allestar`) and
default:61903 (`top of the Well`) receive only local Korean `샘(Well)`
annotations. They add no occurrence keys and no global `Well` alias.
The ordinary hideout `a well` at default:54620 remains unannotated.
Existing row-level dispositions for other entities remain unchanged.


### D-21509: Primal Magic

Registered `lore_term:primal-magic` as `원초 마법(Primal Magic)`,
a named magic type/effect, not a learned active skill. Reviewed all
18 exact source keys (1 base, 17 default). English introduces the
magic and its weapon/gem infusion effects; Japanese and Chinese
corroborate. All existing Korean terms in the long default:47196
book passage are paired without changing the prose or paragraphs.

At default:62612, the exact `{*3원초 마법}` display marker is retained
byte-for-byte and `(Primal Magic)` is placed immediately after it.
No marker content is rewritten; actual in-game line width/style was
not tested. The separate full title at default:25241 is excluded
from this magic-type scope and unchanged. Its `Forward` versus
existing Korean `서문` interpretation remains deferred in the
per-row manifest, not silently corrected to `Foreword`.
No bare `Primal` alias, unrelated decision or historical tally changed.

### D-21507-D-21508: Cradle Of Summer

Registered `place:cradle-of-summer` as
`여름의 요람(Cradle of Summer)` and the complete stone label as
`여름의 요람 돌(Cradle of Summer Stone)`. Reviewed 59 row keys in
50/9-key batches: 60 entity matches including the excluded nested
place occurrence in the stone title. English identifies the sacred
region, its magic and barrier; Japanese 夏のゆりかご and Chinese
夏之摇篮 corroborate. Fixed base:1967's reversed modifier relationship,
missing full-name annotations, the repeated full reference at
default:13274 and the same-row short `Cradle` reference at
default:59513. No global `Cradle` alias was introduced.

Default:1833 and default:11199 remain unchanged and uncertain for
this new entity: lowercase poetic `our cradle of summer` could name
the sacred region or describe a metaphorical birthplace of Summer.
The aligned languages do not resolve that identity. These two new
entity holds do not reopen earlier row/lore decisions. Every other
entity disposition and historical translation total is preserved.

### D-21506: The Wolds And The Black Atoll

Registered `place:the-wolds` as `월즈(The Wolds)` with the source
short form `Wolds`. Reviewed all 40 exact Wolds keys (2 base,
38 default), normalizing 볼즈, 울즈, the mistranslated 황야 label,
missing annotations and repeated mentions. Source-local full/short
English forms remain distinguishable; unrelated geography and prose
are not rewritten.

The complete base:272 label is separately registered as
`월즈의 돌(Stone of the Wolds)` under `item:stone-of-the-wolds`;
its parent place occurrence is excluded, without inferring mechanics.
Also registered the painting `named_work:the-black-atoll` as
`검은 환초(The Black Atoll)` across all 5 exact base/default keys.
English explicitly calls it a painting; Japanese and Chinese corroborate.
Existing valid complete base annotations remain unchanged.
Total: 46 entity matches across 45 distinct row keys, not 46 edited
rows. Prior findings and historical translation totals are not recounted.

### D-21505: Existing Ysa Scope And Missing Genitive

Screened all 76 exact `Gardens of Ysa` lexical row keys (3 base,
73 default; no affix): every key is already covered by terminal
`place:ysa` decisions, including complete named-label contexts.
No separate duplicate Gardens entity or new occurrence was added,
and the screening is not a fresh linguistic disposition of those rows.
The book-title attribution at default:14454 and ambiguous standalone
labels base:3049/default:9150 retain their historical decisions and text;
do not infer new book/location identities from those bare labels.

Corrected only the missing genitive particle at default:53537,
`이사 정원(Gardens of Ysa)` to `이사의 정원(Gardens of Ysa)`.
English, Japanese イーサの庭園 and Chinese 伊萨花园 corroborate the
place reference. This residual textual correction preserves the
D-20727 identity disposition in place: all occurrence keys and status
counts remain unchanged. The row-by-row existing-key screening is in
`proper-name-candidate-screen-D21505.tsv`.

### D-21504: Giran Alba, Beorn And Giran's Journal

Registered `person:giran-alba` as `기란 알바(Giran Alba)` with the
source-attested short form `기란(Giran)`, and `person:beorn` as
`베오른(Beorn)`. Reviewed 38 distinct source keys, covering all three
resource types (no affix matches). Normalized missing Giran annotations
and the mixed 비온/비오른/베른/베오른 spellings. English full labels,
family/quest descriptions, and the mercenary leader's key establish
identity; Japanese and Chinese corroborate rather than dictate spelling.

Registered `unique_item:girans-journal` separately as
`기란의 일지(Giran's Journal)` at base:1188:11. The complete title
remains atomic and its parent personal-name occurrence is excluded:
39 entity matches across 38 row keys, not 39 edited rows. Prior
age-neutral 형제, arrest/future-threat, and hiring/bringing decisions
are untouched. No historical translation tally was recounted.

### D-21502-D-21503: Court Of Enchantments

Registered `organization:court-of-enchantments` as
`마법의 궁정(Court of Enchantments)`. Refreshed source matching found
66 exact keys (base:3083 and 65 default keys), not merely the heuristic
candidate snapshot's 55 IDs. Reviewed them in 50/16-key batches.
English identifies Wencen's court, its membership and its venue;
Japanese 英雄院/祝福の宮殿 and Chinese 附魔廷/魔法廷 corroborate.
Unified source-matched 마법부여 궁정, 마법 궁정, 매혹의 궁정,
마법부여 법정 and 마법의 전당; corrected the singular English annotation
at default:22165. Default:22031's English itself uses the singular
`Court of Enchantment`; this source-attested alias retains its singular
English annotation rather than silently rewriting the source spelling.
This does not merge the court with House of Ballads
or the Summer Court. Other entities and earlier findings remain
untouched; no historical translation tally was recounted.

### D-21501: The Requiem

Registered the named pirate ship `item:the-requiem` as
`레퀴엠호(The Requiem)`, with the source-attested short form `Requiem`.
Reviewed all 27 matching keys across `base` and `default`, including
three excluded lexical collisions: poetic lowercase `requiem` at
default:9763/59459 and the separate `Singer's Requiem` title at
default:62559. The latter is not classified as an ordinary word or
silently merged into the ship. English explicitly identifies the ship
and its owner; Japanese レクイエム号 and Chinese 安魂曲号 corroborate.
Standardized the ship-name span only, retaining source-local full/short
English annotation, unrelated entities, and prior decisions. Adjusted
only the name-adjacent particles required by final-vowel `호`.
No PAK evidence or historical global translation recount was used.

### D-21500: Lowercase `toothpicks` Alias Collision

Corrected one occurrence-index disposition without changing the Korean
cell or adding a source key. English default:17768 uses lowercase
`toothpicks` descriptively for Draug's ceremonial daggers; aligned
Japanese and Chinese likewise describe the ordinary object rather than
writing the named item `Draug's Toothpicks`. The case-insensitive short
alias had caused a false proper-name match. Excluded only
`unique_item:draugs-toothpicks / default:17768`; the Korean text remains
unchanged and the occurrence key remains in the index.

The active occurrence index was backed up byte-for-byte at
`/private/tmp/ko-translate-backups/20261017/before-proper-name-D21500/proper-name-occurrences.tsv`.
Its parsed row order and all fields other than this key's status/evidence
were verified against the backup. No active CSV changed.

### D-21499: Bristletongue

Registered `resource:bristletongue` as `브리슬텅(Bristletongue)`. Reviewed all
25 exact source keys across `base` and `default`,
covering its rare-spice, plant, blossom, seed, and harvest contexts.
English default:53176 identifies the rare spice and harvestable seeds;
default:32839 identifies the bloom, and default:57872 places it in a
guarded garden above the Font. Japanese ブリッスルタング and Chinese
鬃舌草 corroborate. Standardized missing or malformed labels, including
the base `Bristletongue Weed` and `Bristletongue Seeds` compounds and
default:57872's `뻣뻣혀초` mistranslation. Other wording and prior entity
dispositions remain unchanged.

The refreshed heuristic `Craft` candidate was also screened across
31 source IDs / 36 aligned row variants: 13 `Craft Hall`
source IDs (13 variants) are already covered by `place:craft-hall`;
the remaining 18 source IDs (23 variants) are generic crafting actions,
skills, or affix wording. No new entity or Korean edit was made for
`Craft`. Per-row evidence is in
`proper-name-candidate-screen-D21499.tsv`.

### D-21498: Draug’s Toothpicks

Registered `unique_item:draugs-toothpicks` as
`드라우그의 이쑤시개(Draug's Toothpicks)`, with `Toothpicks` as a
short alias only in exact source-matched item references. Reviewed all
27 aligned source keys across `base` and `default`.
English default:17679 identifies the item as a pair of daggers and names
Gunnar Frode as their owner; default:17768 explains the joke as the
legendary troll Draug's ceremonial daggers. Default:40322 independently
confirms the pair-of-daggers description. Japanese ドラウグの爪楊枝 and
Chinese 德拉格的剔牙刀 corroborate. Standardized incomplete, unpaired,
and misspelled Korean labels only in these exact item rows; short
references use `이쑤시개들(Toothpicks)`. Historical translation findings
were not reopened or recounted, and ordinary toothpick wording was not
assigned a global alias.

### D-21497: Silent Choir

Registered `faction:silent-choir` as `침묵의 합창단(Silent Choir)` and
`monster:silent-choir-hound` as
`침묵의 합창단 사냥개(Silent Choir Hound)`. Reviewed
26 faction-name source keys and the complete creature name at
default:7319 (27 entity matches across
26 distinct row keys).
English default:13120 describes the group of faithful followers;
default:40438 explicitly calls them Anokatos's followers, and
default:63143 calls them his disciples. Aligned Japanese
声なき聖歌隊 and Chinese 无声教团 corroborate. Normalized the
source-matched `침묵의 성가대`, `무언의 성가대`, and unannotated forms
only in faction rows, correcting particles where the canonical Korean
name's final consonant required it. The Hound label remains atomic;
ordinary choir references, other entities, and historical findings
were not reopened or recounted.

### D-21496: Khleran and Aergase

Registered `person:khleran` as `클레란(Khleran)` and
`person:aergase` as `에어가스(Aergase)`. Reviewed all 26 exact Khleran
source keys and all 14 Aergase keys against English, aligned Japanese,
Chinese, and current Korean. English identifies Khleran as the Witch
Knight at default:21938; base:767 and base:4447 name his Sceptre and Key,
and default:46078 names his tower. Default:21124 identifies Aergase as
the Lord of the Hunt's Herald, while default:26883 names him in a
body-search objective. Complete role labels remain atomic; no global
short-name or role aliases, historical recount, or unrelated entity
changes were added.

### D-21495: Sinsear

Registered `place:sinsear` as `신시어(Sinsear)` after reviewing all
37 exact source keys across `base` and `default`.
English default:55150 calls it an ancient place in Klurikon and a Hollow;
default:63068 places it in southern Klurikon and identifies it as the
Hollow of the Weeping King. Aligned Japanese シンシアー and Chinese
业火之地 corroborate the same place. The established spelling was applied
only to these exact Sinsear source rows, including correction of
`신세어(Sinsear)`. Other entities and historical totals were not reopened.

### D-21494: Elrod Edman

Registered `person:elrod-edman` as `엘로드 에드먼(Elrod Edman)` from
11 exact English full-name rows. English default:12915 self-identifies
him as the refugee-group leader; default:38932 independently identifies
the same leader and links the same-row short `Elrod` to that full name.
Japanese エルロッド・エドマン and Chinese 艾尔罗德·埃德曼 corroborate.
Six `Texto` cells were corrected; five already had the complete bilingual
form. No global `Elrod` alias or historical translation tally was added.

Three isolated short-name rows remain outside the confirmed entity scope:
default:17625 (`call for Elrod`), default:58835 (`Elrod sent you`), and
default:60791 (bare `Elrod` label). Their separate evidence and the
exact missing identity link are recorded in
`proper-name-residual-review-D21494.tsv`; keep them unresolved until
source-linked speaker/scene, surname, role, or quest evidence is found.
No CSV edit or occurrence decision was made for these three rows.

### D-21447 Candidate Refresh

The regenerated 29,606-phrase scan found two terms beyond the saved snapshot:
`Ever Glen` at default:11821 and `Theater of Fates` at default:54811. Both
already have bilingual labels and exact terminal dispositions; no CSV,
glossary, occurrence record, or historical tally changed. Full discovery
remains incomplete. See `proper-name-candidate-refresh-D21447-20261017.md`.

### D-21415-D-21416: Residual Name Checks

D-21415 screened seven short `Widow` keys (accepted=2, excluded=4,
uncertain=1), changed two cells, and added no occurrence-index record.
D-21416 normalized the two `Halter Ninepins` poem keys to the bilingual full
and short forms. Its exact backup, post-edit hash, ordered-row check, and
inverse-byte verification are in the active checkpoint. Neither batch
recounts historical translation totals; discovery remains incomplete.


## D-21417: Row-Scoped Moondown References

Reviewed 11 exact English short-form `Moondown` keys under the existing
`place:camp-moondown` entry: {"accepted"=>3, "not-an-issue"=>6, "uncertain"=>2}.
Corrected only the three missing Korean bilingual labels. Two isolated
references remain uncertain; six contextual references already used the
canonical bilingual short form. No global `Moondown` alias or historical
translation recount was added. Existing dispositions for other entities
on these rows remain unchanged.


## D-21418: Moondown Hill And Siege

Registered `Moondown Hill` as the separate place `문다운 언덕(Moondown
Hill)` and `The Siege of Moondown` as the named event `문다운 포위전(The
Siege of Moondown)`. Reviewed all three exact source keys and corrected
all three Korean cells, including the existing `무운다운` typo. English
is primary; Japanese and Chinese corroborate the landform and siege.
Neither entry is merged with Camp Moondown, and no bare `Moondown` global
alias was added. No historical translation totals were recounted.


## D-21419: Chernobog

Registered `Chernobog` as `monster:chernobog`, the named legendary
Bolgan champion/beast, based on repeated explicit English descriptions
and corroborating Japanese and Chinese. Reviewed all 27 exact source
keys and added the bilingual name only where missing. Complete
`Chernobog's Eye` and `Chernobog's Offering` item labels remain atomic;
their existing item dispositions and all `monster:bolgan` dispositions
were not reopened. No global alias or historical translation recount
was added.


## D-21420: Heart Of Sibun

Registered the named Warsworn relic `Heart of Sibun` as
`unique_item:heart-of-sibun`. Reviewed all 22 exact source keys and
standardized missing or component-only Korean labels to
`시분의 심장(Heart of Sibun)`. The English-led quest/lore context and
aligned Japanese and Chinese identify the same stolen and recovered
artifact. `Sibun` itself remains unclassified; no alias or separate
deity/person/place entry was inferred. Existing row dispositions and
historical translation totals were not reopened or recounted.


## D-21421: Fomorians

Registered the named people group `Fomorians` as `people:fomorians`,
using `포모리안족(Fomorians)` consistently across all three source keys.
English identifies the group; Japanese 巨人族 and Chinese 佛莫尔 support
the race/name reading. The previous `포모르족` spelling was standardized
only within this new entity scope. Pombero and Mabinogi remain separate;
no individual identity or global alias was inferred. Historical row
dispositions and translation totals were not reopened or recounted.


## D-21422: Selkie Veil

Registered the named Fae relic `Selkie Veil` as
`unique_item:selkie-veil` and reviewed all nine exact source keys.
Standardized the complete item label to `셀키의 베일(Selkie Veil)`;
English quest context identifies the stolen/recovered relic and its
transformation power, with Japanese and Chinese corroboration. This
cross-row evidence resolves the prior isolated-item uncertainty at
`default:39328` for this artifact only. The distinct bare `Selkie` label
at `default:23536` remains uncertain and unregistered; it is not inferred
to be the item, creature, or people group. No historical global tally
was recounted.

### Verified Run D-21391-D-21401

Reviewed 184 distinct CSV rows; corrected 130 Texto cells. Added 182 new
entity/key records and explicitly superseded only four existing short-name
annotation omissions, without duplicate records or historical global recount.
Full inverse CSV reconstruction and exact pre-run index reconstruction pass.
Details: `work/zh_cn/audit/proper-name-resume-validation-D21391-D21401-20261017.md`.
The current block above is operative: next D-21402; continue discovery.
Zero unreviewed indexed keys is not proof that all names have been discovered.

## D-21399: Existing Mixed Full/Short Annotation Follow-Up

Corrected four existing occurrence keys, not four new indexed records:
default:18039 (Pepin), 35537 (Angharad), 50452 and 58690 (Alder).
English explicitly uses both the full and short names in each row.
The complete full-name pairs and other text are protected unchanged;
only the later missing short-name annotations are added. This
supersedes only the earlier annotation omission, not the established
identities or full-name spelling. The manifest retains exact previous
dispositions and evidence. Pepin's earlier not-an-issue becomes
accepted for this concrete omission; the other three remain accepted.
No new glossary or occurrence entry, global alias or historical
translation total is added. Existing reviewed holds are untouched.


## D-21391: Enconeg Row-Scoped Short References

Reviewed 22 newly indexed source keys for the short form `Enconeg` under
the existing `person:enconeg-holn` entity: 20 accepted spelling/annotation
corrections and 2 `not-an-issue`. Standardized the short Korean form to
`엔코네그(Enconeg)`, matching the established full-name stem, with
vowel-final particles. The 9 already-terminal full-name keys were verified as
terminal and not reopened. `base:1269`'s Enconeg-owned ring is retained as
a person reference; its item wording is not registered as an alias. No
global English alias, duplicate person, or historical global tally was
added. Aligned Japanese and Chinese support the same fisherman/quest giver.
Exact source cells and prior dispositions are in
`proper-name-edits-D21391.tsv`.


### Scoped Review And Historical Dispositions

D-21363-D-21370 are new proper-name scopes, not a repeat of the completed
sequential translation review. `previous_status = needs-context` refers
to new entity/row occurrences, not old global row dispositions.
D-21363 explicitly supersedes D-19350's pickaxe rationale at default:27168;
D-21364 supersedes only Seasteel naming at default:23468 (D-18638) and
26549 (D-19311). Preserve historical events and totals without recounting.
See `proper-name-prior-disposition-reconciliation-D21363-D21370-20261017.md`.

### Verified Resumed Chain (D-21284-D-21293)

Reviewed 179 entity/row occurrences in 178 unique CSV row keys; 126 edit
events affect 125 unique cells. Default:53181 has separate person/family
scopes and is counted once for row coverage. Full inverse reconstruction
passed for all CSV bytes, BOM, mixed line endings and target-only Texto
edits. Removing this run's added occurrence/glossary records and restoring
initial snapshots exactly reproduced D-21283's index and glossary hashes,
proving the earlier dispositions/evidence and entries were preserved.
Details: `work/zh_cn/audit/proper-name-resume-validation-D21284-D21293-20261016.md`.
These are focused run counts, not global totals or overall completion.
Continue from the latest verified block above; refresh the source inventory
before new discovery rather than reusing the pre-edit D-21284 inventory.

### Provisional Source Forms and Protected History

D-21289's `source-form:yolvan` covers 19 explicitly scoped keys, and
D-21291's `source-form:gorta` covers only default:10025. Their reviewed
dispositions concern spelling/bilingual annotation, not entity identity.
Those identities remain unresolved separately from the indexed
occurrence-hold count above. Blank entity-level English canonicals and
empty aliases intentionally prevent generic matching for these records;
do not infer global identities or rebuild the authoritative occurrence
ledger from unreviewed candidates. See the two reports for exact scopes.
Default:51702 retains D-19515's accepted canonical Fomorous Hugues spelling;
D-21287 excluded it before editing or counting. Do not reopen it as a new
Hughes annotation discrepancy.

### Dolve Source Form (D-21294)

`default:4738` is now `돌브(Dolve)` in Korean, with the row-local spelling
disposition indexed under `source-form:dolve`. This does not identify or
link the label to Dolve Arne or Dolve Wayle; that identity remains
unresolved. D-21268 preserves the original discovery decision, and
D-21294 records the scoped annotation and verification. See
`named-scope-review-D21294-20261017.md`.
D-21084's Aglir/Senshir dispositions are unchanged.

### Yolvan Matcher Residuals (D-21295-D-21296)

D-21295 and D-21296 reviewed all 55 source-generated `place:yolvan`
substring hits and excluded them from that regional scope only. The prior
source-form, Castle Yolvan, and complete title/item dispositions were
preserved; no CSV text or glossary entity changed. The full source/index
check found 37,190 generated matches, zero missing keys, 489 contextual
extras all backed by exact terminal review evidence, and zero missing
bilingual labels. One documented Crudok idiom remains a non-label.
See `proper-name-source-index-validation-D21296-20261017.md` and the
D-21295/D-21296 batch reports.

Older checkpoint narratives below are historical; the latest verified batch above takes precedence.

Date: 2026-10-15

The latest verified checkpoint in `NEXT-SESSION.md` takes precedence. Each
new batch also maintains this document's marked checkpoint block together
with the four handoff documents. The following
D-20923 narrative is historical, not the active resume point. Recent chain
and residual verification results are recorded separately below.

## Historical D-20923

Latest applied batch: D-20923 (2026-10-15). Next batch: D-20924, continuing
source discovery among unreviewed proper-name candidates. Do not revisit the
18 already-dispositioned uncertain occurrences without new evidence.
Sequential default review through ID 65134 remains complete; this is a
separate English-indexed proper-name discovery and consistency pass.

The active occurrence index contains 26,028 entity/row matches across 660
glossary entities: 17,264 accepted, 7,168 `not-an-issue`, 1,578 excluded,
and 18 uncertain matches across 16 CSV row keys. There are no unreviewed
indexed matches. These are focused index states, not historical global
translation totals.

| Active resource | SHA-256 |
| --- | --- |
| `affix` | `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586` |
| `base` | `ad579e00bae956442e66bd4580e4b0eaa2c52752ddbf76c7768c8a4c22a4d92e` |
| `default` | `e9a841405bb10f2567c81042d777c8e27751707898e7727c3209d5a944463767` |

The last CSV edit was D-20923, default IDs 9675, 25013, 25348, 52422, and
53845. Its byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261015/before-proper-name-D20923/locatexts_zh_cn.koalocatext_default.csv`.
The verifier confirmed five target cells, 65,135 ordered rows, exact target
text, unchanged non-target bytes, BOM, mixed line endings, and inverse
reconstruction.

## Discovery and Residual Results

`audit-proper-name-residual-final.rb` found 26,023 source-generated
occurrences, zero missing index keys, and five documented contextual
Anwon-family extras. The terminal bilingual-label scan reported one
unpaired Crudok hit at default ID 3851; its English line is the idiom
“I'm a Crudok's arse,” while Korean uses the equivalent idiom “내 손에
장을 지지.” It is intentionally not a species-name omission.

D-20829 registered `A Brutal Contract` as a quest title. `default:33054`
now matches the existing `잔혹한 계약(A Brutal Contract)` at
`default:61793`; the discovery and validation gates now recognize `quest`
as a glossary category.

The D-20827 alias expansion adds context-specific English `Sorrow` to
`faction:house-of-sorrows`. All 35 newly matched `Sorrow` rows across
`base` and `default` were dispositioned. Only the parallel Houses of
Sorrow, Pride, and Vengeance references were treated as the faction; generic
grief, magical-force references, personal titles, and item/work titles were
excluded. Three Korean cells were normalized to the established house names.

The two `The Mantle Passes` candidates at `base:2108` and `base:4615` remain
outside the registered occurrence index because Japanese and Chinese support
conflicting meanings and the title category is unknown. No text was changed;
see `named-title-candidate-holds-D20825-20261015.md`.

`proper-name-candidates.tsv` still contains 29,569 heuristic candidates.
They include ordinary words, title fragments, and false positives; this
count is not a verified proper-name backlog. D-20922 established the formal
`Scion` office and D-20923 added the regular plural alias `Scions`, reviewing
six new occurrences and correcting five cells. Overall discovery and
consistency remain incomplete. Do not claim completion or reopen old holds
without new evidence.

## Verification

- `verify-proper-name-full-chain.rb`: PASS, all 531 reviewed edit stages; reconstructed the recorded pre-D-20390 hashes.
- `verify-proper-name-batch-chain.rb 20923 20923`: PASS, five default edits; reconstructed pre-D-20923 hashes.
- `validate-proper-name-data.rb`: PASS, 660 unique entities and 26,028 active-aligned occurrences.
- `audit-proper-name-residual-final.rb`: PASS, zero missing source/index keys; five documented contextual extras; one intentional idiomatic non-label.
- Proper-name cell editor, inventory, occurrence builder, index reconciliation, independent edit rebase, candidate detector, discovery gate, Travelers merge, House-trio, and Barghest qualifier test suites passed.
- No PAK or PAK-derived asset was inspected or modified. Source CSVs remain read-only.

## Recent Batches

- D-20822 corrected the monster residual label guard: 23 edits and one intentional unchanged idiom.
- D-20823-D-20824 registered and reviewed War Cry/Wrath: 12 edits, one `not-an-issue`, and 44 exclusions.
- D-20825 registered two book titles and the named ballad: 40 edits and five already-canonical rows.
- D-20826 reviewed 38 Travelers/Scholia rows: 13 edits, four `not-an-issue`, 18 exclusions, and three retained uncertainties.
- D-20827 reviewed the 35 singular `Sorrow` matches and normalized the three-house list in three cells.
- D-20828 added the bilingual Barghest label while preserving the separate meat-count qualifier.
- D-20829 registered `A Brutal Contract` as a quest title and corrected its one missing bilingual label.
- D-20922 registered `Scion` as the religious office/title; 149 matches were reviewed and 82 cells corrected.
- D-20923 registered plural `Scions`; six new matches were reviewed and five cells corrected.

Each batch has a dated review report, edit addendum, and exact row manifest
under `work/zh_cn/audit/`; the latest verified hashes and next key are in
the current blocks at the top of `NEXT-SESSION.md`, `TRANSLATION_PROGRESS.md`,
the audit README, and the decision register.
