# Candidate Reconciliation: IDs `36750`-`36999`

- Date: 2026-11-14.
- Rechecked all 14 current in-range candidates against English, Japanese,
  Chinese, active Korean, and prior application decisions.
- Checked seven directly related candidate IDs: `21777`, `36916`, `38893`,
  `48675`, `63303`, `64287`, and `64922`. `36916` is also an in-range
  candidate and is counted only once. `21777`, `36982`, and `38893` had
  already been counted.
- English anchored meaning; Japanese guided tone and register; Chinese was
  supporting evidence. Asset membership did not establish speaker or order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `36783` | Corrected | Replaced the awkward literal farewell with `여행 잘 다녀와, 멍청아.`, retaining the informal insult supported by English and Chinese. |
| `36828` | Corrected | Japanese `よかった` signals relief. The line now begins `다행이네` rather than suggesting the listener finally arrived. |
| `36831` | Corrected | Restored the warning against being caught making trouble again: `다시는 말썽 피우다가 내게 걸리지 마.` No specific punishment is added. |
| `36838` | Confirmed | The active Korean says `응답하는 이는 드물어`, correctly preserving the scarcity of answers. The earlier retention note described a different wording and is superseded by the current-row check. |
| `36854` | Confirmed | `복무 소집 통지서(Notices of Duty)` is already consistent with the established term, and Rhiad remains the payer. |
| `36863` | Previously corrected, confirmed | `설명해 줄 생각은 없다` preserves the speaker's dismissive refusal in context; no stronger unsupported insult is added. |
| `36896` | Previously corrected, confirmed | `이익을 자축하며 한잔하죠` is a natural toast and keeps the line's polite conversational register. |
| `36916` | Confirmed | `유골함` matches the urns in the Teeth of Naros quest and the reviewed urn group. Its earlier terminology review is supporting evidence; the ID is counted once as an in-range candidate. |
| `36922` | Confirmed | `주군` is already the consistent rendering of `my liege`; no additional register change is needed. |
| `36929` | Corrected | Removed unsupported younger-sibling ages. `내 형제자매 둘 다 아파` preserves that both siblings are ill without inferring the speaker's gender. |
| `36967` | Corrected | Changed `아쉽군` to `아쉽네` to match the surrounding plain conversational speech and Japanese. |
| `36968` | Corrected | Paired the established title as `처형인(The Executioner)` while preserving the Hood of Last Breath, Ferrin Shaw, and the cost of obtaining the information. |
| `36982` | Previously reconciled, confirmed | The active label already preserves the source count as `보가트(Boggart) (벌레 2마리)`. The correction was applied and counted in the earlier `3000`-`3249` reconciliation. |
| `36993` | Confirmed | `미스로리스(Mithroliths)` and `깊은 황혼(Deep Gloam)` are already paired and used consistently in the sentence. |

## Linked Candidate Checks

- `21777` was already reconciled. Its `미스로리스(Mithroliths)` and
  `언바운드의 길(Unbound Path)` pairings remain supported.
- `38893` was already reconciled with `36982`; its exact duplicate label
  already preserves the two-bug count.
- `48675`, `63303`, `64287`, and `64922` were newly counted as linked
  candidates here. Their
  existing `깊은 황혼(Deep Gloam)` and `미스로리스(Mithroliths)` pairings
  match their respective English references; no extra edit was needed.
- The `Silkfarmers` findings at `35368`, `36815`, and `39191` remain
  evidence-limited holds. English, Japanese, and Chinese do not establish
  whether these people farm silkworms, gather silk, or process it.
- The separate holds at `36754` and `36984` remain unresolved; no sense,
  speaker gender, or sibling age was inferred from asset association.

## Verification

- Reconciled 13 newly counted in-range candidates plus four newly counted
  out-of-range linked candidates. `36916` is counted once in-range;
  `36982`, `21777`, and `38893` were already counted. Cumulative
  reconciliation is 2,316 / 4,015 (57.68%), with 1,699 remaining.
- Changed only `default` IDs `36783`, `36828`, `36831`, `36929`, `36967`, and
  `36968`; refreshed only those IDs' source fingerprints.
- All 65,135 ledger fingerprints validate. Index/catalog reproduction,
  11 CSV-preservation tests, nine dialogue-context tests, and the CRLF-aware
  diff check pass.
- The active CSV retains 65,135 ordered records, its UTF-8 BOM, 71,838 CRLF
  sequences, 244 LF-only sequences, and no bare CR.
- Runtime tokens and embedded line breaks are unchanged. No source CSV,
  extracted asset, or game binary was modified. No commit was made.
