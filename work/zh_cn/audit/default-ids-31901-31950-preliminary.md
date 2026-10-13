# Preliminary Language Scan: `default` IDs 31901-31950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31901-31950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, and recurring
  terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31901 | `티르노크` for `Tirnoch` | Standardize the creature/name form and preserve the statement that it is intelligent and malignant. | English names the entity the Tuatha call Tirnoch and links it to Prismere crystals. Korean preserves the identification and description; canonical Korean spelling remains a glossary question. | Medium |
| 31902 | `벨렌의 유언 검객` for `Belen's Testament Swordsman` | Confirm whether Belen's Testament is a faction/institution and how the Swordsman rank attaches to it. | English presents a capitalized compound. Japanese omits Testament and calls the person a swordsman; Chinese translates the full compound as a Testament swordsman. Korean follows English literally. | Medium |
| 31906 | `증오로 가득한 가문` for `hateful house` | Determine whether `house` means a literal family, a named faction, or a figurative institution. | English asks how the group ended up in a “hateful house.” Korean interprets it as a family; no locale context resolves the referent. | Medium |
| 31912 | `커` for `the Cur` | Determine whether Cur is a named creature/entity or a generic dog/cur, then standardize the form. | English capitalizes `Cur`; Japanese transliterates it, while Chinese interprets it as a vicious dog. Korean transliterates without resolving the entity type. | Medium |
| 31917 | Deep cave beneath Bhaile; Winter King's meditation/death-emergence alternatives | Preserve both competing legends and identify who “they” are only if surrounding lore resolves it. | English says the cave may be for the Winter King's meditation or where “they” emerge after death. Japanese/Chinese specify the Winter Fae in the latter clause; Korean generalizes to the dead. | Medium |
| 31919 | `트래블러스` | Preserve the distinction between the group's thief reputation and its other livelihoods; standardize the faction name. | All locales list traders, bards, and jugglers alongside the Travelers' reputation as thieves. Korean retains the contrast and activity list. | Medium |
| 31924 | `성우진` for `Voice Cast` | Decide whether this is a player-facing credit/UI label or an internal development label; Japanese retains English while Chinese and Korean localize it. | The isolated label gives no interface context. Korean's translation is plausible but should be checked against the intended display audience. | Medium |
| 31933 | `감정은 늘 가슴속에 감춰 둬` | Preserve the idiomatic “keep emotions close to your chest” meaning rather than interpreting it literally. | English, Japanese, Chinese, and Korean all express emotional concealment and the mother's cynical reason. Korean keeps the aphoristic, quoted voice. | Medium |
| 31940 | `달의 운명을 타고난 이들` for `Those fated of The Moon` | Determine whether The Moon is a formal Fate card/title or a literal celestial/lore reference; standardize capitalization and Korean naming. | English capitalizes The Moon. Japanese treats it as a named Moon, while Chinese/Korean can read it as moonlight or lunar fate. The sentence's light/dark metaphor is preserved. | Medium |
| 31942 | `웬센 왕` | Standardize Wencen with the earlier name occurrences and preserve the distinction between eternal life and not keeping the king waiting. | The name recurs from ID 31563. All locales agree on the meaning; this is a cross-range spelling consistency check. | Medium |
| 31946 | Gravehal petition record; two `(illegible)` spans | Preserve both unreadable spans and all paragraph divisions; review the political satire, names/titles, and coercive settlement logic without filling gaps. | The long record includes petitioners, Scav crop/livestock damage, a grotesque promise, three Emberdeep candidates, an unreadable gallery instruction, a commissioned flattering poem, and a suggestion to burn settlers' ships so they cannot return. Korean retains both unreadable spans and the same 10 line breaks. | Medium |
| 31948 | `이 경기장에서는 아무도 믿지 않는 게 좋을 거야` | Preserve the Arena warning and the taunting address `gladiator`; review whether “you hadn't a clue” refers to the opponent's ignorance. | English, Japanese, and Chinese agree that the speaker reads the addressee's expression as clueless and advises trusting no one in the Arena. Korean retains both points. | Medium |
| 31950 | `죽이기엔 너무 영리` for `too clever to kill` | Preserve the claim that the Erathi imprisoned him after finding him too clever to kill; identify the antecedent of “him” only with context. | English, Japanese, Chinese, and Korean agree on imprisonment in the mountain and the stated reason. The row does not identify the prisoner. | Medium |

Rows 31903-31905, 31907-31911, 31913-31916, 31918, 31920-31923,
31925-31932, 31934-31939, 31941, 31943-31945, 31947, and 31949 generally
retain the English meaning on this first reading. Proper names, rank/
faction terminology, and context-dependent references remain candidates
for the integrated pass; no separate high-confidence wording correction
was identified.

## Historical Audit Reconciliation

- The archived `default` question heading spans IDs 31900-31999, while its
  specific listed concerns begin at 31902. ID 31900 was checked in the
  preceding batch, and this batch starts at 31901 from the active CSV, so
  no active key was skipped or counted twice.
- Historical questions for this interval specifically flag Belen's
  Testament Swordsman, Cur, Voice Cast, The Moon, and the long Gravehal
  petition record. Both unreadable source spans in ID 31946 remain marked
  `(판독 불가)` in Korean; no text was invented.
- ID 31946's English and Korean each contain 10 embedded line breaks,
  retaining the six narrative paragraphs and their blank-line separations.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31901-31950 once and in identical order.
- Embedded line-break counts match throughout the range, including all 10
  line breaks in ID 31946.
- Runtime-marker identities/order match; no marker discrepancy was
  detected.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31901-31950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31951.
