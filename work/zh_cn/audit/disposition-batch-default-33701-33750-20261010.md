# Disposition Batch: `default` IDs 33701-33750

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary candidates and carried
  historical questions with English meaning, Japanese voice/register, Chinese
  supporting evidence, active Korean, prior decisions, and structure.
- Decisions: two accepted, two `not an issue`, and nine uncertain findings.
- CSV changes: IDs 33732 and 33743 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33701 | `the last of the staff` / `마지막 일꾼들` | Uncertain: English and Japanese suggest staff/retainers, while Chinese can mean employees. `일꾼들` may narrow the group, but Seawatch context is insufficient to choose a more specific role. |
| 33711 | Travelers / `트래블러` | Uncertain: capitalization and Japanese support a named group, but prior decisions document competing Korean translations, transliterations, and plural/display conventions. |
| 33718 | Malformed English `there is on such a beast` | Not an issue: Korean expresses the likely intended “there is one such beast” reading without reproducing the source typo. The source typo remains documented historically; this disposition does not claim in-game confirmation. |
| 33722 | Death's Cryptic Hand / ceremonial apposition | Uncertain: the formal introduction is retained, but English's “instrument,” Japanese's executioner, and Chinese's opaque phrasing do not establish whether the Hand is a being, title, or artifact. |
| 33724 | Three parcels of Plagueshield | Uncertain: Korean preserves the count and package sense, consistent with the accepted parcel wording at ID 10555. The identity/type of Plagueshield and the canonical Brother Fallon title remain unresolved. |
| 33726 | `lessons of the Sojourn` / `체류 의식` | Uncertain: Japanese supports a named rite, while Chinese reads a journey/pilgrimage. The source does not settle whether Sojourn is a rite, tradition, journey, or residence. |
| 33732 | `too damaged to bring joy` / `난 망가져서 기쁨을 줄 수 없어` | Accepted: change to `난 너무 망가져서 기쁨을 줄 수 없어`. This restores the force of `too` and makes the Korean clause natural without deciding whether the damage is physical or emotional. |
| 33739 | `the Hierophant has fallen` / `대사제가 쓰러진` | Uncertain: English permits defeat, death, or loss of office; Japanese explicitly reads loss of office while Chinese and Korean retain a fallen/defeated sense. Keep the broad source wording pending context. |
| 33743 | Unspecified `them` / `우리가 그들을 찾으리란` | Accepted: change to `우리가 찾으리란`. English leaves the plural antecedent unresolved, Chinese uses an inanimate pronoun, and Japanese omits it; Korean can preserve the discovery claim without incorrectly specifying human referents. |
| 33744 | Seer Destiny / `회피 구르기` | Uncertain: the combat mechanic is understandable and the replacement by short-range teleport is retained, but canonical Destiny and skill terminology remains an integrated glossary question. |
| 33745 | `how I came to change things` / `상황을 바꾸게 되었는지` | Uncertain: the Korean is plausible and Japanese likewise refers broadly to changing circumstances, but the broader event/object denoted by `things` needs narrative context. |
| 33750 | `murghan` / `머간` | Uncertain: this carried historical terminology question is not resolved by the threat context. Prior decisions leave the creature/group identity and canonical Korean form open; keep the current transliteration. |
| Remaining ordinary text in IDs 33701-33750 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was found. The 50 ordered IDs, inspected line breaks, marker, and values align with the source rows. |

## Historical Audit Reconciliation

- The source-keyed entry for IDs 33600-33799 is present in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` and its preserved Japanese
  source. It flags the malformed `on` at 33718, the unresolved antecedent at
  33743, Destiny/roll terminology at 33744, the Hierophant at 33739, and
  `murghan` at 33750.
- Prior register findings D-315 and D-1259 independently leave the murghan
  identity/spelling unresolved. Prior parcel decision D-3032 supports
  `꾸러미` but does not settle Plagueshield's identity.
- No historical question was treated as authorization to edit the CSV.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 33701-33750 once
  and in identical order.
- ID 33748's `#NAMED_ICON_GRAY_PS3_SQUARE#` token is unchanged.
- Active default CSV SHA-256:
  `5b8e14fe286ec8ba364a3562780a89663d58acc18af1831db3505e63db284b08`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 33751; 31,384 default IDs remain through ID 65134.
