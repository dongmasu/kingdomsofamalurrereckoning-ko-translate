# Sequential `default` Revalidation: IDs `28750`-`28999`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 75 recorded IDs and added 175 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `28762` | Naturalness / address | Japanese `待たせしないようにな` is conversational; Korean `기다리게 하지 말게, 숙련자여` sounds stiff. Consider `숙련자(Adept), 대현자(Archsage)를 기다리게 하지 않는 게 좋겠어.` Preserve the rank and warning without assuming who speaks. | Medium |
| `28779` | Name / format | `the order` is rendered `워스원` without its English pairing. Confirm the Warsworn context and consider `워스원(Warsworn)`; preserve Caerwyn's death, the 70-year interval and the Niskaru disappearance. | Medium |
| `28827` | Meaning | English `speaker for the Fae of Pride` says the speaker represents the Fae of Pride; Korean says `긍지의 집을 대표해 페이의 대변자`, which can imply representing all Fae. Consider `긍지의 페이(Fae of Pride)를 대표하는 대변자` while keeping the lowest-rank claim. Japanese interprets the affiliation as House of Pride, so do not infer further faction membership. | Medium |
| `28875` | Journal register | A quest log uses the conversational ending `아직 있을 거야`. Consider `아직 있을 것이다`, preserving the freed Conni and the previously found cell. | High |
| `28893` | Name / format | English `Fae of Winter` and Japanese `ウィンター・フェイ` mean Winter Fae; Korean `겨울 페이(Fae)` pairs only the generic word. Consider `겨울 페이(Winter Fae)` and preserve the five-line structure and all lore. | High |
| `28938` | Naturalness / context | `Any luck?` commonly asks whether an effort succeeded; Korean `운은 좀 따랐어?` sounds literal. Consider `성과는 좀 있었어?`, subject to the preceding exchange. Japanese `どうした？` is less specific. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `28751` | Name / format | `Modern Varani` and `Old Varani` are both annotated simply `(Varani)`. Full form pairing may help distinguish the languages, but check the existing convention for language variants before changing annotations. |
| `28846` | Meaning | English `What now?` could ask what happens next or express irritation; Japanese `なんだ？` favors the latter, whereas Korean chooses the former. The preceding exchange is needed. |
| `28884` | Meaning | `Your charge` can mean a duty, a person in one's care, or a fee. Japanese asks whose responsibility; Korean `네 담당` is fragmentary. Do not guess without the menu or dialogue context. |
| `28950` | Meaning / speaker | English omits the subject of `From fresh recruit ... to this`; Korean inserts `내가`. It may refer to the addressee rather than the speaker. Check the actual exchange before selecting either subject. |

## Earlier Findings And Checks

- Retain candidates `28797` and `28839`, and holds `28769`, `28842`,
  `28855`, and `28954`.
- 65 exact-English duplicate groups touch this range (1,233 corpus rows).
  Korean forms match within each group. Japanese `What now?` differs in
  interpretation; see `28846`, and do not blindly unify on English alone.
- Normalized token signatures and line-break counts agree across all four
  languages. Existing runtime tokens and verse line breaks remain intact.
- `28758` follows the existing user-selected combined name/title pattern for
  `킨 대사(Keen Ambassador)`; do not silently reverse the established pairing.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, 38,471 of 65,135 unique IDs are recorded (59.06%),
leaving 26,664. Sequential coverage reaches `28999`; next: `29000`-`29249`.
