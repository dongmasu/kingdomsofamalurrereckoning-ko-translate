# Preliminary Language Scan: `affix` IDs 100-109

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 100-109 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 101 | `Favors's` | 호의의 | Confirm the source spelling and the game's intended sense of `Favor`. | The English has a possessive typo (`Favors's`). Chinese uses a grace/favor term, while German and Russian suggest fortune or patronage and Italian suggests gifts. Korean is plausible as a literal “favor,” but the game concept and source typo should be checked against composed item names before deciding. | Low |
| 104 | `Frame` | 액자에 넣기: | Recheck as `누명을 씌우기:` or another “frame/implicate” sense, subject to the composed UI phrase. | Korean selects the picture-frame sense. German, Spanish, French, Italian, and Russian all indicate framing/implicating or trapping someone; Chinese's `框架` is ambiguous, and Japanese unusually says “set fire.” English is the semantic anchor, so the current Korean is a strong candidate meaning error. | High |
| 109 | `Bolstering` | 강화하는 | Confirm the item/stat sense before choosing between “strengthening” and a support/boost sense. | Spanish, French, Italian, and Russian support reinforcement/bolstering; German appears anomalous. Korean is a reasonable semantic candidate, but the composed equipment context should settle the form. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 100-109 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- English contains one `FF` row per ID rather than these six variants, so its
  meaning was matched by ID. Exact-variant evidence was checked in each
  available locale.
- IDs 100 (`Despoiler's`), 102 (`Received`), 103 (`Destroy`), 105 (`Pick Up`),
  106 (`Cotton`), 107 (`Blow up`), and 108 (`of the Embers`) had no additional
  high-confidence concern in this pass. Their suffix/prefix form may still
  depend on the composed UI string.

## Batch Status

All 60 target variant rows for IDs 100-109 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
