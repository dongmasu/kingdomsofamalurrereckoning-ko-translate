# Candidate Reconciliation: IDs `38500`-`38749`

- Date: 2026-11-14.
- Rechecked all 21 in-range candidate IDs against English, Japanese, Chinese,
  active Korean, and relevant prior reviews.
- `38609` and `38694` were already reconciled with linked terminology groups
  and are not counted twice.
- English anchored meaning; Japanese guided voice/register and Chinese
  supported the comparison. Asset membership was not used to infer a speaker
  or playback order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `38501` | Corrected | Added the named location pairing `우두아스(Uduath)` and retained the threat and dust image. |
| `38508` | Corrected | Recast the awkward sword-and-buckler line as `내게 그랬듯 너에게도 큰 도움이 될 거야`. |
| `38513` | Corrected | Paired each occurrence of Ysa while preserving all poem lines and paragraph breaks. Exact-English duplicate `12219` was aligned. |
| `38523` | Corrected | Paired `해머 록(Hammer Rock)` and `포지파이어 요새(Forgefire Keep)` while preserving the two-stage construction history. |
| `38524` | Corrected | Added `라피두스(Lapidus)` without changing the question. |
| `38535` | Corrected | Paired the full character name and epithet as `뚱보 레카(Lekka the Corpulent)`; retained the troll and appetite joke. |
| `38596` | Corrected | Paired the queen's complete source title as `흐리르다 여왕(Queen Hrirda)`. |
| `38597` | Retained | `성약단(The Testament)` is already clear here. The cross-locale Testament/Belen naming conflict remains unresolved, so no global faction rewrite was inferred. |
| `38609` | Previously reconciled | The Warsworn credential is already consistently `추천장` in the linked group. |
| `38629` | Corrected | Added the full name pairing `브로건 맥퀸(Brogan MacQueen)` without changing the optional invitation to join. |
| `38630` | Corrected | Changed inability-implying `난 못 가` to the source-supported refusal `난 안 갈래`, naturalized the certainty idiom, and preserved all four paragraphs. |
| `38640` | Corrected | Paired the full rank and name as `로이드 이등병(Private Lloyd)`. |
| `38643` | Corrected | Paired both `고렘 케인(Gorem Kane)` and the named group `라시르 골드블레이드(Rathir GoldBlades)` without asserting a new relationship. |
| `38664` | Corrected | Restored the omitted rhetorical question `하지만 달리 어떻게 됐겠어?` and retained the conversational voice. |
| `38683` | Corrected | Added the source pairing `마비노기(Mabinogi)` while preserving the three-part epithet. |
| `38687` | Corrected | Paired the complete epithet as `미치광이 그레이스톤(Graystone the Mad)`. |
| `38694` | Previously reconciled | The exact-English Argine title group already uses the same complete bilingual title and name at all 26 IDs. |
| `38705` | Corrected | Clarified the invitation as `마음이 바뀌면 여기로 와. 난 여기 있을게.` Exact-English duplicate `9368` was aligned. |
| `38711` | Corrected | Replaced the stiff `잔혹한 솜씨` with `거칠게 싸울 줄 아는`, preserving the direct, conversational request. |
| `38715` | Confirmed | The active row already uses the group's established `성스러운 연못(Sacred Pools)` and `수문(Water Lock)` terms. |
| `38728` | Confirmed | `포럼(Forum)` is already paired. The separate singular `Templar` title remains held and was not inferred from the faction decision. |

## Holds

The prior holds `38500` (singular `Templar` title) and `38601` (whether
`Knave` is a role or a person's card rank) remain unresolved.

## Exact-Source Duplicates

- `12219` and `38513` have identical English source text and now have
  identical Korean poem text. Their eight embedded line breaks are retained.
- `9368` and `38705` have identical English source text and now have
  identical Korean wording.
- The Argine title at `38694` remains consistent with all 25 other exact
  English title rows.

## Verification

- Reconciled 21 in-range candidates. Nineteen were newly counted;
  `38609` and `38694` were already counted. Cumulative reconciliation is
  2,437 / 4,015 (60.70%), with 1,578 remaining.
- Changed Korean `Texto` at 16 in-range candidate IDs and two exact-source
  duplicate IDs (`12219`, `9368`); refreshed only those 18 ledger
  fingerprints.
- IDs remain ordered and unique. The CSV retains its UTF-8 BOM and existing
  mixed line endings; the poem at `38513` and passage at `38630` retain their
  source-matching line-break counts.
- All 65,135 review-ledger fingerprints validate; index/catalog reproduction,
  11 CSV-preservation tests, nine dialogue-context tests, normalized
  manifest-to-CSV comparison, and the CRLF-aware diff check passed. The CSV
  retains 71,838 CRLF sequences, 244 LF-only separators, and no bare CR.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
