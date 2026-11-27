# Translation Edit: `default:5225`

- Date: 2026-11-27.
- Scope: remove unintended addressee honorifics from the opening line while
  retaining the reverential form used for Helius.

## Decision

English asks, “To what do I owe this courtesy?” The courtesy refers to the
visitor's gesture, not to the speaker's register toward the visitor. Japanese
ends with `何か御用かね？`, a characterful plain-style question rather than
polite `です・ます` speech. The prior Korean `오셨나요?` therefore introduced
an unsupported honorific register.

The revised Korean is:

> 정말 영광스러운 날이로군. 마치 헬리우스(Helius)께서 친히 미소로 우리를
> 따뜻하게 해 주시는 듯해. 그런데 무슨 일이지?

Plain speech now addresses the visitor; `께서` and `해 주시는` retain respect
for Helius. The user identified this as the opening line to compare with
`default:63892`. Both IDs are associated with the Godstorm research asset, but
the extracted asset does not map individual keys to speakers or playback
order; this edit does not claim that association proves either.

## Verification

- Changed only the `Texto` field for `default:5225` using
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:5225`'s four-language `source_fingerprint`; all ledger
  judgments and ordering remain unchanged.
- `python3 -m unittest tools.test_replace_text_preserve_eol`: 11 tests passed.
- `python3 -m unittest discover -s work/zh_cn/audit -p
  'test_build_dialogue_context_index.py'`: 14 tests passed.
- `build_dialogue_context_index.py --check-review-ledger`: all 65,135 reviewed
  IDs and four-language fingerprints passed.
- CRLF-aware `git diff --check` passed for the edited CSV and ledger.
- No source CSV or extracted asset changed; no commit was made.
