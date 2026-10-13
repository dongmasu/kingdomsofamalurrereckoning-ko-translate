# Korean Translation Progress

- Updated: 2026-10-07
- Work template: Japanese CSVs copied to `work/ja_jp/`; the folder and CSV
  suffix identify the template source only, not the selected shipping locale.
  Preserve their row keys and variants during translation.
- Meaning reference: English (`src/csv/en_us/`).
- Voice/register reference: Japanese (`src/csv/ja_jp/`), especially honorifics,
  casual speech, and character voice.
- Secondary cross-check: Chinese (`src/csv/zh_cn/`).
- The official Korean game manual in `references/manual/` is the terminology
  authority for this setting; reconcile earlier draft variants during the
  consolidated review. Confirmed terms include `Almain` = `알마인`,
  `Varani` = `바라니`, `Ljosalfar` = `료스알브`, `Dokkalfar` = `도크알브`,
  `Fae` = `페이`, `Faelands` = `패란즈`, `Fateweaver` = `페이트위버`,
  `Might` = `힘`, `Finesse` = `재주`, `Health` = `체력`, `Mana` = `마나`,
  `Sagecraft` = `마법물품 제작`, and `Lopoku` = `로포쿠`.
- `src/` is immutable. Russian rows are not a linguistic drafting reference;
  destination compatibility is checked separately before any repack.
- `work/ja_jp/` is a Japanese-derived Korean translation scaffold, not a
  confirmed shipping locale. The target locale remains undecided. Resolve the
  destination-specific `affix` structure before generating binaries.

## Coverage

| Resource | Total work rows | Korean draft coverage | Status |
| --- | ---: | --- | --- |
| `base` | 4,844 | IDs 0-4843 drafted (4,844 rows) | Draft complete |
| `affix` | 3,311 | All IDs 0-585 drafted (3,311 rows) | Draft complete |
| `default` | 65,135 | IDs 0-65134 drafted (65,135 rows) | Draft complete; integrated review pending |

Current checkpoint: all 4,844 `base` rows and 3,311 `affix` rows have Korean
drafts. `default` IDs 0-65134 are drafted and synchronized. The translation
map intentionally covers IDs 100-65134; IDs 0-99 were drafted directly in
the CSV. All three resources now have complete Korean drafts; integrated
linguistic review and in-game verification remain outstanding.

## Latest Batch

`default` IDs 64950-65049 and the final IDs 65050-65134 are synchronized
with the translation map. All 65,135 work keys and their order match the
Japanese source, and the CSV retains its UTF-8 BOM and CRLF record endings.
The weapon-stats help page at 64998 preserves its `LINE` and inline marker
order; the passive skill at 65015 preserves its break and localized marker.
No Japanese kana remain in the work CSVs. Full-range comparison found 34
line-break and 57 marker-order differences before ID 64150; these are
pre-existing, not introduced by these final batches, and require individual
review before repacking. The map and `default` CSV differ at IDs 51421,
51603, and 63500; the CSV was not overwritten. See `audit/open-questions.md`.

`default` IDs 64850-64949 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its
UTF-8 BOM and CRLF record endings. The book excerpt at 64862 retains its
seven source paragraphs and parenthetical byline; the Faehunter verse at
64884 preserves five embedded line breaks. Uncertain terms are recorded in
`audit/open-questions.md`.

`default` IDs 64750-64849 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its
UTF-8 BOM and CRLF record endings. The blocking effect at 64754 and Battle
Frenzy at 64830 retain their respective three-line formats and exact
numbers. Questionable source readings and names are logged in
`audit/open-questions.md`.

`default` IDs 64650-64749 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its
UTF-8 BOM and CRLF record endings. The long Naros travelogue at 64733 retains
its four paragraphs; the longbow effect at 64736 keeps its line break and
values, and the bet variable at 64685 is unchanged. Uncertain terminology
is recorded in `audit/open-questions.md`.

`default` IDs 64550-64649 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its
UTF-8 BOM and CRLF record endings. The multi-speaker account at 64597 keeps
its original paragraph breaks and quotation order; the trap challenge at
64583 retains `{2}`, `{1}/{2}` in order. Questions are recorded in
`audit/open-questions.md`.

`default` IDs 64450-64549 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its
UTF-8 BOM and CRLF record endings. The Chaos Sight tutorial keeps the exact
`{LINE_LEFT}`, `{LINE_SPACE}`, and `{*1...}` marker sequence; the controller
icon and five-line Court poem also retain source layout. The bare `%` at
64532 is a source omission and has not been assigned a number. Questions
are in `audit/open-questions.md`.

`default` IDs 64350-64449 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its UTF-8
BOM and CRLF record endings. The unusually long Varani passage at 64427
retains its single-paragraph structure. Name, title, and source-meaning
uncertainties are logged in `audit/open-questions.md`.

`default` IDs 64250-64349 are synchronized with the translation map. All
65,135 keys remain aligned with Japanese, and the Korean CSV retains its UTF-8
BOM and CRLF record endings. The Belmaid poem and House of Valor chronicle
preserve Japanese-template line breaks; the shield passive retains its inline
marker and paragraph break. English meaning takes priority where Japanese
differs (`Oathblade` at 64258 and `Not my problem` at 64338). Uncertain terms
and contexts are logged in `audit/open-questions.md`.

`default` IDs 64150-64249 are synchronized with the translation map. All
65,135 keys and their order match the Japanese CSV; the Korean CSV retains
its UTF-8 BOM and CRLF record endings. The Midnight Gardens poem retains its
Japanese-template line breaks, and the dodge/block tutorial retains both
controller placeholders and both localized inline markers. English meaning
overrides the misleading Japanese rendering of `no quarter` at ID 64173.
Questions are logged in `audit/open-questions.md`.

`default` IDs 64050-64149 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The potion recipes preserve ingredients, quantities, and blank lines; the
Poison Cloud effect retains its 60%/275 values and line break. Open questions
are in `audit/open-questions.md`.

`default` IDs 63950-64049 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The gem tutorial markup, die result, sprint control, Chaos effect, and poem
retain their structure. Source questions are logged in `audit/open-questions.md`.

`default` IDs 63850-63949 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The Villa deed's paragraph break, `{*1...}`/`{*3...}` markup, and Rathir room
price variable are preserved. Questions are logged in `audit/open-questions.md`.

`default` IDs 63750-63849 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The Basilica entry, Nan and Oleyn poems, and Varani chapter preserve Japanese-
template breaks. The `{3}/{2}/{1}/{4}` variable sequence is preserved.
Questions are logged in `audit/open-questions.md`.

`default` IDs 63650-63749 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The long Erathi letter and ship manifest preserve Japanese-template breaks;
`{LINE_CENTER}` and both localized `{*1...}` marker positions are intact.
Term and source questions are logged in `audit/open-questions.md`.

`default` IDs 63550-63649 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The `{LINE_SPACE}` markers at 63638 are preserved in order. Term, name, and
source-meaning questions are recorded in `audit/open-questions.md`.

`default` IDs 63450-63549 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The two poems, chronicle, and three-line effect preserve Japanese-template
breaks; `$(0)` and all runtime markers remain intact. Questions about names,
terms, and source/reference conflicts are in `audit/open-questions.md`.

`default` IDs 63350-63449 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
ID 63429 follows the Japanese template's zero embedded breaks despite a
standalone terminal period on the English and Chinese lines. The inline
Chaos-core markers at 63443 retain their identities and order. Questions are
in `audit/open-questions.md`.

`default` IDs 63250-63349 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The Keystone chronicle, combat/effect entries, and inline recipe/Chaos Portal
markers preserve Japanese-template breaks and marker order. Terms and source
ambiguities are recorded in `audit/open-questions.md`.

`default` IDs 63150-63249 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The writ, journal, poems, codex record, and effect descriptions preserve
Japanese-template line breaks and runtime-marker structure. Names and lore
questions are in `audit/open-questions.md`.

`default` IDs 63050-63149 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The reagent instructions and multiline journal/codex entries preserve
Japanese-template paragraph breaks. Names, lore, and source ambiguities are
recorded in `audit/open-questions.md`.

`default` IDs 62950-63049 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The eight-line poem at 62966 and reagent-list layout at 63033 match the
Japanese-template lineation; percentage values are preserved. Source-term and
context questions are recorded in `audit/open-questions.md`.

`default` IDs 62850-62949 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
The five-line poem at 62867 matches the Japanese-template lineation, and the
`$SQ62.poison_cost$` variable at 62908 is preserved. Source-term and context
questions are recorded in `audit/open-questions.md`.

`default` IDs 62750-62849 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
All 100 entries preserve Japanese-template line-break counts and runtime
markers. Dialogue register, named locations, character/item terms, and source
wordplay questions are logged in `audit/open-questions.md`.

`default` IDs 62650-62749 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match.
Three Sceptre markers at 62699, the `#NAMED_ICON_360_A#` control at 62602,
and damage/cost values are preserved. Names and terminology questions are
in `audit/open-questions.md`.

`default` IDs 62550-62649 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
long Savant Engar death account at 62597 retains its unbroken source layout;
`#NAMED_ICON_360_A#` and `{*3...}` at 62602/62612 are preserved. Damage
values and Mana costs remain intact. Names and terminology questions are in
`audit/open-questions.md`.

`default` IDs 62450-62549 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match,
except English ID 62537 has three embedded breaks while Japanese has none;
Korean follows the Japanese-derived template. The Almain codex at 62500,
8-line poem at 62491, 5-line verse at 62520, numeric effect at 62472, and
`{1}` marker at 62506 retain their structures and values. Terms and source
questions are in `audit/open-questions.md`.

`default` IDs 62350-62449 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
nested level/line markers at 62389 and passive label plus line break at 62397
are preserved. `#NAMED_ICON_PLUS#` is intact. Names, setting terms, and
source ambiguities are logged in `audit/open-questions.md`.

`default` IDs 62250-62349 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
Embereyes research entry at 62263 and three dated journal entries at 62300
retain their paragraph structure. `{LINE_INDENT}`, `#NAMED_ICON_PLUS#`, and
all `{1}` markers are preserved. Names, setting terms, and source ambiguities
are logged in `audit/open-questions.md`.

`default` IDs 62150-62249 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
four-paragraph Canneroc account at 62222 and alchemy recipe at 62212 retain
their lineation. All three Chakrams tutorial markers at 62165, `$(0)`, `{1}`,
and effect values are preserved. Names, setting terms, and source ambiguities
are logged in `audit/open-questions.md`.

`default` IDs 62050-62149 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
three-paragraph letter and Avery signature at 62070 and nine-sector report at
62132 retain their lineation. `$(0)`, `{1}`, and all effect values/variables
are preserved. Names, setting terms, and source ambiguities are logged in
`audit/open-questions.md`.

`default` IDs 61950-62049 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
four-paragraph letter at 61977, its closing/signature, and the four-line
effect description at 62038 retain their lineation and markers. Values,
variables, and the `‒ Reddle Mane` signature are preserved. Setting terms,
names, and source ambiguities are logged in `audit/open-questions.md`.

`default` IDs 61850-61949 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
Japanese-template line breaks and runtime-marker identities/order match. The
two-line threat at 61854 and two-line hammer modifiers at 61871 retain their
lineation. Hierophant, Authority, Sorrows, Pledgeshield, and several names or
lore details remain provisional and are logged in `audit/open-questions.md`.

`default` IDs 60450-60549 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
English/Japanese line breaks and Japanese-template runtime-marker identities/
order are preserved. The four-paragraph battle journal, `{1}`/`{2}` timed
record, +6 physical/+20% Chakram modifiers, and raw `Failed To Link Loc` text
remain intact. Terminology questions are in `audit/open-questions.md`.

`default` IDs 60350-60449 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
English/Japanese line breaks and Japanese-template runtime-marker identities/
order match, including the letter and Bayala Tirin poem. The +3 physical and
+10% Chakram modifiers are preserved. Terminology and context questions are
in `audit/open-questions.md`.

`default` IDs 60250-60349 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs; the Korean CSV retains its UTF-8 BOM and CRLF record endings.
English/Japanese line breaks and Japanese-template runtime-marker identities/
order are preserved. The `#NAMED_ICON_GOLD#` marker, 6% stun chance, Rat-tail
quantity, combat dialogue, and item/quest labels remain represented.
Terminology and lore questions are in `audit/open-questions.md`.

`default` IDs 60150-60249 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF record endings. All
100 entries preserve English/Japanese line breaks and Japanese-template
runtime-marker identities/order. The multi-paragraph Gravehal journal retains
its structure; the 7/18-trap counts, 5-meter radius, 130 damage, 80/120 Mana,
and 12-Rat-tail requirement are preserved. Terminology and lore questions are
in `audit/open-questions.md`.

`default` IDs 60050-60149 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF record endings. All
100 entries preserve English/Japanese line breaks and Japanese-template
runtime-marker identities/order, including the 12-paragraph Scholia Arcana
history. Combat damage, Mana costs, the temporary +1 skill value, and the
`#NAMED_ICON_GRAY_360_X#` token are retained. The Chinese-only extra paragraph
break in 60101 and terminology/context questions are logged in
`audit/open-questions.md`.

`default` IDs 59950-60049 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF record endings. All
100 entries preserve source line breaks and the Japanese-template runtime
marker identities/order, including nested markers and the multiline diary,
poem, and ability descriptions. Numeric effect values, variable identities,
and the `-D` memo signature are retained. Source-localized variable-order
differences and unresolved terminology are recorded in
`audit/open-questions.md`.

`default` IDs 59850-59949 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF record endings. All
100 entries preserve source line breaks and runtime-token sequences, including
the two blank-line-separated paragraphs in the Giant Killers notice (59903).
The Ysa title-cost variable, +15% modifier, 40%/40% Storm Bolt effects, and
one-to-thirty ore/refuse ratio remain intact. Names, the Sorrows reference,
quest context, and lore ambiguities are recorded in `audit/open-questions.md`.

`default` IDs 59750-59849 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences, including
the six-line warning poem at 59760. The recipe's two-meat quantity, 10 Bolgan
eyes, glyph-order instruction, antelope-race payout rule, and quest/UI strings
are retained. Names, rank labels, item terms, and source discrepancies are in
`audit/open-questions.md`.

`default` IDs 59650-59749 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences, including
the 10-line `PART VI` document (59722) and nine-line observation lesson
(59745). The ten Bolgan eyes, 30 damage/40%/5-second Frost Trap, +10% Chaos
resistance, `{*1Comet Strike}`/`{*1Whirlwind}`/`{*1Minotaur Rush}` identities,
large-trade variable/icon, and five-hit dagger combo remain represented.
Terminology and source-context questions are in `audit/open-questions.md`.

`default` IDs 59550-59649 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences, including
the two-line journal at 59604 and 12-line poem at 59611. Frost Trap's +30
damage, 40% stun chance/5 seconds, +10% Chaos resistance, Sagecraft level 3,
`{*1[Upgrade]}`, `$DLC1_Diplomacy.trade_cost_small$`, and
`#NAMED_ICON_GOLD#` are retained. Names, item/faction terminology, and lore
questions are in `audit/open-questions.md`.

`default` IDs 59450-59549 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences. The five-line
Sidhe poem (59459), five-line resistance recipe (59460), 30-line seasonal
farming guide (59501), and two-line Storm Bolt tutorial (59527) match source
lineation. `+10%`, `+25%`, reagent quantities, `#NAMED_ICON...` markers in
other ranges, `{*1options}`, `{*1[Upgrade]}`, and `$TR_Shell.minn_wager$` are
preserved. Lore, plant names, item/rank terminology, and source-context
questions are in `audit/open-questions.md`.

`default` IDs 59350-59449 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences. The five-line
letter at 59420 retains its blank lines and signature; +5% Damage, +25%
Armor, the 3-fish recipe count, three lost miners, and the 30-year threat are
preserved. Names, lore, source typos, and context questions are in
`audit/open-questions.md`.

`default` IDs 59250-59349 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences; +20% Block
Efficacy and the 30-year threat remain intact. Terminology and context
questions for names, faction ranks, quest locations, jokes, and item/skill
labels are in `audit/open-questions.md`.

