# Foes' Hearth Fingerprint Reconciliation

The current `default` translations at IDs `22292`, `33236`, and `52900`
already use the established location name `적들의 난롯가(Foes' Hearth)`.
Their ledger fingerprints still matched the corresponding Korean text in
`HEAD`, before that name was standardized. No CSV text was changed here.

The English, Japanese, and Chinese rows were rechecked against the current
Korean. IDs `22292` and `33236` retain their meaning and conversational
register; `52900` remains a standalone location label and preserves the
literal trailing backslash present in all three source languages. The prior
ledger dispositions remain unchanged. Only these three fingerprints were
updated to reflect the rechecked text.

Other stale fingerprints require separate examination; this reconciliation
does not establish that the entire ledger is current.
