# Sequential `default` Revalidation: IDs `45500`-`45749`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 63 previously recorded four-language fingerprints; all match.
  Added the other 187 IDs to the review ledger.
- Retained eight current correction candidates and six evidence-limited
  holds. The other 236 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `45511` | Naturalness | Rechecked the existing finding: `사냥은 어떻게 돼 가?` is understandable but less idiomatic than a direct conversational check-in. Consider `사냥은 잘돼 가?`. | Medium-high |
| `45539` | Speech level / naturalness | The prayer-like reassurance uses Korean `-하라` and `-리니`, creating an archaic, scriptural register absent from Japanese's gentle `なさい` / `なるわ`. Consider a warm conversational form, for example `별들이 네 기도를 이끌어 주길 바라며, 이제 머리를 뉘고 쉬어. 내일은 복된 날이 될 거야.` Do not infer the individual speaker. | Medium |
| `45615` | Naturalness | The Korean repeats the youngest-envoy point across two sentences (`최연소 특사` followed by `이전의 최연소 특사보다도 수십 년이나 어렸어`), making the boast cumbersome. Condense while retaining that the speaker was younger than prior envoys by decades and is now reduced to assigning chores, e.g. `한때는 막강한 라시르(Rathir)의 특사였어. 수십 년 만에 최연소였지. 그런데 지금은 해변에 사는 키 작은 사내에게 잡일이나 나눠 주고 있어.` | Medium |
| `45625` | Name / title format | Rechecked the existing title-pairing candidate. The standalone `Sergeant Bromm` is rendered `브롬(Bromm) 병장`, pairing only the name. Consider pairing the complete label as `브롬 병장(Sergeant Bromm)`, consistent with the full English title. | High |
| `45698` | Naturalness / format | In this formal casualty notice, `Sincerely,` is rendered as the fragment `삼가,`, which is not a natural Korean letter closing. Japanese `誠意を込めて` supports `진심을 담아,`; preserve the existing paragraph and signature breaks. | High |
| `45706` | Terminology / name format | Rechecked the existing SQ08 findings. The known antagonist `the Headsman` is rendered `처형자` here, and `Tinehil` lacks its established English pairing. Consider the provisional forms `처형인(Headsman)` and `타인힐(Tinehil)` in this row; this does not establish a per-key speaker. | Medium-high |
| `45720` | Naturalness | Japanese says the speaker sells prohibited goods (`禁止された品を売ってるよ`). Korean `금지된 물건은 여기서 구해` reads like an instruction to find them. Consider the vendor's natural line `금지 물품도 취급해.` The multi-NPC asset does not identify the speaker for this key. | Medium-high |
| `45731` | Naturalness | Rechecked the existing floodplain finding. `아카사 침수 평원` is a stiff compound, and `머건 정도밖에 없었는데` is awkward for the former creature population. Consider `아카사(Acatha)의 침수된 평원에 있어. 예전엔 머건(Murghan)만 나타났는데, 지금은 더 위험한 것들이 돌아다녀.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `45504` | Speech level | Korean uses polite speech while Japanese is plain. The source addresses Master Brasken, so situational deference is plausible; the asset does not map this key to a specific speaker or addressee. Retain the existing hold rather than forcing a register change. |
| `45535` | Meaning / text type | The isolated label `Basilica` could be a building type, a named location, or an institutional label. Japanese `教会堂` and Chinese `大教堂` translate it descriptively, while other Korean references use both `대성당` and `바실리카`. The linked multi-NPC asset does not establish this key's UI or dialogue context. Retain `바실리카` provisionally. |
| `45536` | Speech level / meaning | The English idiom `Get on with you` supports dismissing someone (`이제 가 보게`), while Japanese `また会おう` instead means “see you again.” The asset does not map this key to a speaker or scene stage, so retain the existing register/context hold. |
| `45674` | Address / honorific | English addresses someone as `Brother`, Japanese omits the vocative, and Chinese retains it. The appropriate Korean religious title and addressee are not established; retain the existing hold on `형제, 지금은 시간이 없어`. |
| `45688` | Text type / localization status | `Director of Business Development` is unchanged in English and Japanese but translated in Chinese. With no indexed quest asset or surrounding context, it could be a deliberately retained credits/role label. Do not infer whether to localize it; retain it pending context. |
| `45701` | Meaning / name reference | English says `Red will want this one`, while Japanese expands this to `レッドリージョン団` (“Red Legion”). The linked MQ14 asset contains multiple NPCs and cannot establish whether `Red` is a person or the faction. Retain `레드(Red)` pending direct context. |

## Rechecked Findings and Structure

- All 63 existing four-language fingerprints in the range match the current
  source rows. The seven prior candidate/hold records were rechecked against
  their cited reports; their dispositions remain as documented.
- Sixty-seven exact-English duplicate groups touch the range and cover 1,026
  corpus rows. Korean matches within every group; no translation was unified
  solely because English repeats.
- Seven rows contain embedded line breaks: `45514` (10), `45544` (2),
  `45566` (1), `45621` (2), `45656` (1), `45698` (5), and `45737` (6).
  Each language has matching per-row break counts; all 27 Korean separators
  are CRLF and remain intact.
- Runtime arguments, markup, and display wrappers were checked. At `45747`,
  all four languages retain the three localized display wrappers and both
  button arguments; Korean follows the English instruction order.
- Of 250 IDs, 193 have indexed asset associations, including 131 of the 187
  newly recorded IDs. The other 57 have no indexed asset association. Asset
  links do not establish per-key speakers, addressees, branches, or playback
  order; unsupported attribution and order remain unknown.

## Range Result

- The range has eight current correction-candidate IDs and six
  evidence-limited holds; the other 236 IDs have no current finding.
- After appending 187 new IDs, the ledger covers 50,850 of 65,135 unique
  `default` IDs (78.07%), leaving 14,285. Sequential coverage reaches
  `45749`; next is `45750`-`45999`. Of reviewed IDs, 40,916 have indexed
  asset links and 9,934 do not.
- Catalog reproduction, all ledger fingerprints, the nine related index
  tests, and the line-ending-aware diff check passed after the ledger update.
