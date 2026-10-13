# Preliminary Language Scan: `default` IDs 47351-47400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47351-47400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47355 | Mana Stolen per Hit / `타격당 훔치는 마나` | Confirm the standard Korean UI wording and whether the stat describes Mana stolen by the player or lost by the target. | English describes Mana stolen per hit; Japanese literally describes Mana lost per hit, while Chinese and Korean frame it as stolen. The value/direction is not otherwise specified in this label. | Medium |
| 47367 | special case of the introductory methodology exam / `특별 응시 과정` | Check whether the phrase denotes a special sitting/administration of the exam or a special exam case, while retaining that the speaker offers to proctor it. | Korean preserves the introductory methodology exam and the offer to supervise, but recasts the unusual `special case` phrase as a special examination process. The source remains awkward. | Medium |
| 47370 | Revival / `리바이벌` | Keep the cross-reference with ID 47322 open until it is clear whether Revival names the refugee camp. | English says “a camp like Revival”; Korean retains the established transliteration. This supports a named camp reading but does not conclusively establish the name's status. | Medium |
| 47375 | Sagecrafters/gems / localized `*1` markers and `{LINE_SPACE}` | Verify the Korean gameplay term for Sagecrafters while preserving every marker identity and the warning's separation. | All four locales retain the five-marker sequence `*1, *1, LINE_SPACE, *1, *1`; Korean renders Sagecrafters as `마법물품 제작자`. The source terminology and marker structure remain review points. | Medium |
| 47377 | “And so it should be for you” / `너도 물론 몫을 챙기고` | Check whether the explicit “share” is supported by the implied profit context or adds specificity. | English leaves the benefit to the addressee implicit; Korean says they should take a share. Japanese also leaves it implicit, while Chinese says the benefit should be substantial for both. | Medium |
| 47381 | interrupted sentence / `놈들이 안에 있...` | Preserve the abrupt interruption and verify the localized punctuation against the source dash. | English and Chinese end with an em dash; Japanese uses an ellipsis and Korean uses three periods. The speech is interrupted in all versions, but the exact terminal mark differs. | Medium |
| 47382 | announcer joke / `다양성과 기습 마법사` | Review the intended sports-announcer joke and how “variety and surprise sorcerers” modifies the strategy. | Korean conveys that variety and surprise mages did not secure a win; Japanese and Chinese likewise paraphrase the phrase. The English inversion/word grouping is unusual, so the exact joke remains uncertain. | Medium |
| 47393 | The Widow / `위도우` | Confirm whether this is a proper title/card label or a generic widow reference. | The isolated English label is capitalized and the historical log flags its status; Korean transliterates it without selecting a generic meaning. | Medium |
| 47397 | Hierophant Shrine / `대사제의 성소` | Verify whether the shrine is dedicated to the Hierophant or belongs to a person/title rendered as “High Priest.” | Korean uses a possessive construction and a generic “sanctuary”; the historical note flags the exact relation. | Medium |

IDs 47351-47354, 47356-47366, 47368-47369, 47371-47374,
47376, 47378-47380, 47383-47392, 47394-47396, and 47398-47400
generally retain the English meaning on this first reading. Names,
gameplay terminology, and register remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47350-47449. It flags
  proper-name spellings, Revival, the Widow label, Hierophant Shrine, the
  interruption at 47381, the announcer line at 47382, and several other
  questions beyond this batch. No historical candidate was treated as an
  approved correction.
- IDs 47364 (`Israel`) and related real-world-name strings are retained as
  source text; their intentional use remains an open historical question.
- ID 47375 retains every localized `*1` marker and `{LINE_SPACE}`. ID 47395
  retains `{1}` and `{2}` in source order.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47351-47400 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 47390 retains six
  embedded line breaks (four paragraphs) in each locale.
- IDs 47375 and 47395 preserve runtime marker identities and order. No other
  runtime tokens or special hidden whitespace were found.
- Explicit values such as `+7%` and level `10+` are retained. No structural
  exception was found; the source interruption at 47381 is lexical
  punctuation, not a missing CSV record.
- Name and bilingual-parenthetical conventions remain inconsistent across
  occurrences; this batch authorizes no global normalization.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47351-47400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47401.
