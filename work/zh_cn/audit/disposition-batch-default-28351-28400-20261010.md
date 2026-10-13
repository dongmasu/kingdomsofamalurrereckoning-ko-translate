# Disposition and Edit Batch: `default` IDs 28351-28400

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28351-28400, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, two `not an issue`, and nine uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28390 | Evasion-potion recipe | Not an issue: all four reagents and quantities (3/2/1/1) are present in the same sequence; line breaks match the source layout. |
| IDs 28351-28400 structural checks | Keys/order, embedded line breaks, and runtime-token identities/order | Not an issue: all four locales contain each ID once in identical order, and the preliminary scan found no actionable structural mismatch. |
| 28354 | `아이텐 서클(Ayten Circle)` | Uncertain: English/Japanese preserve “Circle” and Chinese also reads it as a circle/ring; the isolated question does not establish whether it is an organization or place. |
| 28358 | `Blades and the Seal` | Uncertain: the Korean keeps the source name, but the historical inventory groups it with unresolved named item/quest references. |
| 28374 | `동전의 건달` for `Knave of Coins` | Uncertain: English presents a capitalized card epithet, while Japanese and Chinese differ on lord/rogue readings. Canonical card-title terminology remains open. |
| 28377 | Quoted four-line moral verse | Uncertain: Korean retains the advice but loses the compact rhyme and old-fashioned voice; other locales also differ in lineation and quotation. Preserve pending integrated literary editing. |
| 28382 | Fortress preparation for `his return` | Uncertain: English says “that is where I go now,” Japanese specifies Seawatch, and Korean goes directly to the fortress. The antecedent and destination relation need scene context. |
| 28387 | `나무를 그들이 심었으니까` / “They grew them.” | Uncertain: both pronouns lack antecedents in the isolated source; the locales infer that the beings planted the trees, but the historical audit flags this inference. |
| 28397 | Sephedra / “made you look quite the fool” | Uncertain: Korean's humiliation reading is plausible, but the exact insult nuance and Sephedra spelling need scene and glossary context. |
| 28400 | Majestics / Carver / Architect / Shaper creation myth | Uncertain: Korean preserves the three-role sequence, but the titles and “composed” action need established lore terminology and integrated myth review. |
| Other named terms in IDs 28351-28400 | Ayten Circle, Architect's Inspiration, Blades and the Seal, Piercing Light, Gadflow, Tuatha, Motus Mining, Moon Camp, Esharra, and related terms | Uncertain: preserve current identities pending corpus-wide faction, deity, item, place, and creation-myth terminology review. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28351-28400 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
- No Korean `Texto` cell or source CSV changed in this batch.
- Active default CSV SHA-256 remains
  `0a9290e4029e7c7d82d7ee2899b144754b66cc3e97130969887de39f6a872651`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 876 accepted, 3,003 `not an issue`, and
  5,002 uncertain (8,881 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28401; 36,734 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
