# Disposition and Edit Batch: `default` IDs 28101-28150

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28101-28150, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, three `not an issue`, and five uncertain.
- Accepted title and honor-meaning correction at ID 28135 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28135 | `에메랄드 여왕` / `영광을 얻는다` for `Emerald Lady` / `I honor` | Accepted: change to `적의 머리를 에메랄드 여인의 발치에 바칠 때마다 그녀에게 경의를 표한다.` English says `Lady`, not `Queen`, and the active Korean at ID 63299 already uses `에메랄드 여인`. The old wording also adds gaining glory rather than honoring her. |
| 28104, 28134 | Localized services marker / `+17%` stun-duration value | Not an issue: marker wrapper, `{1}` placeholder, and order are preserved; the displayed stun-duration value matches the source. |
| 28148 | Duplicated `you` in the English source | Not an issue: the English repeats a pronoun in an apparent typo; Japanese/Chinese and Korean express one request to end the speaker's suffering without changing the intended meaning. |
| 28101-28103, 28105, 28109-28115, 28117-28118, 28121-28124, 28126-28128, 28130, 28132, 28136-28137, 28139, 28143, 28145-28146, 28149 | Dialogue, objectives, and short UI wording | Not an issue: Korean generally preserves source meaning and voice; no specific correction is better supported. |
| 28107 | `풀려나면` for an alchemical formula that `if released` could cause devastation | Uncertain: English and Chinese allow release/publication, while Japanese says dissemination. Korean is broad enough to fit the English but the precise action depends on context. |
| 28129 | `도브(Dove)` as direct address | Uncertain: English uses lowercase `dove` as a familiar vocative; Japanese omits it and Chinese says “peace messenger.” The Korean transliteration remains traceable but may look like a proper name. |
| 28138 | `그들은` / `they're no myth` | Uncertain: the antecedent is absent from the isolated English row. Korean preserves that ambiguity; do not invent a referent. |
| 28141 | Trav / Camp Moondown relation | Uncertain: English syntax permits multiple attachments. Japanese treats Trav as the subject and Moondown as a separate consideration; Korean's `와 함께` may imply the camp moved with Trav. |
| 28106, 28108, 28116, 28119-28120, 28125, 28131, 28133, 28140, 28142, 28144, 28147, 28150 | Beckoned / Mitharan / Lyria / Kollossae / Warlock / Cranalt / House of Vengeance and Bhaile / Gale Crossing / Court of Enchantments / Ragnarr, Tearscotter, and Praetorian Paige / Deirdre / Last Breath / Beckoned | Uncertain: preserve current identities and narrative/gameplay relations while deferring recurring title, faction, Destiny, institution, place, character, and item forms to corpus-wide glossary alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The preliminary marker/order checks at ID 28104 remain valid. The
  `+17%` stun-duration value at ID 28134 is unchanged.
- Only Korean `Texto` at ID 28135 changed. IDs, variants, row order, and
  source CSVs remain unchanged.
- Active default CSV SHA-256:
  `17f98a0de73b292d895bc95d22af6f951b62d1d407447ef6528013fc5eb7b094`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 868 accepted, 2,993 `not an issue`, and
  4,968 uncertain (8,829 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28151; 36,984 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
