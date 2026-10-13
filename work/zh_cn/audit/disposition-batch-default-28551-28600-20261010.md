# Disposition and Edit Batch: `default` IDs 28551-28600

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28551-28600, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, two `not an issue`, and eight uncertain.
- The pronoun/agency correction at ID 28599 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28599 | `내가 더는 지지하지 않는 누군가` for “someone they don't support anymore” | Accepted: change to `그들이 더는 지지하지 않는 누군가와 한패라고 생각해서 벌어진 일이야`. English makes the unnamed group the subject of `don't support`; the Korean incorrectly made the speaker the subject. Japanese/Chinese also leave the group as the implied subject. |
| IDs 28551-28600 structural checks | Keys/order, breaks, runtime-token identities/order | Not an issue: all four locales contain each ID once in identical order; line breaks and normalized token structures match. |
| Remaining ordinary dialogue, objectives, and concise UI wording, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported by the checked references. |
| 28553 | `근접 방어 효율` / “Melee Block Efficacy” | Uncertain: English/Japanese specify the block mechanic; Korean may broaden it to defense. Confirm the project's established combat-stat term before changing it. |
| 28554, 28556, 28568 | Scholia Arcana / Savant / Captain at Arms / Pledgeshields / Archsage | Uncertain: institution, rank, and faction forms need corpus-wide glossary alignment. The likely English typo “speak to travel to Ysa” is not reproduced in Korean. |
| 28561 | `나와 같은 영혼` / `like-spirits` | Uncertain: the metaphor may mean kindred people sharing the musical muse rather than a literal spiritual category. |
| 28563 | `비탄` / capitalized `Sorrows` | Uncertain: this may be the House/faction, an emotion, or another named concept. |
| 28565 | `샘물(Font)` / Gardens of Ysa | Uncertain: English capitalizes `Font` as a named sacred spring; Korean keeps the source in parentheses, but the canonical display form remains open. |
| 28580 | Generosity / neighbors / donation | Uncertain: the English is elliptical, and Japanese/Chinese construe the conditional differently. Korean makes the likely contrast explicit, but scene context is needed. |
| 28588 | `물품 목록` for “my inventory” | Uncertain: English may refer to physical stock/goods rather than a written list. The admission of bending rules is preserved. |
| Other named terms in IDs 28551-28600 | Lykeios, Prismere, Font, House of Sorrows, Telogrus, Missives, House of Ballads, Great Cycle, Preordained, Hireling, and related names | Uncertain: retain current identities pending corpus-wide name, faction, institution, and lore-term alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- Only Korean `Texto` at ID 28599 changed. No source CSV, key, row order, or
  variant structure changed.
- Active default CSV SHA-256:
  `0610eb9e5a30a9b9ef92f621e044e1786e1202519f28cdba055a6e674d8d427b`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 880 accepted, 3,012 `not an issue`, and
  5,033 uncertain (8,925 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28601; 36,534 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
