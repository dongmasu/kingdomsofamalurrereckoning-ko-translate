# Sequential `default` Revalidation: IDs `59250`-`59499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 67 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 183 IDs in ascending order.
- Ten new-row correction candidates and three new ledger holds are recorded.
  Seven existing candidates and one existing hold were rechecked without
  rewriting their append-only ledger rows. Two additional findings at
  previously recorded IDs are report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `59284` | Name / format | The standalone objective `Return to Audra` is translated as `오드라에게 돌아가기`; pair the name as `오드라(Audra)에게 돌아가기`. | High |
| `59314` | Name / format | The complete item label is `Master Mitharan Energizing Rivets`, while Korean pairs only `Mitharan` and leaves the item title unpaired. Consider pairing the complete item name without duplicating the personal-name annotation. | Medium |
| `59317` | Name / format | `Three Winds Crutch` is a named location in related source rows, but this journal sentence has only the transliteration `스리 윈즈 크러치`. Pair the place name while preserving `near` as approximate location. | High |
| `59323` | Name / format | The standalone label `Captain Golsey Eidar` is only `골시 에이다르 대위`. Use the established combined name/title form with the English title and name. | High |
| `59358` | Name / format | The standalone objective `Speak to Orla` is only `오를라와 대화`. Add the English name at the first mention in this row. | High |
| `59367` | Name / meaning | English and Chinese use `Wine` as a person addressed by name; Korean `와인` is ambiguous with the drink. Pair it as `와인(Wine)` so the addressee is clear. | Medium-high |
| `59373` | Name / format | `Keep Courtyard` is a named Gravehal location in related source rows, while Korean uses only `성채 안뜰`. Consider `성채 안뜰(Keep Courtyard)` in this journal entry. | High |
| `59387` | Title / format | The standalone item name `Sagard's Fine Crystals` is rendered only as `사가드의 고급 수정`. Pair the full item name rather than annotating only its owner. | Medium-high |
| `59388` | Meaning / naturalness | The Lykeios is an academy of debate; Japanese explicitly describes the first opponent as a debate opponent. `첫 상대를 물리쳤다` can suggest a physical fight. Consider `리케이오스(Lykeios)에서 첫 토론 상대를 꺾었다.` | High |
| `59435` | Name / format | The quest objective names `the Fae Mound`; Korean currently annotates `Fae` but not the complete location. Consider `귀한 과일을 페이의 무덤(Fae Mound)으로 돌려보내기.` | Medium-high |

The preliminary concern at `59253` was withdrawn: the Korean already pairs
`Crystal War` and `Ysa` and preserves the English meaning; Japanese paraphrases
the first clause, while Chinese supports the English reading. The concern at
`59481` was also withdrawn: Korean follows the English meaning, corroborated
by Chinese; Japanese is more compressed but does not establish a Korean
error. Neither row is recorded as a candidate.

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `59258` | The existing `The Big Hunt` consistency candidate remains supported. The current `빅 헌트` differs from established variants and omits the English name. |
| `59260` | The existing role-consistency candidate remains supported: `the champion in the ballad` is `발라드의 챔피언`, while the same role is `용사` at `20416`. |
| `59263` | The existing `Commodore Garrick` candidate remains supported. `제독` may not preserve the specific rank, and the combined English name/title is absent; confirm the Korean rank before editing. |
| `59282` | The existing naturalness/address candidate remains supported. `그대여` is elevated beside the conversational line; `친구` is supported by this exchange's established address. |
| `59300` | The existing speech-level candidate remains supported: one sentence shifts from `하겠다` / `보상하지` to `될 거야`. Review the complete utterance in one register. |
| `59318` | The existing naturalness/meaning candidate remains supported. `게르턴 애스커와 형제는` is an awkward pairing; make the relation explicit as `게르턴 애스커(Gertern Asker)와 그의 형제는`. |
| `59397` | The existing meaning/terminology candidate remains supported: use the established `오지간을 처치한 자` rather than `오지건의 학살자`, and `사그렐 경(Sir Sagrell)` rather than `기사 사그렐`. |

The existing hold at `59480` remains unresolved. Earlier decisions conflict on
the Korean equivalent of Herc Adwold's `Warden` title; this range does not
resolve that broader title convention. Existing ledger rows remain unchanged.

## Additional Report-Only Findings at Existing IDs

These new observations concern IDs already present in the ledger. Their
existing rows remain unchanged.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `59432` | Naturalness | `이 많은 죽음을 도무지 이해할 수 없어` is understandable but abstract for Japanese `all are dead` and English `all of this death`. Consider `이렇게 많은 사람이 죽었다니, 도무지 이해할 수 없어.` | Medium |
| `59483` | Title / format | `Tuatha Master Farraglen` is rendered with separate `투아사(Tuatha)` and `파라글렌(Farraglen)` annotations, leaving `Master` unpaired. Pair the title in source order without changing the rest of the sentence. | Medium |

## Evidence-Limited Questions

| ID | Question and disposition |
| ---: | --- |
| `59299` | English asks where `the Oratory` is; Japanese identifies a prayer place, while Chinese reads it as oratory/rhetoric. The Korean `오라토리움(Oratory)` does not settle whether this is a location or an art/practice. Hold the referent and label. |
| `59479` | `the Mission` may refer to an institution, building, or its people. Japanese says monastery, Chinese says mission group, and Korean says `선교원`. Keep the intended referent open. |
| `59496` | `Ventrinio's Well` and `my Well` are contrasted as the sources to which the protagonist was attuned and from which they were raised. English/Japanese support a magical well or spring; Chinese uses a word also read as a water well. Keep the exact Korean lore term provisional. |

## Repeated English and Structure

- Forty-nine exact-English duplicate groups across the full corpus touch this
  range, comprising 1,395 rows in those groups; 50 IDs in the current range
  participate. Korean is identical within every group.
- `59420`, `59459`, and `59460` are the only rows with embedded line breaks.
  Each has four breaks in each language; logical break totals are 12 per
  language.
- Runtime, display, and layout marker identities and order match across all
  four languages.
- Of 250 IDs, 202 have indexed asset associations, represented by 206 links
  across 128 assets; 48 have none. Of the 183 newly recorded IDs, 135 are
  linked through 137 links across 77 assets, and 48 are unlinked. Asset
  associations do not establish an individual speaker or playback order.

## Range Result

- All 67 pre-existing ledger rows remain unchanged; 183 new IDs are appended
  in ascending order. Ten new-row candidates and three new ledger holds are
  recorded. Two additional findings at existing IDs remain report-only.
  Seven existing candidates and the hold at `59480` were rechecked without
  rewriting their append-only rows.
- The ledger covers 60,997 of 65,135 unique `default` IDs (93.65%), leaving
  4,138 unrecorded. Sequential coverage reaches `59499`; next is
  `59500`-`59749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `59250`-`59499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The 67 existing and 183 new four-language fingerprints match the current
  sources.
- The generated quest-asset index and catalogs, all nine related tests, and
  the CRLF-aware audit diff check passed after the ledger/catalog update.
