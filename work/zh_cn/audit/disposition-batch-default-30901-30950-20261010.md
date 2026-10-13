# Disposition Batch: `default` IDs 30901-30950

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30901-30950, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: zero accepted, five `not an issue`, and twelve uncertain.
- No translation CSV cells were changed.

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30902 | `Knave of Pride` / `교만의 시종` | Uncertain: Japanese identifies a House of Pride retainer, while English and Chinese use a title-like label. Existing Korean alternatives do not settle whether this is a formal title or role. |
| 30909 | `House of Ballads` / `발라드 가문` | Uncertain: the institution is identifiable, but the corpus alternates between semantic, translated-House, and phonetic forms. Do not normalize one isolated label. |
| 30913 | `Oathblade Kirby` / `서약검 커비` | Uncertain: Oathblade may be a rank/title or part of a name. Japanese's mercenary-rank rendering and the corpus's varying Oathblade forms do not establish a canonical Korean label. |
| 30917 | `High King Titarion` / `티타리온 대왕` | Uncertain: identity is retained, but the corpus varies in title/name order and has no settled display convention for High King. |
| 30920 | Four-part stone riddle | Uncertain: Korean preserves all four cryptic parts and their order. The row does not establish the referents of Patrons, Champion of Fate, Unbound path, or Beckoning. |
| 30921 | Capitalized `Maid` / `시녀` | Uncertain: this may be the formal Maid of Windemere title rather than a generic maid; the row alone does not settle the role. |
| 30924 | Great-great-grandson / heir to the Caeled Coast | Not an issue: `고손` preserves the stated generational relationship, and `계승자` conveys heir without deciding whether the Coast is an estate, territory, or title. |
| 30926 | `{3}%` chance to steal `{1}` Health per hit | Not an issue: chance, amount, effect, and variable identities/order are preserved in the Korean health-steal description. |
| 30932 | Sister Zelda becoming a monk in the Order of Mitharu | Not an issue: Korean preserves the evidence-to-status progression and uses gender-neutral `수도자` for the role. The institution's exact identity remains a separate terminology question. |
| 30937 | `What prays before me?` | Not an issue: the unusual prayer image and Fate-river/song-of-Amalur imagery follow the English; the oddness is present in the source rather than introduced by Korean. |
| 30940 | `Hollowlands` / `홀로우랜드` | Uncertain: meaning is retained, but active Korean forms vary and the canonical region spelling remains unsettled. |
| 30941 | Capitalized `the Well` / `우물` | Uncertain: the function is accurately described, but English and Japanese use the shorter Well/泉 while Chinese expands it to a well; the row does not prove that the formal Well of Souls name is intended. |
| 30947 | `the lichen was acting up again` | Uncertain: Korean renders the strange source image as the lichen causing a hallucination; Japanese and Chinese also personify spores/moss, but the intended lore mechanism is not clear enough to approve a wording change. |
| 30948 | `Castellan` / `성주` | Uncertain: the military-leader role is clear, but whether Castellan is a formal office/rank or a generic castle lord remains unresolved in prior decisions and locale references. |
| 30949 | `Cann-Rane` / `캔레인` | Uncertain: the character/name is retained, but English and Japanese mark a compound boundary while the canonical Korean spelling and significance of the hyphen are unknown. |
| Remaining ordinary text in IDs 30901-30950 | Dialogue, objectives, labels, and ordinary prose | Not an issue at this pass: no additional supported meaning, voice, numeric, token, or structural defect was identified. Context-sensitive names and questions remain separately listed. |
| Other named terms in IDs 30901-30950 | Forsaken Plain / Mel Senshir / Alabastra / Tirnoch / Caer Elatha / St. Eadric / Caeled Coast / Mitharu / St. Odwig's Mission / Farraglen and related terms | Uncertain: spellings, formal names, and lore-term conventions need integrated glossary/context alignment; no isolated normalization is authorized here. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 30901-30950 once
  and in identical order, as recorded by the preliminary structural check.
- The four locale rows were directly read for this disposition. Embedded
  line-break, runtime-token, variable, and numeric checks from the
  preliminary report were reconciled; the `{3}%`, `{1}`, and
  `$SQ53.bribe_value$` values remain intact.
- No accepted correction was made; the active Korean CSV remains byte-for-byte
  unchanged. Its SHA-256 remains
  `7e0948db17e0d282b759f79c1f72e80722d5444ae743af1ec91faba410005cc5`.
- Register totals after this batch: 945 accepted, 3,481 `not an issue`, and
  5,595 uncertain (10,021 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30951; 34,184 `default` IDs remain.

These working dispositions are not independent linguistic approval.
