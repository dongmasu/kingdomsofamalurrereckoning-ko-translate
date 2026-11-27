# Translation Edit: `default:38673`

- Date: 2026-11-27.
- Scope: Korean naturalness and conversational register for one Emaire line.

## Decision

English describes the village as a bustling crossroads for traders and
dealers in the arcane, later reduced to a barren outpost for the ignorant.
Japanese ends conversationally with `変わってしまったよ`; Chinese confirms
the arcane-trade hub and desolate-outpost contrast. The prior Korean
`비전 물품을 거래하는` narrows the people to merchants of physical goods,
while `교차로였다`, `전락했다` and the formal narrative cadence read unlike
the requested conversational dialogue.

The revised Korean is:

> 이 마을도 한때는 비전술을 다루는 상인들이 모여드는 교역의 중심지였어.
> 그런데 요 몇 년 새 무지한 자들만 남은 황량한 변두리가 됐지.

This preserves the arcane-trade meaning and the contrast while using natural
plain speech. The asset is linked to multiple NPCs and does not map this key
to a speaker or dialogue order; no character-specific voice claim is made.
This edit supersedes the retained disposition for `default:38673` in the
November 6 naturalness adjudication.

## Verification

- Changed only the `Texto` field for `default:38673` using
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:38673`'s four-language `source_fingerprint`.
- `python3 work/zh_cn/audit/build_dialogue_context_index.py
  --check-review-ledger`: all 65,135 reviewed IDs and four-language
  fingerprints passed.
- No source CSV or extracted asset changed; no commit was made.
