# Sequential `default` Revalidation: IDs `49750`-`49999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 67 pre-existing four-language fingerprints; all match.
  Added the other 183 IDs to the review ledger.
- Recorded 21 current correction-candidate IDs and 30 evidence-limited
  holds. Five IDs have both a clear, separable correction candidate and a
  distinct unresolved question; 204 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `49756` | Name format | The Korean place name `브래컨 코브` lacks the English form. Add `(Bracken Cove)` while keeping its canonical Korean spelling unresolved below. | High |
| `49766` | Name format | The quest's requested collector is `아시온` without the English form. Other active quest rows use `아시온(Acyone)` and Japanese supports that Korean form; pair this reference as `아시온(Acyone)`. | High |
| `49769` | Naturalness | `뒤에 남겨지는 건 ... 대가겠지` is an awkward construction for being left behind because one is not among Trav's elite. Consider `트라브(Trav)의 정예에 들지 못한 대가로 뒤처진 셈이겠지.` | High |
| `49771` | Meaning / omission | English and Chinese include `Ah. Very good.` before the speaker says they may recalibrate the study. The current Korean begins at the recalibration thought and omits that approval; Japanese also omits it, but English is the meaning anchor. Restore the opening reaction, for example `아. 아주 좋군. 연구의 일부는 다시 조정해야 할지도 모르겠어... 네 신체 비율을 추정해야 했거든.` | High |
| `49785` | Speech level / naturalness | The English and Japanese are a direct personal statement, but Korean reads like a report (`기록을 보면 ... 있는 듯하다`). Consider conversational wording such as `갤로우스 엔드(Gallows End)에는 필요 이상 오래 있고 싶지 않아. 이 섬에 관한 기록을 보니 사악한 존재가 있는 것 같아.` Keep the place-name spelling question separate below; no speaker identity is inferred. | Medium-high |
| `49791` | Name format / terminology | Capitalized `the Font` refers to the drying magical spring; Korean reduces it to generic `샘물`. Use the established named form `샘(The Font)`. | High |
| `49795` | Name format | The source identifies the same-named Great House, but Korean `아른 대가문` omits the English name. Add `아른(Arne)` without resolving the family identity question below. | High |
| `49851` | Naturalness | In the trader's coaxing offer, `나한테서 가져가기만 하면 네 것이 될 거야` is translation-like. Consider `내 손에서 가져가기만 하면 네 거야`, preserving the condition and repeated urging. | Medium-high |
| `49860` | Naturalness / consistency | The same English response, `I'll pay you`, appears at `44752`, `46201`, `48041`, `58374`, and `65109`; the parallel Korean wording differs (`돈을 내겠어` / `돈을 낼게`). Align the wording, for example to `돈을 낼게`, while preserving each row's distinct runtime token. | High |
| `49861` | Name format | The place `Tinehil` is rendered `타인힐` without its English form. Pair it as `타인힐(Tinehil)`; do not infer a speaker from the linked multi-NPC asset. | High |
| `49876` | Speech level / naturalness | `부탁이야` and `한담하러 온 게 아니야` are conversational, but the same utterance ends with the stiff `도와줄 수 있겠나?`. Japanese remains conversational. Use a consistent ending such as `도와줄 수 있어?`; the title question is held separately. | High |
| `49880` | Name format | Both epithets are only partly paired: `약탈자 라시논(Racinon)` and `붉은 눈의 라시논(Racinon)`. Include the complete source epithets, `Racinon the Ravager` and `Racinon the Red-Eyed`, without deciding the allegiance meaning held below. | High |
| `49931` | Naturalness / grammar | `메네타이어(Menetyre)에 뼈더미 위에 앉은 에틴(Ettin)처럼` is awkwardly attached. Preserve the simile with wording such as `뼈더미 위에 앉은 에틴(Ettin)처럼 메네타이어(Menetyre) 위에 우뚝 서 있지.` | High |
| `49934` | Naturalness | `눈에 있는 그건 뭐죠?` is unnatural Korean for noticing something in the addressee's eyes. Consider `눈빛에서 타오르는 건 뭐죠?`, preserving the sudden recognition of the flames of chaos. | High |
| `49943` | Meaning / unsupported addition | Korean introduces `검술의 대가(Blademaster)는`, which is absent from English and changes the English modifier about becoming one with one's weapons into a named subject. Japanese adds destiny/class language, but Chinese follows English. Remove the unsupported title and render the English subject naturally, e.g. `무기와 하나가 되면 대부분의 적을 단 몇 초 만에 처치할 수 있습니다.` | High |
| `49949` | Title format | The exact label `Irion, King of Cups` is repeated in 20 rows with the same Korean `컵의 왕 이리온(Irion)`. The person is paired but the title is not. Consider the consistent form `컵의 왕(King of Cups) 이리온(Irion)`. | High |
| `49969` | Terminology / consistency | The same `great chamber` is rendered `대전` here and `대회랑` elsewhere, while the in-group established form is `대전당`. Align this occurrence with `대전당` without changing the protection/opening sequence. | High |
| `49980` | Title format | The quoted ballad title `'The Champions'` is rendered only as `'챔피언들'`. Add the English title, e.g. `'챔피언들(The Champions)'`; retain the separate uncertainty about the title translation below. | High |
| `49987` | Meaning / untranslated text | The UI/credit label `Vice President of Marketing` remains in English. Translate the role, for example as `마케팅 부사장`, while preserving the office level. | High |
| `49993` | Naturalness | `이곳에서는 평화를 지켜라` is a calque of `keep the peace` and sounds unnatural as a guard's instruction. Consider `이곳에서 소란을 피우지 마라.` | High |
| `49997` | Meaning / implication | `Anokatos has done something` is rendered `아노카토스가 무슨 짓을 했어`, which implies wrongdoing not stated by English or Japanese. Use a neutral form such as `아노카토스(Anokatos)가 뭔가 했어`; retain the urgency and hesitation that follow. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `49754` | Proper name | Gunnar Frode's Korean transliteration differs across source locales; no canonical Korean spelling is established. |
| `49756` | Proper name | Bracken Cove's Korean transliteration differs across source locales. The English pairing is a clear format candidate, but do not choose a new Korean spelling from these rows alone. |
| `49757` | Meaning / referent | `Freemen` may name a group or refer to free people, and `give them their due` may mean payment or respect. Korean preserves the ambiguity. |
| `49770`, `49785` | Proper name | Gallows End has conflicting accepted Korean spellings elsewhere. Keep this range's spelling pending a separate corpus-wide decision. |
| `49783` | Lore / meaning | `Alar make` may mean Alar cultural origin or manufacture in a place; English, Japanese, and Chinese do not settle the distinction. |
| `49785` | Proper name | The canonical Korean spelling of Gallows End remains unsettled independently of the speech-style candidate above. |
| `49795` | Lore / proper name | The item is a Great House heirloom of the same name, but the exact Arne family identity and Korean form remain unsettled independently of the pairing candidate above. |
| `49805` | Meaning / metaphor | `my banner` may be a literal banner, a faction symbol, or the speaker's teachings; Japanese and Chinese differ. |
| `49808` | Meaning / role | `member of the staff` may mean a court retainer or an employee. The Japanese and Chinese readings differ, and the surrounding line does not fully resolve the institution. |
| `49818` | Terminology | The canonical crafting tier for `Pristine Shard` is unresolved across the source locales; the completed crafting action is retained. |
| `49829` | Title / proper name | `Warden Blackwood` and the Gemstone venue are identifiable, but the canonical Korean office and venue forms are not settled by this line. |
| `49831` | Proper name | Darries' Korean transliteration differs across source locales. The count of three Warsworn and the hunt/recovery/rescue actions are preserved. |
| `49832` | Meaning / idiom | The map location is clear, but the source's tree/heritage wordplay is not; do not replace the literal image with an unsupported interpretation. |
| `49852` | Terminology / referent | The Varani grave charm and Ettinmere search objective are present, but the item/site's canonical Korean forms and the pronoun's exact referent are unsettled. |
| `49857` | Source conflict | English and Chinese say Volume II; Japanese says Volume III. Korean follows English; retain the source discrepancy. |
| `49868` | Title / referent | Capitalized `the Maid` may be the named Maid of Windemere rather than a generic servant. The line alone does not settle the title's exact referent. |
| `49872` | Title / address | `Champion` may be a formal title of address. Keep `투사여` provisional rather than standardizing it from this isolated farewell. |
| `49880` | Meaning | `give himself to Gadflow` may mean pledging allegiance or joining his followers; Japanese and Chinese support that reading, but the English idiom also permits a stronger devotion sense. |
| `49886` | Source conflict / name | English/Chinese say Walen, Japanese says Warren; the line does not resolve the name or the differing discipline/service clause. |
| `49890` | Proper name / referent | Capitalized `Villa` may refer to the named Sandstone Villa, but English/Chinese do not establish that identity in this row. |
| `49892` | Meaning / antecedent | `And it's not going to be me` is elliptical; Korean can read as “that's not my job,” while Japanese/Chinese suggest other readings. |
| `49901` | Title / address | `Oathblade` may be a formal rank or title. The Korean vocative/old-fashioned request is not changed without stronger context. |
| `49902` | Meaning / institution | `House` may mean a family, faction, or institution; Japanese/Chinese use family-like terms while the English is capitalized. |
| `49919` | Title / referent | `The Baronett` may be a name or rank. The list of three fiends and the sailors' reputation claim are otherwise retained. |
| `49942` | UI / label type | `38 Studios, Corporate` remains untranslated in Korean and Japanese, while Chinese identifies the company. It is unclear whether `Corporate` is a department label or part of a credit/brand string. |
| `49962` | Source conflict / location | English/Chinese say Convict's Cavern; Japanese says White Stone Prison. Korean follows English/Chinese. |
| `49975` | Title / term | `Loresage` may be a person, title, or group label; the isolated label does not settle its Korean rendering. |
| `49980` | Title | English/Chinese support `The Champions`; Japanese calls the ballad `Protectors`. The English title pairing is a format candidate, but retain the translation-choice question. |
| `49990` | Meaning / referent | The subject `they` is not identified in the row. Keep it generic; do not infer a group from asset association alone. |
| `49996` | Lore / terminology | Dwynian's story, the twelve sharpened spears, ages, guard counts, and 18-break layout are retained. Creature/name spellings, including `laenashe`, remain provisional. |

