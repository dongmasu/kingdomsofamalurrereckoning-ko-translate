# Preliminary Language Scan: `default` IDs 14000-14049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 14000-14049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 14000 | `Archsage Voice` -> `대현자 음성` | Confirm whether this is a voice/audio setting or a named character voice. | English is a two-word label with no UI context; Korean follows the voice-setting reading. Historical question remains open. | Medium |
| 14002 | Venris / reconnaissance | Verify Venris's name and whether the carried information is a report, intelligence, or reconnaissance material. | Korean says Venris carried “정찰 자료”; Japanese specifies a reconnaissance report and Chinese calls it intelligence. The outcome warning about the information reaching the wrong hands is preserved. Historical question remains open. | Medium |
| 14003 | `Fahrlangi Swordsman` -> `파를랑기 검객` | Determine whether Fahrlangi names a people, faction, place, or sword style before standardizing the compound. | The isolated English label does not identify what Fahrlangi modifies; Japanese and Chinese also transliterate it as a proper name. Historical question remains open. | Medium |
| 14011 | `Relic` -> `유물` | Confirm whether this inventory/UI label means an artifact or a remnant/location. | The short English label has no context; Korean uses the common artifact reading. Historical question remains open. | Low |
| 14016 | Vigor / Arena team | Confirm whether Vigor is a person, team, or organization and preserve the competitive register. | English capitalizes Vigor and says it has been “doing this” for nearly as long as the speaker; Korean treats it as a named opponent. Historical question remains open. | Medium |
| 14022 | Alfar / Opposition / Bayala Tirin / Lyria | Review the lore passage's syntax, the sense of `Opposition`, and the referents of `Her` and `she` without resolving them from capitalization alone. | Korean preserves the six embedded line breaks and the stanza sequence. The English is deliberately compressed and the key terms have no settled referents in the isolated passage. Historical question remains open. | High |
| 14023 | `silk of that place` -> `비단` | Determine whether “silk” is generic silk or a specific local/spider material and whether a Korean item term exists. | The speaker says they harvested it there for forty years; the Korean uses generic `비단`. Japanese specifies spider silk, while English/Chinese leave the exact source implicit. Historical question remains open. | Medium |
| 14024 | amulet resting beneath its glass -> `유리 진열장 아래` | Clarify whether the glass is a display case, cover, or another container while preserving the amulet's personification. | English says “beneath its glass”; Korean supplies a display-case reading. Japanese/Chinese likewise infer glass/container context. Historical question remains open. | Medium |
| 14028 | Aurenda / Shadowthorn / Fae hollow | Verify the location and character forms and whether Shadowthorn is a Fae hollow, refuge, or other named place. | Korean retains the quest sequence and identifies Shadowthorn as a Fae refuge; Japanese omits that descriptor and Chinese calls it a Fae cave. Historical question remains open. | Medium |
| 14029 | `Lords of Valor` -> `용맹의 군주들` | Align the faction/team form with the existing `용맹의 군주단` at ID 13596. | Both rows refer to Lords of Valor; the current row uses a plural-person form while the earlier occurrence uses a collective/faction form. The sentence also identifies a trained mix of warriors, dagger masters, and sorcerers. | High |
| 14032 | Mithros / uncle's assassins | Verify the place-name form and preserve the speaker's likely dry irony in “Everything worked out for the best.” | Korean retains the attempted deposition, flight from assassins, and ironic conclusion. Historical question remains open. | Medium |
| 14039 | `first year of their studies` -> `수학 첫해` | Review a likely false-friend/word-sense shift: Korean `수학` can mean mathematics, while English means the first year of studying. | English, Japanese, and Chinese all specify the first year of study; Korean's `수학 첫해` can be read as “first year of mathematics.” The passage otherwise retains its four source line breaks and mock-formal “unofficial demise” joke. | High |
| 14044 | Sedeas / crystal weir / Shardfall | Verify both place names and whether “weir” means a water-control structure or another crystal formation. | Korean renders `crystal weir` as `수정의 둑` and preserves the comparison with Shardfall; the geological/architectural referent is not established. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 14000, 14002-14003, 14011, 14016,
  14022-14024, 14028-14029, 14032, 14034, 14039, and 14044 against the active
  Korean and all three source locales. They remain preliminary questions; no
  historical disposition was treated as approval.
- ID 14029 adds a concrete active-corpus Lords of Valor form difference;
  ID 14039 adds a likely Korean word-sense shift in `수학`.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Embedded line-break counts match throughout the range: ID 14022 has six,
  ID 14033 has two, and ID 14039 has four in each locale.
- Brace, dollar, and hash-token signatures match. No marker-order or
  structural exception was found.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 14000-14049 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 14050-14099.
