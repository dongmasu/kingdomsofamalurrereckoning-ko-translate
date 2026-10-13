# Preliminary Language Scan: `default` IDs 26851-26900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26851-26900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26851-26855, 26857-26868, 26870-26878, 26880-26895, 26897-26900 | Dialogue, quest, and concise UI/item text | Recheck register, idiom, names, and short-label context during integrated review. | Korean generally retains the English meaning and Japanese tone. Recurring terms include House of Ballads, Warsworn, Fae, Ariad, Alfar, Telogrus, and Bisarane; name forms remain subject to corpus-wide consistency review. | Medium |
| 26878 | “If you would be so kind as to ready your weapons” | Check whether `친절을 베풀어 무기를 준비해 주게` sounds intentionally formal/archaic or overly literal in this speaker's voice. | The English is a courteous request, and Japanese also phrases it as a request. Korean preserves the request but renders the politeness formula explicitly; no change is approved by this note. | Medium |
| 26879 | “It has been taken” / the candle's flame | Clarify the omitted referent and the relation between the missing item and extinguishing the candle before the monsters arrive. | English uses a passive referent and then names the candle; Japanese says the candle is absent, while Korean says someone took it. The source's sequence is context-dependent and should not be silently normalized. | Medium |
| 26889-26899, especially 26896 | Tomb / Ariad / Alfar / Telogrus / Clan Totem / Wolf Pack / Enright / Luethar De Groot / Nettie Blevins / Mace Darkken / Bisarane / Alyn Shir | Standardize recurring names and review whether `정예 사살 부대` is the right register for “elite death squad”; retain the covert-operation details and military-command qualification. | English says the Wolf Pack operated behind Tuatha lines and often acted without military-leadership consent. The Korean preserves both facts but uses a literal rendering of “death squad”; Japanese calls it an elite assassination unit. Historical questions also flag this passage and its names. | High |
| 26895 | `Clan Totem` -> `부족 토템` | Check `clan` versus `tribe` against established terminology and the item's in-world context. | Korean conveys a group totem, but “clan” may have a more specific social meaning than the chosen generic `부족`; this is a terminology candidate only. | Low |

## Historical Audit Reconciliation

- The historical question log groups IDs 26889-26899 for Ariad, Alfar,
  Telogrus, Clan Totem, Enright, Wolf Pack, the three named Wolf Pack
  members, Bisarane, and Alyn Shir; it specifically flags ID 26896's route
  and mission details.
- Earlier historical entries also leave the identity of the Wolf Pack open
  as a named group or military unit. Those notes are issue inventory, not
  approval of the current wording.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26851-26900 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales.
- The `+15%` value at ID 26869 matches in every locale.
- Chinese ID 26870 contains an internal U+FEFF after the label; no matching
  character occurs in English, Japanese, or Korean. Retain it as a source
  formatting anomaly for later disposition.
- No other structural exception was found. Korean wording and all CSVs were
  not edited.

## Batch Status

IDs 26851-26900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26901.
