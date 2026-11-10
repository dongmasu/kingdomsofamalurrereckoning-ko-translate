# Squire Brio Name Consistency

Date: 2026-11-10

## Naming rule

Keep the English source's distinct roles while standardizing the character
name:

- `Squire Brio` / a possessive or descriptive `squire, Brio`:
  `종자 브리오(Squire Brio)`
- `Steward Brio`:
  `관리인 브리오(Steward Brio)`
- `Brio` without a title:
  `브리오(Brio)`

`종자 브리오(Squire Brio)` was already established for the standalone
character label at `default:33546` and `default:61437`. `Steward` is preserved
as a distinct role in the source and is not silently replaced with `Squire`.

## Applied rows

Only the character/title span was changed in these rows:

| ID | Before | After |
| --- | --- | --- |
| `24944` | `관리인 브리오(Brio)` | `관리인 브리오(Steward Brio)` |
| `27885` | `종자 브리오(Brio)` | `종자 브리오(Squire Brio)` |
| `36546` | `종자 브리오(Brio)` | `종자 브리오(Squire Brio)` |
| `39059` | `종자 브리오(Brio)` | `종자 브리오(Squire Brio)` |
| `58570` | `스콰이어 브리오(Brio)` | `종자 브리오(Squire Brio)` |

The other Brio rows were checked and already follow the rule:
`4089`, `6958`, `23978`, `33546`, `40671`, and `61437`. At `23978`, the first
mention includes the squire title and the later short reference is
`브리오(Brio)`.

## Cross-check and verification

English is the primary evidence for whether the source says `Steward Brio`,
`Squire Brio`, or only `Brio`; the Japanese and Chinese rows corroborate the
respective titles (for example, `名簿係`/`管家` for `Steward` and
`従者`/`乡绅` for `Squire`). No sentence meaning, dialogue register, or
punctuation was changed.

Applied by exact `default` ID with `tools/replace_text_preserve_eol.py`.
The full active Korean CSV contains 11 Brio-related IDs, and all now use the
forms above. The helper regression suite passed (11 tests), and the
CRLF-aware `git diff --check` passed.
