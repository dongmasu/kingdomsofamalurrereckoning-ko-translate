# Preliminary Language Scan: `default` IDs 7800-7849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7800-7849.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7800 | `RCONTROL` → `오른쪽 Ctrl` | Confirm the platform-specific key label and whether this UI should localize the control name or retain the literal identifier. | English gives the control identifier, Japanese/Chinese localize it, and Korean renders the right Ctrl key. | Low |
| 7801 | `sinister` → `사악한` | Preserve the ominous contrast without deciding whether `sinister` means morally evil or more threatening/foreboding. | Korean chooses a moral “evil” reading; Japanese supports that, while Chinese emphasizes danger and volatility. | Medium |
| 7802 | `Ascension` → `즉위` | Resolve whether this means enthronement, promotion, or spiritual ascent from surrounding context. | Japanese supports accession/enthronement; Chinese supports ascension. The isolated title does not settle the sense. | Medium |
| 7807 | `Shadow Strike` / `Twisted Claw` markup | Preserve both `{*1...}` wrappers and localize only their display labels; align ability names with the skill glossary. | Korean contains both translated names inside the source marker wrappers. All locales retain marker ID sequence `1,1`. | High |
| 7816 | Champion/protector; service and love | Preserve the speaker's roles and the abrupt conclusion; verify whether `service` is duty, service to the woman, or service in a romantic relationship. | Korean retains champion/protector, service, and love without specifying the relationship; Japanese omits part of the source role description. | Medium |
| 7817 | `Consistorium` | Determine whether this is a proper name or institutional label; leave untranslated pending context. | All four locales retain the Latin-form label unchanged. | Low |
| 7823 | `Amalur should finally be save` → `아마라 ... 안전해질 것이다` | Retain the apparent source correction from `save` to `safe`; do not reproduce the source typo as a different meaning. | The sentence concerns closing Chaos Portals so Amalur is safe from Chaos creatures; Korean follows that clear intended sense. | High |
| 7824 | `vindicative fire spirit` / `Vraekor` → `복수심 강한 ... 브레이코르` | Verify whether the unusual English adjective is a typo/lore term and standardize Vraekor's Korean spelling. | English says `vindicative`; Japanese suggests capricious and Chinese vengeance. Korean selects vengeance, a plausible but unresolved reading. | Medium |
| 7831 | White Palm letter / unspecified asset | Preserve all paragraph divisions, the concealed object's unspecified identity, and the sender signature; do not infer the relationship behind “a plethora of reasons.” | Korean retains the letter's four body blocks plus signature and leaves the asset unnamed. Historical audit identifies this as a long-form structure-sensitive record. | Medium |
| 7832 | `the Maid` → `시녀(The Maid)` | Keep the recurring capitalized figure/title distinct from a generic maid and retain the figurative question. | Korean identifies the Maid in parentheses; historical context cautions against reading the line as a literal assault. | Medium |
| 7837 | `they` seeking the addressee | Keep the unnamed group unnamed and preserve this as the speaker's inference. | English and Korean do not identify who will seek the addressee; historical note marks the antecedent as open. | High |
| 7840 | `Amongst Travelers` / `dove` → `여행자들` / `비둘기야` | Confirm whether Amongst Travelers is a named group and whether `dove` is an intimate form of address rather than a literal bird. | Korean preserves a group-like parenthetical name and translates the address literally; the historical record leaves both points open. | Medium |
| 7843 | amplified aspects of the speaker's mind | Preserve the metaphor without specifying whether the strong aspects are copies, manifestations, or traits. | Korean keeps the “exaggerated form of me” image; source and supporting locales do not explain the mechanism. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 7800-7802, 7807, 7816-7817, 7823-7824,
  and 7831-7832, 7837, 7840, and 7843.
- ID 7800 retains a localized right-Ctrl label. ID 7801's Korean “사악한”
  follows Japanese, while Chinese supports a danger-focused reading. ID 7802
  remains unresolved between accession and spiritual ascent.
- ID 7807 retains both ability marker IDs and translated display names. ID 7816
  keeps the source's service/love contrast without inventing relationship
  context. ID 7817 remains untranslated in every locale.
- ID 7823 follows the apparent intended `safe` despite the English typo
  `save`. ID 7824 keeps the fire-spirit identity while leaving the adjective
  and proper-name spelling provisional.
- ID 7831 retains the letter structure, hidden asset, and signature. ID 7832
  keeps the Maid as a named figure. IDs 7837, 7840, and 7843 retain their
  unresolved antecedent, group/address, and mental-manifestation questions.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales, including
  the multi-block letter at ID 7831.
- Localized marker ID/order sequences, other brace tokens, and named icon
  markers match across all four locales. ID 7807's localized marker sequence
  is `1,1` in each locale.
- No active CSV structure or text was changed.

## Batch Status

IDs 7800-7849 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
