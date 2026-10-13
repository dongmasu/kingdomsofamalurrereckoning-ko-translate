# Disposition and Edit Batch: `default` IDs 7700-7749

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 7700-7749.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Ten findings were dispositioned: four accepted, three `not an issue`, and
  three uncertain. This remains an in-progress disposition pass, not
  independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 7701 | `...대지와 바람의 성소까지 말이야.` | `...대지의 성소와 바람의 성소까지 말이야.` | D-2126: preserve the English/Japanese distinction between the two elemental shrines. |
| 7723 | `...자기 소유였던 머리띠... 머리띠는...` | `...자기 소유였던 서클릿... 서클릿은...` | D-2133: use the already approved Korean equipment term for `circlet`. |
| 7733 | `...흰 자 할람(Hallam the White)...` | `...백색의 할람(Hallam the White)...` | D-2134: replace the ungrammatical epithet while retaining its English identity and the creator attribution. |
| 7737 | `놈들은 던전 더 깊은 곳에 있어. 계속 전진하면 도달할 거야.` | `던전 더 깊은 곳에 있어. 계속 전진하면 도달할 거야.` | D-2135: remove unsupported contempt and leave the antecedent implicit in natural Korean. |

## Other Dispositions

- IDs 7702, 7703, and 7710 are `not an issue`; the mistake, Health/Mana
  level-up relation, and generic opponent are preserved.
- IDs 7706, 7713, and 7715 remain uncertain because the skill term, named
  faction form, and creature identity are unresolved. No edits were made to
  those rows.
- All other rows in this 50-ID batch remain unchanged; no terminology-wide
  replacements were made.

## Verification

- The English, Japanese, Chinese, and active Korean resources contain the
  same 50 IDs in the same order.
- Only the four accepted `Texto` values changed; keys, order, row count, and
  embedded line-break counts are unchanged.
- No runtime markers or control tokens occur in the edited rows.
- The active Korean `default` CSV retains its UTF-8 BOM, semicolon delimiter,
  and CRLF record endings.
- Active Korean `default` CSV SHA-256:
  `1fd097bf63cf136a704b5f146a817dd418c558ad1fdb21f1769e076173884b2b`
- Cumulative dispositions: 374 accepted, 647 `not an issue`, and 1,114
  uncertain. Resume at `default` ID 7750; 57,385 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
