# Dialogue Context Revalidation: `2001870.quest_bxml`

- Date: 2026-11-14.
- Scope: all 162 `default` IDs linked to this asset by exact 8-byte key
  match; all 162 already have review-ledger entries.
- The extracted asset contains `QUEST_ID` / `DLC1_PH06b`, the NPC symbol
  `DLC1_NPC_GAL_LJO_ZefwynLan`, the topic symbol `DLC1_Shipwrecks`, and 54
  dialog-line handlers.
- These are asset-level clues only. No handler was mapped to an individual
  localization ID; speaker attribution remains `unassigned` and playback
  order remains `unknown`.

## Translation Review

The linked rows were checked against English, Japanese, Chinese, and the
active Korean text. Logical line-break counts and runtime/layout-token
signatures match across the four languages. The asset's shipwreck-choice
context corroborates that `Dvergan Raider` and `Gnomish Trireme` are vessel
labels, but does not establish a speaker for any linked line.

- `9062`, `12508`, and `16940` share the exact English label `Dvergan Raider`.
  The Japanese source identifies a Dvergan pirate ship, and the asset uses
  ship-choice labels. The three Korean labels now consistently read
  `드베르간 약탈선(Dvergan Raider)`; `약탈자` was not appropriate for this
  vessel label.
- `41266`, `43734`, and `55925` share the exact English label
  `Gnomish Trireme`. The Chinese text is identical, while the Japanese uses
  two phrasings for the same three-tier oared vessel. The Korean labels now
  consistently read `노움 삼단노선(Gnomish Trireme)`.
- `59373` names the `Keep Courtyard`; Japanese `砦の中庭` and Chinese
  `要塞庭院` support the place reading. Added the missing English pairing as
  `성채 안뜰(Keep Courtyard)` without changing the rest of the quest text.
- `27459` remains on hold for register: Japanese is casual, while Chinese is
  honorific. The asset-level NPC symbol cannot identify the speaker of this
  individual line, so the Korean polite form was not changed on an unsupported
  speaker inference.
- `10287`, `14289`, `18214`, and `61809` were rechecked and retained under
  their existing ID-specific decisions; asset co-occurrence was not treated
  as proof of speaker or line order.

Only the six supported Korean rows (`9062`, `12508`, `16940`, `41266`,
`55925`, `59373`) were changed in the active CSV. Their existing ledger rows
and dispositions were preserved; only their `source_fingerprint` fields were
refreshed. No extracted asset or immutable source CSV was modified.

## Validation

The review ledger validates all 65,135 IDs and their four-language
fingerprints. The index, asset catalog, and all-ID catalog reproduce; all nine
index tests and 11 CSV-preservation tests pass. The Korean CSV retains its
65,135 ordered records, UTF-8 BOM, 71,838 CRLF sequences, 244 LF-only
newlines, and no bare CR. `git -c core.whitespace=cr-at-eol diff --check`
passes.
