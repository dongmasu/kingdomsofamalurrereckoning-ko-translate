# Sequential `default` Revalidation: IDs `33750`-`33999`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 63 existing ledger entries and added 187 in-range IDs. Findings
  are review proposals, not approved translation edits.
- Eighteen new correction candidates and three new evidence-limited holds
  were recorded. Four existing `not-issue` entries (`33752`, `33787`,
  `33820`, and `33867`) were promoted to candidates; the other three existing
  candidates were retained. Fifty-two other existing entries remain not
  flagged.
- Repeated-name checks added ten missing out-of-range
  `Argine, Queen of Staves` IDs and five missing out-of-range `Lupoku` IDs.
  The other missing occurrences (`33892` and `33899`) are included in the 187
  new in-range IDs. Existing occurrences were reclassified where appropriate.
  The identical `Before The Talk` entry at `36075` was also reclassified with
  `33820`.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `33752` | Naturalness | English says Courdan Passant wants his letter; Korean `자기 편지를 원한다` is literal and stiff for this conversational line. Consider `코던 파상트(Courdan Passant)가 자기 편지를 찾고 있어` or an equivalent that preserves the meaning. | Medium |
| `33759` | Name / format | The line names the Wyvyrns as an old family, but Korean `와이번 가문` has no source pairing while `Gifre` is paired. Add the exact family name, e.g. `와이번 가문(Wyvyrns)`, without inferring a different spelling. | High |
| `33772` | Title / format | `Return Aurenda's Light` is a title-cased objective. Korean `아우렌다의 빛을 돌려주기` omits the complete source title. Add `(Return Aurenda's Light)` while retaining the Korean wording. | High |
| `33781` | Name / format | `Arny` is a named character in the key description, but Korean `아니` is unpaired. Add `(Arny)` to the name. | High |
| `33787` | Meaning / naturalness | English and Japanese ask whether the other person's militia can do the task. Korean `민병대가 처리하면 안 돼?` can instead read as asking whether it is permissible. Consider `민병대는 못 하는 거야?` or an equivalent ability question. | Medium-high |
| `33789` | Format | The ingredient quantities are structurally intact, but the two names use inconsistent spacing before `(1)`: `일 페탈(Eel Petal) (1)` versus `하늘꽃(Sky Blossom)(1)`. Standardize the separator without changing the source names or line layout. | Medium |
| `33820` | Title / format | `Before The Talk` is an identical title at `36075`; both rows use `대화에 앞서` without the complete English title. Pair the full title consistently at both IDs. | High |
| `33836` | Title / format | The complete label is `House of Seasons Adherent`, while Korean pairs only `House of Seasons` and leaves `추종자` unpaired. Add the full label or otherwise make the relationship to the complete English title explicit. | High |
| `33839` | Name / format | The source label is `Delma O‘Mooney`; Korean `델마 오무니` omits the source name. Add the exact English spelling, preserving the source's curly apostrophe. | High |
| `33840` | Place-name format | The journal names the `Hollows of Alserund`; Korean mentions `알세룬드(Alserund)의 공동` without pairing the complete named place. Add the source place label at that reference; do not infer an asset type from the translation alone. | Medium-high |
| `33844` | Terminology / format | The description names the weapon category `Faeblade`, while Korean `페이블레이드` is unpaired. Pair the established Korean term with the source term and preserve both damage values and line breaks. | High |
| `33861` | Name / title format | The recruitment notice names `Commodore Garrick`; Korean `개릭 제독` omits the complete title and name. Consider `개릭 제독(Commodore Garrick)`, preserving the translated rank. | High |
| `33867` | Naturalness | English `out in the wild`, Japanese `荒野`, and Chinese `荒野` describe a wilderness setting. Korean `야생에서` is awkward in this locative use; consider `황야에서` or another natural setting phrase. | Medium |
| `33883` | Title / format | `Aryllia's Charms` is a complete title, but Korean `아릴리아(Aryllia)의 부적` pairs only the character name. Add the complete English title. | High |
| `33892` | Name / title format | The complete label `Argine, Queen of Staves` occurs identically at 26 IDs. Korean consistently pairs only `Argine`, leaving `지팡이의 여왕` without the source title. Pair the full label at every occurrence. | High |
| `33899` | Name / spelling | The English source spells the deity `Lupoku`, while Korean consistently uses `로포쿠(Lopoku)`. Keep the Korean transliteration if desired, but correct the parenthetical to the source spelling. Apply the same correction to every exact-source occurrence listed below. | High |
| `33901` | Name / format | The standalone name `Zaltenus` is rendered `잘테누스` without its English pairing. Add `(Zaltenus)`. | High |
| `33919` | Title / format | The introduction names the `Grand Mistress of Ysa` and her office, `the High King's Guide`. Korean pairs `Ysa` and `High King's Guide` but not the complete first title. Add `(Grand Mistress of Ysa)` to that title without duplicating the existing pairing. | High |
| `33927` | Naturalness | `Those gnomes sure know how to wreck a place` is rendered `노움들은 장소 하나 망가뜨리는 법을 제대로 아는군`, which is literal and unnatural. Consider a concise equivalent such as `노움들은 어딜 가든 엉망으로 만드는군`. | Medium |
| `33930` | Title / format | `Doing Your Part` is a title-cased label; Korean `맡은 바를 다하기` omits the source title. Add `(Doing Your Part)` while retaining the current Korean. | High |
| `33937` | Name / format | The dialogue names `Han`, but Korean `한` has no English pairing. Add `(Han)` without inferring a surname or title. | High |
| `33939` | Name / creature label | English says `Greater Niskaru`; Korean `상급 니스카루(Niskaru)` pairs only the base creature name. Pair the complete source label, e.g. `상급 니스카루(Greater Niskaru)`. | High |

