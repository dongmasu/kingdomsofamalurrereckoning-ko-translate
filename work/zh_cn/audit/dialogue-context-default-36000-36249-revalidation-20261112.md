# Sequential `default` Revalidation: IDs `36000`-`36249`

- Date: 2026-11-12.
- Compared all 250 in-range rows in English, Japanese, Chinese, and active
  Korean; all four CSVs contain the same ordered IDs.
- Rechecked 68 existing ledger entries and reviewed the other 182 IDs.
- Findings are bounded review proposals, not approved translation edits.
  No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `36017` | Name / format | The passage names the Battle of Galafor Plain and General Varlaine, but the Korean does not pair those complete names. Add their source forms while preserving the battle account and the already paired Orieator, Alfar, Fae, and Lyria references. | Medium-high |
| `36028` | Name / format | `Master Belne` is a complete named title; the Korean pairs `Belne` but not the full label. Consider `벨른 장인(Master Belne)` without changing the Ashmoor Clan or Winter Faelands references. | Medium |
| `36032` | Name / format | `Kel` is named but appears only as `켈`; add `(Kel)` while preserving the Frostbreak Sea pairing and the speaker's colloquial tone. | High |
| `36054` | Label / format | The standalone label `Magas the Witch` is only translated as `마녀 마가스`. Pair the complete source label, preserving the current Korean order if appropriate. | High |
| `36075` | Title / format | `Before The Talk` is identical to `33820`; both Korean labels omit the English title. Pair them consistently, as proposed in the earlier `33750`-`33999` report. | High |
| `36093` | Meaning / naturalness | English `Somehow, I anticipated difficulties` expresses an unexpected intuition; Korean `그래도` instead creates a contrast with the preceding sentence. Consider `어쩐지 어려움이 생길 줄 알았어` or another natural rendering that preserves the speaker's voice. `Grim` is already paired. | Medium-high |
| `36097` | Name / format | The event's alternate name `Llosgiad` is rendered phonetically but not paired. Consider adding `(Llosgiad)` to `제2차 대화재`, without reopening the already-settled meaning of the historical account. | Medium-high |
| `36121` | Name / format | `Centurion Gastet` is rendered as `백인대장 가스텟` without the full English label. Pair that title and name; this finding is limited to the missing English pairing and does not reopen prior Praetors/Sable decisions. | Medium |
| `36137` | Name / format | The letter's closing identifies Mason, but the Korean signature `메이슨` omits `(Mason)`. Pair the signature and preserve all paragraphs and line breaks. | High |
| `36151` | Naturalness | Retain the existing candidate: `낯선 이여` makes this brief greeting archaic compared with English `Hello again, stranger` and Japanese `また会ったね`. Keep the stranger reference but consider a more conversational greeting. | Medium-high |
| `36159` | Name / format | The named plant `Sorrogweth` appears only as `소로그웨스`. Add its English form while retaining the instruction to bring it from a nearby damp place. | High |
| `36168` | Name / format | `Bloody` is a named possessive in English and is transliterated in Japanese; Korean `블러디` has no English pairing. Pair the source name without resolving whether other contexts use the longer `Bloody Bones` form. | Medium |
| `36172` | Naturalness | Retain the existing candidate: `찾아오는 이는 드물지` is stilted for English `to venture down here` and Japanese `ここまで来る`. Consider a more conversational line that conveys the unusual effort of coming this far. | Medium-high |
| `36179` | Name / format | The title `the Executioner` and location `High Scholar Estate` are not paired, although other names in the entry are. Pair the full named title and location without changing the established gender-neutral role wording or `Leggings of Last Breath` label. | High |
| `36191` | Terminology / format | `Fastings` is an established Dverga structure term; `54487` defines the mud-and-timber bunker/tunnel network, and other reviewed entries use `패스팅(Fastings)`. Consider pairing the term here instead of the generic `지하 통로`. This is a new cross-reference consistency proposal, not a change to the previously retained sentence meaning. | Medium-high |
| `36193` | Title / format | `Death's Cryptic Hand` is explicitly a named title but appears only in Korean. Add the complete English title while retaining the current proclamation and title framing. | Medium-high |
| `36200` | Meaning / naturalness | The current modifier order in `알마인 용감한 여인` is awkward and can obscure that the woman is both Almain and courageous. Recast as a `용감한 알마인(Almain) 여인` while retaining the two Ohnshan references and the reason for the gift. | Medium-high |
| `36206` | Terminology | Retain the existing candidate from the `1443829.quest_bxml` review: the same `sigil stone` is `인장석` at `37473` and elsewhere, but `문양석` here. Align this occurrence to `인장석`; do not infer a speaker from the asset. | High |
| `36218` | Title / format | `Child of Dust` is a capitalized form of address and appears in Korean without its source form. Consider `먼지의 자식(Child of Dust)` while preserving the existing wording pending broader canonical-term decisions. | Medium |
| `36231` | Terminology | Retain the existing candidate: the same people described as `vagrants` vary among `부랑자`, `방랑자`, and `떠돌이` elsewhere. Align this occurrence to the reviewed corpus term `떠돌이`, keeping the distinct `refugees` term separate. | High |
| `36232` | Naturalness / number | Retain the existing candidate: English `These were called` refers to the two shrines, while Korean `이곳은 ... 성소들` mismatches singular demonstrative and plural noun. Name both shrines clearly and preserve the speaker's reflective register. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `36226` | Speech level / text type | Retain the existing hold. The four locales differ in register, but the paired entries read as tutorial text and may not be spoken dialogue. Do not impose a conversational voice from nearby asset associations. |
| `36235` | Meaning / referent | `Bloody least I can do` may be a wordplay/name reference or an intensifier. Japanese omits `Bloody`, Chinese gives a generic “least I can do” reading, and the isolated line does not settle the referent. Keep the current text pending context. |

## Rechecked Findings and Structure

- The range has 21 candidate IDs, two evidence-limited holds, and 227 IDs
  without a finding. Six candidates and one hold were already in the ledger.
  Three prior `not-issue` rows (`36121`, `36159`, `36218`) received new,
  separately scoped format candidates; prior sentence-meaning dispositions
  remain intact. Twelve candidates and one hold are new on IDs added in this
  pass.
- `36244` was explicitly excluded from new findings: its current
  `서약방패병(Pledgeshield)` already includes the English label, and prior
  exact-key reviews closed it as not an issue.
- `36143` was not confused with the `Fastings` term: it discusses Dverga
  treasure-map history and already pairs `Dverga`; the new term candidate is
  only at `36191`.
- Sixty-one exact-English duplicate groups (1,509 corpus rows) touch the
  range. Korean text matches within every full-string group.
- Six rows contain embedded line breaks: `36024` (1), `36136` (2), `36137`
  (9), `36167` (3), `36197` (12), and `36211` (2). Counts match across all
  four languages; normalized runtime-token and markup signatures also match
  throughout the range.
- Asset associations remain grouping evidence only. No individual speaker,
  addressee, branch, or playback order is inferred.
- The 182 new IDs bring the full-corpus ledger to 43,833 of 65,135 unique
  `default` IDs (67.30%), leaving 21,302. Sequential coverage reaches
  `36249`; the next range is `36250`-`36499`.
- The 530-asset and 65,135-ID catalogs, all 43,833 four-language ledger
  fingerprints, nine index tests, and audit-scoped diff check passed.
  Translation CSVs remain unchanged.
