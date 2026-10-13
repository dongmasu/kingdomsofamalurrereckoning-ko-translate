# Disposition and Edit Batch: `default` IDs 7400-7449

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 7400-7449.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twenty-five findings were dispositioned: four accepted, twelve `not an
  issue`, and nine uncertain. This remains an in-progress disposition pass,
  not independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 7403 | `어머니가 날 이 자리에 자원하게 했고` | `어머니가 내 의사도 묻지 않고 날 이 자리에 지원시켰고` | D-2029: make the mother the person who put the speaker forward. |
| 7404 | `그녀는 진실의 빛을 찾았네,` | `그녀는 진실의 빛을 전하려 했네,` | D-2030: restore the act of bringing truth while preserving poem lineation. |
| 7410 | `저보다 더 비참하고 한물간 전사라는 건 본 적이 없어요.` | `이렇게 비참하고 한물간 전사 흉내를 내는 자는 본 적이 없어요.` | D-2032: remove the unsupported comparison to the speaker and retain the insult. |
| 7433 | `길조로운 도착이군.` | `좋은 징조로군.` | D-2044: render `auspicious` as natural Korean. |

## Other Dispositions

- IDs 7401-7402, 7406, 7415, 7417, 7419, 7422, 7426, 7432, 7435, 7437, and
  7445 are `not an issue`; their meaning, joke, fragment, token, or source
  structure is adequately preserved.
- IDs 7400, 7420-7421, 7423, 7429, 7431, 7444, and 7448-7449 remain uncertain
  because their name, antecedent, institution, item/category, or UI context
  is unresolved. No edits were made for those rows.
- All other rows in this 50-ID batch remain unchanged; no terminology-wide
  replacements were made.

## Verification

- The English, Japanese, Chinese, and active Korean resources contain the
  same 50 IDs in the same order.
- Only the four accepted `Texto` values changed; row count, keys, and order
  are unchanged.
- The eight-line Maid poem at ID 7404 retains its embedded lineation. The
  `{*3체력}` marker at ID 7423 is unchanged.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF
  record endings. Runtime markers and line breaks are preserved.
- Active Korean `default` CSV SHA-256:
  `1c8018a8be2f5588c094eaee571193ddb62ca87f411dd08ec9c18a9cca02b28a`
- Cumulative dispositions: 362 accepted, 617 `not an issue`, and 1,071
  uncertain. Resume at `default` ID 7450; 57,685 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
