# Unique Lore and Item Keys (D-19718)

- Date: 2026-10-12. Scope: 20 exact IDs outside
  completed D-19653-D-19655 snapshots:
  17711, 17724, 17731, 17736, 17802, 17816,
  17826, 17831, 17866, 17880, 17907-17908,
  17910, 17965-17966, 18023, 18077-18078,
  18131, 18512 (D-5614/D-5620/D-5642/D-5646/
  D-5662/D-5673-D-5674/D-5691/D-5706/D-5725/
  D-5740/D-5860).
- Checked exact English/Japanese/Chinese/Korean, active
  `base` 4254/11 for `Flawless Ravenous Shaft`,
  D-19590/D-19641 for `Sorrows` force, accepted
  Mitharan-vs-Mitharu and Rathir precedents, and
  the official Korean manual's Mitharu context.
  English governs meaning; no PAKs.

## Disposition

- `accepted` (4): 17831 both `라시어` -> `라시르`
  (accepted in-corpus Rathir form); 17908 `완벽한
  미사란 탐욕의 샤프트` -> `흠 없는 미타란 탐식의 축`
  (`base` 4254/11 renders exact `Flawless Ravenous
  Shaft` as `흠 없는 탐식의 축`, and English item
  modifier `Mitharan = 미타란`); 17966
  `비탄의 집(House of Sorrows) 열쇠` ->
  `비탄의 힘(Sorrows)의 열쇠` (Japanese explicitly
  names the magical force; English does not say
  House); 18078 `미사루 신도들` -> `미타란족`
  (English `Mitharans` is the people, not worshippers
  of the different deity `Mitharu`).
- `not an issue` (16): 17711, 17724, 17731,
  17736, 17802, 17816, 17826, 17866, 17880,
  17907, 17910, 17965, 18023, 18077,
  18131, 18512. Spellcloak and development-looking
  labels retain the English source rather than invent
  player-facing text; Elund, Cycle/Firstsworn, Maid,
  Bolgan Bane, Wyvyrn-Girfe, Savant Reen, Sorrows
  guard, three Plagueshield parcels and the Knave
  of Coins all preserve the source-led meanings.

## Integrity and Resume

- Pre-edit SHA-256
  `27cb13f3c6d4a047c560f9774c95fc01db40608d70bf8e1196144d3e7605c8d8`.
- Byte-identical backup
  `/private/tmp/ko-translate-backups/20261012/before-rathir-shaft-sorrows-D19718/locatexts_zh_cn.koalocatext_default.csv`.
- Active SHA-256
  `bf03c107a607883b172e437704557cd7a51fb003edb3bb7d0a7c8d484bc970f9`.
- Four inverse row substitutions exactly reproduce backup;
  BOM, 72,011 CRLF, 73 bare LF, row count/order and
  all other bytes unchanged.
- Totals **3,387 accepted / 33,829 not an issue / 1,308 uncertain**
  (38,524). Next candidate D-5902 / IDs 18653,
  18655-18657, 18659-18660, 18668, 18677,
  18684-18685, 18689, 18695-18696, 18699.
  Check later closures and completed snapshots first.
