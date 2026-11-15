# Asset Revalidation: `1632212.quest_bxml` (`SQ149`, Mixing Business)

- Date: 2026-11-11.
- Scope: all 89 `default` IDs linked to this asset; all 89 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Eight correction-candidate IDs and three evidence-limited holds are
  recorded. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML explicitly identifies `QUEST_ID SQ149`, the asset-level NPC symbols
`NPC_RTH_DOK_CarastaArawyn` and `NPC_RTH_DOK_GweddlwnyGwalchmai`, and 37
serialized `dialog_line_*` handlers. The localization text concerns Carasta
Arawyn's attempt to negotiate with the merchant Gwalchmai, using Maybryn Wine
to improve his offer. The quest and NPC symbols support this grouping, but
the BXML does not map individual localization IDs to a speaker, handler,
branch, addressee, or playback order. ID `2835` explicitly identifies the
first-person speaker as Gwalchmai; no broader attribution or order is inferred.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `9588` | Meaning / naturalness | `just the thing` means the right solution or item; `좋은 수` can suggest a clever move or tactic. Consider `좋은 방법을 찾아낸 것 같아` while retaining the speaker's hesitation. | Medium-high |
| `19076` | Name format | The Korean uses the established spelling `프라이데리` but omits the English pairing for `Pryderi`. Consider `프라이데리(Pryderi)` without assigning an unsupported entity type. | High |
| `25913` | Meaning / name format | English says the goods-store owner is located “in the Pryderi”; Chinese also describes a shop there, while Japanese alone specifies a company. Korean adds `상회`, which is not established by English or Chinese. Consider `프라이데리(Pryderi)에 있는 잡화점 주인이야`, preserving the place-name reading without deciding what kind of entity Pryderi is. | Medium-high |
| `30599` | Name consistency / format | `프라이더리` conflicts with the accepted recurring spelling `프라이데리` (ID `19076`, D-19721). The English explicitly calls this the Pryderi market; consider `프라이데리(Pryderi) 시장` and retain the location without adding an organization type. | High |
| `33833` | Naturalness | `거기, 멋진 당신` is a stiff vocative for the flirtatious `my lovely`. Consider a natural colloquial address such as `거기, 멋쟁이`, while preserving the playful offer that follows. | Medium |
| `36896` | Naturalness | `이익을 축하하며 건배하죠` is awkward Korean. Consider `일이 끝나면 이익을 자축하며 한잔하죠`, preserving the toast to the profit from the deal. | Medium-high |
| `60709` | Meaning / idiom | “For a song” means very cheaply, not literally singing; the Japanese also reads “you call this cheap?” Korean `그게 노래라고?` loses the exchange's bargaining joke. Consider `그게 헐값이라고?` | High |
| `63672` | Naturalness / objective format | `그월흐마이에게 계약서 서명받기` is grammatically compressed and leaves the agent relation unclear. Consider `그월흐마이(Gwalchmai)가 계약서에 서명하게 하기`, retaining the established `-하기` objective form. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `61393` | Meaning | English and Chinese ask why the addressee cannot do it; Japanese asks why they do not do it themselves. Korean follows the Japanese reading. The response context is insufficient to decide whether this is inability or unwillingness; hold rather than changing it from English alone. |
| `6848`, `38854` | Text type / format | The source strings are literal `FAIL LINE 2` and `FAIL LINE 1`; English and Japanese retain these authoring-like labels, while Chinese translates them. It is unclear whether they are internal fallback labels or visible dialogue. Do not treat the unchanged Korean as a confirmed player-facing error without stronger evidence. |

## Repeated Text and Structure

Four exact-English duplicate groups cover 14 rows: `Have another bottle of
wine.` (`17640`, `19851`, `24185`, `25291`, `29071`, `30929`), `Quest
Complete` (`42526`, `62370`), `Did you enjoy your wine?` (`49029`, `51431`),
and `Please look at this contract.` (`49077`, `61018`, `62462`, `64351`).
Korean is identical within every group. All 89 IDs have matching four-language
line-break, runtime-token, and markup signatures.

## Complete Asset ID Set

`521`, `2835`, `2973`, `5080`, `5874`, `6079`, `6707`, `6848`, `6902`,
`8096`, `8295`, `8372`, `8607`, `8808`, `9588`, `11282`, `11972`, `13128`,
`14470`, `14660`, `16218`, `16416`, `16776`, `17614`, `17640`, `18412`,
`19076`, `19851`, `20032`, `20734`, `21016`, `22075`, `22320`, `22625`,
`23103`, `24185`, `25291`, `25913`, `28379`, `28496`, `29071`, `30031`,
`30599`, `30868`, `30929`, `31392`, `33337`, `33399`, `33529`, `33557`,
`33833`, `34492`, `36896`, `37150`, `38140`, `38542`, `38644`, `38854`,
`40535`, `42526`, `42836`, `44363`, `44444`, `46712`, `46728`, `47354`,
`47377`, `49029`, `49077`, `49329`, `49858`, `50382`, `50979`, `51431`,
`52010`, `52640`, `53157`, `53341`, `55954`, `56641`, `60709`, `61018`,
`61393`, `62370`, `62462`, `63672`, `64274`, `64351`, and `64658`.

All 89 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
