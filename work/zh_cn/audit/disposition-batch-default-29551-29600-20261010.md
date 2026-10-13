# Disposition and Edit Batch: `default` IDs 29551-29600

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29551-29600, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: two accepted, eleven `not an issue`, and eleven uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29555 | `내가 보기엔 리더와 그의 워스원은 충분히 움직이지 않고 있어.` | `내가 보기엔 리더(Rydder)와 그의 워스원은 충분히 움직이지 않고 있어.` | English capitalizes `Rydder` as a name, and ID 29449 identifies Drystan Rydder. Add the source spelling to disambiguate the Korean homograph `리더`; this does not settle the canonical Korean phonetic form. |
| 29576 | `조합법을 알고 있는 물약을 제조합니다.` | `보유한 조합법으로 물약을 제조합니다.` | English says potions for which the player has recipes. The previous Korean follows a “knows recipes” reading; restore recipe ownership with a concise UI-compatible phrase. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29554 | “What is Deireadh?” | Not an issue: Korean preserves the direct question and quoted-term function; the term's identity and spelling remain open separately. |
| 29557 | Return from the dead / “he” will be reasonable | Not an issue: Korean retains the sarcastic assurance, male reference, and unexplained return-from-death context. |
| 29559 | Warsworn status / no one orders the speaker | Not an issue: self-importance, camp respect, and the repeated refusal to be ordered around are preserved. |
| 29562 | Two Wells / captured essence / Tirnoch's magic | Not an issue: the attunement, essence capture, and missing-element inference remain in order; exact lore mechanics are unresolved separately. |
| 29563 | Cortius / Gale Crossing rat problem | Not an issue: Korean meaning is coherent and preserves the request for help and decision to lend a hand. The English NBSP after `Cortius` is a source-format anomaly, not a Korean defect. |
| 29579 | Poison Cloud effect | Not an issue: 10% chance, death trigger for a Poisoned enemy, Poison Cloud, 150 Poison Damage, and the line break are retained. |
| 29587 | Swordplay as a break from festivals | Not an issue: Korean conveys anticipation of swordplay as a change of pace from constant festivals. |
| 29590 | Potion / Sir Farrara near death | Not an issue: companions' help, correct-use condition, and return from the brink of death are preserved. |
| 29596 | Need at Gallows End / survivors' leadership | Not an issue: the speaker's need at the location, father's strong faith, and survivors looking to the speaker for leadership are retained. |
| 29599 | Lyria / cards spelling mortal lives | Not an issue: the fate-card metaphor and relation to mortal lives are retained without replacing the image with generic fate. |
| IDs 29551-29600 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; line-break counts and normalized runtime-token identities/order match. The 29563 source NBSP is documented, not copied into Korean. |
| 29551 | Naros Jottun Slave | Uncertain: the phrase's meaning is retained, but whether it is a proper title/role label and canonical Korean forms remain unclear. |
| 29554 | `Deireadh` | Uncertain: the direct question is preserved, but the quoted lore term's identity, pronunciation, and Korean spelling are unresolved. |
| 29571 | Splitrock Depths | Uncertain: a named location is clear, but the sense of `Depths` and its canonical Korean place form are not established across locales. |
| 29575 | “their deaths were not in vain, either” | Uncertain: Korean leaves the group unnamed, but the antecedent and earlier consolation implied by `either` depend on context. |
| 29578 | Flawless Mitharan Fortified Trim | Uncertain: the Korean item label is plausible, but component type, material, and name segmentation need glossary alignment. |
| 29581 | Missives of Sable | Uncertain: Sable may identify a person, organization, or collection; the Korean possessive reading is not settled by other locales. |
| 29584 | Theater of Fate | Uncertain: it may be a named venue or institution; canonical Korean naming remains open. |
| 29592 | “subtle speech and hidden hands” | Uncertain: Korean interprets hidden hands as concealing one's inner thoughts, while the source may refer to covert action; the metaphor needs context. |
| 29597 | `Be at peace` as `평안히 잠들길` | Uncertain: the English is open-ended and Korean adds sleep/repose; scene context is needed to determine whether this is a death formula. |
| 29598 | Blackshriek | Uncertain: this standalone name has conflicting phonetic renderings; no canonical Korean spelling is established. |
| Other named terms in IDs 29551-29600 | Naros / Jottun / Deireadh / Rydder / Warsworn / Hugues / Cortius / Splitrock / Mitharan / Sable / Theater of Fate / Farrara / Gallows End / Lyria and related terms | Uncertain: source meanings are generally retained, but canonical names, faction terms, and item labels require integrated glossary review. |

## Verification

- Only the approved `Texto` cells at IDs 29555 and 29576 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution
  were preserved. Poison Cloud values and its embedded line break remain
  intact.
- Active default CSV SHA-256:
  `4b40e16117e022411d3032a1eefeb95d7fa9e77c31cd8838930210ce432fd10a`.
- Register totals after this batch: 906 accepted, 3,196 `not an issue`, and
  5,241 uncertain (9,343 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29601; 35,534 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
