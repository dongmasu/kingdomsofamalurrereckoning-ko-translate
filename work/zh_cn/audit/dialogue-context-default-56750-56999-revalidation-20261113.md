# Sequential `default` Revalidation: IDs `56750`-`56999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 68 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 182 IDs in ascending order.
- Nine new correction candidates and ten new evidence-limited holds are
  recorded on new rows. The existing candidate at `56837` was rechecked and
  remains supported; its ledger row was not rewritten. Two source-conflict
  holds at existing IDs `56757` and `56758` are documented here without
  rewriting their ledger rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `56755` | Name / format | The standalone name `Saint Barthelemy` is rendered only as `성 바르텔레미`. Japanese identifies it as an island, and the Korean transliteration is plausible; consider pairing the source name as `성 바르텔레미(Saint Barthelemy)`. | Medium-high |
| `56806` | Name / format | The location label `Chicken Hill` is rendered only as `치킨 힐`. Consider `치킨 힐(Chicken Hill)`. | High |
| `56814` | Terminology | English `tavern`, Japanese `酒場`, and Chinese `酒馆` all indicate a drinking establishment. Korean `여관` suggests lodging; consider `술집`, e.g. `오늘은 술집 영업 안 해.` | High |
| `56817` | Title / format | The objective names `Templar Jorielle` but Korean pairs only the personal name: `템플러 조리엘(Jorielle)`. Other rows use the full title in parentheses (`11451`, `17448`, `36814`); consider `템플러 조리엘(Templar Jorielle)과 대화하기`. | High |
| `56854` | Name / format | The ship `Gilded Gorgon` is rendered `황금 고르곤호` without its source name, while the same epithet at `3075` is paired as `황금 고르곤(Gilded Gorgon)호`. Use the same pairing here. | High |
| `56873` | Name / format | `Battle of Glynn` is rendered `글린 전투`; the same battle at `5374` is `글린(Glynn) 전투`. Apply the established pairing. | High |
| `56909` | Name / format | The standalone proper name `Mauritania` is transliterated as `모리타니아` without the English form. Consider `모리타니아(Mauritania)`. | Medium |
| `56977` | Meaning | English and Chinese explicitly include `time` alongside the ancient winds, streams, and the Great Cycle's countless seasons. Korean mentions the seasons but not time. Preserve the time element, for example `태고의 바람과 시내, 시간과 위대한 순환(Great Cycle)의 무수한 계절이 빚어냈어.` Keep the existing line breaks. | Medium-high |
| `56981` | Name / format | The standalone title `Lord Callor` is rendered only as `칼로르 경`. Other references pair the same title as `칼로르 경(Lord Callor)` (`39341`, `39451`, `43632`); use that form. | High |

## Rechecked Existing Candidate

| ID(s) | Current finding and disposition |
| --- | --- |
| `147`, `2345`, `4961`, `6644`, `9748`, `12159`, `13670`, `15598`, `20444`, `30849`, `33018`, `35070`, `49949`, `52369`, `54932`, `56837`, `57745`, `59823`, `61570`, `63233` | The exact-English group `Irion, King of Cups` still has identical Korean `컵의 왕 이리온(Irion)`, pairing only the personal name. The existing proposal to pair the title as `컵의 왕(King of Cups) 이리온(Irion)` remains supported. Prior reports and ledger rows are preserved. |

