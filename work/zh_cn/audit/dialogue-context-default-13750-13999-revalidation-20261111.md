# Sequential `default` Revalidation: IDs `13750`-`13999`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-seven existing ledger records were retained after fingerprint
  validation. The other 183 IDs were compared and added.
- Four newly recorded IDs have correction candidates. Six retain
  evidence-limited findings.
- Of the 183 new records, 142 have indexed quest-asset links and 41 do not.
  Asset association does not establish an individual speaker or playback
  order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `13836`, `13884` | Terminology / English pairing | Both refer to the named Rathir location `the Burn`, but use `번(Burn)`. The same location is paired as `번(The Burn)` in the active translation, including the standalone location label at `7284`. Align these two rows with the established full name; check other occurrences separately before changing them. | High |
| `13858` | Meaning | `The Fae are immortal` is stated directly, while `페이는 불멸이라며` can introduce hearsay. Consider `페이(Fae)는 불멸이잖아. 우리가 어떻게 버텨 내겠어?`, preserving the speaker's rhetorical question without adding an uncertain source. | Medium |
| `13920` | Naturalness | `예언자의 사적인 야영지` is a stiff literal rendering of `the prophet's private camp`. Consider `예언자(Augur) 전용 야영지` or another natural equivalent that preserves the camp's restricted/private character. | Medium |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `13759` | Meaning / UI context | `Place` can be an action to place something or a storage/placement command; Japanese reads it as storage while English and Chinese support placing. Keep `놓기` pending interface context. |
| `13768` | Meaning / role | `I was his second` is translated as `부관`. Chinese supports a deputy/second-in-command, while Japanese reads it as being unable to match Daltan. The line alone does not settle the intended role; retain the current wording pending context. |
| `13780` | Address / relationship | `my dear` is translated as `여보`, which can specifically imply a spouse. Chinese preserves an affectionate address, Japanese omits it, and the linked asset contains multiple NPCs without a key-level speaker mapping. Do not infer the relationship. |
| `13891`, `13969` | Speech level | Korean uses polite greetings, while Japanese uses plain/casual forms; English does not encode the distinction and Chinese is not consistent across the two lines. Without the individual speakers, retain the natural Korean choices pending more context. |
| `13988` | Meaning / place | Capitalized `the Mission` may refer to a religious institution or a specific mission site. Japanese reads it as a monastery, while Chinese points to a missionary group. `선교원` is plausible but cannot be confirmed from this row alone. |

## Source / Reference Anomalies

At `13824`, the English item description spells the established name
`Shroud of Omission` as `Shroud of Omnission`. Other English entries use
`Shroud of Omission`; the Korean keeps that established title, so this is
recorded as an English-source typo rather than a Korean correction candidate.

## Duplicate and Structural Checks

- Forty-nine exact-English duplicate groups touch the new IDs, covering
  863 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout tokens, named icons, and
  formatting-wrapper identities and order match across English, Japanese,
  Chinese, and Korean for all 183 new IDs.
- Logical line-break counts match across all four locales for all 183 IDs.
- Four Korean strings contain 19 existing embedded CRLF breaks: `13753` (6),
  `13757` (5), `13802` (3), and `13917` (5). Their existing bytes were
  preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
