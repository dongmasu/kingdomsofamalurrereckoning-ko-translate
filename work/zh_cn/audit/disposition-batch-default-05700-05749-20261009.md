# Disposition and Edit Batch: `default` IDs 5700-5749

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 5700-5749.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Fifteen findings were dispositioned: two accepted, six `not an issue`, and
  seven uncertain. Two accepted `Texto` cells were changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5700 | `my liege` | Keep the deferential address `주군`; no source establishes a higher court title. | D-1494: not an issue. |
| 5701 | Fateweavers membership / `initiated` | Keep the established `페이트위버` and the membership reading `입단`. | D-1495: not an issue. |
| 5705 | `{*2Side Quests}{LINE_LEFT}` | Localize the visible label to match the Korean body while preserving both structural markers. | D-1496: accepted. |
| 5707 | `Try removing the gem` | Defer whether the line is an instruction or an objective/title label. | D-1497: uncertain. |
| 5711 | Dry praise of the city / humorless City Watch | Keep the understated criticism and conversational voice. | D-1498: not an issue. |
| 5712 | `all the elements of Aron Excavations` | Defer whether `elements` means facilities, upgrade components, or other features. | D-1499: uncertain. |
| 5714 | `Warsworn punishment` | Defer the faction's canonical Korean name and whether the punishment is formal discipline. | D-1500: uncertain. |
| 5719 | Ending up in one of the creatures' swamps | Defer whether `처박히다` adds too much force to the speaker's disgust. | D-1501: uncertain. |
| 5720 | `Unwritten One` | Defer the canonical Korean form of the capitalized title. | D-1502: uncertain. |
| 5728 | `old Dverga fastings` | Keep the passage reading provisionally, but defer the unusual English term and canonical Dverga spelling. | D-1503: uncertain. |
| 5733 | `Greatsword Mastery` | Keep `대검 숙련`, consistent with Korean weapon-mastery wording. | D-1504: not an issue. |
| 5740 | Dolan Hardy's stolen Border Permit | Correct the Korean possessive so the permit, not Dolan Hardy, is described as stolen. | D-1505: accepted. |
| 5745 | Four-reagent potion recipe | Keep the English-led reagent identities, order, and quantities; canonical item terms remain a broader glossary task. | D-1506: not an issue. |
| 5748 | Hall of Appointments / ambassador preparation | Defer the institution's identity and the exact “role is with” relation. | D-1507: uncertain. |
| 5749 | Father tossing his son like a rag doll | Keep the agency, contrast, and simile. | D-1508: not an issue. |

All uncertain rows remain unchanged.

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5705 | `{*2Side Quests}{LINE_LEFT}하위 임무는 ...` | `{*2하위 임무}{LINE_LEFT}하위 임무는 ...` | D-1496: translate the visible heading consistently with the following Korean copy; retain `*2` and `LINE_LEFT`. |
| 5740 | `...돌런 하디가 도난당한 국경 통행증을 되찾았다...` | `...돌런 하디의 도난당한 국경 통행증을 되찾았다...` | D-1505: restore Dolan Hardy as the permit's owner, not the person stolen. |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 5700-5749 are present in matching order.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF bytes.
- At ID 5705, the localized `*2` wrapper and `{LINE_LEFT}` marker retain
  their identity and order; the explanatory text and row key are unchanged.
- At ID 5740, the row key and one-record structure are unchanged. Runtime
  markers and line-break structure in both edited rows are preserved.
- Active Korean `default` CSV SHA-256:
  `08cafc942b986a35578aebcb68a4be748249ed9807cc048950ece7a29869f119`
- Cumulative dispositions: 285 accepted, 407 `not an issue`, and 816
  uncertain. Resume at `default` ID 5750; 59,385 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
