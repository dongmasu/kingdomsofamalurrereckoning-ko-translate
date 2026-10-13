# Disposition and Edit Batch: `default` IDs 29151-29200

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29151-29200, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: one accepted, fourteen `not an issue`, and eleven uncertain.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29190 | `세그렐(Sagrell)` | `사그렐(Sagrell)` | The active corpus uses `사그렐` with `Sagrell` in 38 rows, versus 13 `새그렐` forms and this single `세그렐`. ID 23002 has an accepted correction using `사그렐`; align this row only and do not bulk-replace variants. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29160 | Tuatha king's death rumor | Not an issue: hearsay framing, uncertainty about the cause, and tentative suicide speculation are retained. |
| 29162 | Bodine Borgue / Arena rule | Not an issue: the self-defense motive, named opponent and sorcerers, and rule barring competitors from leaving before the fight ends are preserved. |
| 29163 | Shieldring Keep contract posting | Not an issue: the current contract, former holder, and request for information about the posting are distinguished. |
| 29165 | Dice wager variable | Keep `$Ayten_NQD.dice_wager$` exactly and preserve its order; Gold is localized. |
| 29167 | Refugees / Mel Senshir | Not an issue: the besieged outpost, hundreds of refugees, and conditional refusal to accept their fate while Mel Senshir stands are retained. |
| 29173 | Sacred Pools / Lyceum Grove / Font | Not an issue: five water sources, destination, opened roots, and flow-regulation sequence are preserved. Korean term choices remain open separately. |
| 29191 | Faer Gorta / signet ring | Not an issue: disappearance, extinguished ring flame, and reclaiming it from the altar are retained; creature terminology remains open. |
| 29194 | Stealth benefits | Not an issue: undetected movement and combat bonuses when attacking unseen are both preserved. |
| 29195 | Family heirlooms and unavailable key | Not an issue: volunteering, heirloom retrieval, family lock box, and the speaker's lack of the key are retained without inventing its location. |
| 29196 | Localized gem markup | Keep both `{*1...}` wrappers, their order, `{LINE_SPACE}`, and the selected-item instruction. The Korean matches the reference structure. |
| 29197 | Orella / Preordained trap | Not an issue: the meeting-as-trap reveal, betrayal, defeating assassins, and tracking Orella are preserved. |
| 29198 | Abergast affair / inquiry | Not an issue: appreciation for the help and an inquiry into how Abergast progressed unnoticed are retained. |
| 29200 | Bertran Nest journal fragment | Not an issue: the journal attribution, initiate status, Scholia Arcana, and departure from Ysa Chapter House are preserved. Canonical terms remain open separately. |
| IDs 29151-29200 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; embedded line-break counts and normalized runtime-token identities/order match. The variable at 29165 and gem markup at 29196 are preserved. |
| 29152 | “I've had a few apprentices of my own” | Uncertain: Korean's mentoring interpretation is natural, but the English idiom does not specify the exact relationship or experience. |
| 29159 | `Hexes` / `주술` | Uncertain: the capitalized English label may be a named skill/category or generic magic; the isolated row does not settle it. |
| 29169 | Savant / Trial of Initiation | Uncertain: rank and ceremony terminology differ across locales; preserve the role and responsibility pending glossary/context review. |
| 29171 | Compact label `vs. Fae` | Uncertain: the matchup meaning is clear, but the group's canonical Korean name and UI convention remain open. |
| 29172 | “I am yours” | Uncertain: service, allegiance, romance, or possession are all possible; do not choose a relationship from this isolated line. |
| 29175 | Flawless Mitharan Energizing Grip | Uncertain: quality, Mitharan modifier, function, and whether Grip is a component or handle need equipment/glossary context. |
| 29182 | `dove` address | Uncertain: the English pet name's familiar/flirtatious register is not established; Korean `아가씨` adds an age/status address. |
| 29183 | Sativa Road | Uncertain: English capitalization supports a proper place name, while Chinese translates Sativa; retain pending place-name alignment. |
| 29192 | Veil's Fae abilities | Uncertain: the legend and curiosity are preserved, but the Veil's identity and exact Fae-ability relation need context. |
| 29193 | Memory Walk | Uncertain: Korean preserves the exclusion of outsiders, but whether this is a rite, place, or formal practice remains unresolved. |
| Other named terms in IDs 29151-29200 | Jealous Sun / Sari / Corialia Scathe / Ost Ordura / Scholia / Savant / Shieldring Keep / Ayten / Mel Senshir / Mitharan / Niskaru / Lyceum Grove / Font / Ljosalfar / Lyria / Wending / House Ansilla / Sagrell / Faer Gorta / Veil / Memory Walk / Preordained / Abergast / Bertran Nest / Ysa Chapter House | Uncertain: defer canonical spellings, factions, titles, items, rites, and locations to integrated glossary review. ID 29190's spelling correction is limited to that row. |

## Verification

- Only the approved `Texto` cell at ID 29190 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution
  were preserved. Variables, markup, line breaks, and numeric values remain
  intact.
- Active default CSV SHA-256 and direct structural counts are recorded in
  `TRANSLATION_PROGRESS.md` and `NEXT-SESSION.md`.
- Register totals after this batch: 894 accepted, 3,101 `not an issue`, and
  5,156 uncertain (9,151 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29201; 35,934 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