The 11 `Argine, Queen of Staves` IDs that lacked a ledger record were
`33892`, `38694`, `40340`, `41255`, `43684`, `47099`, `52596`, `53842`,
`55720`, `56433`, and `62000`. Ten are outside the current range. Across all
26 occurrences, English, Japanese,
Chinese, and Korean each use one consistent string; Korean pairs only the
personal name. Fifteen IDs already had ledger entries; their other findings
were retained while the missing full-title pairing was recorded.

The other `Lupoku` IDs missing from the ledger are `36620`, `44730`, `54589`,
`57248`, and `62917`, in addition to in-range `33899`. English contains 22
IDs with `Lupoku`, while Korean's parenthetical consistently says `Lopoku`.
Sixteen IDs already had ledger entries; unrelated candidates and holds were
preserved while the source-spelling discrepancy was recorded.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `33780` | Meaning / name | English capitalizes `Hollow`, but Japanese and Chinese render a generic cave. The line alone does not establish whether this is a proper place name; retain the uncertainty rather than affirming or removing Korean `할로우`. |
| `33827` | Meaning / context | The sibling wording and details differ among English, Japanese, and Chinese. Do not infer the speaker's gender, sibling ages, or a more specific family structure from the Korean line. |
| `33851` | Meaning / tone | English and Japanese express uncertainty about the Maid's plans; Korean `꿍꿍이` adds a distinctly scheming implication, while Chinese also suggests a plot. Keep the intent unresolved pending stronger context. |

## Repeated Sources And Structure

- Sixty-nine exact-English duplicate groups (1,660 corpus rows) touch this
  range. The only group with different Korean text is `Hello, mortal.` at
  `30574`, `33784`, and `41405`; Japanese also varies, so the register
  difference is retained rather than mechanically unified.
- `Before The Talk` at `33820` and `36075` is identical in all four languages.
  Both rows are recorded together for consistent title pairing.
- Embedded line-break counts match across all four languages: 32 each across
  the range, in seven entries. Existing long descriptions and item lists keep
  their source-aligned layout.
- Normalized runtime-token and markup inventories match across all four
  languages. Localized wrapper payloads and argument ordering vary at
  `33807` and `33934`; no Korean token or numeric-value loss was found.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this pass and the repeated-name follow-ups, the ledger contains 42,159
of 65,135 unique IDs (64.73%), leaving 22,976. This range has 29 candidate
IDs, three holds, and 218 entries not flagged after review. Sequential
coverage reaches ID `33999`; next: `34000`-`34249`.
