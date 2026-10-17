# D-20383: Focused Review of Standalone Personal Names in `default`

Date: 2026-10-14

## Scope and Decision

Reviewed active Korean `default` rows whose English source is a standalone
single-word name. The inventory contained 2,414 unique one-word English
groups. English established whether the token referred to a person; Japanese
was used to corroborate pronunciation and Chinese as supporting evidence.
Each candidate was also checked against other `default` sentences, including
full names, pronouns, dialogue, and roles. The official Korean manual does
not enumerate these NPC names, so it was not treated as a name authority.

Confirmed 339 personal-name groups and corrected 462 active `Texto` cells
that still showed a bare Korean or English-only label. Bare Korean labels
were rendered as `한글(English)`. Existing bilingual labels were retained,
except that single-word labels with clearly erroneous lexical translations
or a conflicting established form were aligned to the supported personal
name. Korean punctuation after a label was preserved. Cross-checking the
sentences also exposed two clear misreadings of Ursin Kettle; these full-name
references were corrected to `우르신 케틀(Ursin Kettle)`. In total, 464
unique `Texto` cells changed.

Representative contextual decisions:

| English | Korean form used | Cross-check |
| --- | --- | --- |
| Aedran | `에이드런(Aedran)` | The label `에드란` was aligned with the full-name form `에이드런 티르` (ID 39799); Japanese and Chinese identify Aedran Tyr. |
| Anwy | `안웨이(Anwy)` | ID 42252 identifies Gwyn Anwy as a woman; Korean `그윈 안웨이`, Japanese アンウェイ, and Chinese 安维 corroborate the surname. |
| Hugues | `휴그(Hugues)` | Repeated Fomorous Hugues references support `휴그`; the alternate label spellings `위그`, `휴그스`, and `휴즈` were not reused for bare labels. |
| Karth | `카르스(Karth)` | The personal-name context and Japanese カース / Chinese 卡尔斯 distinguish it from other lexical readings. |
| Thaddeus | `새디어스(Thaddeus)` | Brother/pronoun context confirms a person; Japanese サディアス and Chinese 撒迪厄斯 support the chosen form. |
| Ursin | `우르신(Ursin)` | Japanese アーシン and Chinese 乌尔辛 establish a name, not the Korean honorific `어르신`. |
| Gray, Quay, Deadeye | `그레이(Gray)`, `퀘이(Quay)`, `데드아이(Deadeye)` | Context establishes Gray as a person, Quay as an old man, and Deadeye as a Tuatha assassin; this corrects `회색`, `부두`, and `명사수` readings. |
| Ursin Kettle | `우르신 케틀(Ursin Kettle)` | ID 26788's `어르신 케틀` and ID 29279's `얼신 케틀(Ursin Kettle)` conflict with English, Japanese アーシン・ケトル, Chinese 乌尔辛·凯特尔, and the established `우르신(Ursin)` label. |

ID 32477 retains its question mark after the bilingual name:
`블러드그린(Bloodgrin)?`. The already bilingual Green label at ID 42465 was
checked and left unchanged; ID 50010's `Green though` means inexperienced,
not the person.

One-word candidates that were not established as personal names were not
changed. This includes places, factions, titles/ranks (`Elund`, `Decanus`),
species or deities, the Forstid demonym, family-line `Gastyr`, and generic
words. `Dolve`, `Argoth`, `Pombero`, and `Enfamanir` were excluded because
the available sentence context does not establish them as personal names
rather than an estate/family, a defeated entity, or another named subject.
Capitalized words with no identifying personal-name context were also left
untouched. No disposition keys were reopened or recounted, and no global
tally was changed. The sequential default review remains complete through
D-20377 / ID 65134.

The complete per-ID inventory includes English, Japanese, Chinese, previous
Korean, and revised Korean values in
[`person-single-word-edits-D20383.tsv`](person-single-word-edits-D20383.tsv).
The one-time byte-preserving edit procedure is
[`apply-person-single-words-D20383.rb`](apply-person-single-words-D20383.rb),
followed by the two-cell contextual correction in
[`apply-ursin-context-D20383.rb`](apply-ursin-context-D20383.rb).

## Verification

- Pre-edit active default SHA-256: `200c3a81b6fbe23d231d5a28e64cfd426d7f6a4e2c0b47ec2dbfc5e1675e2c89`.
- Byte-identical pre-edit backup: `/private/tmp/ko-translate-backups/20261014/before-person-single-words-D20383/locatexts_zh_cn.koalocatext_default.csv`.
- Intermediate SHA-256 after the 462 standalone-label edits: `89f8bed738c2a43e3bfe80b2aa26e2be3ca0aaa1b6d889bc1cb1518e727c773c`.
- Byte-identical backup before the two contextual Ursin corrections: `/private/tmp/ko-translate-backups/20261014/before-ursin-context-D20383/locatexts_zh_cn.koalocatext_default.csv`.
- Final active default SHA-256: `07981d157152c8a5880c23c16c81e466a23c69a17103d2a4df37d8d63dce31c9`.
- Exactly 464 unique `Texto` cells changed: 462 standalone labels across 339 confirmed name groups and two full-name contextual references. The per-ID inverse edits reproduced the pre-edit file byte-for-byte.
- UTF-8 BOM, 65,135 ordered IDs (`0`-`65134`), CSV parse structure, 72,084 CRLF endings, and zero bare-LF endings were preserved.
- Source CSVs under `src/csv/` were read-only and unchanged. No PAK or PAK-derived data was consulted.
- No other field or row bytes were changed; no prior disposition or global total was updated.
