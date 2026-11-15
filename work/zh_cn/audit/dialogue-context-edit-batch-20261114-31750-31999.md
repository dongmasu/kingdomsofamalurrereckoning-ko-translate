# Dialogue Context Translation Edit Batch: IDs `31750`-`31999`

- Date: 2026-11-14.
- Rechecked all new and retained candidates against English, Japanese,
  Chinese, and active Korean. English anchored meaning; Japanese guided voice
  and layout; Chinese was supporting evidence.
- Applied all 18 newly recorded correction candidates and four supported
  earlier candidates in range, for 22 changed in-range IDs. `31759` already
  matched the approved `Master's Tallow` form and was retained.
- Aligned directly related names and item labels in 16 other `default` IDs
  and one `base` variant. The unresolved `Athyll's Fall` source conflict at
  `31932` remains held; no speaker or playback order was inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `31767` | Added the `Joanne` pairing, retaining the existing conversational line. |
| `31775` | Recast the malformed mixed-language stat label as `숨겨진 재물 감지 보너스`. |
| `31806` | Replaced generic `전승석` with the established collectible name `로어스톤(Lorestone)`. |
| `31817` | Clarified the geology introduction and paired the distinct organization `모투스 광업(Motus Mining Operations)`. |
| `31837` | Aligned `Child of Dust` to `먼지의 자손(Child of Dust)` in the existing respectful voice. |
| `31861` | Paired the named district `부두(Quays)`. |
| `31866` | Rewrote the incomplete question while preserving the speaker's first-person meaning. |
| `31881` | Changed the objective ending to the established `-하기` form. |
| `31883` | Changed ambiguous `초대 수비병` to `초기 수비병`. |
| `31885` | Identified “The House” as `비탄의 집(House of Sorrows)` and preserved the formal register. |
| `31893` | Recast the whole line naturally as a storyteller's conversational introduction; Japanese confirms the “told stories” sense. |
| `31903` | Standardized `Three Swords` as a `검술 대가` and paired the sword `헬베인(Hellbane)`. |
| `31911` | Smoothed the invitation-and-gift sentence while retaining its respectful address. |
| `31914` | Reordered the phrase to `묻혀 있던 두 번째 드베르간(Dvergan) 보물`. |
| `31917` | Added the complete title pairing `겨울 왕(Winter King)`. |
| `31946` | Paired Ansgar Solsvard, Starg Njolf, Isle Varalin, and Lady Gravehal; preserved the petition's paragraph layout and `(판독 불가)` markers. |
| `31969` | Identified the Grastar family and paired Cenda, Myria, Tine, Snaketail, Ealfhelmn, and the letter's Heste Grastar signature. Existing `Motus Mining Interests` remains distinct from `Motus Mining Operations`. |
| `31970` | Paired `성스러운 통로(Sacred Passage)` and `레코닝 모드(Reckoning Mode)`. |
| `31977` | Joined the title and name as `강사 네나 아돌라(Docent Nena Adolla)`. |
| `31978` | Completed the ingredient pairing as `펜라크 잎(Fennwrac Leaf)`. |
| `31987` | Clarified the item as `암린시안 왕관(Amrynthian Band)`, consistent with the related crown descriptions. |
| `31988` | Reworked the literal “swollen sea” phrasing and smoothed the verse while retaining all four lines. |

The existing `Master's Tallow` wording at `31759` already matched the
source-supported form. The earlier holds at `31894` and `31999` remain
unresolved; `31992`'s Japanese-only placeholder-order difference is not a
Korean formatting error.

## Related Consistency Corrections

| Group | IDs and result |
| --- | --- |
| Joanne | Added `조앤(Joanne)` at `40382` and `49205`, matching `31767`. |
| Three Swords / Hellbane | Aligned `65134` to `검술 대가 세 자루의 검(Three Swords)` and paired `헬베인(Hellbane)`. |
| Winter King | Paired the same title consistently at `8661`, `16192`, `16991`, and `42831`, matching `31917`. Exact duplicate narrative entries remain aligned. |
| Amrynthian Band | Standardized the named item as `암린시안 왕관(Amrynthian Band)` at `500`, `11022`, `24316`, `31987`, `39286`, `43446`, `46825`, `48552`, `53479`, and `57945`. Updated matching UI label `base:3132`, variant `11`, as well. |

## Verification

- Refreshed only the 38 changed `default` IDs' `source_fingerprint` fields.
  The complete 65,135-ID ledger validates.
- The `default` CSV retains its UTF-8 BOM, 65,135 ordered records, 71,842
  CRLF record endings, and 244 LF-only record endings. The linked `base` row
  retains its original ID, variant, and order.
- The 31946 and 31969 paragraph-break counts match all four languages;
  `31988` retains four Korean verse lines.
- The index and both catalogs reproduce; all 20 CSV-preservation and
  context-index tests pass; the CRLF-aware diff check is clean.
- Source CSVs, extracted assets, and game binaries were not changed. No
  commit was made.

The next sequential candidate range is `32000`-`32249`; application remains
ongoing.
