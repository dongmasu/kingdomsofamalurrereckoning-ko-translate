# Disposition Batch: `default` IDs 35051-35100

- Decision date: 2026-10-10.
- Scope: all 50 IDs, checking the preliminary findings against active Korean,
  immutable English/Japanese/Chinese rows, historical dispositions, values,
  markers, and row structure.
- Evidence caution: only `src/csv/ja_jp/` was used as Japanese evidence;
  `work/ja_jp/` is a Korean migration archive.
- Decisions: two accepted, three `not an issue`, and seven uncertain.
- CSV changes: IDs 35055 and 35079 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35055 | Handwraps feeding mana and elemental-fire reserves | Accepted: replace the capacity/storage reading with `착용자의 마나와 원소 화염 에너지를 보충해 주도록 마법으로 조율된 천 손목붕대.` English `feed`, Chinese `恢复`, and the handwrap description indicate replenishing the pools/reserves, not increasing storage capacity. Japanese uses “increase,” but does not support the Korean capacity-of-storage syntax. |
| 35062 | `Adrenaline Surge` | Uncertain: +15% Critical Hit chance and the active-effect condition are preserved, but the ability's canonical Korean name and whether `Surge` should be a semantic or transliterated form are not established. |
| 35065 | Wencen's `brood` / first of the Great Fae Houses | Uncertain: Korean preserves the self-proclaimed-hero claim, but resolves `brood` and “first of” as lineage/founder; the exact hierarchy and canonical group term remain unclear. |
| 35067 | Guardian of the Cradle | Uncertain: the guardian relationship and “never needed protection until now” contrast are retained. Historical material suggests “Summer's Cradle,” but the English row itself omits Summer, so do not expand the name without scene confirmation. |
| 35070 | `King of Cups` | Uncertain: English/Japanese/Chinese identify the Cups title, but the project has repeated unresolved decisions D-380 and D-1198 on its tarot/lore function, Korean ordering, and canonical suit term. |
| 35076 | `Preordained` | Uncertain: the safety motive is retained, but the capitalized group/faction term has several competing Korean forms; prior decisions including D-471 and D-1603 leave it open. |
| 35077 | `Bloody` | Uncertain: English and Japanese say `Bloody`, while Chinese renders “Bloody Bones”; the identity/name expansion remains unresolved, so retain the current Korean pending context. |
| 35079 | “shine of generosity” | Accepted: replace `자비의 빛` with `관대함의 빛`; English, Japanese, and Chinese support generosity/magnanimity, not mercy/compassion. Keep the unusual image and the speaker's offer. |
| 35080 | Meta-question about translation progress | Not an issue: `번역은 잘돼 가?` naturally conveys the deliberate meta-joke and matches the casual voice in Japanese. |
| 35098 | Reckoning / Fateshift tutorial | Uncertain: the sequence, all-enemies emphasis, and experience bonus are retained, but canonical Korean terms for Reckoning, Fateshift, and unraveling remain a broader terminology question. No isolated edit is authorized. |
| 35100 | Ysa's eventual end / currents | Not an issue: the certainty that Ysa will eventually fall beneath Prismere blades and the contrast between the speaker holding back the tide and the addressee changing the currents are preserved. |
| Remaining ordinary text in IDs 35051-35100 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 39 IDs. |

## Historical Audit Reconciliation

- The existing King of Cups decisions D-380 and D-1198 explicitly leave its
  tarot/lore interpretation and Korean display unresolved; this batch does
  not override them.
- Preordained remains inconsistent across the active corpus and is already
  uncertain at D-471 and D-1603. No global normalization is inferred.
- `Bloody` versus `Bloody Bones`, Summer's Cradle, Adrenaline Surge, and
  Reckoning/Fateshift terms remain open; no locale-only expansion or
  transliteration is promoted to a canonical decision.
- The handwrap and generosity corrections are row-local semantic fixes and
  do not authorize terminology-wide edits.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean;
  keys and order match. Line-break and runtime-marker identities/order have
  no discrepancies in this range.
- The +15% value at 35062, +7% at 35082, and numeric range 4-6 at 35066 are
  unchanged.
- Only the `Texto` values at IDs 35055 and 35079 changed. The UTF-8 BOM,
  72,046 CRLF endings, and 39 original bare-LF endings remain intact.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35101; 30,034 IDs remain through ID 65134.
