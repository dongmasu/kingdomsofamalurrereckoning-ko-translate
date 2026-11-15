# Sequential `default` Revalidation: IDs `49250`-`49499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 59 previously recorded four-language fingerprints; all match.
  Added the other 191 IDs to the review ledger.
- Recorded 11 current correction-candidate IDs and four evidence-limited
  holds; 235 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation, including reopened findings.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `49259` | Naturalness / name format | The long Aster history is intelligible, but phrases such as `왕위를 지킨 마지막 아스터 가문 사람` read literally. Several English names are also unpaired in Korean (`Aster`, `Eaton Aster`, `Heric`, `Bodan Aster`, `Kent`, `Ratofer`, and `Scaith`). Rephrase the succession sentence naturally (for example, `아스터(Aster) 가문 출신으로 마지막 왕이었다`) and pair the names consistently. | High |
| `49259` | Quotation format | The king's quoted testament is not visibly delimited in Korean although English, Japanese, and Chinese mark it as a quotation. Add clear quotation marks around the testament while preserving the eight embedded line breaks. | High |
| `49271` | Meaning | `I wish to see the enemy` is rendered `적을 만나고 싶다`, which says the speaker wants to meet the enemy rather than see them. Consider `적을 직접 보고 싶다`. | Medium-high |
| `49338` | Format | The English and Japanese explicitly name Julia, but the Korean gives only `줄리아` without the English pairing used for names. Consider `줄리아(Julia)는 이제 내게 남은 유일한 가족이야. 도와줄래?` | High |
| `49357` | Naturalness / meaning | `true love has no memory of time` is rendered `진실한 사랑에는 시간이란 없어`, which can sound like a claim that time itself does not exist. Japanese says time does not matter and Chinese says true love is not limited by time. Consider `진실한 사랑 앞에서는 시간이 의미 없으니까.` | Medium |
| `49375` | Name format | The person addressed as `Astlof` is rendered `아스트로프` without the English pairing. Consider `아스트로프(Astlof)`; no speaker identity or register change is inferred from the asset association. | High |
| `49427` | Format / untranslated text | The phrase `deed to Skoria Mine` remains verbatim inside the Korean sentence. Translate the full phrase, for example `스코리아 광산(Skoria Mine)의 소유권 증서`, rather than leaving the English source fragment. | High |
| `49444` | Name format | The named location `Hunter's Pit` appears as `헌터스 핏` without its English pairing. If retaining this site-name rendering, consider `헌터스 핏(Hunter's Pit)`. | Medium |
| `49479` | Terminology consistency | Rechecked the Sandstone Villa upgrade entry. Within the same quest, the action varies among `개량`, `업그레이드`, and `개조`; related journal entries `10464` and `10866` use `개량`, and Japanese also uses `改築`. Align this row's `개조` with `개량`. | High |
| `49483` | Name / title format | `Master Mcleod` is rendered `마스터 맥클라우드(Mcleod)`, leaving the English title outside the parenthetical. Consider `마스터 맥클라우드(Master Mcleod)`. | High |
| `49486` | UI terminology / consistency | The `Main Menu` heading is `주 메뉴`, while the same heading in related entry `3076` is `메인 메뉴`; Japanese also uses `メインメニュー`. Use `메인 메뉴` here. The distinct five-section text, including Online, is source-specific and should remain. | High |
| `49491` | Meaning / naturalness | In the SQ121 relic context, `them` refers to missing relics, but `그들을 계속 지켜볼게` reads as watching people. Consider `유물들을 계속 찾아볼게` or another natural “keep an eye out for the relics” wording. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `49380` | Speech level | Japanese uses a warm, feminine-sounding greeting, while Korean uses polite `-군요`; the linked asset does not map this key to a speaker or scene. Keep the existing hold rather than making a speaker-voice judgment. |
| `49440` | Speech level | The Japanese line mixes a conversational phrase with polite departure wording, while the Korean is consistently polite. The asset does not establish the individual speaker or turn; retain the existing register hold. |
| `49487` | Title meaning | `The Humbled` is rendered `겸손한 자`; Japanese supports a humble-person reading, while the English passive form and Chinese title suggest being humbled or feeling inferior. The exact intended play title is not settled, so do not guess a replacement. |
| `49490` | Meaning / source conflict | English and Chinese say Lyria will save the speaker and others; Japanese instead directly invokes Lyria to save them. Korean follows the prayer-like Japanese construction. Retain it pending contextual evidence that resolves this source difference. |

## Rechecked Findings and Structure

- The 59 pre-existing ledger fingerprints match the current four-language
  sources. Existing candidate and hold rows remain byte-for-byte unchanged.
  The report reopens `49357` and `49427` as current findings; their historical
  ledger dispositions are preserved.
- One exact-English conversational duplicate group touches the range:
  `49301`/`49322` (`Goodbye.`). Japanese and Korean match within the pair.
  `49326`/`49400` contain only a period and are punctuation-only entries, not
  a meaningful repeated sentence.
- Two entries contain embedded line breaks: `49259` has eight and `49372` has
  one. The counts match across all four languages, totaling nine per language.
- Runtime/display markers occur at `49270`, `49345`, `49387`, `49432`,
  `49442`, and `49486`. Marker identities and order match across all four
  languages.
- Of 250 IDs, 188 have indexed asset associations, represented by 191
  ID-asset links across 128 assets; 62 IDs have no indexed asset. Of the 191
  newly recorded IDs, 129 have indexed associations, represented by 132
  links across 79 assets; 62 have no indexed asset. Asset links do not
  establish per-key speakers or playback order.

## Range Result

- The range has 11 current correction-candidate IDs and four evidence-limited
  holds; 235 IDs have no current finding.
- After appending 191 new IDs, the ledger covers 53,624 of 65,135 unique
  `default` IDs (82.33%), leaving 11,511. Sequential coverage reaches
  `49499`; next is `49500`-`49749`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
- Catalog/index reproduction, all 53,624 ledger fingerprints, all nine
  related unit tests, and `git -c core.whitespace=cr-at-eol diff --check`
  passed.