## Rechecked Findings and Structure

- The previous working disposition at `49771` said the active Korean included
  `아. 매우 좋아.`; the current row does not. The current source comparison
  therefore reopens it as an omission candidate. Existing ledger rows and
  their historical statuses were not overwritten.
- Earlier voice findings for `49912`, `49839`, and `49889` were checked
  against the current Korean. Their previously flagged wording is no longer
  present or does not remain a supported issue; they are not carried as
  current candidates.
- The exact-English duplicate group `49777`/`49800` (`Yeah?`) has matching
  Korean text (`응?`) in both rows.
- Three entries contain embedded line breaks: `49844` (1), `49871` (3), and
  `49996` (18). The counts match across all four languages, totaling 22
  breaks per language. The ballad at `49996` retains its 10-paragraph layout
  and all 18 breaks.
- Runtime/display marker identities and order match across all four
  languages. Localized `{*1...}` payloads differ as expected at `49887` and
  `49930`; the localized wrapper order is preserved.
- Of 250 IDs, 189 have indexed asset associations, represented by 192
  ID-asset links across 129 assets; 61 have no indexed asset. Of the 183 new
  ledger IDs, 122 have indexed associations and 61 do not. Asset links do
  not establish per-key speakers or playback order.

## Range Result

- This range has 21 current correction-candidate IDs and 30
  evidence-limited holds; five IDs have a candidate and a separate hold.
  204 IDs have no current finding.
- After appending 183 new IDs, the ledger covers 53,980 of 65,135 unique
  `default` IDs (82.87%), leaving 11,155. Sequential coverage reaches
  `49999`; next is `50000`-`50249`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
