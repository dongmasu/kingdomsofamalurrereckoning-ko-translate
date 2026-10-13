# Disposition Batch: `default` IDs 58801-58850

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 33 `not an issue` IDs, and 17 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The pre-batch CSV matched the preceding checkpoint and was backed up
  byte-for-byte before disposition. No translation CSV cells changed.

## Accepted Corrections

No translation CSV cells were changed. Meaningful source conflicts and
terminology gaps remain uncertain; the other rows preserve the English-led
meaning and structure.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17777 | 58806 | The canceled deal, three-paragraph layout, parties, and 800 tins are retained; Rathiri tallow-wax, Haxhi timber, and proper-name forms remain provisional. |
| D-17778 | 58809 | The patrol's infrequent visits are preserved; capitalized `Watch` may be a named guard organization rather than a generic patrol. |
| D-17779 | 58814 | The Fae Cairn/Lorestone, Cureseeker ballad, and Echo Stone relationship are retained; the exact item's role and `Cairn` term need context. |
| D-17780 | 58815 | The refuge and Jottun mercenaries are retained; English/Chinese/Korean differ from Japanese on whether the refuge belongs to Khleran or the mercenaries protect him. |
| D-17781 | 58816 | Wife-loss grief is clear; `tremble for the loss of my god` can indicate impending or completed loss, and the god is unidentified. |
| D-17782 | 58819 | All seven displayed lines and stanza gap are retained; the Ouranos name, imagery, meter, and lore remain open. |
| D-17783 | 58822 | `House of Pride` is a capitalized faction/institution; Korean's literal `자부심의 가문` needs alignment with established House terminology. |
| D-17784 | 58827 | The expedition and mercenary invitation are retained; Helyc Crosse and Teeth of Naros spellings remain provisional. |
| D-17785 | 58829 | `Game of Hexes?` may be a named game, a hexes reference, or wordplay; locale interpretations differ. |
| D-17786 | 58831 | The named place is rendered `티린의 쉼터`; canonical Tirin's Rest terminology remains open. |
| D-17787 | 58836 | The ballad reenactment promise is retained; the unusual `as much as a Traveler can` qualification attaches differently across locales. |
| D-17788 | 58837 | Mineralogy, Motus Mining, and the unwitting-adventurer joke are preserved; role/company-fragment interpretation varies across locales. |
| D-17789 | 58839 | Selling pieces and customer appreciation are retained; Korean shifts between `물건` and `작품`, and the sales category needs context. |
| D-17790 | 58840 | The burned school, Orieator's war-hero status, and tentative Galafor Fields link are preserved; names and attribution need context. |
| D-17791 | 58842 | Mel Aglir's survival and the defense rationale are retained; `our shade` as protection is plausible, but the speaker's `our` referent remains open. |
| D-17792 | 58845 | Eryie Peak is preserved as a place; whether `Peak` is part of the proper name or should be translated is unsettled. |
| D-17793 | 58850 | `Crilgarin, Knave of Coins` is rendered as `동전의 잭`; `Knave` may be a card rank, title, or epithet, and locale readings differ. |

## Not an Issue

Decision D-17794 records these 33 IDs: 58801-58805, 58807-58808,
58810-58813, 58817-58818, 58820-58821, 58823-58826, 58828, 58830,
58832-58835, 58838, 58841, 58843-58844, and 58846-58849. These rows
preserve evident meaning, voice/register, markers, values, and lineation.
At 58820 Korean follows the supporting locales' clear intended meaning of
the malformed English `Seek our a Healer`; 58834 uses the documented
`료스알브`; and 58847 preserves a tentative raise decision.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58801-58850 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The 58806 cancellation notice and 58819 Ouranos poem retain matching
  paragraph/stanza structure. At 58801 the 14-meter range, 20 Physical
  Damage, 11 Piercing Damage, and 23 Mana are preserved.
- At 58801, the 14-meter pull, 20 Physical Damage, 11 Piercing Damage, and
  23 Mana cost remain unchanged. The 800 tins at 58806, eight labors at
  58799, and ten-year interval at 58800 are also preserved. No
  runtime-marker discrepancy was found.
- Reconciled the source-keyed historical prompts for IDs 58750-58849 and
  the `Crilgarin / Knave of Coins` prompt at 58850. Unresolved prompts are
  recorded above; none was promoted to an accepted correction.
- The preliminary scan's stored active-default hash differs from the actual
  pre-batch checkpoint. The checkpoint and byte-identical backup both
  verified as `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`;
  the scan hash was not used as the review baseline.
- The active default CSV remains at SHA-256
  `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58801/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`).

D-17777-D-17793 record 17 uncertain findings; D-17794 records the remaining
33 `not an issue` IDs. Direct register totals: 1,716 accepted, 12,717
`not an issue`, and 11,193 uncertain (25,626 total); next D-17795.

Resume at `default` ID 58851; 6,284 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
