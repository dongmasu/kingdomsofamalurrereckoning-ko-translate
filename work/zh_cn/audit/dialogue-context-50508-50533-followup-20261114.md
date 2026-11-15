# Dialogue Context Application Follow-up: IDs `50508` and `50533`

- Date: 2026-11-14.
- Rechecked the active Korean rows against English, Japanese, and Chinese.
- `50508` already contains the complete `Circlet of Arkes` pairing. No text
  change was needed; its stale ledger fingerprint was refreshed.
- `50533` is the named location `Hurvar's Doorsil`. The same source spelling
  appears in `base:2774`, while other references to the location spell it
  `Hurvar's Doorsill`. Japanese means a threshold, and other Korean rows
  consistently use `허바르의 문턱`. The current row is therefore
  `허바르의 문턱(Hurvar's Doorsil)`: Korean terminology is aligned without
  silently changing the one-letter source spelling.
- This resolves the earlier format hold for this row. The original ledger
  disposition is preserved; only its `source_fingerprint` was updated.

## Verification

- The CSV edit used `tools/replace_text_preserve_eol.py` and changed only
  `default:50533`.
- The complete 65,135-ID review ledger fingerprint check passes.
- No source CSV, extracted asset, or game binary was changed.
