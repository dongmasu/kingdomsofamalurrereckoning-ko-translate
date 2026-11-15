# Sequential `default` Revalidation: IDs `14000`-`14249`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- The 70 existing ledger records in the range were fingerprint-checked.
  Their supported unresolved findings were retained; the previous candidate
  at `14146` was cleared because the current Korean already reads `광상`.
- The other 180 IDs were reviewed and added to the ledger. Eight correction
  candidates were added or reopened, alongside four earlier open candidates.
  Two evidence-limited holds were added or reopened, alongside three earlier
  holds.
- Of the new IDs, 131 have indexed quest-asset links and 49 do not. Asset
  associations do not establish an individual speaker or playback order.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV. Four previously recorded candidates remain open alongside
the eight new findings.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `14002` | Terminology / meaning | This refers to the reconnaissance document carried by Venris. Japanese repeatedly uses `偵察報告書`; the same document is already `정찰 보고서` in Korean at `1237`, `1766`, and `20647`. Consider changing `정찰 자료` to `정찰 보고서` while retaining the sentence structure. Existing finding: `dialogue-context-sq118-revalidation-20261110.md`. | High |
| `14079` | Naturalness | In `But it's fitting that you came`, `네가 온 건 마땅한 일이야` sounds like the arrival was deserved or obligatory. In context, the speaker hopes the one who damaged the Weave will repair it. Consider `하지만 네가 온 건 잘된 일이야.` | Medium |
| `14092` | Speech level / naturalness | `무슨 일이오` and `무엇을 도와드릴까` shift between marked `-오` and a less consistent offer ending. Consider maintaining one elevated register, e.g. `무슨 일이오, 먼지의 아이여? 무엇을 도와드리면 되겠소?` | High |
| `14150` | Naturalness | `가진 건 별로 없지만 없는 것보단 조금 나아` leaves the comparison without a clear subject and sounds as if the speaker, rather than their wares, is better than nothing. Consider `가진 건 많지 않지만, 없는 것보단 나을 거야.` | Medium-high |
| `14179` | Naturalness | `공식적인 평화를 확립하려는 내용` is an awkward collocation for the contingency letter's purpose. Consider `아데사와 투아사 군대 사이에 공식적인 평화가 성립되도록 하는 내용이야.` | Medium |
| `14180` | Naturalness | `여기, 싸우다 찾았어` is an awkwardly joined fragment for `Here, I found these during the fight`. Consider `자, 여기. 싸우는 중에 찾았어.` | High |
| `14183` | Name consistency | `Malgar` is `말가르` in other active rows, but appears here as `마르가르`. Align this occurrence to `말가르(Malgar)`. Existing finding: `dialogue-context-three-handler-assets-kvsq01-sq27-dlc1sq03-revalidation-20261111.md`. | High |
| `14190` | Naturalness | The vocative `필멸자여` is awkwardly attached after both commands. Consider moving it to the front: `필멸자여, 우리와 함께하든가 지금 떠나라.` Existing finding: `dialogue-context-hm01-revalidation-20261110.md`. | High |
| `14204` | Naturalness | `주사위가 좀 있어. 한 판 하고 싶다면 말이야` is stilted and splits the invitation unnaturally. Consider `한 판 하고 싶으면 주사위도 있어. 돈도 있잖아.` | High |
| `14231` | Terminology consistency | `master-at-arms` varies among `무기 담당관`, `무술 교관`, and `병기 교관`; related rows support `무기 교관` for this role. Consider `무기 교관이었어`. Existing finding: `dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md`. | High |
| `14241` | Naturalness | `흔적의 배열을 보면` is an unnatural rendering of judging by the blood's layout. Consider `혈흔이 흩어진 모양으로 보아, 이 사람은 최근 이곳을 지나 남쪽으로 향한 듯하다.` | Medium |
| `14243` | Naturalness | `솜씨가 그리워지는 건 부정 못 하겠어` is an awkward negative construction. Consider `그 솜씨가 그리울 수밖에 없지.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `14051` | Meaning | `the only part of my name I wish to hold onto` may refer to the family name or the parchment as the remaining part of family identity. English and Japanese do not settle the metaphor. Retain the current Korean pending stronger context. Existing finding: `dialogue-context-sq54-revalidation-20261110.md`. |
| `14062` | Meaning / title | English says `Mr. Hugues`, Japanese says `Professor Hugues`, and Chinese uses `先生`. Korean `휴그 씨` follows English. The source-language title discrepancy does not establish a different Korean correction. |
| `14069` | Format / sentence boundary | English ends with `They will treat you like my own,`, while Japanese and Chinese complete the thought and Korean preserves the comma. Retain the punctuation pending dialogue-node evidence. Existing finding: `dialogue-context-1257091-sq84-gertern-jakasen-revalidation-20261111.md`. |
| `14128` | Speech level | Korean uses polite `무엇을 도와드릴까요?`, while Japanese uses plain `どんな用かな？`; English does not encode the distinction. No per-key speaker or scene-stage mapping establishes whether this is a voice mismatch. Retain without normalizing. |
| `14177` | Speech level / address | Korean uses polite forms while Japanese is plain conversational speech. The linked asset has no per-key speaker or scene-stage mapping, so retain the existing register question unresolved. Existing finding: `dialogue-context-next-five-sq47-sq78-sq97-sq100-sq103-revalidation-20261111.md`. |

## Source and Structural Checks

- Fifty-eight exact-English duplicate groups touched the range, covering
  1,089 rows across the corpus. Korean text matches in every group.
- Runtime arguments and markup were checked across all four locales. At
  `14088`, the localized `Tirnoch` and `Reckoning` wrappers appear in the
  reverse order from English and Japanese, matching the Korean sentence
  syntax and Chinese order; `{1}` and `{2}` remain intact. The `[Active]`
  display label at `14203` is localized inside the same wrapper.
- Six rows contain embedded line breaks: `14022` (6), `14033` (2), `14039`
  (4), `14050` (4), `14203` (1), and `14209` (10). Korean retains its
  existing CRLF bytes. English, Japanese, and Korean have 27 logical breaks;
  Chinese has 26 because `14209` has one fewer break.
- `14209`'s long rhetorical text retains its paragraph structure. No source
  or translation line breaks were normalized.
- The English source includes apparent typos at `14018` (`imbecil`), `14096`
  (`Ever time`), `14134` (`wretcheder`), `14163` (`bout`), and `14209`
  (`wordly`). The Korean follows the intended meaning; these are not Korean
  correction candidates.
- ID `14133` directly self-identifies as Queen Belmaid. All other speaker
  assignments and playback order remain unknown unless separately supported
  by direct evidence.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
