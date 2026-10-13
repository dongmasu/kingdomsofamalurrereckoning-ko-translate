# Disposition Batch: `default` IDs 35801-35850

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, and source-keyed
  historical notes.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: two accepted, one `not an issue`, and eight uncertain.
- CSV changes: IDs 35802 and 35804 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35802 | Lockpicking tutorial / `곡괭이` | Accepted: English says `pick` in the angle-adjustment tutorial, Japanese says pick, and Chinese explicitly says a lock-opening tool. The Korean mining pickaxe is the wrong object. Change to `#NAMED_ICON_360_RS#로 자물쇠 따개 각도를 조정하세요.` and retain the exact runtime marker. |
| 35804 | Thanks on behalf of the speaker's people | Accepted: English explicitly thanks the addressee on behalf of the speaker's people; Chinese agrees, and Japanese says to thank them on their behalf. The old `그들에게 대신 감사 인사를 전하네` can make the player convey thanks to the people. Change to `...적어도 우리 사람들을 대신해 네게 감사하네.` |
| 35810, 35820 | Shadow Flare effect / Madding Wind key | Uncertain: 20% Bleeding, 20% Poison, 10% damage, and the upper-right control-room key destination are preserved. Canonical ability and location spellings remain terminology questions. |
| 35818, 35821 | The Widow / Den Patron | Uncertain: the fear of the Widow becoming real is preserved, but its formal title status remains open. For `Den Patron`, English, Japanese, Chinese, and Korean suggest customer, regular, deity/protector, and sponsor readings respectively; context is insufficient. |
| 35824-35826 | Cliff Barghest / Well | Uncertain: Korean retains the friendly creature, repelled attackers, den, and plan to ask Jora what to do with it. `Well` is rendered as a well while Japanese says a spring; its identity and canonical form are unresolved. |
| 35830-35832 | Executioner / Last Breath / The Beast / Requiem | Uncertain: the claimed armor origin, change-not-death distinction, card readings, and theft of the ship are retained. Formal title, card, and ship-name conventions remain open. |
| 35836 | `Serve Sentence` / `형기 집행` | Uncertain: English is a UI-like label; Chinese means serving time while Japanese can mean execution of a sentence. Without the screen/context, the actor and action cannot be settled. |
| 35840 | `forgot myself` / `제정신을 잃었다` | Uncertain: English is idiomatic/ambiguous, Japanese stays close to forgetting oneself, and Chinese says memory loss. The immediate monk/king contrast may concern identity rather than sanity; no single reading is secure. |
| 35843 | Knave of Pride / Bolgan Masters | Uncertain: the untimely death and failure to help against the Bolgans are retained. `Knave` may be a formal House role/card/person, and `Bolgan Masters` remains a lore/group label. |
| 35849 | Weeping King / `울음의 왕` | Uncertain: the person/title is clear, but the active corpus uses multiple forms, including `통곡하는 왕`; earlier dispositions leave the canonical title unresolved. Do not normalize from frequency alone. |
| Remaining ordinary text in IDs 35801-35850 | Dialogue, objectives, names, labels, and values | Not an issue: the other 34 IDs were checked across all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed historical entry covering IDs 35800-35999 has no row
  entry for 35801-35850; the absence is not treated as approval. Existing
  register decisions on lockpicks, Wells/Fonts, House roles, and the Weeping
  King were consulted where relevant.
- The correction at 35802 follows the accepted active-corpus lockpick
  rendering; the correction at 35804 resolves the explicit thanks-agency
  relation in English and Chinese without relying on the Korean migration
  archive as Japanese evidence.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35801-35850
  once in identical order.
- The `#NAMED_ICON_360_RS#` marker at 35802 remains byte-identical; ID 35810
  retains 20% Bleeding, 20% Poison, and 10% Shadow Flare damage.
- No embedded line-break or runtime-marker mismatch was found.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `5a1726f7414fb7596bc86a114c62778a599713236fd9fc43dcaa9cbdd9b7c33a`.
- The unresolved hash discrepancy recorded in the preceding checkpoint
  remains open; this batch changed only the two accepted Korean cells and
  restored their original CRLF endings.
- These are working dispositions, not independent final linguistic
  approval.

## Checkpoint

Disposition is complete through ID 35850. Resume at ID 35851; 29,284
`default` IDs remain through ID 65134. The next unused decision ID is
D-11586. Preliminary scan:
`default-ids-35851-35900-preliminary.md`.
