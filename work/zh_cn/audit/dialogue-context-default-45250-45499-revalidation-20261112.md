# Sequential `default` Revalidation: IDs `45250`-`45499`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 77 previously recorded four-language fingerprints; all match.
  Added the other 173 IDs to the review ledger.
- Recorded 12 current correction candidates and 13 evidence-limited holds.
  The other 225 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `45252` | Terminology / name format | `lorestone` is rendered `운명의 돌`, which can imply a fate-related stone; the established item term is `로어스톤`. The name Callor is also unpaired. Consider `칼러(Callor)의 로어스톤 찾기`. | High |
| `45287` | Speech level / naturalness | `고맙네, 나그네여` shifts into `걱정하기 시작했어` in one utterance. Japanese stays conversational. Consider keeping the whole line in plain conversation, e.g. `고마워, 나그네. 아무도 오지 않을까 봐 걱정되기 시작했어. 장막 너머로 끌려갈 때까지 이 벽만 바라보게 될까 봐 말이야.` | Medium-high |
| `45314` | Naturalness / format | The farewell letter's `Yours, Ruby` is reduced to the abrupt fragment `루비가`. Recast the sign-off as natural Korean correspondence while preserving the intimate farewell; do not add an unsupported relationship. | Medium |
| `45339` | Meaning | English says the addressee's stalling will cease, while Korean changes this to a direct order, `당장 중단해라`. Preserve the threatening declarative sense that the delay ends immediately rather than making it a command to stop. | High |
| `45341` | Name / format | `Nil the White` is rendered `백색의 닐` without the source name. Match the established `백색의 닐(Nil the White)`. The generic `Priestess` does not need to be treated as the same name. | High |
| `45351` | Naturalness | `이자의 주머니` is an awkward, potentially ambiguous rendering of `this one's pockets`. Consider `이 사람 주머니를 털자` or an equally natural line that keeps the pickpocketing intent. | Medium |
| `45360` | Meaning | `It won't likely kill you` is probabilistic, while `죽지는 않을 거예요` sounds certain. Japanese also says death is very unlikely. Consider `죽을 가능성은 거의 없어요. 하지만 새끼 고양이처럼 기운이 빠지죠. 이 근방에선 그 정도면 죽은 거나 다름없어요.` | Medium-high |
| `45386` | Terminology / name format | `Adarus Hollow` is rendered `아다루스 굴`, while the established full place name is `아다루스 동굴(Adarus Hollow)`. Consider `아다루스 동굴(Adarus Hollow)은 절벽 바로 아래 정남쪽에 있어.` | High |
| `45433` | Name format | The named scout Remes is rendered `레메스` without the English name, while Secandra, Primos, and Kahrunk are paired in the same entry. Consider `레메스(Remes)`. | High |
| `45447` | Terminology | The capitalized returning `Champion` is rendered `용사`, while the same role is rendered `챔피언` in related references. Consider `챔피언(Champion)` here. | Medium-high |
| `45465` | Formatting | The English, Japanese, and Chinese explicitly quote Mitharu's speech; Korean omits the opening and closing quotation marks. Add the quotation marks around the quoted passage while retaining its single embedded line break. | High |
| `45468` | Meaning / naturalness | `그리고 지금은` adds a present-time claim absent from the source and makes the prison/graveyard threat sound like a current destination. Consider `아포타이어(Apotyre)에서 두 번째로 오래된 가문이야. 결국 감옥이나 묘지에 갈 처지지.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `45277` | Faction terminology | `Vagabonds` is capitalized as a bandit-group name, but the row alone does not settle whether the established group label should be translated descriptively or paired as a proper name. Retain `방랑자들` provisionally. |
| `45342` | Address / honorific | `your grace` is rendered `각하`; Chinese uses an imperial honorific, while Japanese omits the address. The row and asset do not establish the addressee's rank or the intended Korean honorific. |
| `45356` | Meaning / source conflict | English's `passed under the awareness` is unclear; Japanese and Chinese describe a blessed person who does not know Lykeios, which Korean follows. Keep the interpretation open rather than resolving the source discrepancy from this row alone. |
| `45358` | Name / context | `the First` is rendered `퍼스트`; Japanese identifies the first Scaith, while English does not spell out the relation. Retain provisionally until the title/person reference is established. |
| `45370` | Text type / terminology | `Circle of Strife` could refer to a faction, ability, or magical circle. The isolated label and differing Chinese rendering do not establish its type. |
| `45375` | Name / meaning | `Bloody` may be a named creature/person or a descriptive warning; Japanese transliterates it and Chinese interprets it as a bloody skeleton. Retain `블러디` pending context. |
| `45391` | Title / meaning | `Tilera Redeemed` may be a title or a description, and `redeemed` can mean atonement or restored standing. The isolated label does not settle the intended reading. |
| `45396` | UI terminology | The localized display label `sprint` appears inside a runtime style marker. Its Korean naming remains subject to the existing UI-label decision; retain `질주` without treating the marker as missing. |
| `45397` | Speech level | Korean uses marked `-말게` while Japanese uses plain speech. The asset's handler-prefix clue does not map this key to a speaker or scene stage, so retain it as a register question. |
| `45414` | Title / meaning | `Will and Waters` can use `will` as testament or intention. Japanese and Chinese differ, and the quest context does not settle the title. Retain `의지와 물` provisionally. |
| `45429` | Text type | The isolated `Russian Federation` label is unusual in the fantasy setting, but the row does not establish whether it is player-facing text, test data, or metadata. Do not rewrite it by inference. |
| `45443` | Meaning | `indisposed` does not identify why Octienne is unavailable; Japanese suggests reluctance and Chinese an exit/withdrawal. Korean's inability-to-perform-duties reading is plausible but more specific. Retain pending context. |
| `45445` | Title / meaning | `Bayala's Spring` could name a season, water source, or location. The isolated label does not establish which sense applies. |

