# Preliminary Language Scan: `default` IDs 25351-25400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25351-25400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25351-25354 | Adessa / rescue from wreck / trade offer / Idylla | Standardize place names and preserve the survivor's limited-support offer, rescue action, and unspecified quantity. | Korean retains the offer and that one person was pulled from water by the wreck; ID 25353 keeps its tokenized amount. | Medium |
| 25356-25358 | Sir Creth / Health-Fate-Mana / Wulflacs / Gizela / Camden | Verify names and official stat terms; retain the consequence that killing one Wulflac prevents helping Gizela learn what happened to Camden. | Korean renders Health as `체력` and describes one of the Wulflac couple; the source's family/relationship wording is less explicit. | High |
| 25361 | Warsworn | Standardize the faction spelling and preserve the speaker's self-deprecating surprise at needing to fight. | Korean keeps the rhetorical joke and uses `워스워른`; related rows use other spellings. | Medium |
| 25362-25365 | hesitant speech / balance / “It was as he wished” / country names | Preserve hesitation and the assertion that the outcome was the deceased person's wish; verify the pronoun antecedent if context becomes available. | Korean retains the unfinished hesitation and the speaker's denial of lying; no row-level context resolves “he.” | Medium |
| 25366-25368 | Handwritten Note from Alyn Shir / House sundering / Cloudcrest Mountain / Hollowlands | Standardize Alyn Shir's name and places; determine whether House tenants are dead, displaced, or emotionally lost. | Korean calls the note a handwritten letter and uses `알린 시르`; “tenants are already lost” becomes that residents have lost heart, while Chinese suggests people have dispersed. | High |
| 25371-25374 | Great Library / Telling / St. Eadric / Authority | Standardize the named tradition and religious title; preserve that the Telling is unraveling and nature's patterns reveal the Authority's design. | Korean renders Telling as `전승` and Authority as `창조주`; capitalized English may denote a setting-specific entity. | High |
| 25375 | Corialia Scathe | Verify the character's canonical Korean rendering. | Korean uses `코리알리아 스케이스`; other locale spellings differ. | Medium |
| 25378-25380 | Fate Shrine / Mairu / Apotharni / Kreios / Kollossae / Midden | Standardize ritual/deity/group names and preserve the poem and the claim that Tuatha turned the Winter cradle into a foul pit. | Korean retains the stanza layout and core events; its “stolen” wording at Midden is more specific than English “taken.” | High |
| 25383-25385 | Font / western Faelands / Webwood / Hollow | Verify whether Font and Hollow are named setting concepts and standardize the regions; preserve the silk-town history. | Korean marks Font as `샘(Font)` and transliterates Hollow as `할로우`; the localized forms vary. | High |
| 25386 | gladiator pit | Determine whether this means the arena itself, a holding area, or a pit associated with gladiators. | Korean says `검투사 경기장`; Japanese uses a gladiator waiting area and Chinese reads it as a tomb, so context is needed. | High |
| 25388 | six-line poem for Dara / lake and loch / “a century's task” | Preserve six lines and clarify the two water-feature references and the claim that a century's labor seems effortless for Dara. | Korean retains all six lines and the comparison; English distinguishes “lake” and “loch,” while the Korean reads them as a lake and a smaller lake. | High |
| 25389-25393 | Sir Creth / House of Ballads / Canneroc / Warden Adwold / Castellan | Standardize names and roles; clarify the security arrangement and the source's “Your lords and master” grammar. | Korean uses `경비대장` for Warden and resolves the malformed plural phrase to a singular lord/master; Chinese instead reads the role as jailer. | High |
| 25395-25396 | Sun Camp grave entrance / “train one” | Standardize the camp name and identify what person or creature is to be trained. | Korean preserves the secret grave entrance and translates “train” as animal training; the antecedent is absent from the isolated row. | Medium |
| 25399-25400 | Mitharu / church friends / Scholia Arcana | Standardize the deity and institution names while preserving the church's welcoming register. | Korean keeps the inclusive blessing and uses `스콜리아 아르카나`; Japanese/Chinese describe the latter as a university/academy. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 25350-25354, 25356-25358, 25361,
  25366-25368, 25371-25375, 25378-25380, 25383-25386, 25388-25389,
  25391-25393, 25395-25396, and 25399 against the active locale rows.
  Name/stat consistency, the Wulflac consequence, Alyn Shir and House imagery,
  Telling/Authority, poem structure, Font/Hollow, gladiator-pit meaning,
  Castellan/Warden roles, the training antecedent, and Mitharu remain open.
- Cross-checked recurring forms for Adessa, Idylla, Sir Creth, Wulflac,
  Gizela, Camden, Warsworn, Alyn Shir, Cloudcrest Mountain, Hollowlands,
  St. Eadric, the Telling, Authority, Corialia Scathe, Fate Shrine, Mairu,
  Apotharni, Kreios, Kollossae, Midden, Tuatha, Font, Webwood, Canneroc,
  Warden Adwold, and Mitharu.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25351-25400 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales. The poem at ID
  25379 retains its stanza/line structure; the six-line poem at ID 25388 has
  matching line breaks.
- Runtime-token signatures match, including
  `$DLC1_Diplomacy.trade_cost_medium$` and `#NAMED_ICON_GOLD#` at ID 25353.
- Numeric and event order are retained. No structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25351-25400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25401.
