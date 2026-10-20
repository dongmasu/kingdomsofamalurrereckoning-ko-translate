# User-Scoped Translation Consistency Review (2026-10-20)

Status: accepted and applied at the user's request. This is a bounded
maintenance pass, not a resumption of general proper-name discovery.

## Scope And Evidence

Reviewed English-source matches across `affix`, `base`, and `default`, aligned
Japanese and Chinese entries, the active Korean CSVs, and existing glossary
decisions. The occurrence index contains 109 Dokkalfar, 117 Wencen, and 30
Oleyn keys; the English source has no matches in `affix`.

- `Dokkalfar`: retain the official Korean manual form `도크알브(Dokkalfar)`.
  Japanese `ドカルファー` supports the established sound shape, while Chinese
  `暗精灵` corroborates the dark-elf meaning. The English spelling alone does
  not establish a definitive English pronunciation; no game pronunciation
  source was found. No Korean occurrence required a spelling change.
- `default:59732`: translate the quickslot `Clear` action as `비우기`, since it
  removes the assigned item and leaves the slot empty.
- `default:25341`: translate `Map Slot` as `슬롯에 등록`, following Japanese
  `スロットに登録` and the established Korean tutorial term `슬롯에 등록된 능력`.
  The UI context identifies this as the quickslot assignment action.
- `Lady Oleyn`: standardize the title as `레이디 올레인(Lady Oleyn)`.
  Preserve bare `Oleyn` as `올레인(Oleyn)`. The self-introduction and
  name-preference dialogue distinguish her name from the title.
- `Dame Oleyn`: preserve the source's distinct title as `올레인 경(Dame
  Oleyn)`. Use complete English annotations for `Oleyn the Pure` and other
  explicit epithets.
- `King Wencen`: use `웬센 왕(King Wencen)` for the titled source form,
  `웬센(Wencen)` for bare `Wencen`, and a complete English annotation for
  epithets such as `Wencen the Bold`. This does not convert historical or
  acting bearers of the Wencen role into one individual.

## Accepted CSV Scope

- UI: `default:25341`, `default:59732`.
- Oleyn: `base:929`; `default:8862,14388,23306,27196,31370,31705,34912,35383,55112,57550`.
- King-title form: `default:4452,5609,6107,10474,12638,18244,18336,19919,20043,21824,22031,22144,22629,25134,25812,25940,27073,27648,28643,28814,30122,30733,30982,31942,32856,33152,34804,35065,35331,38175,40218,43239,44650,45398,45963,46019,46624,46669,47144,48765,51560,53867,54520,59005,59274,59463,59636,59895,63420,63823`.
- Wencen epithet: `default:25199,37203,53713,56854`.
- Wencen couplet apposition: `default:27700,62491` (`Her king, Wencen` → `그녀의 왕인 웬센`).

Total applied scope: 68 `default` rows and 1 `base` row (69 cells).
The before/after manifest is [translation-consistency-edits-20261020.tsv](translation-consistency-edits-20261020.tsv); embedded poem line breaks are represented as literal `\n` escapes so each edit remains one TSV record.

The English-source IDs above were compared against their Japanese, Chinese,
and Korean counterparts. Other name-only, title, role, and unrelated
occurrences retain their prior dispositions.

## Backups And Verification

Byte-identical pre-edit CSV backups:

- `/private/tmp/ko-translate-backups/locatexts_zh_cn.koalocatext_default-20261020.csv`
  SHA-256: `88eecfe711c483754356fd782d09d7974fbfb51cbd8938b31a24f0ce77af3585`
- `/private/tmp/ko-translate-backups/locatexts_zh_cn.koalocatext_base-20261020.csv`
  SHA-256: `57000ac4220bc261b090585847fdae7c9f80e9e7fd680e6be169f02d18de4ed6`

CSV-parser comparison confirms 65,136 `default` and 4,845 `base` records
remain in the same ID/order, with the original field counts unchanged. Only
the 68 `default` and 1 `base` translation cells differ from the backups. Both
active CSVs retain their UTF-8 BOM, CRLF record separators, and final CRLF.
The manifest contains one entry for each of the 69 changed cells.

No source CSV, sidecar, generated localization binary, or PAK was modified.
