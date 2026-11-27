# Translation Edit: `default:34908`

- Date: 2026-11-27.
- Scope: conversational register for one Gelt Far line.

## Decision

The user identified this as dialogue by Gelt Far. English says Amman made the
object by combining lightning, fire, and frost, using an arcane trick stolen
from the Scholia Arcana. Japanese presents it as a plain, spoken explanation;
Chinese confirms the same content.

The previous Korean preserved the facts but read like written exposition.
The revised Korean is:

> 전설로는 아만(Amman)이 번개와 불, 서리를 섞어 이걸 만들었다더군.
> 스콜리아 아르카나(Scholia Arcana)에서 훔친 비전 기술을 쓴 거지.

This uses conversational endings while retaining all three elements, the
crafting claim, and the stolen-technique attribution. The user supplied the
speaker identification; the linked multi-NPC quest asset does not independently
map this key to a speaker.

## Verification

- Changed only the `Texto` field for `default:34908` with
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:34908`'s four-language `source_fingerprint` and its two
  Korean snapshots in the proper-name occurrence index.
- No source CSV, extracted asset, or game binary changed; no commit was made.

## Element-Term Follow-Up

In the subsequent cross-language terminology review, `frost` in this
sentence was confirmed to refer to the same elemental force as `ice` elsewhere
in the game's three-element list. The current wording uses `얼음`, not the
earlier `서리`; the conversational style and all other wording remain
unchanged. See the
[element terminology review](element-terminology-consistency-20261127.md).
