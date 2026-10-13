# Consolidated Context Review: 200 Default Keys, D-19650

Scope: all 200 entries in `uncertain-200-D3747-D4122-20261012.jsonl`.
Each English, Japanese, Chinese, and active Korean cell was checked directly
against its keyed CSV row (200/200 matches per locale). English anchors
meaning; Japanese informs voice/register; Chinese is supporting evidence.
The page-indexed official Korean manual extraction was reused; PDF p. 7
confirms `셉터(Sceptres)` and names the `트래블러` and `워스원` factions.
PAK files were not used.

All 200 findings are closed: 21 accepted corrections and 179 `not an issue`;
none remains uncertain. The 21 accepted IDs are 12876, 12905, 12929, 12991,
13031, 13084, 13201, 13207, 13209, 13263, 13288, 13305, 13312, 13340,
13348, 13405, 13424, 13458, 13618, 13639, and 13859. Every other ID in the
200-key snapshot is `not an issue`; this complement is the complete closed
set, not an unreviewed remainder.

## Accepted Corrections

| IDs | Disposition and evidence |
| --- | --- |
| 12876 | `Savant` is the formal Scholia Arcana rank `사반트` (D-18268); replace generic `석학`. |
| 12905, 13405 | Familiar `dove` address uses the neutral `친구` precedent (D-19432), not gender-assuming `아가씨`. |
| 12929 | Japanese identifies the `Sorrows` as the power and Chinese supports that reading. Replace unsupported `비탄의 집` with `비탄의 힘` and express the key as leading to that power. |
| 12991, 13031 | Formal Warsworn `Oathblade` rank is `맹세의 칼날` (D-18254), not `맹세칼`. |
| 13084, 13312 | Use the official-manual Warsworn faction name `워스원`; English and the other locales identify the faction. |
| 13201 | Align `{*1[Passive]}` with the approved gameplay label `[패시브]` (D-19626). |
| 13207, 13263, 13424 | `Mitharan` is `미타란`, distinct from deity `Mitharu = 미사루` (D-18158). Use the established item adjective; 13263 also follows `Flawless = 흠 없는` and `Fulcrum = 지렛목` from D-19551/D-19649. |
| 13209 | Correct the established people-name to `콜로사이` (D-18878/D-18933 and D-19649). |
| 13288 | `House` is the House of Sorrows collective, not a domestic building; use the established `비탄의 집` (D-19451). |
| 13305 | Use `미타란족` for the Mitharan chieftain and the manual's weapon-class term `셉터`, not deity-derived `미사루인` or generic `홀`. |
| 13340 | Align the capitalized House of Sorrows role `Delvers` with the previously accepted `탐구자들` (D-19632). |
| 13348 | `Brother Fallon` is `팔론 수사`, matching Chinese `修士` and the same character's accepted Korean religious title (D-15959), not `신부`. |
| 13458 | Apply the official-manual faction name `트래블러` while preserving Star Camp. |
| 13618 | `Marches` is the established frontier `변경지`, not a transliteration (D-19647/D-19649). |
| 13639 | `Pledgeshield` is the formal rank `서약방패병` (D-18254); add the missing rank suffix. |
| 13859 | Correct `Mitharans` from deity-derived `미사루인` to the accepted people-name `미타란족` (D-18158; compare ID 619). |

## Not an Issue

The other 179 IDs in the snapshot close as `not an issue`. Their source
meaning, actions, relationships, values, and register are preserved after
English-led comparison with Japanese and Chinese. This includes already
correct uses of `숙련자` (Adept), `대사제` (Hierophant), `부름받은 자`
(Beckoned), `교수대의 끝` (Gallows End), `콜로사이`, `혈역병`, and
`비탄의 집`; source-faithful place/name spellings were not globally
normalized without a row-local error. The capitalized `The Offering` lines
were assessed in their available context and their current Korean remains a
valid reading; no unsupported object-versus-rite substitution was made.

## Integrity and Resume

- Pre-edit default SHA-256: `fe30c288604fd936f30714a772ed04b8687a33f4ce0d49b1dac7a62e6b56c944`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19650/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256: `a83130a7664a70bbf2ea3490faab3aebce8c7f290683e6b7f4240052a5882301`.
- Exact inverse reconstruction, BOM, 72,011 CRLF / 73 bare-LF endings, row order, and all non-`Texto` bytes verified; exactly 21 approved rows changed.
- Totals: **2,760 accepted / 27,265 not an issue / 8,499 uncertain** (38,524). Separate Chinese-only provisional affix holds: **55**. Overall review remains incomplete.
- Next **D-4123 / ID 13908**; prepared snapshot
  `uncertain-200-D4123-D4409-20261012.jsonl`. Continue default uncertain
  review before the separate affix pass.