`default` IDs 59150-59249 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences, including
`#NAMED_ICON_STEALTH_EYE#`, the displayed `%` chance, and the 18% Reflection
chance. The quantity/color conditions in the thumos painting quest and
punctuation pauses in the poisoned speaker's line are retained. Names, lore,
skill/item terminology, and source-context questions are in
`audit/open-questions.md`.

`default` IDs 59050-59149 are synchronized with the translation map. All
65,135 keys and their order match across the English, Japanese, Chinese, and
Korean CSVs. The Korean CSV retains its UTF-8 BOM and CRLF records. All 100
entries preserve source line counts and runtime-marker sequences, including
the 12-line Erathi quotation at 59100, `{*1fate}`, `{LINE_SPACE}`, `{1}`,
`{2}`, `{*1reckoning mode}`, `$M0_SQ06.dagger_cost$`, `{3}%`, `{1}`, `{5}`,
`+20%`, and both lorestone markers. Terminology, source-language disagreement,
the deliberately incomplete journal quote, and wordplay questions are in
`audit/open-questions.md`.

`default` IDs 58950-59049 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
`{*1Balor}`, `{*1claws}`, and `{*1dodging}` marker identities/order and 10%
movement proc at 59032-59033 are preserved. `Hunter1` at 58963 is rendered as
`사냥꾼 1`, preserving its index. Key, token, and explicit-number checks passed.
Open names, lore, and source-context questions are in
`audit/open-questions.md`.

`default` IDs 58850-58949 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
five-line agreement notice at 58806, 13-line poem at 58929, three-part Ethene
account at 58934, and recipe at 58914 retain their source line breaks.
`{1}`, `{LINE_SPACE}`, `{LINE_LEFT}`, all `{*1...}` marker identities/order,
the `$DLC2_SQ09.key_cost$` variable, 15%, 20, 250 Gold, and other explicit
values are preserved. Key, line-break, token, and numeric checks passed.
Lore, proper-name, and source-context questions are in
`audit/open-questions.md`.

`default` IDs 58750-58849 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
four-line agreement at 58806, seven-line Ouranos poem at 58819, and two-line
combat descriptions at 58781/58801 retain their source breaks. All variables,
controller icons, and explicit numeric values are preserved. Source-spelled
`ten years` and `eight-hundred` are rendered as `10년` and `800통`. Key,
line-break, marker, and explicit-number checks passed. Terminology and lore
questions are in `audit/open-questions.md`.

`default` IDs 58650-58749 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
six-line Rattlesnake/Desert Runner tale at 58664 and five-line creation verse
at 58716 retain their source breaks. `{LINE_SPACE}`, `{1}`, `{2}`, both
`{*1...}` markers, named UI icons, +60% stun damage, and +5% Physical Damage
are preserved. The spelled ordinal `second` at 58713 is rendered as `2층`.
Key, line-break, marker, and explicit-number checks passed. Lore and source
context questions are in `audit/open-questions.md`.

`default` IDs 58550-58649 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
59-line Halter/ Widow poem at 58563, five-line recipe at 58576, seven-line
Mairu hymn at 58599, four-line king's verse at 58630, and two-line modifiers
at 58644 retain their source line breaks. `{LINE_SPACE}`, +5% resistance,
20%/175 Poison values, and +17/+30% Greatsword modifiers are preserved. The
source words `first` and `number one` at 58557 are rendered as `제1회` and
`1위`. Key, line-break, marker, and source-digit checks passed. Lore, names,
and source-context questions are in `audit/open-questions.md`.

`default` IDs 58450-58549 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
letter at 58499, two-line skill entries at 58507 and 58514, and their source
line breaks are preserved. `{1}`-`{9}`, the `{*1[...]}` marker identity,
20%/175 poison values, and +5% Health are retained. Key, line-break, token,
and numeric checks passed. Register, terminology, and source-meaning questions
are listed in `audit/open-questions.md`.

`default` IDs 58350-58449 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
two-line staff modifiers at 58387, eight-line Ahnrun poem at 58403, and
five-line choice verse at 58419 preserve their source line breaks. The
`$VMC_NQD.cost_mine$` variable, +14 physical damage, and +30% staff damage are
preserved. Key, line-break, runtime-token, and numeric checks passed. Questions
about proper names, the Burn, tournament tradition, and difficult source verse
are recorded in `audit/open-questions.md`.

`default` IDs 58250-58349 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
signature block at 58298 and five-line Galafor poem at 58344 retain their
source line breaks. `{3}`, `{1}`, and `{2}` remain in source order at 58326;
the 75% resistance value, fifteen-gland quantity, Roman numeral `VIII`, and
dialogue/icon tokens are preserved. Key, line-break, marker, and numeric
checks passed. Open lore and source-phrase questions are in
`audit/open-questions.md`.

`default` IDs 58150-58249 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
Widow refrain at 58156 preserves both source line breaks. `Twists of Fate`
and `Great Cycle` follow the existing draft terms `운명의 굴곡` and
`대순환`; the gold variable, controller icon, and `{1}` marker are unchanged.
Key, line-break, marker, and numeric checks passed. Open naming and context
questions are in `audit/open-questions.md`.

`default` IDs 58050-58149 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
critical-potion recipe at 58072 retains all five source line breaks and
quantities; the two-line Longsword modifiers at 58084 and five-line palace
account at 58103 preserve layout. `{*1...}` and `{1}` at 58131 and the +5%
Fire Resistance value at 58141 are preserved. Key, line-break, marker, and
numeric checks passed. Open lore/name questions are in
`audit/open-questions.md`.

`default` IDs 57950-58049 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
critical-hit potion at 57973 and Burn potion at 58010 retain their source
blank lines and ingredient quantities. The gold variable/icon at 57982, all
combat and crafting values, and the Roman numeral `XXII` at 58011 are
preserved. The `Delver` role uses the established draft form `델버`. Key,
line-break, marker, and numeric checks passed. Open terms and lore are in
`audit/open-questions.md`.

`default` IDs 57850-57949 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
15-line fortune account at 57861, three-line poem at 57851, and four-paragraph
book excerpt at 57932 retain their source lineation. `{LINE_CENTER}` and the
`$DLC1_Diplomacy.trade_cost_large$ #NAMED_ICON_GOLD#` tokens remain unchanged;
40-66 damage, 16 Mana, and the 25% value are preserved. Key, line-break,
marker, and numeric checks passed. Open names and lore questions are in
`audit/open-questions.md`.

`default` IDs 57750-57849 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
three-line potion recipe at 57824 and long maintenance request at 57849 retain
their source line breaks. `{1}`, `{*1...}`, `{LINE_SPACE}`, `{2}`, and
`$NQD_City_Ysa.title_cost$` are preserved in source order; modifier and recipe
quantities also match. Key, line-break, marker, and numeric checks passed.
Open names and context questions are in `audit/open-questions.md`.

`default` IDs 57650-57749 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
paragraph structure of the Cipher account at 57662 and political letter at
57728 remains intact. `{1}`, `{*1...}`, `{LINE_SPACE}`, and `{2}` at 57708
remain in source order; +24%, the year 1489, and the spelled-out “twenty
years” quantity are preserved. Key, line-break, marker, and numeric checks
passed. Context, name, and lore questions are in `audit/open-questions.md`.

`default` IDs 57550-57649 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 data rows and matching
key order, and the Korean CSV retains its UTF-8 BOM and CRLF records. The
three-line Tuatha account at 57585, blank-line-separated recipe at 57608, and
four-line block-effect description at 57626 retain their source line breaks.
The `{*1...}` marker identities/order at 57551, signed `+20%` modifier at
57599, and all recipe quantities and +40% values are preserved. Key, line-break,
marker, and signed-number checks passed. Open names, terms, and source-context
questions are in `audit/open-questions.md`.

`default` IDs 57450-57549 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The 20-second/50-Mana effect
at 57467 and all seven paragraph breaks in the Rundamir journal at 57507 are
preserved. Key, line-break, and marker checks passed. Open terms and lore are
in `audit/open-questions.md`.

`default` IDs 57350-57449 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The Chaos Sight tutorial
markers and button token at 57380, availability marker at 57418, and dated
journal line breaks remain intact. Key, line-break, and marker checks passed.
Open terminology and narrative questions are in `audit/open-questions.md`.

`default` IDs 57250-57349 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The damage/cost values and
line break at 57272, tutorial markers at 57289, and dated journal paragraphs
at 57331 retain source structure. Key, line-break, and marker checks passed.
Open terminology questions are in `audit/open-questions.md`.

`default` IDs 57150-57249 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. `{1}` in the completed-set
label at 57158 is preserved. Key, line-break, and marker checks passed.
Faction, lore, and source-context questions are recorded in
`audit/open-questions.md`.

`default` IDs 57050-57149 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The four-line Wolds poem at
57093 and `{1}` at 57110 retain their source layout/marker; line-break, token,
and key checks passed. Questions on lore, item terms, and source wording are
recorded in `audit/open-questions.md`.

`default` IDs 56950-57049 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The recipe at 56962, Wolds
verse at 56977, and Ohn poem at 57013 retain their source line breaks and
quantities. `{1}` at 57003 and all marker, line-break, and key checks passed.
Ambiguities are listed in `audit/open-questions.md`.

`default` IDs 56850-56949 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The five-line creation verse
at 56878 and multi-voice passage at 56880 retain their source line/paragraph
breaks. `{1}` at 56910 and all marker, line-break, and key checks passed.
Terminology and source-context questions are in `audit/open-questions.md`.

`default` IDs 56750-56849 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The House of Ballads poem at
56810 and weapon-stat lines at 56811 retain source line breaks and values;
`{1}`, `{2}`, and `{3}` at 56824 are unchanged. Batch line-break and marker
checks passed. Context and lore questions are in `audit/open-questions.md`.

`default` IDs 56650-56749 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The quest UI markers at 56687,
`{1}`/`{2}` at 56730, and the +3/+10% dagger values and line break at 56714
are preserved. Batch line-break and marker checks passed. Open terms and
source-context questions are in `audit/open-questions.md`.

`default` IDs 56550-56649 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The long poems at 56581 and
56586 and recipe at 56554 retain source line breaks and quantities. Runtime
markers and their order were checked; a missing Fate Meter marker at 56618
was restored before validation passed. Open terminology and source questions
are in `audit/open-questions.md`.

`default` IDs 56450-56549 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The five-paragraph Shardfall
report at 56450 and recipe layout at 56536 retain their source line breaks.
Batch line-break and marker checks passed. Source ambiguities and terminology
questions are recorded in `audit/open-questions.md`.

`default` IDs 56350-56449 are synchronized with the translation map. All 100
keys are present; the four language CSVs retain 65,135 rows and matching key
order, and the Korean CSV retains its UTF-8 BOM. The 15%/10-damage/5-second/
25%-Mana values at 56418 and `{1}: {2}` at 56372 are preserved. Batch
line-break and marker checks passed. The sewer wording conflict at 56405 and
uncertain names, titles, and lore are recorded in `audit/open-questions.md`.

`default` IDs 56250-56349 are synchronized with the translation map. The
creation account at 56251 and discharge certificate at 56262 retain their
source line breaks; UI markers at 56271 and ability markers at 56292 remain in
source order. All 100 keys are present, the four language CSVs retain 65,135
rows and matching key order, and the Korean CSV retains its UTF-8 BOM and
CRLF record endings. Batch line-break and marker checks passed. Ambiguous
creation wording, item/faction names, wordplay, and lore are recorded in
`audit/open-questions.md`.

`default` IDs 55450-55549 are synchronized with the translation map. All 100
keys are present; the four CSVs retain 65,135 rows, matching key order, UTF-8
BOM, and CRLF. Source line breaks and runtime tokens were checked. ID 55473's
three `{*1...}` markers were restored after validation found they had been
omitted; ID 55525's source word “one” is rendered as the equivalent numeral
`1`. The rogue/outlaw meaning at 55470 and the religious imagery at 55480 are
recorded for consolidated review.

`default` IDs 55550-55649 are synchronized with the translation map. The
four-stanza creation account at 55566 and paragraph/verse layout of the long
entry at 55594 retain their source line breaks; all `{*1...}` marker
identities/order, the 15%/50-damage/5-second/25%-Mana values at 55602, and the
five Windstones at 55632 are preserved in source order. All 100 keys are
present; the four CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and
CRLF. Line-break, token, and numeric checks passed. Open terminology and
context questions are in `audit/open-questions.md`.

`default` IDs 55650-55749 are synchronized with the translation map. The
long Edorias biography at 55746 retains its five source paragraphs; `{*2...}`
and `{LINE_SPACE}` at 55661 and `$HP02.bribe_value$` at 55662 are preserved.
The +1 bonus and first-two-tier scope at 55683 are retained. All 100 keys are
present; the four CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and
CRLF. Line-break, token, and numeric checks passed. Names, titles, lore, and
source ambiguities are in `audit/open-questions.md`.

`default` IDs 55750-55849 are synchronized with the translation map. The
six-paragraph Ouranos history at 55823 retains its source paragraph breaks;
`{1}`/`{2}` order in the Lorestone counter at 55780 is preserved. All 100
keys are present; the four CSVs retain 65,135 rows, matching key order, UTF-8
BOM, and CRLF. Line-break, token, and numeric checks passed. The source word
“five” at 55770 is rendered as the equivalent `5`; open lore and terminology
questions are in `audit/open-questions.md`.

`default` IDs 55850-55949 are synchronized with the translation map. The
three quoted sections at 55855 retain all seven source line breaks; the
`{*1...}` marker identities/order at 55878 are preserved. All 100 keys are
present; the four CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and
CRLF. Line-break, token, and numeric checks passed. Ambiguous source wording
and lore/naming questions are in `audit/open-questions.md`.

`default` IDs 55950-56049 are synchronized with the translation map. The
poem and epigraph at 55953 retain all 55 source line breaks; the two-line
modifier at 55951 and `{*1[Passive]}` plus description at 55991 preserve their
source layouts and marker identity. All 100 keys are present; the four CSVs
retain 65,135 rows, matching key order, UTF-8 BOM, and CRLF. Line-break,
token, and numeric checks passed. Context and terminology questions are in
`audit/open-questions.md`.

`default` IDs 56050-56149 are synchronized with the translation map. The
five-paragraph Dead Kel record at 56110 retains its source paragraph breaks;
crafting/race markers at 56074 and 56106, recipe markers at 56094, the passive
marker at 56091, and the 9/30/6/45 damage-cost values at 56101 are preserved.
All 100 keys are present; the four CSVs retain 65,135 rows, matching key
order, UTF-8 BOM, and CRLF. Line-break, token, and numeric checks passed.
Terminology and lore questions are in `audit/open-questions.md`.

`default` IDs 56150-56249 are synchronized with the translation map. The
four-line verse at 56157 retains its three source line breaks; `{1}` at 56153
and the 10% experience value at 56168 are preserved. All 100 keys are present;
the four CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and CRLF.
Line-break, token, and numeric checks passed. Open terminology and context
items are recorded in `audit/open-questions.md`.

`default` IDs 54350-54449 are synchronized with the translation map. The
four-paragraph letter at 54362 and payment record at 54405 retain their blank
lines; the 30%/10-second/25-Mana effect at 54410 and `$TR_Shell.minn_wager$`
at 54442 are preserved. Numeric values and all control tokens match, including
the one-gem/one-item/4,000-gold quantities in the payment record. The CSV
retains 65,135 rows, matching full key order, UTF-8 BOM, and CRLF; batch
line-break, empty-row, token, and key checks passed. Name, lore, title, and
source-language discrepancies are logged in `audit/open-questions.md`.

`default` IDs 54450-54549 are synchronized with the translation map. The
letter at 54490 retains its opening/closing fragments and paragraph divisions;
the four dated entries at 54495 and five-line passage at 54541 preserve their
source lineation. Chakram modifiers `+8` and `+25%` remain on separate lines.
All 100 keys are present, full key order, 65,135 rows, UTF-8 BOM, and CRLF are
unchanged, and line-break, empty-row, numeric, and control-token checks passed.
Uncertain terms and lore/name questions are in `audit/open-questions.md`.

