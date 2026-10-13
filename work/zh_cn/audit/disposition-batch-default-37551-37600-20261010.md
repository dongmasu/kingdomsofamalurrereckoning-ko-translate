# Disposition Batch: `default` IDs 37551-37600

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, four `not an issue`, and eight uncertain.
- CSV change: ID 37567.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37554 | Voice of Rathir / civic office | Uncertain: the contrast with general, Fateweaver, and Lyria is retained; whether this is an official title or generic civic voice needs context. |
| 37555 | nightmares / wounds / restlessness | Not an issue: all three torments and the decision to spare her are retained; Korean follows English's unresolved feminine pronoun without importing Japanese's “wife.” |
| 37564 | Prudent Temperance | Uncertain: the direct address is retained with the English name, but the intended title/name and Korean convention remain unsettled. |
| 37566 | DC brass ring / Anker Edmure of Emaire | Uncertain: material, initials, and likely recipient are retained; the two proper-name forms need alignment. |
| 37567 | `cage key` / `우리 열쇠` | Accepted: change to `철창 열쇠를 훔쳐라`. English and Japanese say cage key, while Chinese specifies a cell key; `우리 열쇠` incorrectly reads as “our key.” |
| 37570 | fragmentary “My brother, Giran” | Not an issue: the fragmentary address and question about helping find Giran are retained without inventing an objective beyond the English. |
| 37572 | Hospitalis Quarters | Uncertain: the location label is retained, but proper district versus generic hospital ward remains unresolved across locales. |
| 37573 | Galafor / White Nil | Uncertain: regained power, restored balance, and the revelation about Nil's soul remain; canonical name forms need alignment. |
| 37577 | font | Uncertain: the objective is retained, but English, Japanese, and Chinese differ on whether the font is a spring or a ritual vessel. |
| 37582 | “Maybe one of them herself” | Uncertain: Korean retains the speaker's uncertainty and feminine referent; preceding context is needed to identify the group. |
| 37586 | cast Zotikus | Uncertain: Japanese supports casting an actor in the role and Korean reflects that reading; the proper name and theatrical context remain provisional. |
| 37599 | Webwood silkfarmer's account | Not an issue: colloquial voice, no-seasons claim, harvest data, spider/tunnel contrast, and the full three-paragraph structure are retained. |
| Other rows in IDs 37551-37600 | Dialogue, names, values, objectives, UI, and labels | Not an issue: remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed questions at IDs 37548-37599 were checked, including the
  PSN notice, cage key, Hospitalis Quarters, font, unclear feminine referent,
  Zotikus, and Webwood entry.
- The English, Japanese, and Chinese references support correcting 37567;
  Chinese's `cell key` is compatible with the source's cage/prison context.
- The 37599 paragraph and line structure was inspected without changing it.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37551-37600 once and in identical order.
- Only active Korean `Texto` at ID 37567 changed.
- Runtime markers, numeric values, and the three-paragraph journal layout
  remain unchanged.
- The UTF-8 BOM and existing mixed line endings are preserved; exact counts
  and the resulting SHA-256 are recorded in the current checkpoint documents.

## Checkpoint

Disposition is complete through ID 37600. Resume at ID 37601; 27,534
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37601-37650-preliminary.md`. The next unused decision ID is
D-12198.
