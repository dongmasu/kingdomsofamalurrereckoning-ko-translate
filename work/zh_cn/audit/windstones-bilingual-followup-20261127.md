# Windstones Bilingual Follow-Up

- Date: 2026-11-27.
- Scope: `default:33211`, the Windstones occurrence.

## Decision

The English source refers to finding and activating the Windstones scattered
throughout the Plains. Japanese `風音石` and Chinese `风石` support the same
objects. At the user's direction, both Korean mentions in this row now retain
the source's plural English form:

> 아니. 문은 일부 열렸지만, 아직 바람돌(Windstones) 네 개가 남았어.
> 평원 곳곳에 흩어진 바람돌(Windstones)을 찾아 활성화해야 해.

This is scoped to `default:33211`; it does not establish a project-wide rule
for repeated English parentheticals.

## Verification

- Changed only the `Texto` field for `default:33211` with
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:33211`'s four-language review fingerprint and Korean
  snapshot in the proper-name occurrence index.
- No source CSV, extracted asset, or game binary changed; no commit was made.
