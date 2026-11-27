# Translation Edit: `default:35608`

- Date: 2026-11-27.
- Scope: remove redundant Korean name repetition and use natural spoken
  dialogue for this blunt complaint.

## Decision

English introduces W. Emundas and credits the shop as `Oddities and Curios,
by W. Emundas`, so the source does contain the name twice. Japanese identifies
the speaker as Wane Emundas and describes him as the shop owner in direct,
plain speech; German also retains the proprietor credit. Chinese paraphrases
the ownership without repeating the name.

The revised Korean is:

> 나는 W. 에문다스(W. Emundas)야. '진기한 물품점(Oddities and Curios, by W.
> Emundas)' 주인이지. 에메어(Emaire) 마을에 산 지도 거의 1년 됐어.
> 여긴 지긋지긋해. 알파르(Alfar) 이야기는 꺼내지도 마.

The English shop title retains its source attribution, while the Korean shop
label avoids repeating `W. 에문다스`. The Japanese uses direct plain speech,
and the line shifts from self-introduction to an irritated complaint; the
Korean therefore uses conversational informal endings without slang. This
supersedes both the original draft and the interim declarative revision. The
previous November 6 retained disposition for `default:35608` is superseded
for this wording.

## Verification

- Changed only the `Texto` field for `default:35608` using
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:35608`'s four-language `source_fingerprint` and the
  three affected Korean snapshots in the proper-name occurrence index.
- Added a regression test for the exact approved sentence and its single
  Korean name occurrence.
- No source CSV or extracted asset changed; no commit was made.