## New Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `56750` | Meaning / source conflict | English and Chinese say to open the path to Alarane; Japanese says the path is to Caelrod. The indexed asset contains both NPC symbols but does not map this key to either speaker or referent. Korean follows English/Chinese; retain it pending stronger evidence. |
| `56751` | Meaning / rank | English capitalizes `Hireling`, and Japanese specifies a third-class mercenary; Chinese and Korean use the generic hireling/mercenary sense. The row does not establish whether this is a formal rank. |
| `56762` | Name / title | `Maid of Windemere` is a named title in English; Japanese reads it as a warrior heroine and Chinese as a maiden. Korean's `시녀` follows the English wording, but the intended lore title is not settled by this row. |
| `56782` | Name / institution | English and Chinese say `Hall of the Firstsworn`; Japanese says shrine. Korean follows the English/Chinese institution type, but the source-language discrepancy remains. |
| `56788` | Meaning | English `Should I have a costume?` can ask about needing, receiving, or wearing one. Japanese supports receiving; Chinese supports wearing; Korean selects receiving. Retain pending context. |
| `56804` | Meaning / term | English `Spellbinding`, Japanese `封呪` (sealing/curse), Chinese `迷人的` (captivating), and Korean `마법부여` do not establish one clear sense for this standalone label. Do not replace it without UI/context evidence. |
| `56829` | Name / term | The line deliberately contrasts `the Fountain` with `the Wellspring` and says the speaker cannot remember which name is used. Korean's `분수` / `샘의 근원` preserves the uncertainty, but the latter is awkward and the referent is not established. Do not mechanically apply the separate `Font` → `샘` decision. |
| `56912` | Speech level | English says `I bid you goodbye`; Japanese gives a neutral farewell, while Korean uses the marked `하겠소` register. Without reliable speaker or stage mapping, the row does not establish whether that register is intentional. |
| `56938` | Name / referent | English capitalizes `the Cradle`; Japanese calls it the “Cradle of Summer,” while Korean has only `요람`. This line alone does not establish whether to use the full location name. |
| `56984` | Meaning / source conflict | English and Chinese say the effect reduces health, but Japanese says it restores life. Korean follows English/Chinese; retain pending resolution of the source conflict. |

## Rechecked Historical Findings

- IDs `56757` and `56758` remain source-conflict holds: the former contrasts
  “summoned” with an answered request, and the latter contrasts the English /
  Chinese accusation about passing absurdity off as wisdom with Japanese's
  statement that the High King would not have written it. The existing
  append-only ledger rows remain unchanged.
- The earlier question at `56754` is not promoted: despite an English
  grammatical omission, the sources consistently describe Anela leading
  refugees back to resettle or rebuild Culn; Korean does not invent a count.
- The concerns at `56761`, `56774`, `56775`, `56783`, and `56790` are not
  promoted. Korean preserves the public appeal's polite register; `유랑극단`
  reasonably covers the performance-group variants; `조언자` aligns with
  Japanese and Chinese better than a governing council; `굴` conveys the
  stated hollow/cave; and Japanese confirms the rite sense in `개화 의식`.
- The title-format proposal for `56837` is independently corroborated by all
  20 exact-English duplicates and remains a proposal, not an applied edit.

## Repeated English and Structure

- Seventy exact-English duplicate groups across the corpus touch this range,
  covering 1,315 rows. Korean differs in three groups: `I'll be back
  tomorrow.` (Japanese also varies between polite and plain forms), `What do
  you require?` (Japanese varies correspondingly), and `Hello?` (the `뭐?`
  reading at `56942` matches Japanese `何？`; the other IDs are greetings).
  These differences are supported by source context and were not unified.
- Six rows contain embedded line breaks: `56810` (5), `56811` (1), `56878`
  (4), `56880` (10), `56962` (4), and `56977` (4). Each language has 28
  embedded line breaks in total, with matching per-ID counts.
- Runtime/display markers match across the four languages: `56824` retains
  `{1}`, `{2}`, and `{3}` in order; `56910` retains `{1}`.
- Of 250 IDs, 182 have indexed asset associations, represented by 185
  ID-to-asset links across 123 assets; 68 have no indexed asset. Of the 182
  newly recorded IDs, 114 are linked through 116 links across 72 assets;
  68 are unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- All 68 pre-existing ledger rows remain unchanged; 182 new IDs were
  appended in ascending order.
- The ledger covers 59,142 of 65,135 unique `default` IDs (90.80%), leaving
  5,993 unrecorded IDs. Sequential coverage reaches `56999`; next is
  `57000`-`57249`.
- The nine new candidates and ten new holds are proposals only. Findings at
  existing IDs `56757`, `56758`, and the `Irion, King of Cups` duplicate
  group are documented without rewriting their ledger rows. No translation
  CSV was changed.
