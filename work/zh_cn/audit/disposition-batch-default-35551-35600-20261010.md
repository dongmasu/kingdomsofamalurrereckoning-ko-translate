# Disposition Batch: `default` IDs 35551-35600

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary report with active Korean,
  immutable English/Japanese/Chinese rows, historical findings, terminology,
  values, markers, and embedded line breaks.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, six `not an issue`, and eleven uncertain.
- CSV change: ID 35582.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35553 | Floating-city travelogue / Mitharu / impossible support | Uncertain: all four narrative sections and the speaker's awe are retained, but the last image and relation between the floating city and absent stone are unclear across locales. Do not settle the lore metaphor from the Japanese rendering alone. |
| 35555 | Scrying mirror / named Eye | Not an issue: English identifies a scrying mirror and Korean retains that object; the Japanese named Eye is insufficient to override the English. The frontal assault versus stealth contrast is preserved. |
| 35560 | Teeth of Naros travelogue / explorers and savior | Uncertain: Korean retains the three initial explorers, later fourth helper, southward journey, four sections, and the female savior reference; proper names and narratorial details need integrated context. |
| 35562 | Brother Fallon / Mitharu's clouded tears | Not an issue: the report of Brother Fallon's death and the prayer to Mitharu are preserved. Prior name/title questions do not establish a row-local meaning error. |
| 35565 | `Poor folk? Make amends.` | Uncertain: Korean turns the clipped command into compensating the poor. That is plausible, but the fragment and scene do not establish whether `make amends` means restitution, apology, or another corrective act. |
| 35567 | Inventory categories and rarity labels | Uncertain: all six categories, rarity colors, and `{LINE_LEFT}`, `{LINE_SPACE}`, `{LINE_INDENT}`, and `{*1}`-`{*6}` markers remain in order. `Infrequent` and the corpus-wide Korean category labels need UI glossary review. |
| 35572 | Sorcerer / Cyclone Ammo | Uncertain: class and ammunition labels are present, but canonical localized UI terms have not been established in the relevant glossary. |
| 35577 | `my blades will always be at your back` | Uncertain: Korean promises protection, while Japanese and Chinese read the blades as aimed/held against the addressee's back. The English can carry support or ominous threat in isolation; do not reverse the meaning without dialogue context. |
| 35580-35581 | Cloudcrest Mountain / Rite of Valor | Uncertain: destination, reinforcements, delay warning, and rite objective are retained; canonical place and ritual forms remain open. |
| 35582 | `something more` after business and peers' respect | Accepted: change `더 많은 걸 원해` to `그 이상을 원해`. In context, the speaker wants something beyond the stable business and peer respect he previously wanted, not simply a greater quantity. Japanese and Chinese support the “something else/beyond that” reading. |
| 35583 | `DOWN` label | Not an issue: retain the literal control/state label used by English and Japanese; Chinese's directional rendering alone does not prove that Korean should expand it. |
| 35585 | Physical-damage potion recipe | Uncertain: the recipe function and amounts are retained, but Sativa Fibers, Scarwood Bark, and Bloodroot forms need cross-entry item terminology review. |
| 35589 | Health-steal value without percent | Not an issue: the Korean retains the damage increase and does not add a percent sign; Japanese alone adds unsupported `%`. |
| 35591 | Imprisoned `she` | Uncertain: Korean preserves the unnamed female referent and demand to bring her out; the antecedent cannot be identified from this standalone row. |
| 35593 | Ayten / “I'm the law” | Not an issue: the newcomer address, lawkeeper's authority, peace condition, and leave warning are all retained. |
| 35594 | `flesh and blood` / Anokatos's will | Uncertain: the will contrast is retained, but the English appositive can describe the speaker or Anokatos; Korean chooses the embodied-speaker reading while Japanese chooses the latter. |
| 35596 | Unbound `they` / Kollossae comparison | Uncertain: Korean preserves the English plural subject and comparison; the referent of `they` is not available in the isolated entry. |
| Remaining ordinary text in IDs 35551-35600 | Dialogue, labels, values, markers, and structure | Not an issue: the other 32 IDs were checked in the four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- The source-keyed 35400-35599 audit inventory confirms these are open
  questions, not edit authority. In particular, retain uncertainty for the
  blade idiom, `flesh and blood`, the unnamed prisoner, and `they`.
- No Japanese-derived Korean text from `work/ja_jp/` was counted as Japanese
  evidence.

## Verification

- English, Japanese, Chinese, and active Korean entries for IDs 35551-35600
  were checked in matching key order.
- The four-paragraph travelogue (35553), four-section book introduction
  (35560), inventory marker sequence (35567), recipe quantities and breaks
  (35585), and `+20` health-steal value without `%` (35589) are retained.
- Only the approved Korean `Texto` at ID 35582 changed. UTF-8 BOM, 72,046
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35601; 29,534 `default` IDs remain through 65134.
