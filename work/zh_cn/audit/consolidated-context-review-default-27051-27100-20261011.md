# Consolidated Context Review: `default` IDs 27051-27100

- Review date: 2026-10-11.
- Scope: Re-review prior uncertainties at IDs 27052, 27061, 27067, 27071,
  27078, 27089, 27098, 27099, and 27100 from D-8653-D-8658.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence. Other already-dispositioned rows are linked, not
  recounted.

## Decisions D-19343-D-19346

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19343 | `default` 27061 | accepted | English `[Passive]`, Japanese `パッシブ`, Chinese `被动`, and repeated Korean UI labels support `지속 효과` as the clear localized passive label. Change only the payload within `{*1[...]}`; retain wrapper, order, and description. |
| D-19344 | `default` 27098 | accepted | English explicitly says Grim must not know the Missives were planted. Korean `들키지 않게` only says to avoid detection, omitting who must remain unaware. Japanese supports the no-notice reading. Name Grim as the subject of `모르게`; keep markers and the quest sequence unchanged. |
| D-19345 | `default` 27078, 27089, 27099, 27100 | not an issue | The two poems retain their source imagery and stanza breaks; `그냥 싸워` follows the English `Just Fight` rather than importing the conflicting “righteous fight” readings; and `플라스마` is a standard Korean rendering of `Plasma`. Related terminology can remain under broader glossary review without making these rows incorrect. |
| D-19346 | `default` 27052, 27067, 27071 | uncertain | The canonical House of Sorrows name/institution, the setting-specific address `Savant`, and the English `Testament` versus Japanese/Chinese `Belen Covenant` conflict remain unresolved. Preserve all three rows. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27061 | `{*1[지속]}` | `{*1[지속 효과]}` | Make the passive-ability label unambiguous using the recurring Korean UI form; the runtime wrapper is unchanged. |
| 27098 | `그림을 찾아 들키지 않게 밀서들을 그에게 심어야 한다.` | `그림을 찾아 그림이 모르게 밀서들을 그에게 심어야 한다.` | Restore the explicit English referent: Grim must not know. |

## Verification

- The existing preliminary report's key/order, poem line-break, and marker
  checks remain valid. IDs 27078 and 27099 retain five and three embedded
  line breaks; ID 27061 retains `{*1[...]}`.
- Only the two authorized Korean `Texto` substrings changed. Reversing those
  substitutions reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.
- Pre-edit SHA-256:
  `c3f6c8ddcd3bede275fdfc6388d5c437845f9899394fd355e4b22b628b4cb1ba`.
- Post-edit SHA-256:
  `51cad27f1a98bd20e71141c52ef1afc8ba4794991fdb5712b16d37e17d12f3f3`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-27051-27100-D19343/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,223 accepted / 24,650 `not an issue` / 11,651 uncertain
  (38,524). Resume at D-19347, ID 27101.