## Rechecked Findings and Structure

- The historical `45477` word-choice concern referred to `맡길`; the current
  Korean is `맞길`, which correctly expresses that the work suits the
  addressee. No current correction is needed. The older ledger disposition
  remains unchanged as a historical record.
- The current `45361` says `틸레라(Tilera)가 쓰러졌을 때`, resolving the
  older `무너질 때` wording concern. The `45289` text explicitly retains the
  `한 손` joke, and `45320` already pairs the established
  `공성 파괴자(Siege Breaker)` title. These are not current findings.
- Fifty-six exact-English duplicate groups touch the range, covering 1,027
  rows. Korean is identical within every group; no translation was unified
  solely because English repeats.
- Five rows contain embedded line breaks: `45284` (2), `45288` (17),
  `45408` (5), `45421` (8), and `45465` (1). Each language has matching
  per-row break counts. All 33 Korean separators are CRLF and remain intact.
- Runtime-token and markup signatures match across the four languages in the
  range. Values, names, and localized marker payloads were reviewed in
  context; no speaker or playback order was inferred from asset links.
- Of 250 IDs, 193 have indexed asset associations; 116 of the 173 new ledger
  IDs have asset links. Asset links do not establish per-key speakers,
  addressees, branches, or playback order.

## Range Result

- The range has 12 current correction-candidate IDs and 13 evidence-limited
  holds; the other 225 IDs have no current finding.
- After appending 173 new IDs, the ledger covers 50,663 of 65,135 unique
  `default` IDs (77.78%), leaving 14,472. Sequential coverage reaches
  `45499`; next is `45500`-`45749`. Of reviewed IDs, 40,785 have indexed
  asset links and 9,878 do not.
- Catalog reproduction, all ledger fingerprints, the nine related index
  tests, and the line-ending-aware diff check passed after the ledger update.
