# Preliminary Language Scan: `default` IDs 7850-7899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7850-7899.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7850 | `sagecrafting` → `마법물품 제작(Sagecraft)` | Retain the established glossary term and confirm the sentence's gem-crafting context; avoid unnecessary mixed-language marking if project display convention does not call for it. | The official project glossary uses `마법물품 제작`; the Korean conveys that even a small jewel can improve a sword. | Medium |
| 7851 | `Gallows End` → `교수대의 끝` | Reconcile this place-name rendering with the corpus-wide variants and preserve that the pirate is the island's only authority. | The active corpus has several Korean spellings and literal renderings of Gallows End. This line otherwise retains the pirate's authority and unspecified claim. | High |
| 7852 | `a Jottun's nose` → `요툰의 코라니` | Preserve the source's intentionally odd/comic exclamation unless context establishes a Korean idiom. | English is itself an unusual exclamation and Japanese omits the Jottun reference; Korean keeps the odd image. | Low |
| 7865 | `I've never felt so well with him` → `그와 함께 있을 때 ...` | Retain the ambiguous theatrical/interpersonal reading; do not resolve it as romance without context. | English is ambiguous in isolation, while Japanese explicitly suggests performing a role. Korean can read as a personal relationship and loses that possible theatrical sense. | Medium |
| 7868 | `Pierce Armor [DO NOT USE]` → `방어구 관통 [사용 금지]` | Preserve the warning and its bracketed display wrapper; do not mistake this test/developer label for a usable skill. | The Korean localizes the warning text and retains the brackets. English and Chinese use different warning wording, but all retain the bracketed structure. | High |
| 7871 | capitalized `Well` → `샘` | Preserve the personified target of the threat and verify whether `Well` is a named magical entity. | English capitalizes `Well`; Korean addresses it directly as a well, preserving the brick-by-brick threat. | Medium |
| 7875 | `Oathblade` / `Warsworn Order` → `서약검` / `워스원` | Verify rank and order terminology against the official Korean manual and recurring faction references. | Korean retains the formal self-introduction and the source's rank/order relationship; historical notes identify both terms for terminology review. | Medium |
| 7878 | `House of Valor` → `용맹의 전당` | Keep this as a named faction/institution and align it with `Lords of Valor` and related Valor terms. | English capitalization marks a named group; Korean currently renders it as `용맹의 전당`, a form that should be consistent across the corpus. | Medium |
| 7880 | stealth increased by 1 → `은신 기술이 일시적으로 1 증가` | Verify whether the amount is one point, one level, or one rank; preserve its temporary duration and numeric value. | Korean retains the duration and value, but the English does not state the unit. | Medium |
| 7882 | Alleia / Rahnil / Liordran / `the Keening` | Standardize all four names and confirm whether the Keening is a proper place-name; preserve the altar action and return/report sequence. | Korean retains the ring placement and objective sequence. The names have multiple transliterations across locale references. | Medium |
| 7886 | `Lords of Valor` / `Champion` → `용맹의 군주들` / `챔피언` | Confirm formal group/rank names and align with `House of Valor`. | Korean retains the Lords, their leader, and fearlessness; the historical audit notes that related English and Japanese group labels differ. | Medium |
| 7887 | fragmented recruitment pitch | Preserve the clipped self-correction, large-picture/small-start contrast, and request for someone able to do both. | Korean retains the speaker's two-scale approach, though the source fragments may need voice review in context. | Low |
| 7890 | `White Nil` → `백색 닐(White Nil)` | Keep the name unresolved and verify whether `White` is a title or part of a personal name. | English and Japanese present it as a question; the isolated row does not identify the referent. | Low |
| 7895 | `put them out of their misery` → `고통에서 해방해 줘` | Retain the euphemistic plea without making an unstated method explicit. | Korean preserves the request to relieve the speaker's men of suffering; it does not specify what action that entails. | Medium |
| 7898 | troubles “righting themselves” → `저절로 해결되기 마련` | Keep the understated relief while confirming whether troubles resolve on their own or justice is restored. | English supports both readings; Korean chooses the self-resolution sense, while Japanese suggests that trouble has its reasons. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 7850-7852, 7864-7865, 7868, 7871-7872,
  7875, 7878, 7880, 7882, 7886-7887, 7890, 7893, 7895, and 7898.
- ID 7850 uses the established `마법물품 제작` term. ID 7851 retains the
  pirate's unique authority and unnamed claim; Gallows End remains a
  corpus-wide consistency issue. ID 7852 retains the unusual Jottun image.
- ID 7864 keeps the encoded security details on the blade. ID 7865's
  `with him` remains ambiguous between an interpersonal and theatrical
  reading. ID 7868 preserves the bracketed developer warning.
- ID 7871 personifies the capitalized Well and preserves the threat. ID 7872
  retains the speaker's tenure at Sun Camp and Argine's witness to Adessa's
  construction. ID 7875 keeps the Oathblade/Warsworn introduction; terminology
  remains open. ID 7878 retains House of Valor as a named group.
- ID 7880 preserves temporary duration and `1` without inferring a unit.
  ID 7882 retains the completed altar action and return objective. ID 7886
  keeps the Lords/Champion relation. ID 7887 preserves the fragmented pitch.
- IDs 7890 and 7893 leave proper-name and Great Cycle context unresolved.
  ID 7895 keeps the euphemistic plea; ID 7898 retains the understated tone
  while leaving the idiom's exact sense open.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales. The bracketed localized warning
  at ID 7868 retains its wrapper while translating its display text.
- No active CSV structure or text was changed.

## Batch Status

IDs 7850-7899 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
