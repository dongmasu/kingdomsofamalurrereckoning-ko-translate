# Preliminary Language Scan: `default` IDs 13300-13349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13300-13349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13300 | double-negative Fate line | Preserve the deliberately confusing double negative, but confirm the intended meaning in scene context. | English says Fate “didn't not knock”; Korean likewise means Fate did knock, while Japanese omits the second negative and Chinese says Fate did not come for the speaker. Historical question remains open. | High |
| 13302-13303 | Maid of Windemere / House of Pride | Align the Maid title and the House's proper-name form with established faction/lore terminology. | The Korean draft includes the English title parenthetically and uses `긍지의 집`; the isolated House question remains unresolved. Historical questions remain open. | Medium |
| 13304 | Embereyes / Alanter Renalus | Verify the ingredient's established Korean form and the author's name; preserve the book-title structure. | Korean retains both English names in parentheses. Other locales transliterate or translate Embereyes differently. Historical question remains open. | Medium |
| 13305 | Ascension / Linza Aimar / trailing whitespace | Clarify whether Ascension is a named rite and what the “sixty perilous nights” describes; preserve the exact trailing character pending format review. | English and Chinese end with U+00A0; Japanese has no trailing space; active Korean ends with the six literal characters `\\u00a0`, not U+00A0. The historical note that the Korean NBSP was retained does not match the current CSV. | High |
| 13306 | Wulf Godfrey diary / Skald Atlas / Chaos Realm | Review the 17-entry voice progression, names, and source's Day 27 craft/assignment sequence together. | The source calls the dagger one crafted by Skald for Red Idward, then says the work was entrusted to Wulf. Korean preserves that tension. The 17 `{LINE_INDENT}` and 16 `{LINE_NEXT_PAGE}` markers match all locales. Historical question remains open. | Medium |
| 13310 | Amman the Clever | Confirm the Korean rendering of the epithet and whether “the Clever” is a formal name/title. | Korean renders it as `영리한 아만`; Japanese and Chinese also treat it as an epithet. Historical question remains open. | Medium |
| 13312 | Warsworn / `services in kind` | Clarify whether the phrase means in-kind compensation or services/amenities provided to members. | English is ambiguous; Japanese and Chinese lean toward in-kind provision, while Korean says lodging and comparable conveniences. Historical question remains open. | Medium |
| 13314 | Apule / Calovar / lone Fae | Verify both names and whether “lone” means solitary/isolated; retain the south-cliff location. | Korean keeps the location and suspicion but renders `lone Fae` as `외로운 페이`, which may imply emotion rather than isolation. Historical question remains open. | Medium |
| 13316 | Cillian Keen / Rat / Gravehal Keep | Determine whether capitalized `Rat` is a named creature/type and align the Keep's Korean form. | Korean describes a pet rat/mouse and names the trainer and Keep; capitalization/context may signal a specific creature. Historical question remains open. | Medium |
| 13319 | cards read / gamble / dice | Preserve the playful offer of both fortune-telling and gambling, and check the speaker's voice. | Korean keeps the two alternatives and dice gambling; English and Japanese explicitly mention rolling dice. Historical question remains open. | Low |
| 13321 | Malthon / leanashe / Meathgra / Alfar | Verify creature/race names and preserve the sequence of removing the food supply by cremating Alfar corpses to drive Meathgra back. | Korean retains the causal sequence and named entities. Whether `leanashe` is a formal creature name and the canonical forms remain open. Historical question remains open. | Medium |
| 13322 | `Default Statue Name` -> `기본 석상 이름` | Determine whether this is a development fallback label or player-facing text before deciding whether to translate. | All locales translate the string, but the English explicitly looks like a default/debug label. Historical question remains open. | Medium |
| 13324 | Hierophant / one of three keys | Preserve the speaker's surprise that the received key is only one of three required keys. | Korean retains the prediction and question; the precise referent of “the treasure” remains contextual. Historical question remains open. | Low |
| 13326 | Warsworn / steel and valor against Chaos | Align the faction name and review the elevated, martial register. | Korean preserves the old Warsworn's brave tales and the steel/valor opposition to Chaos. Historical question remains open. | Low |
| 13328 | `who - or what -` / caravan attacks | Preserve the deliberate uncertainty about whether attackers are people or creatures. | Korean retains both alternatives. Its `대상들` can also be read as “targets,” so confirm that the caravan sense is clear in context. Historical question remains open. | Medium |
| 13332 | `Master's Pick` -> `달인의 자물쇠따개` | Identify whether `Pick` means a lockpick, a pick/tool, or a selection before fixing this item label. | English is isolated and Japanese transliterates “pick”; Korean narrows it to a lockpick. | Medium |
| 13333 | `the Weave` / Fate Magic | Confirm whether the capitalized Weave is a named cosmological concept and use the established Korean term. | Korean's `짜임` is a literal rendering; English capitalization and the Fate Magic context may indicate a glossary term. | Medium |
| 13339 | `#NAMED_ICON_360_Y#` / Secondary Weapon | Preserve the icon token byte-for-byte and verify the official UI term in the integrated terminology pass. | The token is identical and in the same position across all four locales; Korean label `보조 무기` conveys the category. Historical question remains open. | Low |
| 13340 | Weeping King / Delvers / function / art | Clarify what function or power the King performed and align Delvers with established terminology. | Korean retains the sequence that Delvers witnessed and imitated the King's power, and that only the speaker now retains the art. Historical question remains open. | Medium |
| 13342 | Zefwyn Lan / Cape Solace / camp direction | Resolve the map-direction conflict before any disposition. | English, Chinese, and Korean place the camp north of the village; Japanese says west. Follow English provisionally. Historical question remains open. | High |
| 13344 | `Good tidings, Beckoned` / Primos | Align the archaic greeting and formal role names with established terms. | Korean's `반가운 소식이군` can read as announcing news rather than greeting someone; the Beckoned and Primos forms also need glossary review. Historical question remains open. | Medium |
| 13346 | Fateweaver / overcoming anything | Preserve the contrast between youthful confidence and the speaker's present limits. | All four versions retain this contrast; verify the official Fateweaver form. Historical question remains open. | Low |
| 13348 | Blood Plague / Didenhil / Brother Fallon | Interpret the malformed English cautiously; retain that most Didenhil residents are sick and Fallon was expected to bring more medicine. | Korean supplies the implied subject and relation without changing the stated situation. Align Blood Plague and Brother Fallon forms with recurring usage. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions at IDs 13300, 13303-13306, 13310,
  13312, 13314, 13316, 13319, 13321-13322, 13324, 13326, 13328, 13339-13340,
  13342, 13344, 13346, and 13348 against active Korean and all three source
  locales. They remain preliminary questions; no historical disposition was
  treated as approval.
- Added current-pass terminology/meaning candidates at IDs 13332 (`Master's
  Pick`) and 13333 (capitalized `Weave`).
- ID 13305 has a concrete trailing-character mismatch: Korean stores the
  literal escape spelling rather than the source U+00A0. ID 13306 has
  physical newline-count differences across locales; token sequence and
  counts remain aligned.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Runtime-token signatures match throughout. ID 13306 contains 17
  `{LINE_INDENT}` and 16 `{LINE_NEXT_PAGE}` markers in every locale; ID 13339
  retains `#NAMED_ICON_360_Y#` in the same position.
- Physical embedded line breaks differ only at ID 13306: English/Korean have
  0, Japanese 1, and Chinese 5. The current Korean follows English's
  one-line CSV field, not the Japanese/Chinese physical breaks.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13300-13349 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13350-13399.
