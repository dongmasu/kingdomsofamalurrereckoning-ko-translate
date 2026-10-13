# Preliminary Language Scan: `base` IDs 1150-1199

- Review date: 2026-10-07
- Scope: all 50 active `base` rows, IDs 1150-1199.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1155, 1159, 1164, 1181 | 상급/장인급 ... 결속구 | Check whether `Bindings` names a consistent armor/crafting item and whether `결속구` is the established Korean item term. | The entries consistently preserve the source tier and `Bindings` concept, but the literal Korean compound may not identify the equipment clearly. Japanese transliterates the English item terms and Chinese uses binding-like wording; confirm against item context and related rows before changing. | Low |
| 1163 | 상급 방호 활시위 | Confirm that `Warding String` is a bowstring rather than a generic warding string/material. | Korean resolves `String` as a bowstring, while the English is underspecified and Japanese transliterates the full name. Check its inventory category or related item context. | Low |
| 1179 | 장인급 화염 방어 | Check whether `Master Flameguard` is an armor/effect name or a literal defensive property. | English and Chinese support a fire-guard concept; the Korean may read as a stat description rather than a named item. Japanese also treats it as a transliterated item name. | Low |
| 1199 | 갤로우스 엔드의 처형자들 | Align `Gallows End` with the pending corpus-wide place-name decision. | This adds another rendering to the already documented variants `갤로스 엔드`, `갤로우스 엔드`, `갤로우즈 엔드`, and literal Korean forms. The underlying English is a place name, so do not normalize this row in isolation. | High |

## Other Checks

- The other inspected item labels generally track the English meaning; no additional high-confidence semantic mismatch was found in this range.
- Proper-name parenthetical display continues to vary: for example, this range includes `블라스커(Vlasker)` and `에이거 덜프레드(Aegar Dulfred)` alongside unparenthesized names such as `그림 온위그(Grim Onwig)` versus names rendered with different spacing or source spellings. Do not normalize until the project defines a display rule.
- IDs 1157 (`Chausses`), 1165 (`Eel Petal`), and 1174 (`The Running Man Leggings`) are worth checking in game context, but the available references do not establish a definite translation error.

## Batch Status

IDs 1150-1199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