`default` IDs 54550-54649 are synchronized with the translation map. The
four dated entries at 54560, three-part quotation at 54562, six-line poem at
54601, four-paragraph letter at 54620, and Primos oath at 54628 preserve their
source lineation. `{1}` at 54568, the 3-cast chain, `x 200`, and 120 Physical
Damage are retained. Date components use Korean order, and the spelled card
value “five” at 54606 is rendered as `5`. All 100 keys are present; full key
order, 65,135 rows, UTF-8 BOM, and CRLF are unchanged. Line-break, empty-row,
and control-token checks passed. Lore, name, cipher, and terminology questions
are in `audit/open-questions.md`.

`default` IDs 54650-54749 are synchronized with the translation map. The
`{*1...}` marker identities/order and `{1}` at 54662 remain unchanged;
`+30%` at 54689 and the 10-stack limit at 54720 are preserved. The spoken
number sequence at 54736 is localized as `20, 30, 33... 33.5`. All 100 keys
are present, full key order, 65,135 rows, UTF-8 BOM, and CRLF remain intact.
Line-break, empty-row, and marker-identity/order checks passed. Ambiguous
terms and source fragments are in `audit/open-questions.md`.

`default` IDs 54750-54849 are synchronized with the translation map. The
source phrase “second part” at 54764 is rendered `제2부`; quantities, markers,
and source line breaks are preserved. All 100 keys are present and the CSV
retains its 65,135 rows, key order, UTF-8 BOM, and CRLF record endings.

`default` IDs 54850-54949 are synchronized with the translation map. The
`{*1...}` merchant/trade labels, `{LINE_SPACE}`, `{1}`, and `{2}` at 54891
remain in source order; +15% piercing damage and the 16%/220 bonus-damage
values are unchanged. The English northward direction at 54901 is followed
despite the Chinese eastward discrepancy. All 100 keys are present, with
source key order, row count, UTF-8 BOM, and CRLF preserved; line-break,
empty-row, numeric, and token checks passed. Open terminology and context
questions are recorded in `audit/open-questions.md`.

`default` IDs 54950-55049 are synchronized with the translation map. The
four-line poem at 54993 retains its lineation; `{LINE_BULLET}{1}` at 54963,
the bribe and ring-cost variables at 54988 and 55021, and `{1}` at 54999 are
preserved. The 16% chance/220 bonus damage values are unchanged. All 100 keys
are present, and the four CSVs retain 65,135 rows, matching key order, UTF-8
BOM, and CRLF; line-break, empty-row, numeric, and token checks passed.
Terminology and context questions are in `audit/open-questions.md`.

`default` IDs 55050-55149 are synchronized with the translation map. The
eight-line Oleyn verse at 55060, six-line Dara poem at 55103, and two-line
Chakram modifier at 55080 retain their source layouts. `$SQ151.bribe_value$`,
`$M0_SQ06.ring_cost$`, `#NAMED_ICON_PS3_SQUARE#`, and
`#NAMED_ICON_360_LT#` are preserved; the 5-meat quantity is unchanged. All
100 keys are present, and the four CSVs retain 65,135 rows, matching key order,
UTF-8 BOM, and CRLF; line-break, empty-row, numeric, and token checks passed.
Terminology and context questions are in `audit/open-questions.md`.

`default` IDs 55150-55249 are synchronized with the translation map. The
two-stanza Winter Heroes poem at 55208 retains its stanza break; Irena's
six-paragraph review at 55197 retains its five source line breaks, and the
long Eye of Amman entry at 55176 remains one paragraph. `{1}` at 55184 and
`$(0)` at 55232 are unchanged; +6% Lightning Resistance and the card value
three are preserved. All 100 keys are present; the four CSVs retain 65,135
rows, matching key order, UTF-8 BOM, and CRLF. Line-break, empty-row, token,
and numeric-meaning checks passed.

`default` IDs 55250-55349 are synchronized with the translation map. The
Blacksmithing tutorial's `{LINE_LEFT}`, `{LINE_SPACE}`, and `{*2...}`/
`{*3...}` heading markers at 55251 retain their identities and order;
`{1}` at 55273 is unchanged. The tutorial remains one source record, with
all other line breaks, quantities, and numeric values preserved. All 100
keys are present, and the four CSVs retain 65,135 rows, matching key order,
UTF-8 BOM, and CRLF; token, line-break, empty-row, and numeric checks passed.

`default` IDs 55350-55449 are synchronized with the translation map. The
four-line effect at 55360 retains all `LINE_BULLET` markers and the source
order of 60%, 25%, 20%, 60%, 10 seconds, and 300 seconds. The two-paragraph
journal entry and separate signature at 55444 retain their paragraph breaks.
All 100 keys are present; all four CSVs retain 65,135 rows, matching key
order, UTF-8 BOM, and CRLF. Token, line-break, empty-row, and numeric-order
checks passed.

`default` IDs 54250-54349 are synchronized with the translation map. The
quoted maxim at 54254 and quotation at 54315 retain their wording; `{1}/{2}`
and the line break at 54337 remain in source order. +1 Mercantile and +10%
critical-hit modifiers are preserved. All four CSVs retain 65,135 rows,
matching key order, UTF-8 BOM, and CRLF; the batch passed token and line-break
validation. Lore, terminology, and reference-language conflicts are in the
audit.

`default` IDs 54150-54249 are synchronized with the translation map. The
three-line defense description at 54160 retains 14/29/29 values. ID 54156 is
blank in all four language CSVs and remains blank. `+30%` propagation and
Storm Bolt damage, `+20%` resistance, and the source modifier values are
preserved. The four CSVs retain 65,135 rows, ordered keys, UTF-8 BOM, and CRLF;
the range passed marker and line-break validation. English spelled-out
durations “ten” and “seven” are rendered as equivalent Korean numerals; lore,
name, and fragment questions remain in the audit.

`default` IDs 54050-54149 are synchronized with the translation map. The
eight-line Fenian poem at 54054 preserves its stanza break; the repeated
Fateweaving entry at 54075 retains all four `{*1}` markers and `{1}` in source
order. `$STR0 $STR1`, `{*3Ice}`, `{3}% {1}% {2}`, the three-year duration,
and other source values are preserved. All four CSVs keep 65,135 rows,
matching keys, UTF-8 BOM, and CRLF. The range passed key, marker, and
line-break validation. Names, poem wording, and UI terms remain listed in the
audit.

`default` IDs 53950-54049 are synchronized with the translation map. The
nine-line village account at 54015, eight-line Ulfsten verse at 54026, and
eight-line Draug verse at 54048 preserve source lineation. `{*1}` markers,
`{LINE_SPACE}`, `{1}`-`{3}`, +30/+75%, 20%/120/5 seconds, +3 skill, and 3/4/80
combat values are retained. All four CSVs keep 65,135 rows, ordered keys,
UTF-8 BOM, and CRLF record endings. The range passed key, token, and line-break
validation. The translation map and audits record uncertain terms and source
context.

`default` IDs 53850-53949 are synchronized with the translation map. The
ten-line ballad at 53880 and four-line Winter lament at 53944 preserve source
lineation. `{*1}` labels, `{LINE_SPACE}`, and `{1}` at 53885/53909/53913
retain marker identity/order; +20%, +5%, 20%/120/5 seconds, and 4/80 orb
values are preserved. All four CSVs retain 65,135 rows, matching key order,
UTF-8 BOM, and CRLF record endings. The range passed key, marker, and line
break validation. Lore/name and metaphor questions are in
`audit/open-questions.md`.

`default` IDs 53750-53849 are synchronized with the translation map. The
quest journal at 53759, faction dialogue at 53800, and item/quest descriptions
at 53811/53819/53840 retain their meaning and identifiers. `{*1Arrow Storm}`
retains its marker identity and +20% value. All four CSVs retain 65,135 rows,
matching key order, UTF-8 BOM, and CRLF record endings. The full 53650-53849
range passed key, marker, and line-break validation. Uncertain titles, lore,
and the metaphors at 53782/53783 are recorded in `audit/open-questions.md`.

`default` IDs 53650-53749 are synchronized with the translation map. The
report at 53656, historical poems at 53671/53682, recipe at 53710, and letter
at 53736 retain source line breaks. `{*3Lightning}` and `{1}% {2}` retain
their marker identities/order; recipe counts 2/1 and amphora count 2/3 are
preserved. All four CSVs retain 65,135 rows, matching key order, UTF-8 BOM,
and CRLF record endings. Keys, markers, line breaks, and numeric values passed
structural validation; spelled-out English quantities rendered as Korean
ordinals/cardinals are semantically equivalent. Uncertain names, the referent
at 53697, and lore/context questions are in `audit/open-questions.md`.

`default` IDs 53550-53649 are synchronized with the translation map. The
five-line poem at 53555, three-line material list at 53574, and long crime
guide at 53582 preserve source layout. `{3}/{1}/{2}/{4}` at 53569, guide
control-marker order, and numeric values match. Keys/order, tokens, line
breaks, and numbers passed validation. Lore/name conflicts and unclear
phrasing are in `audit/open-questions.md`.

`default` IDs 53450-53549 are synchronized with the translation map. The
four-line effect at 53478 preserves 110/40%/5/24/35 in source order; style
tokens at 53487 and 53542, and their line breaks, are unchanged. Keys/order,
tokens, line breaks, and numbers passed validation. Name conflicts and setting
terminology are recorded in `audit/open-questions.md`.

`default` IDs 53350-53449 are synchronized with the translation map. Marker
`#NAMED_ICON_360_Y#`, the localized `*1` heading, `$STR0 $STR1 $STR2`, and
`{1}/{2}` at 53439 are preserved. The 10-year interval at 53382 is unchanged.
Keys/order, marker identities/order, line breaks, and other numeric values
passed validation. Context and terminology questions are in
`audit/open-questions.md`.

`default` IDs 53250-53349 are synchronized with the translation map. The
ability modifiers at 53280 and variables `{2}/{1}/{2}` at 53282 are unchanged.
The eight-line Warsworn verse at 53295 and five-line account at 53321 retain
their source lineation. Row keys/order, tokens, line breaks, and numbers passed
validation with no mismatches. Ambiguous lore terms and names are in
`audit/open-questions.md`.

`default` IDs 53150-53249 are synchronized with the translation map. The
five-line lore passage at 53150 and nine-break statistical report at 53175
retain their source lineation. `{3}`, `{1}`, `{2}`, `{4}` at 53154 and the
ordered repair markers at 53248 are preserved. Keys/order, control tokens, and
line breaks passed validation. The report's spelled year range and `second
floor` are rendered as `248/249년` and `2층`; remaining values match. Uncertain
lore and phrasing are in `audit/open-questions.md`.

`default` IDs 53050-53149 are synchronized with the translation map. The
long order at 53146 retains its blank line and signature; the 75% ice modifier
at 53056 is unchanged. Row keys/order, control tokens, and source line breaks
passed validation. At 53065, `second floor` is localized as `2층`, preserving
the same ordinal. Names, roles, and lore questions are recorded in
`audit/open-questions.md`.

`default` IDs 52950-53049 are synchronized with the translation map. The
52956 guide retains control-marker order, including localized `*2` labels;
52964 keeps its two material lines, and 53008 retains the long report as one
source paragraph. Keys/order, control tokens, line breaks, and numeric values
passed validation with no mismatches. Ambiguous names and context are in
`audit/open-questions.md`.

`default` IDs 52850-52949 are synchronized with the translation map.
`{1}` at 52852 and all source numeric values, including 50% at 52929, are
preserved. The single trailing backslash in the `Foes' Hearth\` string at
52900 also matches the source. Keys/order, tokens, line breaks, and numbers
passed validation with no mismatches. Lore names and context-dependent lines
are logged in `audit/open-questions.md`.

`default` IDs 52750-52849 are synchronized with the translation map. The
fast-travel token `{1}` at 52762, 50% ice-resistance modifier at 52829, and
source line breaks are preserved. Keys/order, tokens, line breaks, and numeric
values passed validation with no mismatches. Names, setting terms, and
context-dependent source phrasing are logged in `audit/open-questions.md`.

`default` IDs 52650-52749 are synchronized with the translation map. The
recipe at 52676 and ability description at 52707 preserve their values and
source line breaks; `{LINE_CENTER}{1}` at 52722 is unchanged. The long Forum
letter at 52739 retains its paragraph and signature layout. Row keys/order,
control tokens, line breaks, and numeric values passed validation. `10 years`
and `Thirty-Ninth` are rendered as `10년` and `제39일`, respectively. Open
questions are in `audit/open-questions.md`.

`default` IDs 52550-52649 are synchronized with the translation map. The
16-line prayer at 52580 and the multi-paragraph letter at 52634 retain their
source lineation. The recipe at 52608 preserves reagent quantities and order,
and the `#NAMED_ICON_360_LB#` marker at 52628 is unchanged. IDs 52450-52649
were checked against English for row keys/order, control tokens, line breaks,
and numeric values; no mismatches were found. Japanese register and Chinese
supporting evidence were consulted. Unresolved terms and context questions
are in `audit/open-questions.md`.

`default` IDs 52350-52449 are synchronized with the translation map.
The 2/1 recipe quantities, `$NQD_City_Adessa.borrowed_amount$`, `{1}`, and
keyboard/lockpicking prompts are preserved. The five-line verse at 52389 keeps
its source lineation. Row keys/order, control-token IDs/order, line breaks,
and numeric values passed validation; unresolved terms and source issues are
logged in `audit/open-questions.md`.

`default` IDs 52250-52349 are synchronized with the translation map. `$INT0`
at 52267 is unchanged; ID 52334 preserves its three poem line breaks and
blank separator. Row keys/order, control-token IDs/order, line breaks, and
literal numeric values were checked with no mismatches. Unresolved source
phrasing and setting terms are in `audit/open-questions.md`.

`default` IDs 52150-52249 are synchronized with the translation map.
`{*1}` at 52185, +28% at 52175, the 25% threshold at 52185, and five hits at
52229 are preserved. All row keys/order, control-token IDs/order, and source
line breaks match. `Three` at 52158 is rendered `세 개`; `limerick` at 52234
is rendered as `5행시`. Remaining terminology and lore questions are in
`audit/open-questions.md`.

`default` IDs 52050-52149 are synchronized with the translation map. The
`{*1[Active]}` label at 52068 is localized with marker ID retained; the 8-line
poem at 52096 and the wrapped journal at 52129 retain source lineation.
Structural, token, and numeric checks found no mismatches. Name, lore, poetry,
and UI ambiguities are recorded in `audit/open-questions.md`.

`default` IDs 51950-52049 are synchronized with the translation map. ID 51958
retains its four-paragraph report; `{1}` at 52004, `[Female]` at 52008,
`$SQ54.bribe_value$` at 52028, and all gameplay markers/values are preserved.
ID 52037 keeps the 45/12 damage values, 5-second duration, and 35 Mana in
source order. Line-break and control-token checks found no mismatches. The
word `tenth` at 51958 is localized as `10년째`; context and terminology
questions are recorded in `audit/open-questions.md`.

`default` IDs 51850-51949 are synchronized with the translation map. ID 51871
retains `{1} #NAMED_ICON_GOLD#{2}` unchanged; ID 51889 preserves all 9 source
line breaks and its stanza separator; ID 51912 keeps the three clue fragments
and slash separators. Source line breaks, control-token IDs/order, and literal
numeric values were checked with no mismatches. Names, `Tenders`, `lith`, the
poem's immortality imagery, the `Patrons` clue, and other context-dependent
terms are logged in `audit/open-questions.md`.

The previously unrecorded `default` IDs 51550-51849 are now included in the
audit. Correction from D-20111's direct check: line-break counts match across
the range, but ID 51803 has source-reference marker differences. English and
Korean marker identity/order match; Japanese omits `{*2}`, and Chinese omits
the opening `{LINE_LEFT}` and places `{*1}` before `{*3}`. Korean writes the
source's `3 pages` as `세 페이지`, preserving the value.

`default` IDs 51450-51549 are synchronized with the translation map. The
Eleanor Brea lesson at 51469 retains all 8 English line breaks; the poem at
51496 retains its verse and stanza layout. The +1 ability tiers at 51501,
20%/6 seconds/15 Mana at 51516, five named inventory style markers at 51508,
and `{LINE_LEFT}`, `{*5}`, `{1}` sequence at 51524 are preserved. `Scion` at
51421 follows the existing provisional `후계자` term. Names, source phrasing,
poetry, and UI ambiguities are recorded in `audit/open-questions.md`. No
consolidated linguistic review has been performed.

