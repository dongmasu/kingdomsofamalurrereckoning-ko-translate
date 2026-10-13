# Disposition and Edit Batch: `default` IDs 30801-30850

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30801-30850, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: three accepted, five `not an issue`, and five uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30813 | `구름 위에 머리를 둔 추종자 무리야.` | `현실 감각 없는 추종자 무리야.` | English uses “heads in the clouds” idiomatically for detached/unrealistic followers. Japanese and Chinese also avoid the literal physical image; the new wording preserves the criticism without losing the separate next sentence about failing to see reality. |
| 30816 | `쉬운 일은 아니지만, 마을에 이 물약이 꼭 필요해!` | `쉬운 일은 아니지만, 마을에 곧 이 물약이 꼭 필요해!` | Restore English `soon`, supported by Chinese `很快`; Japanese says immediately. |
| 30841 | `그러려면 시체가 필요해. 죽은 시체면 더 좋고.` | `그러니까 몸이 필요해. 죽은 몸이면 더 좋고.` | English asks for bodies and prefers dead ones, distinguishing a body from a dead body. Japanese and Chinese preserve that distinction; the old Korean made the preference tautological by first requiring a corpse. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30804 | Capitalized player title `Beckoned` / `부름받은 자여` | Not an issue: this matches the established player-title form accepted at D-692 and repeatedly applied in later decisions. |
| 30807 | `spidersac ichor`, `Fennwrac`, and `grist` recipe ingredients | Uncertain: all three ingredients are present, but the locale references differ on whether Fennwrac is a leaf/reagent and whether grist is grain or a cooked mixture. Do not invent recipe specifics or normalize the names without item/context evidence. |
| 30819 | `House Ansilla` / `안실라 가문` | Uncertain: Japanese and Chinese support a family/House reading, but the formal Korean convention for this named institution and its relation to the larger Houses is unresolved. |
| 30821 | Elliptical `By my leave, I'm sure` / `분명 내 허락을 받았겠지` | Uncertain: English may be sarcastic, Japanese sounds like granting permission, and Chinese instead reads as “when I was away.” Speaker intent cannot be settled from the isolated line. |
| 30830 | `Scholia Arcana` / `스콜리아 아르카나` | Not an issue for this standalone proper-name label: Korean preserves the English institution name in an established active form. Whether the organization should instead receive a semantic Korean title remains a corpus-wide terminology question. |
| 30838 | Unnamed `It` resting out of reach | Uncertain: the line does not identify the object or group. Korean preserves the source's generic pronoun and does not invent an antecedent. |
| 30843 | `{*6Resisted}` marker payload | Not an issue: marker index 6 and payload are retained as in English and Japanese; Chinese localizes only the visible payload. No marker-identity or order discrepancy exists. |
| 30847 | Lightning-potion ingredient layout and quantities | Not an issue: Korean preserves the blank-line-separated list and counts 3, 2, 1, and 1. Locale differences in reagent spellings are tracked separately as terminology questions. |
| Remaining ordinary text in IDs 30801-30850 | Dialogue, objectives, labels, and ordinary prose | Not an issue at this pass: no additional supported meaning, voice, numeric, token, or structural defect was identified. Context-sensitive findings remain listed separately. |
| Other named terms in IDs 30801-30850 | Kollossae / Fennwrac / Jottun / Dren / Dyth / Hierophant / House Ansilla / Augur / Scholia Arcana / Hearts of Chaos / Hreid Amelthoe / and related names | Uncertain: names, faction/role titles, reagent terms, and transliteration/localization conventions need integrated glossary and context alignment. |

## Verification

- The English, Japanese, Chinese, and Korean sources contain IDs 30801-30850
  once and in the same order, as confirmed against the preliminary report.
- The preliminary structural checks remain applicable: embedded line breaks
  and normalized runtime-token identities/order match; `{*6}` is preserved.
- ID 30847 retains the blank-line-separated recipe and all four quantities.
- Only the accepted Korean `Texto` cells at IDs 30813, 30816, and 30841
  changed. No key, variant, row order, token, or recipe quantity changed.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Active default CSV SHA-256:
  `7ecb2378930f1c4047866ff7d549d5f2b245b1141cc709328131bbf990eeb749`.
- Register totals after this batch: 943 accepted, 3,470 `not an issue`, and
  5,572 uncertain (9,985 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30851; 34,284 `default` IDs remain.

These working dispositions are not independent linguistic approval.
