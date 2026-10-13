# Disposition Batch: `default` IDs 63801-63850

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 36 `not an issue` IDs, and 13 uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18090 | 63845 | `내 전임자 아르케스(Arkes)는 하이페리언을 억지로 띄우려 했다. 하지만 하이페리언은 그를 거부해 추종자들과 함께 죽였고, 스스로 봉인되었다.` | `내 전임자 아르케스(Arkes)는 하이페리언을 억지로 띄우려 했다. 하지만 하이페리언은 그를 거부하고, 그와 추종자들을 죽인 뒤 스스로를 봉인했다.` | English and Japanese make Hyperian the subject that rejects and kills Arkes and his followers, then seals itself away. Clarify the killed group and retain Hyperian's agency in the sealing. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18091 | 63805 | Apotyre/Motus Mining spellings vary; Korean preserves the abandoned mines/offices and sudden-departure investigation without a supported canonical transliteration. |
| D-18091 | 63810 | English/Japanese retain `Brother`, Chinese uses a monastic title, and Korean uses `수사`; confirm the religious office and project title convention. |
| D-18091 | 63811 | English/Chinese describe a thicket while Japanese says a forest cave; Korean follows English/Chinese, but the location identity is unresolved. |
| D-18091 | 63813 | The poem contains the source typo `gray as as` and an obscure repeated refrain; Korean retains all six lines, but Nan/Harlan identity and final poetic wording need context. |
| D-18091 | 63817 | English `Sorrows` may be a named entity, while Japanese and Chinese describe a sorrow-related power. Korean's `House of Sorrows` adds a specific faction/place reading not settled by this isolated line. |
| D-18091 | 63818 | Korean preserves the Japanese-template placeholder sequence `{3}`, `{2}`, `{1}`, `{4}`, differing from English/Chinese `{3}`, `{1}`, `{2}`, `{4}`. The localized stat/effect labels and intended order need UI validation; do not reorder speculatively. |
| D-18091 | 63820 | The Varani history preserves the source's claims and nine embedded breaks, but several people/place terms and the non-gender-based meritocracy passage need terminology and lore review. |
| D-18091 | 63822 | `Faehunter` may be a formal title/name; Korean preserves both the parenthetical name and the embodied-hatred image pending glossary review. |
| D-18091 | 63823 | `Court of Enchantments` is rendered as `마법 궁정`; the canonical institution/title form varies across locales. |
| D-18091 | 63831 | The Queen of Cups/Moon Camp line is poetic and the marital timeline differs in specificity across locales. Korean preserves the former co-leader/wife relation without adding a separation event. |
| D-18091 | 63836 | English/Chinese say Canwen moved ahead/left the speaker, while Japanese suggests she should be ahead. Korean follows English; retain pending context. |
| D-18091 | 63839 | The eight-line Oleyn poem's “nature's tooth,” “simple truth,” and humility/knighthood imagery admit different readings; retain its lineation and defer poetic revision. |
| D-18091 | 63843 | English/Japanese/Chinese use the demonym `Mitharans`; Korean identifies them as Mitharu worshippers. Whether this is a people, faith group, or both needs lore context. |

## Not an Issue

Decision D-18092 records these 36 IDs: 63801-63804, 63806-63809, 63812,
63814-63816, 63819, 63821, 63824-63830, 63832-63835, 63837-63838,
63840-63842, 63844, and 63846-63850. They preserve available meaning,
voice, labels, values, and structure. ID 63841 retains the report's causal
sequence and investigation targets; 63846 preserves the two additional
sigil-stones and passage function; 63847 retains the sarcastic invitation;
63850 keeps the flies/fiery-blood metaphor without turning it into a
literal gameplay effect.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63801-63850 once,
  in identical ascending order.
- Embedded newline counts match for every row, including the six-line poem
  at 63813, the Varani entry at 63820, and the Oleyn poem at 63839.
- ID 63818 preserves the localized `{3}`, `{2}`, `{1}`, `{4}` sequence and
  its values; this documented Japanese-template order differs from
  English/Chinese. No other marker or numeric-value differences were found.
- Rechecked the source-keyed historical questions covering the Varani
  passage, Sorrows, placeholder order, Faehunter, Court of Enchantments,
  Queen of Cups, Canwen, Oleyn, Mitharans, and Hyperian/Arkes.
- Pre-edit CSV SHA-256:
  `e35b8ab1940b0612adbd8956fefe0d5a30a5df00d0464ee019d7d7e3a623ad47`.
  Post-edit CSV SHA-256:
  `895fc78f57c832036eda6744f53fab18b60fa2a44aece2ac5d8d5a290200e7c0`.
  Byte-level comparison against the batch-start backup confirmed that only
  the `Texto` field at ID 63845 changed. The UTF-8 BOM, 65,135 records, key
  order, embedded lineation, and outer CRLF record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63801/locatexts_zh_cn.koalocatext_default.csv`.
- D-18090 records one accepted correction, D-18091 records 13 uncertain
  findings, and D-18092 records 36 `not an issue` IDs. Totals at D-18092:
  1,822 accepted, 16,297 `not an issue`, and 12,536 uncertain (30,655
  dispositions); next D-18093.

Resume at `default` ID 63851; 1,284 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
