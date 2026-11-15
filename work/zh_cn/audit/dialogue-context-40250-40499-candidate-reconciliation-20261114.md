# Candidate Reconciliation: IDs `40250`-`40499`

- Date: 2026-11-14.
- Rechecked all 25 correction-candidate IDs against English, Japanese,
  Chinese, the active Korean CSV, and prior scoped decisions.
- The supported corrections were already present except for one repeated
  sentence at `40384`, which was aligned with the identical English sentence
  at `61804`.
- Three candidates (`40293`, `40355`, `40382`) were already resolved in the
  active Korean text. The existing title/name pairing at `40340` was retained
  because it fully represents both parts and matches all 26 exact-source
  `Argine, Queen of Staves` labels.
- Candidate `40387` had already been reconciled with exact four-language
  duplicate `37115`; it is not counted twice.
- Four separate evidence-limited holds remain: `40255`, `40352`, `40395`,
  and `40473`.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `40264` | The informal address and command are consistent with Japanese and English. |
| `40278` | `Cranalt` is paired with the established Korean place-name form. |
| `40282` | `Serabel` is paired; the respectful address to Lyria is preserved. |
| `40291` | The complete named land `Painted Orsks` is paired; the joke remains intact. |
| `40293` | The current `후버 평원(Field of Huber)` already resolves the candidate. |
| `40318` | The conversational profile matches Japanese register and preserves the stated expertise. |
| `40332` | The wording correctly places the Cradle's importance within the Great Cycle. |
| `40340` | Retained: both `Queen of Staves` and `Argine` are paired; all 26 exact-source labels match in Korean. |
| `40349` | The statue/sculpture wording is natural and preserves the described image. |
| `40355` | `촌극` matches Japanese and Chinese for `travesties`; the earlier `만행` concern is resolved. |
| `40356` | The full rank and name, `Private Ilver`, are paired. |
| `40357` | `Herus` is paired in the offer of help. |
| `40370` | The complete standalone item label is paired. |
| `40382` | The current `조앤(Joanne)` pairing already resolves the candidate. |
| `40384` | Changed to match the shared English sentence at `61804`; `망치를` was removed, and all other sentence content and name pairings remain. |
| `40387` | The complete `Children of Dust` group is paired; exact duplicate `37115` already matches. |
| `40395` | The local source spelling `Bridget Malloi` is paired; the separate source-spelling conflict remains held. |
| `40396` | The sentence now explicitly says the listener can control how the tapestry is woven. |
| `40405` | The sigil stone terminology is consistently `인장석`. |
| `40418` | The dangling comma is closed as a sentence after `Sun Camp`, without inventing another camp. |
| `40447` | The line preserves having heard of something that could cause the aggressive behavior. |
| `40473` | The named people, places, group, and titles are paired while all three paragraphs remain intact; the separate title meaning remains held. |
| `40478` | The warning uses a consistent conversational register. |
| `40490` | The archaic formal endings are replaced by a consistent conversational offer. |
| `40498` | The line conveys the speaker's involvement in the black market without inventing a role. |

## Linked Consistency

- IDs `37115` and `40387` have identical English, Japanese, and Chinese
  strings and now share identical Korean.
- The English sentence about Gwyn Anwy reforging the Mystic Hammer is
  identical at `40384` and `61804`; both Korean sentences now use
  `그윈 안웨이(Gwyn Anwy)는 그곳에서 다시 벼려야 한다고 믿는다.`
  The remaining text in the two rows differs because their source passages
  provide different location details.
- The exact English label `Argine, Queen of Staves` occurs 26 times. Each
  language is internally consistent across the group, including the Korean
  `지팡이 여왕(Queen of Staves) 아르진(Argine)`.
- No individual speaker or playback order was inferred from asset links.

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `40255` | The four-language sources do not establish whether `Master Makers` is a formal group/title or a descriptive label. |
| `40352` | English and Chinese identify `Oathblade`, while Japanese gives a mercenary rank. |
| `40395` | The local source spells `Bridget Malloi`; other rows use `Bridgette Malloi`. The alias/typo relationship is unresolved. |
| `40473` | Japanese interprets `Pledged of Shield` as a mercenary rank while Chinese supports a shield oath. |

## Verification

- All 25 candidates were dispositioned; 24 unique IDs were newly reconciled
  after excluding previously counted `40387`.
- One Korean row changed (`40384`); only its four-language fingerprint was
  refreshed.
- All 65,135 ledger fingerprints and index, asset-catalog, and ID-catalog
  reproducibility checks passed.
- The 11 CSV-preservation tests and nine dialogue-context tests passed.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR.
- Exact-source checks and the CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

Candidate reconciliation now covers 2,603 / 4,018 (64.78%), with 1,415
remaining.
