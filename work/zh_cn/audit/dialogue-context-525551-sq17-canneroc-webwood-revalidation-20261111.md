# Asset Revalidation: `525551.quest_bxml` (`SQ17`, Canneroc/Webwood)

- Date: 2026-11-11.
- Scope: all 83 `default` IDs linked to this asset; all 83 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Four correction candidates and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML explicitly identifies `SQ17`, Garaner Vernt
(`NPC_DAL_ALM_GaranerVernt`), and Barten (`NPC_DAL_VAR_Barten`), and contains
40 `dialog_line_*` handlers. Its quest targets and linked text concern the
town of Canneroc, Castle Yolvan, Webwood, and the Widow. This supports an
`SQ17` / Canneroc-Webwood topic grouping. The asset has two NPC symbols, and
the key matches do not map individual IDs to either NPC, callbacks, branches,
or playback order. Speaker attribution remains unassigned and dialogue order
unknown. The related `SQ16` Canneroc/Webwood review is a separate quest asset;
shared characters and setting do not make the quests or their lines
interchangeable.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `17145` | Naturalness | `아무런 소식도 들리지 않고, 아무것도 보이지 않았다` is an awkward passive construction and shifts into a narrative past ending. Consider `오랫동안 페이(Fae)의 요새에서는 아무런 소식도 들려오지 않았고, 눈에 띄는 움직임도 없었어.` | Medium |
| `39028` | Naturalness / meaning | `corrupting what should be a sunny place into a twisted, winding ruin` is reduced to simply changing the place. Consider `햇살 가득해야 할 곳을 뒤틀리고 구불구불한 폐허로 망가뜨리고 있어` to retain the destructive force of `corrupting`. | Medium |
| `41586` | Terminology | `Find the remaining Lorestones` is `남은 지식의 돌 찾기`, while the project glossary lists `Lorestone` as `로어스톤` and parallel objective labels use `로어스톤` (for example IDs `13097`, `58441`, and `58707`). The older terminology disposition also left this ID unresolved. Consider `남은 로어스톤 찾기`, subject to the existing terminology decision. | Medium |
| `61118` | Meaning | `Another stirs in Yolvan?` is rendered `요르반(Yolvan)에서 또 누군가 깨어났나?`. Japanese `またヨルヴァンで騒ぎ?` and Chinese `又有人从尤凡来了？` do not support the specific “awoke” reading. Consider `요르반에서 또 무슨 소란이 일었나?`; retain the following clause unless further scene evidence changes it. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `48015` | Naturalness / meaning | English `Is that someone tripping about my web?` and Chinese support a web-related pun, while Japanese reads more like asking whether someone is interested in the web. The current Korean `누가 내 거미줄에 걸린 건가?` is plausible but resolves the ambiguity. Hold rather than choose a more specific reading without scene/audio evidence. |

## Repeated Text and Structure

Six exact-English duplicate groups occur: `6364` / `9455`, `8711` /
`11146`, `13801` / `15468`, `45986` / `48370`, `58967` / `64518`, and
`60854` / `62120`. Each pair has identical Korean text. Four-language
line-break counts, runtime-token sequences, and detected markup signatures
match for all 83 IDs.

## Complete ID Set

`47`, `577`, `4695`, `5735`, `6086`, `6226`, `6364`, `7158`, `7663`, `8245`,
`8444`, `8504`, `8711`, `9197`, `9411`, `9455`, `11146`, `12641`, `12760`,
`13746`, `13801`, `15468`, `15828`, `15911`, `16642`, `17145`, `18702`,
`19773`, `20486`, `20583`, `20773`, `23338`, `24406`, `25141`, `25384`,
`27302`, `27397`, `27402`, `27652`, `28420`, `32855`, `36015`, `36128`,
`36538`, `36943`, `38214`, `38769`, `39028`, `39601`, `41559`, `41586`,
`42406`, `43699`, `44402`, `45538`, `45582`, `45986`, `47451`, `48015`,
`48370`, `51230`, `51834`, `51909`, `52527`, `53473`, `54575`, `55347`,
`55965`, `57351`, `58566`, `58967`, `59134`, `59315`, `60822`, `60854`,
`61118`, `62120`, `62271`, `62490`, `62574`, `63557`, `64200`, and `64518`.

All 83 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These findings are review candidates, not approval to edit the translation.
