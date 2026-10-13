# Disposition and Edit Batch: `default` IDs 28001-28050

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28001-28050, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, one `not an issue`, and four uncertain.
- Accepted corrections at IDs 28006 and 28022 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28006 | `밤새 술병을 붙들고 잤다고나 할까` for `slept the night in a bottle` | Accepted: change to `밤새 술에 절어 뻗어 있었거든.` English uses a euphemistic idiom for drunkenness; Japanese says the speaker was drunk and asleep, and Chinese says heavily intoxicated. The old Korean could describe physically holding a bottle overnight. |
| 28022 | `자, 어머니.` for `There, there mother.` | Accepted: change to `어머니, 괜찮아요.` Japanese and Chinese clearly use a soothing/reassuring address; the old Korean sounds like a handoff or command rather than consolation. |
| 28001-28003, 28007, 28009-28011, 28014, 28016, 28018-28019, 28023, 28026-28027, 28029, 28033-28034, 28036, 28038, 28045-28046, 28048, 28050 | Dialogue, objectives, and concise UI | Not an issue: the Korean generally preserves the source meaning and register; no specific correction is better supported. |
| 28005 | “traded more than rags” / “up above and here below” | Uncertain: English is elliptical and Japanese/Chinese differ in how they express the trade parties and “above/below.” Korean's “지상과 지하” is plausible, but the intended relationships need scene context. |
| 28032 | `길에서 벗어난 사람이군` for `Someone off the road.` | Uncertain: retain the clipped line until context establishes whether it describes a traveler, outsider, or someone literally off the road. |
| 28040 | Gallows and roaring waters threat | Uncertain: English says “walk the gallows,” Japanese says gallows gate, and Chinese says walk onto the gallows. Korean preserves the sequence but the exact structure/location needs scene context. |
| 28004, 28008, 28012-28013, 28015, 28017, 28020-28021, 28024-28025, 28028, 28030-28031, 28035, 28037, 28039, 28041-28044, 28047, 28049 | House of Valor / Firstsworn / Unbound / Warrior Kings / Kobold / Warden / Hyperian-Cipher / Widow / Beckoned / Salon Magisterium / Warsworn Sentry / twin Defenders / Gadflow / Apotyre miners / Faitir / Celerity / Amaldor | Uncertain: preserve current identities and gameplay/story relations while deferring faction, species, rank, role, ability, and institution terms to corpus-wide glossary alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The preliminary key/order, embedded-line-break, and normalized
  runtime-token checks remain valid. No numeric or structural change was
  made.
- Only Korean `Texto` values at IDs 28006 and 28022 changed. IDs, variants,
  row order, and source CSVs remain unchanged.
- Active default CSV SHA-256:
  `88eee19175ebc4d89ddd9849e634d1cb620c25e8c4760b463c948d12a17cbc4b`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 867 accepted, 2,987 `not an issue`, and
  4,958 uncertain (8,812 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28051; 37,084 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
