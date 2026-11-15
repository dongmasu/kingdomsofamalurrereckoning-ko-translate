# Sequential `default` Revalidation: IDs `34000`-`34249`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 76 existing ledger entries and added all 174 unrecorded IDs in
  this range. Five cross-range IDs were also added after verifying repeated
  people, family, and item references. Findings are review proposals, not
  approved translation edits.
- Twenty-one new correction-candidate IDs and five evidence-limited holds
  were identified. Six existing `not-issue` rows were promoted to candidates;
  eight existing candidates and three holds were rechecked and retained.
  `34047` has a supported `Scaith` name-pairing candidate, but its separate
  `the First` reference remains uncertain, so its overall status is held.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `34000`, `34952` | Item name / format | `Master Mitharan Immunity Trim` and `Flawless Mitharan Immunity Trim` are complete item labels; Korean pairs only `Mitharan`. Pair each complete label while retaining the existing Korean wording and distinct prefixes. | High |
| `34015` | Title / format | `Champion` is a direct form of address, rendered `용사여` without its source term. Consider `용사(Champion)여` or an equivalent that preserves the address. | Medium |
| `34023` | Label / format | The standalone label `Mallion's Mother` is rendered `말리온(Mallion)의 어머니`, pairing only the personal name. If this is the complete NPC label, pair the complete source label without inferring her personal name. | Medium |
| `34027` | Title / format | The standalone title `Voices of the Dead` is rendered `죽은 자의 목소리` without its English title. Add the complete source title. | High |
| `3475`, `34037`, `45625` | Name / title format | The standalone `Sergeant Bromm` label and the objective `Talk to Sergeant Bromm` render `브롬(Bromm) 병장`, pairing only the name. Consider pairing the complete label as `브롬 병장(Sergeant Bromm)`. The self-introduction at `18107` already preserves the rank and paired name in its sentence. | High |
| `34041` | Title / format | The title-cased `Out of Your League` is rendered `분수에 안 맞아` without the source title. Add `(Out of Your League)` if this is the displayed label, while retaining the Korean wording. | Medium-high |
| `34047` | Name / format | `Scaith army` is rendered `스카이스 군대` without the established source pairing. Consider `스케이스(Scaith) 군대`. The identity and intended title of `the First` are held separately below. | High |
| `4468`, `34058` | Name / title format | Both standalone `Master Farraglen` labels use `파라글렌(Farraglen) 사부`, pairing only the name. Pair the complete label, for example `파라글렌 사부(Master Farraglen)`. Other reviewed references that already pair the complete title remain unchanged. | High |
| `34062` | Name / format | The standalone name `Old Hick` is rendered `올드 힉` without English. Consider `올드 힉(Old Hick)`. | High |
| `34073` | Class / terminology | The capitalized class name `Traveler` is rendered `트래블러` without English. Add `(Traveler)` while retaining the established Korean class term. | Medium-high |
| `34081` | Meaning | English says the companion “will serve you well”; Japanese says he will be useful and Chinese says he will help. Korean `잘 보살펴 주겠지만` instead says he will take good care of the player. Consider `분명 도움이 될 거야` or an equivalent. | High |
| `34093` | Title / format | `Archsage` is a direct title; Korean `대현자` omits the source pairing used elsewhere. Consider `대현자(Archsage)`. | High |
| `34124` | Name / format | `Oda` is named in the objective `Look for Oda's treasure`, but Korean `오다의 보물 찾기` does not pair the name. Add `(Oda)`. | High |
| `34129` | Name / format | The sentence names the weapon `Makhaira`; Korean `마케이라` is unpaired. Add `(Makhaira)` without changing the established weapon-class term `단검`. | High |
| `11722`, `34131` | Name / title format | `Magnon's Brutality` is a title and the later passage names the Almain warlord `Magnon`; neither Korean occurrence pairs the source name/title. Add the source pairing at each occurrence. The current Korean has `매그논` at `11722` and `마그논` at `34131`; preserve that unresolved spelling difference for a separate glossary decision rather than silently normalizing it here. | High |
| `34144` | Name / format | The objective `Follow Anella` is rendered `아넬라 따라가기` without the name's English spelling. Add `(Anella)`. | High |
| `26551`, `26805`, `33141`, `33266`, `34152`, `45816` | Family name / format | All six references name the Aster family without consistently pairing the complete English family term. Add the source pairing at each actual family reference. Existing candidate findings at `26551`, `33141`, and `33266` remain; `26805` is promoted from `not-issue`. Korean uses both `애스터` and `아스터`, and prior records propose different forms, so this pass does not choose a canonical Korean spelling. | High for pairing; spelling unresolved |
| `34155` | Title / format | The title-cased `Ungentle Beasts` is rendered `사나운 야수들` without its English title. Add the complete source title. | Medium-high |
| `34156` | Title / format | The title-cased `Bodies Poisoned` is rendered `독에 오염된 시신들` without its English title. Add the complete source title. | Medium-high |
| `34175` | Objective / format | `Go to Winner's Ceremony` is rendered `우승자 시상식으로 가기` without the complete named objective. Add `(Winner's Ceremony)` to the event name. | High |
| `34192` | Title / format | The title-cased `Her Righteous Fury` is rendered `그녀의 정의로운 분노` without its English title. Add the complete source title. | High |
| `8627`, `18233`, `34198`, `47136`, `53754`, `55233`, `56431` | Name / epithet format | Each source reference explicitly calls the character `Aloff the Hunter`; Korean uses `사냥꾼 알로프(Aloff)`, pairing only the personal name. Pair the complete epithet and name consistently. The two unrecorded references, `53754` and `55233`, were added to the ledger. | High |
| `34204` | Naturalness | Korean `실언도 이따금은 잘된 일로 끝나곤 하지. 가끔은 말이야.` repeats the idea of “once in a while” in consecutive clauses. Remove the redundancy while preserving the speaker's point that the slip benefited everyone. | High |
| `34211` | Title / format | `Liturgy of the Word` is rendered `말씀의 전례` without its source title. Add `(Liturgy of the Word)`. | High |
| `34220` | Faction / format | The dialogue names the `House` in a context about aiding it; Korean `비탄의 집` omits the established faction pairing `House of Sorrows`. Add the full faction name only if the surrounding quest context confirms this reference, rather than treating every `House` as the faction. | Medium-high |
| `10895`, `34223` | Name / format | `Ventrinio Descilini` is fully paired at `10895`, but `34223` pairs only `Ventrinio` and leaves `Descilini` outside the parenthetical. Reuse the complete personal-name form. | High |
| `34245` | Objective / format | The objective `Obtain Freeman Armbands` pairs only `Freeman`; Korean `프리맨(Freeman) 완장 획득` omits the complete item/objective label. Add `(Freeman Armbands)` without inferring a unique item type. | Medium-high |

