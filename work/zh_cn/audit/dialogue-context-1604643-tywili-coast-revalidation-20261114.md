# Dialogue Context Revalidation: `1604643.quest_bxml`

- Date: 2026-11-14.
- Scope: all 116 `default` IDs linked to this asset by exact 8-byte key match.
- The asset catalog records no `QUEST_ID`, one NPC symbol
  (`NPC_RTH_DOK_MyrddinGlas`), and 247 dialog-line handlers under
  `NQD_Region_TywiliCoast`.
- The resource supports a regional Tywili Coast association and a possible
  Myrddin Glas association. It does not map any individual localization ID to
  a handler or speaker, and does not establish playback order. Keep individual
  speaker attribution `unassigned` and order `unknown`; do not classify all
  116 rows as Myrddin's spoken lines.

## Translation Review

All 116 linked rows were compared across English, Japanese, Chinese, and the
active Korean CSV for source meaning, Korean naturalness, register, names, and
formatting. Because individual speakers and dialogue positions are not
established, no cross-row voice profile or sequence was inferred.

- No cross-language line-break or runtime-token mismatches were found.
- No exact-English duplicate group within the asset had divergent Korean
  translations.
- At ID `154`, the English and Chinese both shift from first-person plural to
  “they”; Japanese describes the group collectively. The existing Korean
  subject shift was retained rather than changing the source's perspective.
- ID `9774` already has the complete title `설리의 반란(Sully's Rebellion)`.
- ID `11778` already introduces the application papers without adding a
  signing action.
- ID `29213` already uses the source spelling `Lupoku`; its existing
  exclamation was retained.
- ID `58858` remains unresolved: English capitalizes `the Burn`, while
  Japanese and Chinese describe a burned/charred harbor or place. No place-name
  status was inferred.

## Applied Correction

ID `55521` used `샐리(Sully)`, while the same source name is rendered
`설리` in `설리의 반란(Sully's Rebellion)` at ID `9774` and
`타이넌 설리(Tynan Sully)` at ID `56781`. Changed only the Korean name
spelling in ID `55521` to `설리(Sully)`. The ledger's existing review
disposition was preserved; only this row's `source_fingerprint` was refreshed.

The active translation CSV was edited by exact ID with
`tools/replace_text_preserve_eol.py`. No reference CSV or extracted asset was
modified.