`default` IDs 51350-51449 are synchronized with the translation map. The
two-line modifier at 51393 retains +10 Physical Damage and +30% Chakram
Damage; the +2 lockpicking value at 51395, 15 glands at 51359, and five
Fateshift kills at 51403 are preserved. The marker IDs and `{LINE_SPACE}` at
51409 match English. No source line-break mismatches were found. Source
ambiguities, including `Walen`/`Warren`, `Den Patron`, `Scion`, `Odd`, and the
south/north discrepancy at 51441, are recorded in `audit/open-questions.md`.
No consolidated linguistic review has been performed.

`default` IDs 51250-51349 are synchronized with the translation map. The 8
line breaks in the report at 51271, 2 in the journal at 51335, and 22 in the
chronicle at 51339 match English; control-marker IDs at 51276 and the +150%,
80 Mana values at 51277 are preserved. “Twelve men”/`12명`, “five minutes”/
`5분`, and December/`12월` are equivalent localized numeric forms. The source
typo `Firstworn` at 51339 was rendered consistently with `Firstsworn` and is
logged for review. Open names, rank/title readings, and source ambiguities are
in `audit/open-questions.md`. No consolidated linguistic review has been
performed.

`default` IDs 43450-43549, 43550-43649, 43650-43749, 43750-43849,
43850-43949, 43950-44049, 44050-44149, 44150-44249, 44250-44349,
44350-44449, 44450-44549, 44550-44649, 44650-44749, 44750-44849,
44850-44949, 44950-45049, 45050-45149, 45150-45249, 45250-45349,
45350-45449, 45450-45549, 45550-45649, 45650-45749, 45750-45849,
Recent `default` batches, IDs 48550-48649, 48650-48749,
48750-48849, 48850-48949, 48950-49049, 49050-49149, 49150-49249, and
49250-49349, 49350-49449, 49450-49549, 49550-49649, 49650-49749,
49750-49849, 49850-49949, 49950-50049, 50050-50149, 50150-50249,
50250-50349, 50350-50449, 50450-50549, 50550-50649, 50650-50749,
50750-50849, 50850-50949, 50950-51049, 51050-51149, and 51150-51249 are
synchronized with the translation map at 100 rows each. IDs 50550-51249 retain
English source IDs/order and embedded line breaks. The `$INT0` save-count variable, nested
ability markers, item counts, levels, and ability-cost values are preserved.
ID 50661's malformed English syntax was interpreted with Japanese/Chinese
support; ID 50703 follows English's “gone” rather than Japanese's “dead.”
The 14-line poem at 50765 and ability-markup passages at 50837, 50880, 50911,
and 51066 retain their layouts and marker IDs/values. The three-paragraph lore
entries at 50915 and 51241 retain their paragraph breaks; the two-paragraph
chronicle at 50993 and modifier lists at 50999/51066 retain their structure
and values. ID 51160 retains the `{*2}` red-name style marker and
`{LINE_SPACE}`; +2% resistance at 51190 is unchanged. `FAIL LINE` at ID 51059
remains unchanged as a source test string. The map covers IDs 100-51549
continuously, while IDs 0-99 were
translated separately. No consolidated linguistic review has been performed.
IDs 48350-48449 preserve source
line breaks, control tokens, and numeric values; ID 48357 renders “a years
time” as `1년`, an equivalent singular duration. IDs 48358 and 48388 retain
their five-line layouts, and ID 48392 preserves both `{LINE_SPACE}` markers.
The `{*3}` label at 48402 and the `{1}` variable at 48416 retain their marker
identities and order; 48405 keeps both runtime tokens unchanged. IDs
48450-48549 preserve source line breaks, markup, and control tokens; the
13-paragraph account at 48468 retains all 24 line breaks. “twenty years”/`20년`
at 48468 and “One”/`1명` at 48480 are equivalent numeric forms; `500 years`
at 48511 is unchanged. IDs 48550-48649 preserve source line breaks, tokens,
and numeric sequences. ID 48605 is a single-paragraph letter in the English
source and remains so; ID 48645 retains its six source line breaks. IDs 48593
and 48643 preserve their `{*1}`/`{1}` markers and order; ID 48647 retains 5%.
IDs 48650-48749 also retain source line breaks and token identity/order. Item
quantities “two”/`2` and “three”/`3` at 48659, and “five days”/`5일` at 48672,
are equivalent numeric forms. The `{*1}` marker at 48696 retains its ID while
its display label is localized. No consolidated linguistic review has been
performed. IDs 48750-48849 retain source line breaks, tokens, and numeric
sequences; the five-item list at 48816 preserves 10/3/3/5 quantities, and the
poem at 48840 retains all nine line breaks. No consolidated linguistic review
has been performed. IDs 48850-48949 preserve source line breaks, variables,
and numeric values. The item list at 48816 and poem at 48840 remain verified;
the `{2}/{1}/{2}` sequence at 48881 and `{1}` at 48906 are unchanged. No
consolidated linguistic review has been performed.
IDs 48950-49049 preserve source line breaks, values, and runtime markers.
The `$SQ58.parwen_bribe$` and `$SQ23.bribe_value$` variables remain intact;
ID 49000 retains three localized `*1` labels, `{LINE_SPACE}`, and `{1}` in
source order. The 205 AA vintage date and level 8 at 49046 are unchanged. No
consolidated linguistic review has been performed.
IDs 49050-49149 preserve source line breaks, token order, and numeric values.
The 9-paragraph account at 49084 retains all 16 line breaks; `{*3}` at 49140,
+5% at 49066, and +30% at 49114 are unchanged. No consolidated linguistic
review has been performed. IDs 49150-49249 and 49250-49349 are synchronized
with the translation map. Both ranges retain source line breaks and control
tokens; `ten-year`/`10년` at 49178 is an equivalent numeric form. ID 49152
retains the source's unfinished fragment, and ID 49259 retains its paragraph
breaks. No consolidated linguistic review has been performed.
IDs 49350-49449 are synchronized with the translation map and preserve source
line breaks, control tokens, and numeric values. The two Faeblade modifiers
at 49372 retain their separate lines; `{*1}` at 49432 and the `{5}/{1}/{2}/{3}`
variables at 49442 retain identity and order. No consolidated linguistic
review has been performed. IDs 49450-49549 are synchronized with the map and
preserve source line breaks and control tokens. `six hundred`/`600년` at
49459 is numerically equivalent. The UI instructions at 49486 retain layout
and marker order, and `$TRSQ01.bribe_value$` at 49492 is unchanged. No
consolidated linguistic review has been performed. IDs 49550-49649 are
synchronized with the map and preserve line breaks, control tokens, and
numeric values. The 70-ability tutorial at 49608 retains all five `*1`
wrappers in source order; the save variable at 49492 remains intact. No
consolidated linguistic review has been performed. IDs 49650-49749 are
synchronized and preserve line breaks, tokens, and numeric meaning.
`ten years`/`10년` at 49681 is equivalent; `{1}/{2}` and `{3}` quantities in
other ranges remain intact; the recipe quantities `2`/`1` at 49709 and the
`120` damage/`5` seconds at 49718 retain their values and order.
No consolidated linguistic review has been performed.
IDs 49750-49849 are synchronized with the map and preserve source line breaks,
control tokens, and numeric values. `twelve days`/`12일` at 49775 is
equivalent. The recipe at 49844 keeps its line break, and `{1}` at 49787 is
unchanged. IDs 49850-49949 are synchronized with the map; line breaks, runtime
variables, and marker identities/order match the English source. The 12%/140,
+10/+25%, and +5% values at 49850, 49871, and 49926 are preserved. Questions
about the Japanese/English volume-number conflict, names, titles, and lore are
logged in `audit/open-questions.md`. No consolidated linguistic review has
been performed. IDs 49950-50049 are synchronized with the map; line breaks,
variables, and marker identities/order match English. The 18 line breaks in
the 10-paragraph ballad at 49996 are intact; its 5/5/10/15/100/1,000 counts,
the 1-year duration at 50002, and five Lorestones at 50029 are preserved.
Terminology, title, and Japanese/English differences are logged for
consolidated review. No consolidated linguistic review has been performed.
IDs 50050-50149 are synchronized with the map; line breaks, control markers,
and runtime variables match English. The five line breaks in the fable at
50085 and `{1}` prompts at 50090 and 50094 are retained; 20%/10% at 50134
remain unchanged. ID 50070's “one final time” was corrected to `마지막으로 한
번 더`. Uncertain setting terms and names are logged in the audit. No
consolidated linguistic review has been performed. IDs 50150-50249 are
synchronized with the map; line breaks, control markers, and numeric values
match English. The 8 breaks in the poem at 50178, 2 in the account at 50193,
and 4 in the ability description at 50229 are preserved. Faeblade `+5`/
`+20%` and the Sceptre cost change from 5% to 4% remain intact. Terminology
questions are logged in `audit/open-questions.md`; no consolidated linguistic
review has been performed. IDs 50250-50349 are synchronized with the map;
line breaks and control tokens match English, including `$NUM0 MB` at 50267.
The +8%/30% Mana, +17%, and +15%/15% values at 50315-50316 and 50337 are
preserved. IDs 50350-50449 are synchronized and retain source layout; the
poem at 50357 has 3 breaks, the recipe at 50395 has 3, and the Lyria poem at
50406 has 9. Numeric values and quantities at 50354, 50377, 50395, 50401,
50407, 50409, 50419, and 50427 are retained. IDs 50450-50549 are synchronized
with the map. The 12 breaks in the policy at 50466, 8 in the poem at 50479,
5 in the recipe at 50503, and 1 in the effect at 50526 match the source;
`$SQ54.bribe_value$` at 50458 is unchanged. Recipe quantities and the 20%/
70%/10% HP plus 30%/20% Mana values are preserved. Terminology and source
typos are logged in the audit; no consolidated linguistic review has been
performed.
Control markers/variables at IDs
43469, 43611, 43657, 43691, 43727, 43836, 43850, 43919, 43931, 43960,
44019, 44133, 44199, 44393, 44401, 44473, 44889, 44946, and 44994 retain identity
and order; IDs
43543 and 44438 retain their named-icon token. The style wrappers at 44583
and 44593 retain their IDs/order; IDs 44662 and 44812 retain their layout/
variable markers; ID 44752 retains its runtime cost variable;
ID 43545 remains the source placeholder and
ID 43610 remains `Trav`. Multiline poems/letters/recipes at 43626, 43689,
43871, 43931, 44020, 44040, 44077, 44095, and 44213 retain source line
structure and quantities; IDs 44218 and 44378 retain their record/paragraph
structure; IDs 44510, 44656, 44880, 44913, and 44949 retain poem lineation; ID
44575 retains its report paragraphs; IDs 44807, 44827, 44835, 44900, and 44913
retain their source paragraph/line structure. ID 45040 retains its cost line.
IDs 45050-45149 and 45150-45249 retain their source line breaks, runtime
tokens, and numeric sequences; ID 45102 retains its report paragraphs, ID
45176 retains its inn-cost variable, and ID 45200 retains its two-line effect
and all four combat values. ID 45284 retains its three stat lines; ID 45288
retains its `2:3` heading, blank line, and 16 hymn lines; ID 45311 retains its
single-record, no-line-break test text and incomplete final clause; ID 45348
retains all four `*1` style-marker IDs and their order. ID 45408 retains its
six source lines, ID 45421 retains all eight source line breaks and separate
signature, and IDs 45352, 45354, 45382, 45396, and 45416 retain their runtime
tokens/marker IDs and order. ID 45465 retains its two paragraphs, ID 45514
retains all 10 source line breaks and blank paragraph separator, and ID 45544
retains all three damage lines and values. The eight-spider contract, the
source's 33-by-day line, and the +30% ranged-damage value retain their
quantities. The 100 XP/50 Gold values, +9/+10% and +25/+40% Hammer modifiers,
50% fire-damage reduction, 140 Physical Damage, +23% melee damage, and +30%
ranged damage are preserved. `Adept` at IDs 44006, 44012, and 44139 uses the
established
provisional term `숙련자`. `[DO NOT USE]` at 44240 is unchanged. The work CSV
retains the Japanese template's keys and order, UTF-8 BOM, and CRLF record
endings. ID 45566 retains 13 seconds, -20% armor, 40 Mana, and its cost line;
ID 45621 retains its two paragraphs and visibly incomplete final clause. IDs
45656, 45677, 45698, 45723, and 45747 retain their numeric/token values and
source line-break structure; 45737 retains the poem's lineation and blank
paragraph. ID 45769 retains disease/UI marker order and both `{LINE_SPACE}`
markers; 45797 retains `{1}`; ID 45834 retains +120% and +55%. Card ranks
`three`/`four` at 45812/45822 are rendered as `3`/`4`. IDs 45855 preserve all
three damage values and line breaks; 45900 preserves localized inventory
marker order, `{LINE_SPACE}`, and `{1}`; 45901 retains all three paragraphs;
45940 retains the ten-pace quantity. IDs 45953 retain +14 Physical Damage,
+25% Greatsword Damage, and the source line break; 45960 preserves the
gold/tribute tokens; 46015 preserves `{1}`; 46044 preserves weapon/inventory
markers and `{LINE_SPACE}`. Map/CSV sync, control-token identity/order, source
line-break, and normalized numeric checks passed for IDs 45050-46049. Open
names, terminology, and context questions are listed in
`audit/open-questions.md`. ID 46111 retains six poetic lines; ID 46132
preserves the three skill/game style markers and their order; ID 46138 retains
ten verse lines; ID 46149 retains the age of 10. Map/CSV sync, control-token
identity/order, source line-break, and normalized numeric checks passed for
IDs 45050-46149. No consolidated linguistic review has been performed.
IDs 46152 retain the `3` label; 46158 and 46201 retain their dollar-value
variables; 46232 preserves its loot markers, `{LINE_SPACE}`, and `{1}`.
The “one or two” wording at 46220 remains idiomatic Korean (`한두 가지`).
Map/CSV sync, control-token identity/order, source line-break, and normalized
numeric checks passed for IDs 45050-46249. Open names, terminology, and context
questions remain in `audit/open-questions.md`. No consolidated linguistic
review has been performed. ID 46302 retains 29/22/22 and its three source
lines; ID 46327 retains the passive style marker and line break; ID 46332
retains `{LINE_SPACE}` and `{1}`; ID 46343 retains four paragraphs and the
three-spring sequence. Map/CSV sync, control-token identity/order, source
line-break, and normalized numeric checks passed for IDs 45050-46349. Open
names, terminology, and context questions are listed in
`audit/open-questions.md`. IDs 46350-46449 retain the slash-separated poem
format at 46407 and the nested Mana token at 46417. The working CSV remains at 65,135 rows
with Japanese-template key order, UTF-8 BOM, and CRLF record endings; source
line breaks are retained. No consolidated linguistic review has been
performed. IDs 46450-46549 also pass the same key/order, map, encoding,
line-break, and token checks; ID 46518 keeps its sign-off paragraph and
46527 keeps both source paragraphs. No consolidated linguistic review has
been performed. IDs 46550-46649 also pass those checks; 46567 and 46584 retain
their paragraph/verse structure, 46578 localizes only the visible `*1` label,
46628 remains the source test label, and 46637 retains all four reagent
quantities. No consolidated linguistic review has been performed. Continue
at ID 46650. IDs 46650-46749 pass key/order, map, encoding, line-break,
control-ID, and variable checks; `[DO NOT USE]`, `Orieator`, and the
incomplete `{*2` source marker are retained. IDs 46682 and 46726 preserve
their source value/description structure, and 46737 retains its markup IDs
and order. No consolidated linguistic review has been performed. Continue
at ID 46750. IDs 46750-46849 pass the same structural checks; the 15-paragraph
entry at 46846 preserves all 28 source line breaks and the one-month,
32-year, and seven-day spans. The incomplete marker at 46692 and all prior
batch contents remain synchronized. No consolidated linguistic review has
been performed. Continue at ID 46850. IDs 46850-46949 also pass the structural
checks; ID 46865 retains its heading and both paragraphs, 46883 retains eight
verse line breaks, 46907 keeps `{1}`/`{2}`, and the 13% value at 46873 remains
unchanged. `FAIL LINE` at 46934 is retained verbatim. IDs 46950-47049 also
pass key/order, map, encoding, line-break, control-ID, and variable checks.
The two-line records at 46950/46958 and 47047 retain their breaks; the bribe
variable, `{1}`/`{2}`, and effect values remain intact. No consolidated
linguistic review has been performed. IDs 47050-47149 also pass key/order,
map, encoding, line-break, control-ID, and variable checks. The Archsage
journal at 47133 keeps its two source line breaks, and 47112 retains the
inn-cost variable. Counts, effect values, and the 120-second summon remain
intact. IDs 47186 and 47196 retain source line/paragraph breaks; 47234
preserves marker identity/order and `{LINE_SPACE}`. Numeric values, named
tokens, and CSV key order remain intact for 47150-47249. IDs 47250-47349
also retain source line breaks, markers, values, and key order. IDs
47350-47449 retain source lineation, runtime markers, values, and key order.
IDs 47450-47549 also retain source line breaks, variables, quantities, and
key order; the 26 line breaks and seven ship-rank numerals in 47542 are kept.
IDs 47550-47649 preserve source breaks and control markers, including the
incomplete `{*3` and named-icon markers; explicit values remain intact. IDs
47650-47749 also retain all line breaks, marker identities, and values,
including the 12-line poem at 47707. IDs 47750-47849 preserve source breaks,
combat values, and runtime markers, including the sustained-cost description
at 47771. IDs 47850-47949 pass key/order, map, encoding, line-break, control
token, and explicit numeric-order checks; the word numerals `sixth` and `four`
at 47883/47934 are rendered as `6` and `4`. The poem at 47894, effect lines,
and recipe at 47933 retain source breaks. IDs 47950-48049 also pass key/order,
map, encoding, line-break, control-token, and explicit numeric-value checks.
ID 47986 retains its three paragraph breaks and incomplete final clause; IDs
48000 and 48022 retain their style/control markers, and 48041 preserves its
cost variable. IDs 48050-48149 also pass key/order, map, encoding, line-break,
control-token, and numeric-order checks. The verse at 48100 retains all five
source line breaks, and the technical entry at 48133 preserves its two
paragraph breaks. IDs 48150-48249 also pass key/order, map, encoding,
line-break, control-token, and numeric checks. ID 48185 retains its heading
break, 48208/48220 preserve localized marker order, and the journal at 48223
retains all eight line breaks. No consolidated linguistic review has been
performed. IDs 48250-48349 also pass key/order, map, encoding, line-break,
control-token, and numeric checks. IDs 48265/48285 retain their source
paragraph and sign-off breaks; the reagent lists at 48254 and 48297 preserve
their quantities and order. No consolidated linguistic review has been
performed. Continue at ID 48350.

The working CSV keys, row counts, and order currently match the Japanese
template for the completed `base` and `affix` drafts. Every `affix` ID retains
its Japanese-template variant rows; the translated text is consistent across
all variants for each ID. The Korean wording and terminology across all
drafted ranges remains provisional. Do not conduct piecemeal linguistic
review; consolidated review and correction are deferred until all three
resource drafts are complete.

For `default`, IDs 0-47149 have Korean drafts. The CSV has 65,135 data rows,
UTF-8 BOM, and matching Japanese-template keys and order. The working map for
IDs 100-47149 are recorded in the translation map; IDs 0-99 are retained in
the initial working draft. CSV records use CRLF; embedded
multiline text retains its internal line breaks. The translation map stores
line breaks as literal `\n` escapes; these are expanded to actual line breaks
when synchronizing the work CSV. IDs 10165 and 10236 retain
their source paragraph breaks; IDs 10263, 10266, and 10286 retain their source
line-break counts. IDs 10202 and 10224 retain their runtime/UI markers.
ID 10362 retains its four source line breaks, and ID 10383 retains its
source placeholder text. IDs 10466 and 10475 retain their source paragraph
breaks; IDs 10494 and 10499 retain their source line breaks and numeric values.
IDs 10523, 10548, and 10593 retain their source line breaks; ID 10502 retains
its localized awareness marker and ID 10565 retains all seven control markers.
IDs 10627, 10645, and 10683 retain their source line breaks; IDs 10608, 10643,
10657, and 10681 retain their source control/variable tokens.
IDs 10739 and 10790 retain all four source line breaks; ID 10759 retains its
four localized/control markers.
IDs 10809, 10838, and 10842 retain their source line breaks; ID 10890 retains
both localized special-attack markers.
ID 11069 retains its four source line breaks and ingredient quantities.
IDs 11189 and 11199 retain their source line breaks; ID 11123 retains `{1}`,
ID 11144 retains both `{LINE_SPACE}` markers, and ID 11163 retains its
localized ability-marker wrapper.
IDs 11271 and 11299 retain their source line breaks; ID 11214 retains all
three localized ability markers in order, and ID 11242 retains its runtime
price variable.
IDs 11360, 11363, and 11385 retain their source line breaks; IDs 11307 and
11392 retain their control/substitution tokens.
IDs 11418 and 11476 retain their source line breaks.
ID 11599 retains all 13 source line breaks; ID 11579 retains `{1}`.
IDs 11647, 11654, and 11688 retain their source line breaks.
Unresolved wording across drafted ranges is recorded in
`audit/open-questions.md`. IDs 4814, 4819, 4862,
4892, 5017, 5035, 5044, 5064, 5095, and 5098 retain their source line-break
counts; template tokens checked in IDs 4860, 4887, 4902, 4954, 4982, 4991,
and 5089 are preserved. Markup in IDs 5243, 5327, 5372, 5380, 5387, 5405,
5451, 5457, 5479, 5486, and 5492 is also verified against English. IDs 5605,
5640, and 5661 retain their source line-break counts and numeric tokens. IDs
5745, 5758, and 5793 retain their source line breaks; ID 5705 retains its
markup tokens. IDs 5849, 5871, 5887, 5888, and 5899 retain their source line
breaks and/or quoted-string formatting. IDs 5933, 5987, and 5918 preserve
source line breaks and parameter tokens. IDs 6002, 6032, 6085, and 6094 retain
their source markup, line breaks, and/or quantities. IDs 6104 and 6185 retain
their substitution tokens and formatting controls. IDs 6210, 6298, and 6299
retain their copyright text, placeholders, and source label formatting. IDs
6309, 6347, 6370, and 6393 retain source placeholders, line breaks, or UI
structure. IDs 6441, 6470, and 6480 retain their source line breaks, quote,
and runtime variable. IDs 8523, 8529, and 8554 retain the source line breaks;
IDs 8587 and 8590 retain all control and substitution tokens. IDs 8601 and
8670 retain their source line breaks; IDs 8629, 8656, and 8698 retain their
localized control-token structure. IDs 8742 and 8761 retain their source
paragraph/line breaks; ID 8726 retains its runtime price variable. IDs 8831,
8832, 8852, 8859, 8864, and 8886 retain source line breaks; IDs 8839, 8864,
8867, and 8886 retain their parameter/control-token structure. IDs 8930,
8966, 8969, 8996, 8997, 9035, and 9050 retain their source line breaks; IDs
8934, 8991, and 9035 retain all localized control-token structure.
IDs 9228 and 9264 retain their source line breaks; IDs 9210 and 9292 retain
their button/control tokens. IDs 9323, 9342, and 9364 retain their source
line breaks; IDs 9338, 9430, 9504, and 9536 retain their quest-marker/control
tokens. IDs 9405, 9432, 9474, 9583, 9603, 9647, 9652, 9690, 9714, 9733,
9763, 9778, 9813, 9839, 9898, 9919, 9939, 10037, 10058, 10067, 10086, and
10090 retain their source line-break
counts; IDs 9504, 9536, 9688, 9727, 9729, 9903, and 9945 retain their
control-marker structure, and IDs 9690, 9727, 9836, and 9903 retain their
runtime variables/layout tokens.

For `default`, IDs 11700-11799 have Korean drafts and are reflected in the
working CSV. The CSV retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record
terminators, and embedded source line breaks. Translation continues at ID
11800; defer linguistic review of this range and all accumulated questions
until the three resource drafts are complete.

IDs 11800-11899 have Korean drafts in the translation map and working CSV.
Only the 100 target `Texto` cells changed; the CSV retains 65,135 data rows,
ID order, UTF-8 BOM, CRLF record terminators, and embedded source line breaks.
Translation continues at ID 11900. No piecemeal linguistic review was
performed.

IDs 11900-11999 have Korean drafts in the translation map and working CSV.
Only the 100 target `Texto` cells changed; the CSV retains 65,135 data rows,
ID order, UTF-8 BOM, CRLF record terminators, and embedded source line breaks.
Translation continues at ID 12000. No piecemeal linguistic review was
performed.

IDs 12000-12099 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; 97 differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12100. No piecemeal linguistic review was performed.

IDs 12100-12199 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; 99 differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12200. No piecemeal linguistic review was performed.

IDs 12200-12299 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; 99 differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12300. No piecemeal linguistic review was performed.

IDs 12300-12399 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; 99 differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12400. No piecemeal linguistic review was performed.

IDs 12400-12499 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map and differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12500. No piecemeal linguistic review was performed.

IDs 12500-12599 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; 99 differed from the prior draft. The CSV
retains 65,135 data rows, ID order, UTF-8 BOM, CRLF record terminators, and
the original count of embedded line breaks. Translation continues at ID
12600. No piecemeal linguistic review was performed.

IDs 12600-12699 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. Ambiguous names,
lore terms, and source phrasing are recorded in `audit/open-questions.md`.
Translation continues at ID 12700. No piecemeal linguistic review was
performed.

IDs 12700-12799 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. Source/reference
disagreements and uncertain names or phrases are recorded in
`audit/open-questions.md`. Translation continues at ID 12800. No piecemeal
linguistic review was performed.

IDs 12800-12899 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. The 11 line breaks
in ID 12898 and the control-marker prefixes in ID 12870 are preserved.
Translation continues at ID 12900. No piecemeal linguistic review was
performed.

IDs 12900-12999 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. Markup, runtime
variables, and named control markers in the tutorial/cost strings are
preserved. Translation continues at ID 13000. No piecemeal linguistic review
was performed.

IDs 13000-13099 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. Item variables,
emphasis/control markers, and runtime cost tokens are preserved.
Translation continues at ID 13100. No piecemeal linguistic review was
performed.

IDs 13100-13199 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. The long
letter/poem structures, control markers, and runtime values are preserved.
Translation continues at ID 13200. No piecemeal linguistic review was
performed.

IDs 13200-13299 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. The Fate-sworn
warning structure, UI placeholder, damage values, and long verse breaks are
preserved. Translation continues at ID 13300. No piecemeal linguistic review
was performed.

IDs 13300-13399 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. ID 13306 retains
all 17 `{LINE_INDENT}` markers and 16 `{LINE_NEXT_PAGE}` markers in source
order; ID 13305 retains its trailing non-breaking space. Translation
continues at ID 13400. No piecemeal linguistic review was performed.

IDs 13400-13499 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map. The CSV retains 65,135 data rows, the
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, and the
English source's embedded line-break counts for this range. The four
paragraph breaks in ID 13411 are preserved. Translation continues at ID
13500. No piecemeal linguistic review was performed.

IDs 13500-13599 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, the Japanese-template ID order, UTF-8 BOM,
CRLF record terminators, and source line breaks. Control/markup tokens in IDs
13503, 13553, and 13576 are retained; the two blank-line paragraph breaks and
ingredient/count lines in ID 13572 are preserved. Proper-name, title, and
context questions are recorded in `audit/open-questions.md`. Translation
continues at ID 13600. No piecemeal linguistic review was performed.

IDs 13600-13699 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, and English source line-break counts. ID 13692 retains its
localized hidden-object marker. Proper-name, lore, and short-context questions
are recorded in `audit/open-questions.md`. Translation continues at ID 13700.
No piecemeal linguistic review was performed.

IDs 13700-13799 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, and the `{*1}` control marker in ID
13715. The long diary, mine ledger, and fable retain their source line-break
counts. Terminology and context questions are recorded in
`audit/open-questions.md`. Translation continues at ID 13800. No piecemeal
linguistic review was performed.

IDs 13800-13899 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, and the `$M0_SQ06.charter_cost$`
runtime variable. Ambiguous or malformed source entries are recorded in
`audit/open-questions.md`. Translation continues at ID 13900. No piecemeal
linguistic review was performed.

IDs 13900-13999 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, and all English source line breaks. Lore terms, short
ambiguous labels, and source issues are recorded in `audit/open-questions.md`.
Translation continues at ID 14000. No piecemeal linguistic review was
performed.

IDs 14000-14099 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, and the button/runtime marker sequence
in ID 14088. Lore terminology and incomplete/ambiguous source strings are
recorded in `audit/open-questions.md`. Translation continues at ID 14100.
No piecemeal linguistic review was performed.

IDs 14100-14199 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, and English source line-break counts. Unclear terminology
and malformed/ambiguous source text are recorded in `audit/open-questions.md`.
Translation continues at ID 14200. No piecemeal linguistic review was
performed.

IDs 14200-14299 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, all source line breaks, and the active-skill/numeric
placeholder markers. The long rhetoric essay retains its paragraph structure.
Terminology and source-meaning questions are recorded in
`audit/open-questions.md`. Translation continues at ID 14300. No piecemeal
linguistic review was performed.

IDs 14300-14399 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, and the diplomacy variable/gold icon
tokens in ID 14367. The formal village proclamation retains its paragraph
structure; numeric combat values and line breaks are preserved. Questions are
recorded in `audit/open-questions.md`. Translation continues at ID 14400.
No piecemeal linguistic review was performed.

IDs 14400-14499 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, and the ability marker in ID 14400 and
button variable in ID 14410. Combat values and the single-line poem structure
at ID 14491 are retained. Questions are recorded in
`audit/open-questions.md`. Translation continues at ID 14500. No piecemeal
linguistic review was performed.

IDs 14500-14599 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, the exact five-marker sequence in ID 14505, and all
English source line breaks and quantities. Questions about lore, names, and
specialized UI terms are recorded in `audit/open-questions.md`. Translation
continues at ID 14600. No piecemeal linguistic review was performed.

IDs 14600-14699 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, English source line-break counts, localized control-marker
prefixes, and runtime/control-token order. The two-line Quake damage/cost
entry and `$STR0 $STR1 $STR2` placeholders are preserved. Ambiguous terms and
context are recorded in `audit/open-questions.md`. Translation continues at
ID 14700; no piecemeal linguistic review was performed.

IDs 14700-14799 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, and English source line-break counts. The 38 Studios
privacy URL, skill/stat values, gold amount, and the quotation and stanza
structure of the Fae-stone passage in ID 14774 are preserved. Uncertain
faction, place, title, and source-meaning questions are recorded in
`audit/open-questions.md`. Translation continues at ID 14800; no piecemeal
linguistic review was performed.

IDs 14800-14899 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, numeric values, and runtime/control
tokens. The alchemy recipe quantities and blank-line layout in ID 14842 are
preserved. Ambiguous lore terms and names are recorded in
`audit/open-questions.md`. Translation continues at ID 14900; no piecemeal
linguistic review was performed.

IDs 14900-14999 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, numeric values, runtime variables,
and localized control markers. Combat-effect values and durations, recipe
quantities, and the four-line bullet layout in ID 14941 are preserved.
Terminology and ambiguous UI/lore questions are recorded in
`audit/open-questions.md`. Translation continues at ID 15000; no piecemeal
linguistic review was performed.

IDs 15000-15099 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, ability/effect values, and control
markers/runtime variables. The 3-line combat effect, 2-line resistance
description, active-skill tooltip, and two-paragraph lore passage with the
13/12 golem and column counts are preserved. Ambiguous names, titles, and
source wording are recorded in `audit/open-questions.md`. Translation
continues at ID 15100; no piecemeal linguistic review was performed.

IDs 15100-15199 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, source line breaks, numeric values, control markers, and
runtime tokens. The 5-line poem, three-paragraph customs notice, and
three-paragraph trade contract preserve their source structure; contract
counts and unit prices are retained. Ambiguous terminology and names are in
`audit/open-questions.md`. Translation continues at ID 15200; no piecemeal
linguistic review was performed.

IDs 15200-15299 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, the Quake damage/cost line break and values, and source
line breaks elsewhere. Uncertain titles, proper names, and UI meanings are
recorded in `audit/open-questions.md`. Translation continues at ID 15300; no
piecemeal linguistic review was performed.

IDs 15300-15399 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, numeric values, localized markers, and source line breaks.
The six-line prophecy, six-line poem, two-line damage bonus, and upgrade marker
layout are preserved. Uncertain lore, skill, proper-name, and UI terms are
recorded in `audit/open-questions.md`. Translation continues at ID 15400; no
piecemeal linguistic review was performed.

IDs 15400-15499 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 data rows, Japanese-template ID order, UTF-8 BOM, CRLF
record terminators, the source line breaks, and UI/control tokens. The
five-line origin poem, two-paragraph plan, and three-paragraph historical
account are preserved. Quest, skill, lore, and proper-name uncertainties are
recorded in `audit/open-questions.md`. Translation continues at ID 15500; no
piecemeal linguistic review was performed.

IDs 15500-15599 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; the CSV retains all 65,135 data rows,
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, source
line-break counts, and control markers. The six-line poem and source layout
are preserved. Names, lore, item terms, and ambiguous phrasing are recorded
in `audit/open-questions.md`. No piecemeal linguistic review was performed.

IDs 15600-15699 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; the CSV retains all 65,135 data rows,
Japanese-template ID order, UTF-8 BOM, CRLF record terminators, source
line-break counts, `{1}/{2}`, and numeric values. The four-paragraph Mel
Aglir lesson, six-line poem, and five-line passage preserve their source
layout. Uncertain names, lore, and context are recorded in
`audit/open-questions.md`. No piecemeal linguistic review was performed.

During structural validation, escaped map line breaks were expanded before
writing the CSV. ID 12357's draft was adjusted to match the English source's
10 line breaks; all mapped rows now match their English line-break counts.
The translation map and CSV agree for IDs 100-15699.

IDs 15700-15799 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; source line breaks, numeric values,
the `{*1 ...}` availability marker, and the `$NQD_City_Rathir.ante_mid$`
runtime value are preserved. Names, lore, and malformed or context-dependent
phrasing are recorded in `audit/open-questions.md`. No piecemeal linguistic
review was performed. Translation continues at ID 15800.

IDs 15800-15899 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; source line breaks, numeric values,
the named icon marker, `{1}`, and both difficulty/options marker wrappers are
preserved. The four-line poem, letter paragraphs, and ten-name list retain
their source layout. Ambiguous lore, names, and source phrasing are recorded
in `audit/open-questions.md`. No piecemeal linguistic review was performed.
Translation continues at ID 15900.

IDs 15900-15999 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; source line breaks, the named icon
marker, and all referenced numeric values are retained. The six-line
Bonewhite Forest passage preserves its stanza break. Uncertain names, lore,
and source phrasing are recorded in `audit/open-questions.md`. No piecemeal
linguistic review was performed. Translation continues at ID 16000.

IDs 16000-16099 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; the four-line poem, nested health
tokens, two-line greatsword bonus, and potion-recipe line breaks and
quantities are preserved. Names, lore, and context questions are recorded in
`audit/open-questions.md`. No piecemeal linguistic review was performed.
Translation continues at ID 16100.

IDs 16100-16199 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; source line breaks, localized UI
marker wrappers, `{LINE_SPACE}`, nested health/effect values, and combat
numbers are preserved. The four-line Gadflow passage and two-line Quake
description retain their source layout. Lore and source ambiguities are
recorded in `audit/open-questions.md`. No piecemeal linguistic review was
performed. Translation continues at ID 16200.

IDs 16200-16299 have Korean drafts in the translation map and working CSV.
The 100 translated cells match the map; source line breaks, Chaos Rift
control markers, the named icon, runtime wager variable, effect values, and
recipe quantities are preserved. The tutorial and long-form lore retain
their source layouts. Uncertain terms and names are recorded in
`audit/open-questions.md`. No piecemeal linguistic review was performed.
IDs 16300-16399 had already been drafted in the map but were not synchronized
to the CSV; they are now synced and verified against the map. Translation
continues at ID 16500.

IDs 16400-16499 have Korean drafts in the translation map and working CSV.
All 100 cells match the map, and source paragraph/verse line breaks are
preserved. Ambiguous titles, names, source wording, and resource terms are
recorded in `audit/open-questions.md`. No piecemeal linguistic review was
performed.

IDs 16500-16599 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source line breaks and the marker wrappers,
variables, and quantities in IDs 16509, 16524, 16534-16535, 16540, 16543,
and 16551 were checked against English. Uncertain names and context are
recorded in `audit/open-questions.md`. Translation continues at ID 16600.
No piecemeal linguistic review was performed.

IDs 16600-16699 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; line breaks, numbered placeholders, combat values,
and percentage values are preserved. Ambiguous names, lore titles, and source
phrasing are recorded in `audit/open-questions.md`. Translation continues at
ID 16700. No piecemeal linguistic review was performed.

IDs 16700-16799 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source line breaks, day-log paragraph breaks,
numeric values, and the localized eligibility marker are preserved. Ambiguous
names, lore, and source wording are recorded in `audit/open-questions.md`.
Translation continues at ID 16800. No piecemeal linguistic review was
performed.

IDs 16800-16899 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; the one-line break in the Archsage account, the
quoted multi-stanza passage, and the named stealth-icon token are preserved.
Uncertain terminology and lore are recorded in `audit/open-questions.md`.
Translation continues at ID 16900. No piecemeal linguistic review was
performed.

IDs 16900-16999 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source line breaks, combat-stat values, ingredient
quantities, and the unused-string warning are preserved. Ambiguous faction,
lore, and terminology questions are recorded in `audit/open-questions.md`.
Translation continues at ID 17000. No piecemeal linguistic review was
performed.

IDs 17000-17099 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; verse and effect-description line breaks, combat
values, and the unused petrification-resistance warning are preserved.
Uncertain names, lore, and malformed source phrasing are recorded in
`audit/open-questions.md`. Translation continues at ID 17100. No piecemeal
linguistic review was performed.

IDs 17100-17199 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source line breaks, the activated-skill marker,
combat values, and the 2:4 poem's 15 line breaks are preserved. Uncertain
names, terms, and source phrasing are recorded in `audit/open-questions.md`.
Translation continues at ID 17200. No piecemeal linguistic review was
performed.

IDs 17200-17299 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; the ingredient recipe's four line breaks, the
nested `{*5{1}}` marker, and all source row keys are preserved. Uncertain
terms and lore are recorded in `audit/open-questions.md`. Translation
continues at ID 17300. No piecemeal linguistic review was performed.

IDs 17300-17399 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source paragraph breaks in the Fae treatise and
Mitharu essay, the slash-delimited verse, and the localized game-title wrapper
are preserved. Ambiguous names, lore, and terminology are recorded in
`audit/open-questions.md`. Translation continues at ID 17400. No piecemeal
linguistic review was performed.

IDs 17400-17499 have Korean drafts in the translation map and working CSV.
All 100 cells match the map; source line breaks, the `{1}{2}` runtime values,
and combat percentages are preserved. Ambiguous lore, names, and context are
recorded in `audit/open-questions.md`. No piecemeal linguistic review was
performed.

IDs 17500-17599 were present in the translation map but had not yet been
synchronized to the working CSV; the full map has now been applied and checked.
IDs 17600-18699 have Korean drafts in both map and CSV. The 1,100 rows preserve
source control tokens and line-break counts, including the long Ettin journal,
Kollossae myths, story epilogues, Pacetor letter, arena records, and lore poems.
Uncertain lore, terminology, and source wording are logged in
`audit/open-questions.md`. Translation continues at ID 18700; no piecemeal
linguistic review was performed.

IDs 18700-18799 have Korean drafts in the translation map and working CSV. English was used
for meaning, Japanese for voice/register, and Chinese as a secondary check.
Names, lore terms, source ambiguities, and conflicting reference readings are
recorded in `audit/open-questions.md`. The localized UI wrappers in ID 18730
are retained. Translation continues at ID 18800; no consolidated linguistic
review has been performed.

IDs 18800-18899 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; the CSV retains 65,135 rows, Japanese
template ID order, UTF-8 BOM, CRLF record terminators, and the English source's
line-break counts. UI markers in IDs 18836, 18867, and 18899 are preserved.
Open terminology and context questions are recorded in
`audit/open-questions.md`. Translation continues at ID 18900; no consolidated
linguistic review has been performed.

IDs 18900-18999 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; source line breaks, nested UI markers,
runtime variables, and numeric values are preserved. The long lore summary
and Avery's letter retain their paragraph breaks. Uncertain lore, names, and
source phrasing are in `audit/open-questions.md`. Translation continues at ID
19000; no consolidated linguistic review has been performed.

IDs 19000-19099 have Korean drafts in the translation map and working CSV.
The 100 target cells match the map; the CSV retains its 65,135 rows, Japanese
template ID order, UTF-8 BOM, and CRLF record endings. Source line breaks,
control/UI markers, runtime tokens, and dialogue signatures are preserved.
Ambiguous terminology and source errors are logged in
`audit/open-questions.md`. Translation continues at ID 19100; no consolidated
linguistic review has been performed.

IDs 19100-19199 have Korean drafts in the translation map and working CSV.
All target cells match the map; the CSV retains its 65,135 rows, Japanese
template ID order, UTF-8 BOM, and CRLF record endings. Multi-speaker dialogue
and the three-paragraph lore entry retain source line breaks. Names, titles,
and context questions are recorded in `audit/open-questions.md`. Translation
continues at ID 19200; no consolidated linguistic review has been performed.

IDs 19200-19299 have Korean drafts in the translation map and working CSV.
All 100 target cells match the map; source line breaks, UI markers, and named
icons are verified. ID 19210 was corrected after detecting a source-key/text
mismatch before synchronization. The CSV retains its Japanese-template order,
65,135 rows, UTF-8 BOM, and CRLF record endings. Uncertain terminology and
context are recorded in `audit/open-questions.md`. Translation continues at
ID 19300; no consolidated linguistic review has been performed.

IDs 19300-19399 have Korean drafts in the translation map and working CSV.
All target cells match the map; the long observance text, letter, and recipe
preserve source line breaks. CSV row count, ID order, UTF-8 BOM, CRLF, markers,
and icons remain intact. Names and religious/lore questions are in
`audit/open-questions.md`. Translation continues at ID 19400; no consolidated
linguistic review has been performed.

IDs 19400-19499 have Korean drafts in the translation map and working CSV.
The seven-line lore verse, six-break chronology, cost line, and UI markers
match the English source structure. The CSV retains its 65,135 rows, Japanese
template order, BOM, and CRLF endings; non-target cells are unchanged. Open
names, ranks, and source ambiguities are recorded in `audit/open-questions.md`.
No consolidated linguistic review has been performed.
IDs 42750-42849 are synchronized with the map (100/100); all four CSVs retain
65,135 rows, matching key order, UTF-8 BOM, and CRLF record endings. Source
line breaks, control tokens, and numeric values were checked with no
mismatches. The 4-line Carver verse at 42786 and encoded `$STR0` field at
42784 are preserved. The `{1}` book-count variable, +6% stun duration, +16
Chakram damage, +40% Chakram damage, and potion recipe quantities are
unchanged. Section `XII` at 42684 is localized as `제12절`.

IDs 19500-19599 have Korean drafts in the translation map and working CSV.
The 100 map entries are synchronized; 99 target cells changed because ID 19552
already matched the Korean draft. The CSV retains 65,135 rows, Japanese
template ID order, UTF-8 BOM, CRLF record terminators, and the English source's
line-break and variable-token structure for this range. Uncertain faction and
place names, lore terms, item terminology, and wordplay are recorded in
`audit/open-questions.md`. Translation continues at ID 19600; no consolidated
linguistic review has been performed.

IDs 19600-19699 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; source line breaks and runtime/UI
marker structure are preserved for this range. Uncertain lore, titles, names,
and internal labels are in `audit/open-questions.md`. Translation continues
at ID 19700; no consolidated linguistic review has been performed.

IDs 19700-19799 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; source line breaks and localized
ability-marker structure are preserved for this range. Uncertain names,
titles, lore, and source phrasing are in `audit/open-questions.md`.
Translation continues at ID 19800; no consolidated linguistic review has
been performed.

IDs 19800-19899 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; source line breaks, letter formatting,
combat values, and localized ability markers are preserved for this range.
Uncertain names, lore, quest wording, and internal labels are recorded in
`audit/open-questions.md`. Translation continues at ID 19900; no consolidated
linguistic review has been performed.

IDs 19900-19999 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; the verse, letter, and any source
line breaks are preserved. Uncertain proper names, lore, titles, and source
phrasing are recorded in `audit/open-questions.md`. Translation continues at
ID 20000; no consolidated linguistic review has been performed.

IDs 20000-20099 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; source line breaks and the localized
Longbow ability marker are preserved. Uncertain lore, source phrasing, and
proper names are recorded in `audit/open-questions.md`. Translation continues
at ID 20100; no consolidated linguistic review has been performed.

IDs 20100-20199 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; source line breaks and trailing
punctuation are preserved. Ambiguous titles, place names, and internal labels
are recorded in `audit/open-questions.md`. Translation continues at ID 20200;
no consolidated linguistic review has been performed.

IDs 20200-20299 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; bullet/ability markers, values, and
source line breaks are preserved. Ambiguous lore, labels, names, and source
errors are recorded in `audit/open-questions.md`. Translation continues at
ID 20300; no consolidated linguistic review has been performed.

IDs 20300-20399 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; runtime tribute, bullet, and ability
markers and source line breaks are preserved. Ambiguous lore, ranks, names,
and source phrases are in `audit/open-questions.md`. Translation continues at
ID 20400; no consolidated linguistic review has been performed.

IDs 20400-20499 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, and CRLF record terminators; nested runtime markers, UI tokens, and
source line breaks are preserved. Uncertain names, ranks, and lore readings
are recorded in `audit/open-questions.md`. Translation continues at ID 20500;
no consolidated linguistic review has been performed.

IDs 20500-20599 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, and source line-break counts. Runtime
variables and localized UI-marker wrappers retain their source order.
Uncertain lore, names, and source wording are recorded in
`audit/open-questions.md`. Translation continues at ID 20600; no consolidated
linguistic review has been performed.

IDs 20600-20699 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control tokens. Uncertain lore, names, and mechanics are recorded in
`audit/open-questions.md`. Translation continues at ID 20700; no consolidated
linguistic review has been performed.

IDs 20700-21499 have Korean drafts in the translation map and working CSV.
All 800 entries match the map. The CSV
retains 65,135 rows, sequential IDs, UTF-8 BOM, CRLF record terminators,
source line-break counts, and ordered runtime/control/markup tokens. Ambiguous
names, lore, item terms, poem readings, and gameplay wording are recorded in
`audit/open-questions.md`. Translation continues at ID 21500; no consolidated
linguistic review has been performed.

IDs 21500-21599 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The five-paragraph Alcyon lore entry retains its
source paragraph breaks. Uncertain names, lore terms, and idioms are recorded
in `audit/open-questions.md`. Translation continues at ID 21600; no
consolidated linguistic review has been performed.

IDs 21600-21699 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, and the English source's line-break counts.
The two-line Chakram stats and the recipe ingredient-list layout are preserved.
Context-dependent names, lore terms, and objective wording are recorded in
`audit/open-questions.md`. Translation continues at ID 21700; no consolidated
linguistic review has been performed.

IDs 21700-21799 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. Combat-stat lines, the donor list, and the attack
description layout are preserved. Uncertain names, mechanics, and lore terms
are in `audit/open-questions.md`. Translation continues at ID 21800; no
consolidated linguistic review has been performed.

IDs 21800-21899 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The four-paragraph Gallows End bestiary and dynamic
inn-cost variable are preserved. Uncertain lore terms, species, and source
phrasing are recorded in `audit/open-questions.md`. Translation continues at
ID 21900; no consolidated linguistic review has been performed.

IDs 21900-21999 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. Player-housing instructions, the signed letter,
damage-stat layout, and equipment tutorial markers are preserved. Ambiguous
titles, source wording, and lore names are recorded in
`audit/open-questions.md`. Translation continues at ID 22000; no consolidated
linguistic review has been performed.

IDs 22000-22099 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The player-housing tutorial markers, placeholder
order, and six-line fable stanza are preserved. Ambiguous lore, creature
names, source errors, and idioms are recorded in `audit/open-questions.md`.
Translation continues at ID 22100; no consolidated linguistic review has
been performed.

IDs 22100-22199 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The DLC warning, ability tutorial, combat stat, and
five-line ballad are structurally preserved. Ambiguous titles, ranks, names,
and lore are recorded in `audit/open-questions.md`. Translation continues at
ID 22200; no consolidated linguistic review has been performed.

IDs 22200-22299 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The five-line lore passage, arrow/ammo tooltip, and
item/ability marker wrappers are preserved. Ambiguous terms, names, and
reference disagreements are recorded in `audit/open-questions.md`.
Translation continues at ID 22300; no consolidated linguistic review has
been performed.

IDs 22300-22399 have Korean drafts in the translation map and working CSV.
All 100 entries match the map. The CSV retains 65,135 rows, sequential IDs,
UTF-8 BOM, CRLF record terminators, source line-break counts, and ordered
runtime/control markers. The eight-line poem, twelve-paragraph Scholia Arcana
history, and two-paragraph letter/signature structure are preserved.
Uncertain names, lore, and source/reference disagreements are in
`audit/open-questions.md`. Translation continues at ID 22400; no consolidated
linguistic review has been performed.

IDs 22400-22499 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map; 99 cells differed from the previous
draft, with the unchanged UI marker retained as-is. The CSV retains 65,135
rows, ID order, UTF-8 BOM, CRLF record terminators, source line-break counts,
and ordered runtime/control markers. The two-line ability description,
damage/cost layout, and all seven trainer placeholders are preserved.
Uncertain titles, names, and context are recorded in
`audit/open-questions.md`. Translation continues at ID 22500; no consolidated
linguistic review has been performed.

IDs 22500-22599 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, and the source's embedded line breaks.
The seven-paragraph diary, five-line ingredient recipe, combat-stat lines,
and runtime cost variable are preserved. Uncertain names, faction terms, and
context are recorded in `audit/open-questions.md`. Translation continues at
ID 22600; no consolidated linguistic review has been performed.

IDs 22600-22699 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, source line breaks, and English control
markers. The six-line poem, war-magic description, and ability tutorial
tokens are preserved. Uncertain lore terms, names, offices, and source
phrasing are recorded in `audit/open-questions.md`. Translation continues at
ID 22700; no consolidated linguistic review has been performed.

IDs 22700-22799 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, English placeholders/control markers,
and source line breaks. The five-line verse, equipment description, and
alchemy recipe layout are preserved. Reference disagreements, proper names,
and context-dependent terminology are recorded in `audit/open-questions.md`.
Translation continues at ID 22800; no consolidated linguistic review has
been performed.

IDs 22800-22899 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, exact English control-marker order, and
source line breaks. The two-paragraph sermon and 14-line poem are preserved.
Uncertain names, lore terms, item labels, and source phrasing are recorded in
`audit/open-questions.md`. Translation continues at ID 22900; no consolidated
linguistic review has been performed.

IDs 22900-22999 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, source markers, and embedded line breaks.
The alchemy recipe and five-line Anokatos confession retain their source
layout; the four-part formatted time token is unchanged. Uncertain ranks,
faction terms, names, and source phrasing are recorded in
`audit/open-questions.md`. Translation continues at ID 23000; no consolidated
linguistic review has been performed.

IDs 23000-23099 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, all control markers, and the source
recipe line breaks. The Level 1 familiar label and Sagecraft recipe use
provisional Korean terminology; the copyright line remains unchanged.
Ambiguous lore, names, and source wording are recorded in
`audit/open-questions.md`. Translation continues at ID 23100; no consolidated
linguistic review has been performed.

IDs 23100-23199 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, source line breaks, and the exact
`{*1Shield Bash}` marker. The three-song entry at ID 23185 retains all 78
source line breaks and its stanza spacing; combat values remain intact.
Uncertain names, effects, and lore are recorded in `audit/open-questions.md`.
Translation continues at ID 23200; no consolidated linguistic review has
been performed.

IDs 23200-23299 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, ID order,
UTF-8 BOM, CRLF record terminators, control markers, and source line breaks.
The 41-line Scion hymn and 14-paragraph Lionbeard tale preserve their 40 and
26 line breaks respectively. Uncertain mythic names, lore, and source
references are recorded in `audit/open-questions.md`. Translation continues
at ID 23300; no consolidated linguistic review has been performed.

IDs 23300-23399 have Korean drafts in the translation map and working CSV.
The CSV retains 65,135 rows, Japanese-template key order, UTF-8 BOM, CRLF
record terminators, source line breaks, and control/placeholders. The fable
at ID 23390 retains its seven source line breaks, and the invocation at ID
23397 retains its three.
Uncertain names, ranks, lore, and ritual wording are recorded in
`audit/open-questions.md`. No piecemeal linguistic review was performed.

IDs 23400-23499 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
markup/placeholders, and numeric values. Ambiguous game terms, names, and
source/reference disagreements are recorded in `audit/open-questions.md`.
Translation continues at ID 23500; no piecemeal linguistic review was
performed.

IDs 23500-23599 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
markers, and source numeric values. Uncertain names, lore, UI wording, and
reference questions are recorded in `audit/open-questions.md`. Translation
continues at ID 23600; no piecemeal linguistic review was performed.

IDs 23600-23699 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
markup/placeholders, and numeric values. The five-paragraph tale at ID 23631
retains its source paragraph breaks. Uncertain terms and lore are recorded in
`audit/open-questions.md`. Translation continues at ID 23700; no piecemeal
linguistic review was performed.

IDs 23700-23799 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
tokens, markup, and numeric values. The eight-line poem at ID 23758 retains
its source line breaks, and ability values/layout at ID 23785 are preserved.
Uncertain names, terminology, and source context are recorded in
`audit/open-questions.md`. Translation continues at ID 23800; no piecemeal
linguistic review was performed.

IDs 23800-23899 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
placeholders, and numeric values. The poems at IDs 23800 and 23811 preserve
their source line counts; ID 23895 retains its five-line structure.
Uncertain names, lore, and source phrasing are recorded in
`audit/open-questions.md`. Translation continues at ID 23900; no piecemeal
linguistic review was performed.

IDs 23900-23999 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
placeholders, markup, and numeric values. The jump/ability strings retain
their source markers, and `[DO NOT USE]` remains unchanged. Ambiguous names
and quest context are logged in `audit/open-questions.md`. Translation
continues at ID 24000; no piecemeal linguistic review was performed.

IDs 24000-24099 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
markers, placeholders, and numeric values. The six-part report at ID 24071
and the letter/location list at ID 24089 retain their source paragraph and
line-break layout. Ambiguous lore and item names are recorded in
`audit/open-questions.md`. No piecemeal linguistic review was performed.

IDs 24100-24199 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
tokens, markup, and quantities. Uncertain terms, proper names, and source
issues are logged in `audit/open-questions.md`. No piecemeal linguistic
review was performed.

IDs 24200-24299 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The CSV retains 65,135 rows, Japanese-
template key order, UTF-8 BOM, CRLF record terminators, source line breaks,
tokens, markup, and numeric values. Uncertain names, lore, and malformed
source phrasing are logged in `audit/open-questions.md`. Translation continues
at ID 24300; no piecemeal linguistic review was performed.

IDs 24300-24399 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows
and the Japanese-template key order; its UTF-8 BOM and CRLF record endings
are preserved. In IDs 24100-24399, translations match the map and preserve
the English source line-break counts and exact control/variable tokens.
Uncertain lore, terms, and names are logged in `audit/open-questions.md`.
Translation continues at ID 24400; no piecemeal linguistic review was
performed.

IDs 24400-24499 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows
and Japanese-template key order; its UTF-8 BOM and CRLF record endings are
preserved. IDs 24100-24499 match the translation map and retain English
source line-break counts and exact control/variable tokens. Uncertain lore,
terms, and names are logged in `audit/open-questions.md`. Translation
continues at ID 24500; no piecemeal linguistic review was performed.

IDs 24500-24599 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, and CRLF record endings. IDs
24100-24599 match the translation map and retain English source line-break
counts and exact control/variable tokens. The seven-day diary at ID 24594
retains its day headings and paragraph layout. Uncertain names and lore are
logged in `audit/open-questions.md`. Translation continues at ID 24600;
no piecemeal linguistic review was performed.

IDs 24700-24799 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, and CRLF record endings. IDs
24100-24799 match the map and preserve the English source line-break counts,
runtime variables, and markup tokens. Ambiguous names, UI terms, and source
errors are logged in `audit/open-questions.md`. Translation continues at ID
24800; no piecemeal linguistic review was performed.

IDs 24600-24699 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, and CRLF record endings. IDs
24100-24699 match the translation map and retain English source line-break
counts and exact control/variable tokens. The long notes at IDs 24641 and
24643 retain their paragraph structure and signature. Uncertain names and
context are logged in `audit/open-questions.md`. Translation continues at ID
24700; no piecemeal linguistic review was performed.

IDs 24800-24899 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, and CRLF record endings. IDs
24100-24899 match the map and preserve English source line-break counts and
runtime/control tokens. Long records and poems retain their source paragraph
and line layout. Uncertain lore and phrasing are logged in
`audit/open-questions.md`. Translation continues at ID 24900; no piecemeal
linguistic review was performed.

IDs 24900-24999 have Korean drafts in the translation map and working CSV.
All 100 target entries match the map. The full CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, and CRLF record endings. IDs
24100-24999 match the map and preserve English source line-break counts and
runtime/control tokens. Uncertain titles, numbers, names, and source wording
are logged in `audit/open-questions.md`. Translation continues at ID 25000;
no piecemeal linguistic review was performed.

IDs 25000-26999 have Korean drafts in the working CSV.
All 2,000 entries from IDs 25000-26999 match the translation map. The CSV retains 65,135 data rows,
Japanese-template key order, UTF-8 BOM, CRLF record endings, and source
paragraph breaks. Substitution tokens in ID 25115, numeric values in IDs
25203, 25214, and 25246, and paragraph structure in IDs 25143, 25146, 25193,
25208, 25237, 25317, 25379, and 25388 are preserved; the bribe-value token in
ID 25265 and numeric bonuses in IDs 25285 and 25328 are intact. Uncertain names, lore terms,
and source wording are recorded in `audit/open-questions.md`. Translation
paragraph layout in IDs 25468 and 25542, property/value tokens in IDs 25485
and 25543, and all four material quantities in ID 25499 are preserved.
Uncertain terms and context are in `audit/open-questions.md`. Translation
paragraph structure in IDs 25746 and 25748, the `{1}` placeholders in IDs
25619 and 25628, and numeric values in IDs 25741 and 25746 are preserved.
Uncertain terms and context are in `audit/open-questions.md`. Translation
IDs 26112, 26138, and 26173 preserve their numeric values and line breaks; the
format marker in ID 26106, chapter structure in ID 26150, and item quantities
in ID 26173 are preserved. Uncertain names, terminology, and the verse at ID
26146 are recorded in `audit/open-questions.md`. The next translation range
continues at ID 26200; no piecemeal linguistic review was performed. For IDs
26200-26299, numeric values, source line breaks, controller/format markers,
and the CSV BOM were verified against English. Open terminology, proper
names, and verse questions are recorded in `audit/open-questions.md`.
Translation continues at ID 26300 without a piecemeal linguistic review. IDs
26300-26399 also match the English line-break, number, marker, and row-count
checks; uncertainties are recorded in the audit. Translation continues at ID
26400 without piecemeal linguistic review. IDs 26400-26499 have also been
synced to the CSV. The line-break, numeric, marker, row-count, and BOM checks
are being maintained; open terminology and proper-name questions are logged
in `audit/open-questions.md`. IDs 26500-26599 are also synchronized and
validated for numeric values, source line breaks, control/variable tokens,
and full CSV structure. Translation continues at ID 26600; no piecemeal
linguistic review has been performed. IDs 26600-26699 are synchronized and
checked for paragraph/line structure, numbers, control markers, variables,
and full CSV shape. Remaining terminology and interpretation questions are
in `audit/open-questions.md`; translation continues at ID 26700. IDs
26700-26799 also pass CSV row/key, source line-break, number, marker, and BOM
checks. Proper-name and literary questions are logged for integrated review;
translation continues at ID 26800. IDs 26800-26899 were synchronized and
validated for row/key order, source line breaks, numeric values, UI markers,
and BOM. Open terminology and literary questions are recorded in the audit;
translation continues at ID 26900. IDs 26900-26999 are synced and validated
for structure, numeric values, placeholders, and controls; uncertainty notes
are in `audit/open-questions.md`. Translation continues at ID 27000.

IDs 27000-28099 have Korean drafts in the map and working CSV. The CSV retains
65,135 rows, Japanese-template ID order, UTF-8 BOM, CRLF record terminators,
and source line breaks, control markers, and numeric meaning across these
ranges. Proper-name, terminology, and context questions are recorded in
`audit/open-questions.md`; no piecemeal linguistic review was performed.
Translation continues at ID 28100.

The working map and CSV are reconciled through ID 42149. Detailed audit notes
are recorded through ID 37799 and for IDs 39750-42149; map coverage for
37800-39749 was verified continuous, but its detailed audit summaries still
need to be backfilled. The full CSV retains 65,135 rows,
Japanese-template ID order, UTF-8 BOM, and CRLF record terminators. IDs
35800-37699 match the English source line-break counts and preserve runtime
markers, variables, and visible marker numbering; translated marker labels
are expected to differ from English. IDs 36000-37699 are synchronized with
the translation map (1,700/1,700 entries). Numeric values in IDs 36200-37699
match their English sources in value and order. Uncertain names, lore, source
errors, and conflicting English/Japanese readings are recorded in
`audit/open-questions.md`. IDs 37000-37699 match the English line-break and
markup/runtime-token checks (700/700). Numeric values and order match except
that the literal-digit checker reports `November`/`11월` and `ten years`/`10년`
and `four generations`/`4대` (including `ten years`/`10년` at 37697) as
textual-form differences; their values are preserved. IDs 37700-37799 are
synchronized with the map (100/100); English line-break counts, runtime tokens,
and numeric values/order match. ID 37797 retains all 10 source line breaks.
Uncertain names and lore are recorded in `audit/open-questions.md`.
IDs 39750-41349 are synchronized with the map (100/100 each); source keys,
line breaks, runtime tokens, and numeric values/order were checked. IDs 39910
and 40039 retain their source line structure; IDs 39927, 39999, and 40037
preserve runtime tokens. Values 7, 30%, 80%, and 13 seconds are unchanged.
The spellings `second`/`2`, `five`/`5`, and card rank words/digits at IDs
40005, 40019-40020 are equivalent localized number forms. Translation
IDs 40101 and 40183 retain their source paragraph/verse layout; ID 40219
retains five verse lines. Runtime tokens in IDs 40167, 40174, and 40191 are
preserved; numeric values are unchanged. `January`/`1월` and `ten years`/`10년`
are localized forms. IDs 40252 and 40303 preserve paragraph structure; ID
40290 keeps its blank line. Variables in IDs 40303 and 40325 retain their
identifiers and order, with 40325 display labels localized. Values `5 years`
and `2 years` at 40262 and 40291 remain unchanged. IDs 40450-40549 preserve
English line-break counts, runtime-token structure, and numeric values/order.
The six-line passage at 40452 and three-paragraph chronicle at 40473 retain
their source layout. ID 40546 uses the official glossary term `마법물품 제작`
for `Sagecraft`. Uncertain names and source wording are logged in the audit.
IDs 40550-40649 preserve English line-break counts, runtime-token structure,
numeric values/order, and the official 65,135-row CSV shape. The eight-line
poem at 40567 and four-paragraph doctrine at 40628 retain their source layout.
IDs 40650-40749 also pass key/order, line-break, token, and numeric checks; the
two-line modifier at 40664 retains +5 and +10%. IDs 40750-40849 likewise
preserve keys, line breaks, runtime tokens, and numeric meaning. ID 40825
renders `seven o'clock` as `7시`; the time value is unchanged. The poem at
40839 retains five lines, and 40843 remains one paragraph. Uncertain terms are
logged in the audit. IDs 40850-40949 also pass source line-break, token,
number, key-order, and BOM checks. IDs 40950-41049 preserve the same structure,
including the two-line poison/lightning modifiers, the six-line verse, and the
`LINE_SPACE`/`LINE_LEFT` markup. IDs 41050-41149 also preserve keys/order, line
breaks, tokens, and numeric meaning. ID 41121 keeps +100%, 6 kills, 15 seconds,
and 30% Mana in source order; `twelve days`/`12일` at 41124 is a word-to-digit
equivalent. The incomplete marker `{*1` at 41095 is unchanged. IDs 41150-41249
preserve source line breaks and token order, including the multi-section
level/XP tutorial and rarity markers. `second`/`2`, `Ten`/`10`, `zero`/`0`,
and `twenty`/`20` are equivalent number forms. IDs 41250-41349 also pass
key/order, source line-break, token, number, and BOM checks. The four-part
passage at 41256 retains its three paragraph breaks; gameplay values at 41265,
41307, and 41343 are unchanged. IDs 41350-41449 are synchronized with the map
(100/100); keys, source line breaks, and control-token structure/order were
checked. ID 41367 retains its four journal sections; ID 41413 retains both
`*1` marker identities/order with localized display labels; ID 41438 retains
`{*2{1}}`, and ID 41443 retains `[DO NOT USE]`. The +15 Mana-per-hit and
+20%/24 Health values at IDs 41433 and 41441 are unchanged. Open terminology
and context questions are logged in the audit. IDs 41450-41549 are
synchronized with the map (100/100); all four language CSVs retain 65,135 rows,
matching key order, BOM, and CRLF. Source line breaks, marker/variable order,
markup, and numeric values were checked with no mismatches. ID 41521 retains
all five poem lines, and the 40%/225 Poison values at 41515 are unchanged.
Open terminology and context questions are logged in the audit. IDs
41550-41649 are synchronized with the map (100/100); all four language CSVs
retain 65,135 rows, matching key order, BOM, and CRLF. Source line breaks,
control markers, variables, markup, and numeric values were checked with no
mismatches. IDs 41561 and 41620 preserve their ordered `*1` markers and
`LINE_SPACE`; potion quantities remain unchanged, including `4` antelope at
41647. The five-line poem at 41521 and four-line poem at 41630 retain their
source layouts. IDs 41650-41749 are synchronized with the map (100/100);
source line breaks, control markers, variables, markup, and numeric values
were checked with no mismatches. The Elemental-resistance recipe at 41698
retains Star Thistle (2) and Ysa's Breath (2); `Second`/`제2차` and
`last decade`/`10년` preserve their numeric meaning. Open questions for the
historical claim at 41743 and the paired-artifact name at 41749 are in the
audit. IDs 41750-41849 are synchronized with the map (100/100); source line
breaks, control markers, variables, markup, and numeric values were checked
with no mismatches. IDs 41766 and 41789 retain every defense value and source
line; ability markers in 41817/41840 and the inn-cost variable at 41825 are
preserved. IDs 41850-41949 are synchronized with the map (100/100); source
line breaks, control markers, variables, markup, and numeric values were checked with no
mismatches. The three paragraphs at 41917 and `{*1}` at 41928 are preserved;
the full Havok copyright text, `LINE_CENTER`, and 1999-2012 at 41940 remain
unchanged. IDs 41950-42049 are synchronized with the map (100/100); source
line breaks, control markers, variables, markup, and numeric values were
checked with no mismatches except `Second`/`제2` at 42039, an equivalent
ordinal. The eight-line poem at 42007 and four-line poem at 42028 retain their
source layouts; the 25-item count and +15% modifier are unchanged. IDs
42050-42149 are synchronized with the map (100/100); source line breaks,
control markers, variables, markup, and numeric values were checked with no
mismatches. The four-line journal at 42093, three-line modifier at 42099, and
`{1}` variable at 42074 are preserved. Values 2%, 140%, and 60% at IDs
42100/42105 are unchanged. IDs 42150-42249 are synchronized with the map
(100/100); all four CSVs retain 65,135 rows, matching key order, UTF-8 BOM,
and CRLF record endings. Source line breaks, control tokens, and numeric
sequences in the new range were checked with no mismatches. The five-paragraph
Barufakir journal at 42154, six-line poem at 42198, two-stanza poem at 42203,
and five-paragraph Cripplespore Cap journal at 42240 retain their source
layouts. IDs 42250-42349 are synchronized with the map (100/100); all four
CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and CRLF record
endings. Source line breaks, control tokens, and numeric sequences in this
range were checked with no mismatches. The `{*5}` DLC marker, both loan-cost
variables, `{1}` score variable, and 60% potion recipe quantities are
preserved. `Galin` at IDs 42312 and 42421 is retained in the English spelling.
IDs 42350-42449 are synchronized with the map (100/100); all four CSVs retain
65,135 rows, matching key order, UTF-8 BOM, and CRLF record endings. Source
line breaks, control tokens, and numeric sequences were checked with no
mismatches. The four-paragraph combat instructions at 42400 preserve all
three costs/damage values; the `{*1}` Mana labels, 50-lock count, 13% chance,
and 160 bonus damage are unchanged. No consolidated linguistic review has
been performed. IDs 42450-42549 are synchronized with the map (100/100); all
four CSVs retain 65,135 rows, matching key order, UTF-8 BOM, and CRLF record
endings. Source line breaks and runtime/control markers were checked with no
mismatches. The 30%/25%/20%/30% effect values and 10/300-second durations at
42458, `{*3Leech}` marker, `{1}`-`{4}` movement variables, 130 damage, and 60
Mana are preserved. Chapter `III` at 42517 is localized as `제3장`. No
consolidated linguistic review has been performed. IDs 42550-42649 are
synchronized with the map (100/100); all four CSVs retain 65,135 rows,
matching key order, UTF-8 BOM, and CRLF record endings. Source line breaks,
control markers, and numeric values were checked with no mismatches. The
11-line verse at 42600 and long narrative at 42617 retain their source
structure; `LINE_BULLET`, `{*3}`, 15 poison glands, +5% resistance, and +8%
resistance are preserved.
IDs 42650-42749 are synchronized with the map (100/100); all four CSVs retain
65,135 rows, matching key order, UTF-8 BOM, and CRLF record endings. Source
line breaks and control markers were checked with no mismatches. The 6-break
Warsworn memo at 42692, 4-line lore at 42707, and 10-entry journal at 42748
retain their layouts. The XII section number, 10 journal-entry ordinals,
`{*1}` labels, 50%/70 Mana effect, 16/40% Chakram values, and recipe
quantities are preserved; Roman and word ordinals are localized to Korean.
No consolidated linguistic review has been performed.

For `base`, IDs 0-4843 have Korean drafts. The CSV has 4,844 data rows; its
Japanese-derived keys, variants, and order match the template, and UTF-8 BOM
and CRLF record endings are preserved. ID 2959 is a source placeholder
(`???`) and remains unchanged. Uncertain names and terms are recorded in
`audit/open-questions.md`.

## Workflow

1. Complete all `base`, `affix`, and `default` rows as one translation goal.
   Continue across resource boundaries without stopping at small ID batches.
2. Preserve IDs, variant codes, ordering, row multiplicity, tokens, markup,
   line breaks, delimiter, and encoding. Change only `Texto`.
3. Record uncertain names, lore, context, and conflicting reference evidence
   in `audit/open-questions.md`; do not guess or stop clear entries.
4. Do not conduct piecemeal linguistic review while drafting. After all three
   drafts are complete, review the full resources and accumulated audit
   documents together in one consolidated pass.
5. Perform destination-locale structure and repacking validation only after
   the linguistic drafts and consolidated review.

No localization binaries or PAK files have been rebuilt.

## Historical Checkpoint Notes

The checkpoint notes below are retained as work history. Their batch-oriented
next-step statements are superseded by the current status at the end of this
document.

`default` is synchronized through ID 64149; the next 100-row batch is
64150-64249. The translation map is continuous from ID 100 through 64149.
All four CSVs retain 65,135 data rows, matching key order, UTF-8 BOM, and
CRLF record endings. IDs 64050-64149 preserve Japanese-template line-break
counts and runtime-marker identities/order. Recipe ingredient lists,
quantities, the Poison Cloud numeric values, and all multiline structures are
intact. Source questions are in `audit/open-questions.md`.
IDs 63950-64049 preserve Japanese-template line-break counts and runtime-
marker identities/order. Markup at 63998/64038, the `{1}` die result, two-
line Chaos effect, and five-line poem are intact. Source questions are in
`audit/open-questions.md`.
IDs 63850-63949 preserve Japanese-template line-break counts and runtime-
marker identities/order. The deed paragraph break, localized markup, and
room-price variable at 63942 are intact. Source questions are in
`audit/open-questions.md`.
IDs 63750-63849 preserve Japanese-template line-break counts and runtime-
marker identities/order. The Basilica entry and three poems retain their
lineation; the Varani chapter has nine breaks and the `{3}/{2}/{1}/{4}`
variable order at 63818 is intact. Source questions are in
`audit/open-questions.md`.
IDs 63650-63749 preserve Japanese-template line-break counts and runtime-
marker identities/order. The Erathi letter and ship manifest retain their
paragraph structures; `{LINE_CENTER}` and localized `{*1...}` marker
positions are intact. Source questions are documented in
`audit/open-questions.md`.
IDs 63550-63649 preserve Japanese-template line-break counts and runtime-marker
identities/order; both `{LINE_SPACE}` markers at 63638 are intact. Source/context
questions are documented in `audit/open-questions.md`.
IDs 63450-63549 preserve Japanese-template line-break counts and runtime-marker
identities/order. Both poems, numeric effects, and the profile variable are
intact. IDs 63429, 63443, and source/context questions are documented in
`audit/open-questions.md`.
IDs 63350-63449 preserve Japanese-template line-break counts and runtime
markers; English/Chinese ID 63429 alone has a separate terminal-period break.
Keystone chronicle lineation, localized recipe/Chaos Portal markers, and
numeric effect values are preserved. Terms and source-context questions are
in `audit/open-questions.md`.
IDs 63250-63349 preserve Japanese-template line-break counts and runtime-marker
identities/order. Keystone chronicle lineation, localized recipe/Chaos Portal
markers, and numeric effect values are preserved. Terms and source-context
questions are in `audit/open-questions.md`.
IDs 63150-63249 preserve Japanese-template line-break counts and
runtime-marker identities/order. Writ/codex spacing, journal and poem
layouts, localized inline markers, and effect values are preserved. Names,
lore, and source-context questions are in `audit/open-questions.md`.
IDs 63050-63149 preserve Japanese-template line-break counts and
runtime-marker identities/order. Reagent instructions and multiline
journal/codex paragraphs match template breaks. Names, lore, and
source-context questions are in `audit/open-questions.md`.
IDs 62950-63049 preserve Japanese-template line-break counts and
runtime-marker identities/order. The eight-line poem at 62966 and
reagent-list lineation at 63033 are preserved; percentage values remain
intact. Source names, terms, and context questions are in
`audit/open-questions.md`.
IDs 62850-62949 preserve Japanese-template line-break counts and
runtime-marker identities/order. The five-line poem at 62867 and
`$SQ62.poison_cost$` variable at 62908 are preserved. Source names, terms,
and context questions are in `audit/open-questions.md`.
IDs 62750-62849 preserve Japanese-template line-break counts and
runtime-marker identities/order; no line breaks or runtime markers occur in
that range. Names, item terminology, and source-context questions are in
`audit/open-questions.md`.
IDs 62650-62749 preserve Japanese-template line-break counts and
runtime-marker identities/order. Three Sceptre markers at 62699, the
`#NAMED_ICON_360_A#` control at 62602, and effect values are preserved.
IDs 62550-62649 also preserve Japanese-template line-break counts and
runtime-marker identities/order. The long Engar death account at 62597
retains its layout; `{*3...}` at 62612 is preserved. IDs 62450-62549 also
preserve Japanese-template
line-break counts and runtime-marker identities/order, except English ID
62537 has three embedded breaks while Japanese has none; Korean follows the
Japanese template. The Almain codex at 62500, poems at 62491/62520, and
numeric effect at 62472 retain their structures/values. IDs 62350-62449 also
preserve Japanese-template line-break counts and runtime-marker identities/
order. The nested level/line markers at 62389 and passive label plus line
break at 62397 are preserved; `#NAMED_ICON_PLUS#` is intact. IDs 62250-62349
also preserve Japanese-template
line-break counts and runtime-marker identities/order. The Embereyes research
entry at 62263 and three dated journal entries at 62300 retain their
paragraph structure. `{LINE_INDENT}`, `#NAMED_ICON_PLUS#`, and all `{1}`
markers are preserved. IDs 62150-62249
also preserve Japanese-template line-break counts and runtime-marker
identities/order. The Canneroc account at 62222 and recipe at 62212 retain
their lineation; the three Chakrams tutorial markers at 62165 are in source
order. IDs 62050-62149
also preserve Japanese-template line-break counts and runtime-marker
sequences. The letter at 62070 and nine-sector report at 62132 retain their
lineation; `$(0)`, `{1}`, and effect values are preserved. IDs 61950-62049
also preserve Japanese-template line-break counts and runtime-marker
sequences; the letter at 61977 and 4-line effect description at 62038 retain
their layouts. `{LINE_BULLET}` markers and all values are preserved.
IDs 61850-61949 also preserve
Japanese-template line-break counts and runtime-marker
sequences; the threat at 61854 and hammer modifiers at 61871 retain their
layouts. Hierophant, Authority, Sorrows, Pledgeshield, names, and lore
uncertainties are recorded in `audit/open-questions.md`. For IDs 61150-61449,
Japanese-template line-break
counts and runtime marker sequences match the Korean drafts. The marker
order in the Chaos tutorial (61394) and inventory-category tutorial (61434)
was checked against English. IDs 61450-61649 also match Japanese-template
line-break counts and runtime marker sequences except ID 61578: the
Japanese row is unrelated to the English/Chinese slave-trafficking contract,
so Korean follows the English/Chinese six-break layout. ID 61600 is an
incomplete English UI phrase that also differs from Japanese. These source
alignment questions and other open terms are recorded in
`audit/open-questions.md`. IDs 61650-61849 also match Japanese-template
line-break counts and runtime marker sequences; the Mairu origin history at
61685 and Atarum Price chronicle at 61754 retain their paragraph layouts.
At ID 61774, English `Testament` differs from Japanese/Chinese `Belen
Covenant`; the draft follows English provisionally. The consolidated
linguistic review remains deferred until all three resources are drafted.

## Current Status (2026-10-06)

All Korean translation drafts are complete: `base` 4,844 rows, `affix` 3,311
rows, and `default` 65,135 IDs. Integrated linguistic review is still
pending. Existing review/edit documents cover only `default` IDs 0-49 and
50-99; they are not a full review or user approval. Open linguistic and
source-context questions remain in `audit/open-questions.md`.

Build compatibility is not established. A key comparison found that the
Japanese-derived work `base` and `default` structures match `en_us`, but work
`affix` has 3,311 rows while `en_us` has 586 `FF` rows. The planned
distribution slot must be confirmed and the target-specific `affix` structure
resolved before repacking.

The three `src/lang/locatexts_en_us.koalocatext_*` files are byte-identical
to the original English PAK resources. They are not the final Korean
binaries. The Korean PAK comparison suggests a 34-file distribution delta:
three localization binaries, 30 font files, and
`locatexts_en_us.characterset`. No final Korean localization binaries or
rebuilt PAK have been produced, and there has been no in-game validation.

The no-edit CSV/binary/CSV round trips passed for the three resource types
with the local toolset; one Korean `base` replacement string also survived
the round trip. The full PAK build and game test remain pending. Follow
`DISTRIBUTION_CHECKLIST.md` for remaining gates and the user-directed
pre-review sequence.
