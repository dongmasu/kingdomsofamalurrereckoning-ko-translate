# Asset Revalidation: `1946261.quest_bxml` (`DLC1_MQ04` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 103 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- Eleven correction-candidate IDs and three evidence-limited holds, with one
  ID appearing in both sets.
- No translation CSV or extracted asset was changed. Proposed corrections
  require separate approval.

## Context Evidence and Limits

The asset contains 37 serialized `DLC1_MQ04`-prefixed dialogue handlers, but
no explicit `QUEST_ID`, NPC symbol, or per-key handler mapping. Its text
concerns Dead Kel, the Offering ceremony, Akara's blessing, Bridgette Malloi,
and Cape Solace. The handler prefix and shared topic support a candidate
grouping only; individual speakers, branches, addressees, and playback order
remain unknown. Journal, objective, title, and UI strings were assessed as
their own text types rather than dialogue.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `14883` | Format | The English names `Captain Brattigan`; Korean has `브래티건(Brattigan) 선장`. Elsewhere in the same active translation, the same name/title is consistently `브래티건 선장(Captain Brattigan)` (for example `5581`, `6215`, and `46503`). Use that established form. | High |
| `17403` | Naturalness | `그런데도 사람들은 내가 이상하다고 하더라` makes the contrastive “even so” explicit where the English only says “And people say I'm strange.” Consider `사람들은 나더러 이상하다고 하더라.` | Medium-high |
| `22298` | Naturalness | `브리짓에게 ... 이 위협을 경고해야겠다` is an awkward Korean collocation. English says to find Bridgette and warn her about the threat; consider `소울딥 지하 통로(Souldeep Fasting)로 가서 브리짓(Bridgette)을 찾아 이 위협을 알려야겠다.` | High |
| `34841` | Naturalness | `장례용 배` is a literal, awkward rendering of “funeral barge.” Consider `이제 그 배는 네 장례선이 될 거야` while retaining the threat. | High |
| `35832` | Meaning | “The dreaded pirate” means a feared or notorious pirate, not simply a “dreadful” one. Consider `악명 높은 해적` rather than `지독한 해적`. | High |
| `37264` | Naturalness | `우리 민족의 타고난 권리를 주장해` is an unnatural rendering of “claim our people's birthright.” Consider `우리 민족의 정당한 권리를 되찾아` or another natural phrasing that preserves an inherited entitlement. | High |
| `38012` | Naturalness | `짜여진 무늬` is stiff and less idiomatic than the English/Japanese image of woven patterns. Consider `엮인 무늬 속에 답이 있어.` | Medium-high |
| `40395` | Format | The Korean name is unpaired. If applying the local English-name pairing convention, use the spelling in this exact source, `브리짓 말로이(Bridget Malloi)`. Do not globally normalize it: this source spells the given name `Bridget`, while other rows use `Bridgette`. | High for local pairing |
| `5345` | Naturalness | `얼마 안 되는 취약한 무리` is a calque of “a fragile few.” Consider a natural phrasing such as `갤로우스 엔드(Gallows End)에 사는 우리는 수가 적고 약해.` | High |
| `62502` | Naturalness | `선택은 아카라가 하는 거야. 네가 아니라고!` is awkwardly split. Japanese confirms the contrast “Akara chooses, not you”; consider `아카라가 선택하는 거야! 네가 아니라!` | High |
| `64447` | Meaning / naturalness | “The Offering is doomed” predicts failure; `실패하게 됐어` is stiff. Consider `봉헌 의식(Offering)은 이제 실패할 거야. 축복을 받을 사이온(Scion)이 없으니까.` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `19385` | Meaning | “May Akara prepare you” is an unusual blessing, and the Japanese `アカラの手配あれ` does not clarify the intended sense. The Korean `아카라께서 그대를 준비시키시길` is stiff, but a replacement would require guessing what the blessing means; hold pending stronger context. |
| `46844` | Meaning | “Honored ones” can mean people accorded honor or people regarded as sacred. Japanese says `聖なる者`, while Chinese says `尊贵的人`; the current `영예로운 이들` follows only part of that evidence. Hold the exact sense rather than choosing a status or religious interpretation without context. |
| `40395` | Meaning | The exact English row says `Bridget Malloi`, while nearby rows identify `Bridgette Malloi`. Keep the local pairing candidate above, but do not decide whether the source spelling is an alias or typo, or normalize the name globally. |

## Retained Decisions and Structural Checks

- The clearly identifiable journal, objective, quest-title, and UI rows were not
  judged by spoken register. Their wording was checked against their own text
  type.
- No individual speaker or dialogue order was inferred from the asset-level
  handler prefix.
- No exact-English duplicate group occurs in this asset. All 103 IDs match
  across four languages in line-break, runtime-token, and markup signatures.
- All linked IDs are listed below; each receives a four-language source
  fingerprint and an ID-level disposition in
  [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Complete Asset ID Set

`1307`, `3317`, `3903`, `4064`, `4207`, `4454`, `4638`, `4923`, `5136`,
`5345`, `5581`, `5767`, `8060`, `10328`, `10661`, `11772`, `11893`,
`12707`, `12824`, `13354`, `13928`, `14883`, `15545`, `16270`, `16801`,
`17391`, `17403`, `17478`, `17484`, `17636`, `18119`, `18269`, `18353`,
`19385`, `19428`, `19593`, `20122`, `21928`, `22298`, `22726`, `23128`,
`25020`, `26309`, `26426`, `26585`, `28242`, `29264`, `29468`, `31637`,
`31695`, `31754`, `31915`, `31933`, `32392`, `32832`, `32935`, `33790`,
`34841`, `34864`, `35832`, `36990`, `37264`, `37440`, `38012`, `39115`,
`39924`, `40173`, `40395`, `41399`, `41582`, `42164`, `42474`, `44511`,
`44625`, `44848`, `46503`, `46844`, `47541`, `47754`, `48319`, `48657`,
`49235`, `49741`, `50830`, `51999`, `52422`, `52561`, `53845`, `56032`,
`56125`, `56578`, `56638`, `57281`, `57547`, `58816`, `59980`, `60462`,
`60892`, `61620`, `62059`, `62502`, `62721`, and `64447`.
