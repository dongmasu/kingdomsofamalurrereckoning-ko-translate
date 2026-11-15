# Sequential `default` Revalidation: IDs `37000`-`37249`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; all
  four resources have the same ordered ID set.
- Rechecked 65 existing ledger entries and added the other 185 in-range IDs.
- Findings are review proposals, not approval to edit translation CSVs.
  No translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `37008`, `1349` | Name / format | The display name and dialogue both refer to `Casmaran the Eternal`. Korean translates the epithet as `영원한` but the parenthetical at both IDs contains only `Casmaran`. Pair the complete source name, e.g. `영원한 카스마란(Casmaran the Eternal)`. ID `1349` is an existing candidate and remains open. | High |
| `37047`, `31375` | Meaning / naturalness / format | The same six-line poem occurs at both IDs and has identical Korean. English `readied, light` is ambiguous; Chinese reads the instruments as lightweight, while Japanese omits `light`. Korean `가볍게 준비되었네` makes it an adverb and reads awkwardly. Rework that line against the ambiguity, preserve the six-line layout, and pair `Gauntlets of the Faehunter`. ID `31375` is already an open candidate. | Medium |
| `37057` | Terminology / format | In the same Bera quest, `animal meat` is `동물 고기` in the objective and UI (`51780`, `53459`), but `짐승 고기` here and at `11728`. The inn is paired as `목마른 자작나무 여관(Thirsty Birch)` at `11728`, but not here. Align the term and add the inn-name pairing without changing the journal voice. | High |
| `37083` | Name / format | `Belcher's Sundries` is a named shop, but the Korean label is only `벨처 잡화점`. Add the English name, e.g. `벨처 잡화점(Belcher's Sundries)`. | Medium-high |
| `37115`, `40387` | Name / format | These IDs contain the exact same English sentence and Korean translation. `Children of Dust` is a named people/group and is paired elsewhere, but omitted in both lines. Add `(Children of Dust)` consistently to both IDs; keep the established Korean wording `먼지의 자손`. | High |
| `37117` | Objective style | This is one of three parallel `Terminate the [family] family` objectives. `37117`, `18874`, and `59562` currently use `제거하라`, `처치`, and `처단`. Align them to the established objective form, e.g. `신릭 가문(Cynric family) 처단하기`, with equivalent family-specific text at the other two IDs. | High |
| `37122` | Name / format | The capitalized `Tapestry of Fate` is rendered `운명의 태피스트리` without its English name. Other entries pair the same named concept, including `18621` and `55256`. Consider `운명의 태피스트리(Tapestry of Fate)` here; this is an ID-scoped pairing finding, not a blanket rewrite of every occurrence. | Medium |
| `37149` | Naturalness | English and Japanese invite the addressee to join and build a new destiny together. Korean shifts from `함께하자` to the detached prediction `만들 것이다`. Consider a coherent spoken invitation such as `이리 와. 나와 함께 새로운 운명을 만들어 가자...`; no speaker identity is inferred. | Medium-high |
| `37189` | Naturalness / format | The quest objective `Find and kill the Stowaway` is `밀항자를 찾아 처치하라`, unlike the project's `-하기` objective form, and lacks the English pairing used for this named target elsewhere. Retain the existing candidate and consider `밀항자(Stowaway)를 찾아 처치하기`. | Medium |
| `37217` | Artifact name / format | The English source elides `stone` after `Sun` and `Frost`; Korean has `태양석(Sun), 서리석(Frost), 폭풍석(Storm stone)`. Retain the existing source-local decision for lowercase `Storm stone`, and consider pairing the complete source forms as documented in the SA08 review: `Sun Stone`, `Frost Stone`, and `Storm stone`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `37085` | Meaning / title | English `These Halls are Wise` and Chinese support the literal “wise halls,” but Japanese reads the title as `知恵の伝道` (“teaching/spreading wisdom”). The isolated key does not resolve whether this is a literal title, a proper name, or a different reading. Keep the current wording provisional. |
| `37154` | Meaning / reference | English says only `my brother`; Japanese specifies a younger brother, Chinese an older brother, and Korean also specifies a younger brother. The sources conflict on age, and speaker identity is unknown. Do not infer the sibling's age. |
| `37155` | Meaning / title | English `Brigands Quarter`, Chinese “bandit camp,” and Korean `도적 지구` suggest a brigand location, while Japanese `アイテン監獄` means Aiten Prison. The available sources do not establish whether these are the same place or a source mismatch. |
| `37215` | Speech level | Korean uses `-오` forms, Japanese is plain, and Chinese is polite. Asset association does not identify the speaker or relationship, so the register cannot safely be normalized. |

## Earlier Findings Rechecked

- `37011` was cleared: its current Korean already uses the established
  `화염 물약` wording proposed by the earlier FFQ03 review.
- `37057` remains a candidate; the current review also records the missing
  inn-name pairing as a separate format dimension.
- Existing candidates at `37117`, `37189`, and `37217` remain supported.
- Existing holds at `37154` and `37215` remain unresolved. The new holds at
  `37085` and `37155` are likewise retained as evidence-limited.
- IDs `1349`, `31375`, and `65008` were checked as related records. The
  `Treasures of Culn` wording at `37145` matches `65008`; no change is
  proposed for that pair.
- No speaker, addressee, branch, or playback order was inferred from asset
  membership, handler names, or ID order.

## Repeated Sources And Structure

- Forty exact-English duplicate groups (564 corpus rows) touch this range.
  The 40 in-range rows match in Korean within every group; no duplicate
  group's Korean wording was forced to change.
- Five rows contain embedded line breaks: `37021` (6), `37047` (5), `37097`
  (2), `37102` (4), and `37242` (5). Counts match across all four locales,
  totaling 22 breaks per locale.
- Normalized runtime-token and markup signatures match across all four
  languages for every ID in the range.
- Ten in-range IDs have correction candidates and four have evidence-limited
  holds; the other 236 have no new finding. Cross-range ID `40387` was added
  to keep the exact-English `Children of Dust` finding together.
- The ledger now covers 44,592 of 65,135 unique `default` IDs (68.46%),
  leaving 20,543. Sequential coverage reaches `37249`; next is
  `37250`-`37499`.
- Catalogs cover all 530 quest assets and all 65,135 IDs. Asset links remain
  grouping clues, not proof of speaker or playback order. Fingerprints,
  the reproducible catalog checks, all nine related index tests, and the
  audit-scoped diff check passed. Translation CSVs remain unchanged.