Existing candidate `34181` remains a candidate for the Oracle-title terminology
already documented in its linked asset report. Existing candidates at
`34029`, `34097`, `34113`, `34134`, `34167`, `34240`, and `34244` were
rechecked and retained. The independent existing holds at `34092`, `34102`,
and `34114` also remain.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `34047` | Meaning / name | `the First` is capitalized, but English and Japanese do not establish whether it is a formal title or an ordinary ordinal reference; Chinese says `ancestor`. Pairing it as a specific person or Scaith title would go beyond the evidence. The separate `Scaith` family name remains a correction candidate. |
| `34072` | Name / context | English and Korean say `Red`, Japanese specifies the Red Legion, and Chinese transliterates a name. The row alone does not establish whether `Red` is a person, faction, or shortened faction name. |
| `34104` | Structure / context | This key is the fragment `of Refuge`, adjacent in ID order to `Tunnels` at `34103`. Without a verified runtime composition, do not combine the two keys into a title or rewrite either fragment. |
| `34164` | Meaning / place name | English capitalizes `Holdfast`, while Japanese describes unlocking a central seal and Chinese says to unlock a fortress. The row does not resolve whether `Holdfast` is a proper place or a generic structure. |
| `34200` | Structure / context | The English fragment begins `with Level 4 Familiar Upgrade`, and Korean is parenthesized. Without a verified neighboring-string/runtime composition, retain the fragment and do not infer a complete display label. |

## Repeated Sources And Structure

- Fifty-eight exact-English duplicate groups (951 corpus rows) touch this
  range. Korean text matches within every group; no text was mechanically
  unified.
- `Master Mitharan Immunity Trim` and `Flawless Mitharan Immunity Trim` were
  cross-checked as related labels, not treated as identical item variants.
  Repeated character/family references for Farraglen, Bromm, Aster,
  Aloff, Magnon, and Ventrinio were checked against the linked prior records;
  unrelated existing findings and holds remain intact.
- Embedded line-break counts match across all four languages: 31 each across
  the range, in six entries.
- Normalized runtime-token and markup inventories match across all four
  languages. No Korean token or numeric-value loss was found.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this pass and the five cross-range additions, the ledger contains
42,338 of 65,135 unique IDs (65.00%), leaving 22,797. Within this range,
34 IDs have overall candidate status, eight remain uncertain, and 208 are
not flagged; `34047` is held overall despite its separate `Scaith` pairing
candidate. Sequential coverage reaches ID `34249`; next:
`34250`-`34499`.
