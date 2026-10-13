# Preliminary Language Scan: `default` IDs 8000-8049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8000-8049.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8001 | `Amphora` → `암포라` | Confirm whether this is a named quest object or a generic two-handled vessel before choosing a more specific Korean term. | The isolated question gives no object context; Korean preserves a transliteration. | Low |
| 8003 | `enter` → `Enter 키` | Retain this as a key prompt and follow the game's Korean keyboard-label convention. | English and Japanese keep the literal key name; Korean explicitly identifies the Enter key, supported by historical UI notes. | High |
| 8007 | `his beads` → `그의 구슬` | Keep the objective generic; do not infer a necklace, ritual beads, or the referent of `his`. | The source gives no further object/person context; Korean preserves that ambiguity. | Medium |
| 8012 | Arkes / Ethene names and recollection | Standardize both names against the English spellings and preserve the trailing fragment/recollection. | Korean follows the English-linked names and retains both ellipsis-separated memories; Japanese uses divergent phonetic forms. | Medium |
| 8018 | `Dvergan custom` / auroch gift | Confirm Dvergan as a people-name and use a precise Korean animal term for auroch; retain the speaker's tentative inference. | Korean marks the customary interpretation as `듯` and preserves the auroch as `오록스`. | Medium |
| 8020 | capitalized `Counsel` → `참모` | Keep its importance while determining whether Counsel is an advisor, person, or named object. | English capitalizes Counsel but provides no referent; Korean chooses the plausible role `참모`. | Medium |
| 8024 | `rip him from you` → `네게서 억지로 끄집어내야` | Preserve the forceful threat without specifying possession, attachment, or the mechanism. | The line omits what `him` is attached to; Korean retains an unspecified forced removal. | Medium |
| 8032 | `What cost the lot by sea?` → `전부를 배로 보내면 ... 운송비` | Confirm from trading context that the speaker asks the sea-freight cost for the entire shipment. | English is compressed/ungrammatical; Korean follows the likely shipping-cost reading, while Japanese asks cargo freight. | Medium |
| 8036 | six-paragraph Pteryx field note | Preserve all six paragraphs, the scientific voice, species/race names, Alpha reference, and the hollow-bone/storm-magic mechanism. | Korean retains six paragraphs and the predator ecology, broken-bone risk, agility, bone-channelled magic, group tactics, and trophy custom. Name spellings remain a corpus consistency matter. | Medium |
| 8039 | `crudok` / `Bloodbane` | Determine Bloodbane's referent and standardize both creature/name terms; retain the unusual prey relationship and prior lack of threat. | Korean preserves Crudok hunting gnomes and Bloodbane's unusual threat, but the isolated row does not identify Bloodbane. | Medium |
| 8042 | `Fateless One` → `운명 없는 자` | Use the project-standard formal player title and preserve the teasing quiz tone. | English capitalizes the title; Korean renders it as a title-like phrase. Chinese supports an “unfated” form, while Japanese uses the established “one without fate” sense. | Medium |
| 8043 | `Vengeance` → `복수의 집` | Confirm this is the named House/faction and keep it distinct from abstract vengeance. | Korean supplies `의 집`, matching the related historical terminology question. | Medium |
| 8044 | Evasion Chance / +50% | Preserve both paragraphs and confirm the value is a probability/stat rather than a flat evasion score. | Korean retains the two-line structure and `+50%` chance wording. | Medium |
| 8046 | Scholia Arcana grounds / glyph imprisoning Sydanus | Preserve the causal image that the grounds themselves form the spell/glyph; verify names and magical terminology. | Korean states the site was made into the imprisoning spell and names Sydanus; exact spell/grounds relation merits context review. | Medium |
| 8049 | `Charter` → `허가장` | Keep the sale and resulting windfall, but confirm whether Charter means a legal charter, franchise, or business right. | Korean says the permit/charter was sold and preserves the large amount of gold without specifying its legal category. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8001, 8003, 8007, 8012, 8018, 8020,
  8024, 8032, 8036, 8039, 8042-8044, 8046, and 8049.
- ID 8001 retains Amphora as a transliterated object. ID 8003 treats `enter`
  as a key label. ID 8007 does not invent what kind of beads or whose they are.
- ID 8012 keeps both names and the trailing recollection. ID 8018 preserves
  the tentative Dvergan-custom inference and auroch gift. ID 8020 leaves
  Counsel's referent open. ID 8024 retains the forced-removal threat without
  resolving the mechanism.
- ID 8032 uses the likely sea-freight reading. ID 8036 keeps all six
  paragraphs and the field-note voice; creature/race terms remain candidates.
  ID 8039 preserves Crudok, gnomes, and Bloodbane without identifying the
  latter.
- IDs 8042-8043 keep Fateless One as a title and Vengeance as a named place or
  group. ID 8044 retains both paragraphs and +50%. ID 8046 preserves the
  grounds/glyph relationship. ID 8049 leaves Charter's legal sense open.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales. The
  six-paragraph record at ID 8036 retains its paragraph structure.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales.
- No active CSV structure or text was changed.

## Batch Status

IDs 8000-8049 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
