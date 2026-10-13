# Default Scope Reconciliation D-19841

2026-10-13. Reviewed all 100 active `default` IDs 36551-36650 in order
against English, Japanese register, supporting Chinese, active Korean,
official Korean manual terminology, and prior exact-key decisions. No PAK
or PAK-derived material was consulted.

## Exact-Key Reconciliation

The D-19666 manifest contains 16 keys in this range. All 16 English,
Japanese, and Chinese fields match the corresponding current source rows
exactly. The prior accepted corrections at 36609 (`스콜리아 아르카나`)
and 36648 (`발라드의 집`) remain applied. The other 14 keys (36553,
36557, 36559, 36563, 36565, 36586, 36588, 36590, 36597, 36605,
36616, 36620, 36623, 36628) were already terminal `not an issue` under
D-19666. Older D-11769-D-11798 uncertainties for these exact keys are
not reopened or counted again. In particular, D-19666 explicitly
recognizes `Adept = 숙련자` at 36563; the manual confirms `로포쿠` at
36620 and `알마인` at 36623. The recipe at 36590 and inventory at
36628 preserve ingredients, quantities, and embedded layout.

Other previously accepted `Texto` edits at 36583 (word spacing), 36591
(maltworm insult), 36594 (Amalur), 36618 (decay), 36630 (acceptance
followed by thanks), and 36647 (Prismere Chantries as idols) remain in
place. The manual's Blacksmithing (`대장기술`), Sagecraft
(`마법물품 제작`), Varani (`바라니`), and Dokkalfar/Ljosalfar
(`도크알브`/`료스알브`) terms support the corresponding active rows.
The remaining active rows retain English-led meaning, including their
numbers and UI placeholders. Japanese and Chinese differences do not
justify overwriting the English-led text.

No new classification, global tally entry, or `Texto` edit was made.
Earlier terminal ordinary-text findings were checked but not recounted.
Global category totals remain unreconciled; the separate affix 55 remain
closed by D-19565.

## Verification

All four CSVs contain 65,135 IDs, 0-65134, once and in identical order;
all 100 scope IDs occur once. The Korean CSV retains its UTF-8 BOM,
72,011 CRLF and 73 pre-existing bare-LF endings. Active SHA-256 remains
`19a774e00f1f30983953659f63755750335b179d684b15d5be8bc588433d2759`.
No CSV edit was made and no new pre-edit backup was required. Last
byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19840/locatexts_zh_cn.koalocatext_default.csv`.

D-19841 is reviewed; the overall default review is incomplete. Last
reviewed ID 36650. Next D-19842 / IDs 36651-36750; 28,484 actual
default rows remain through 65134.
