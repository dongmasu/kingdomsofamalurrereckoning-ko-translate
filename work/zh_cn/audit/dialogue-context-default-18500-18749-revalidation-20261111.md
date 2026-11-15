# Sequential `default` Revalidation: IDs `18500`-`18749`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared by ID with English, Japanese,
  Chinese, terminology evidence, and formatting.
- Sixty-two existing ledger records were rechecked; 188 previously
  unrecorded IDs were reviewed and added.
- Six existing correction candidates were retained, one existing candidate
  was cleared, one new correction candidate was added, and 27 new
  evidence-limited holds were recorded. One existing hold was retained.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `18505` | Meaning | English `Are you sure he's an antelope?` and Japanese `彼がレイヨウなのは確かか？` question whether Oreyn is an antelope. Korean `저게 정말 영양이라고?` changes the subject to “that.” Consider `오레인(Oreyn)이 영양으로 변한 게 확실해?` | High |
| `18522` | Objective form | The objective `Find all the pieces of the druid's armor` uses imperative `찾아라`, unlike the concise action-noun form used by reviewed objectives. Consider `드루이드 갑옷 조각 모두 찾기`. | High |
| `18529` | Meaning / naturalness | English `the faithful` and Japanese `信仰ある者たち` mean people of faith; `충실한 이들` can instead mean loyal or reliable people. Consider `믿음이 있는 이들이 신들을 찬양하며 노래할 때입니다! 함께합시다!` | High |
| `18560` | Terminology | This Teeth of Naros quest's tainted urns are called `항아리`, while related instances use `유골함`. Japanese uses `骨壷` and Chinese uses ash-urn terms. Consider `유골함` consistently for these quest urns. | High |
| `18590` | Terminology | `Niskaru fangs` is `이빨` here but `송곳니` in the same collection topic at `18807` and `21684`. Use `송곳니` for the collectible item. | High |
| `18655` | Naturalness | `Good day, soldier` is a greeting; Japanese `ごきげんよう` confirms the salutation. Korean `좋은 날이군, 병사` reads as a comment about the day. Consider `좋은 하루 보내게, 병사` or another natural greeting. | Medium-high |
| `18704` | Naturalness | `우리 성품의 기둥` is a literal calque of `our pillars of character`, and the sentence repeats `기리다`. Recast it as the virtues that shape the Fae's character while keeping commemoration of their people distinct. | Medium-high |

## Evidence-Limited Holds

These are not confirmed translation errors; the available row-level references
do not settle the relevant reading.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `18503` | Meaning / terminology | The isolated `Diplomacy` label does not establish whether it is a skill, general topic, or menu category. |
| `18504` | Meaning / reference | The fragment does not identify the antecedents of `them` or `these flaws`. |
| `18512` | Terminology | `Knave of Coins` may be a title, role, or insult; the locale readings do not establish a canonical Korean form. |
| `18518` | Format / context | The untranslated credit title is shared by English and Japanese, but the row does not establish whether it is user-facing. |
| `18532` | Meaning / kinship | English says only `aunt`; Korean `이모` specifies the maternal side, which the fragment does not establish. |
| `18539` | Meaning / terminology | `Village Scion` may be a title or social role; the row does not settle its category. |
| `18546` | Terminology | The isolated `Wand Mastery` label does not settle the project's canonical term for the weapon category. |
| `18548` | Meaning / reference | `Garver House` may refer to a family or residence; the compact label and locale readings conflict. |
| `18572` | Meaning / source conflict | `Historical Plack` is rendered as a coin in Korean and Chinese, but Japanese reads it as a plate. The isolated label does not resolve the source/reference conflict. |
| `18589` | Terminology | The Sceptre cost, localized control labels, and effects are retained, but the canonical Korean names for `Charged Entropy` and `Maelstrom` remain unsettled. |
| `18591` | Terminology | The possession event is clear, but the canonical institutional rank for `Savant of the Scholia Arcana` is not established by this row. |
| `18596` | Proper name | The star and inferred blessing are retained, but the canonical Korean spelling of `Aryllia` is not established across the corpus. |
| `18601` | Meaning / source conflict | English and Chinese say the man was dismissed; Japanese asks whether he was not a student. The row does not establish school versus employment context. |
| `18611` | Terminology / source conflict | The paper's argument and paragraph sequence are retained, but several magical and institutional terms vary across the locale references. |
| `18621` | Terminology | The inference about the Tapestry of Fate, Weave, Patron gods, and Amalur is retained; canonical Korean metaphysical terminology remains unsettled. |
| `18640` | Meaning / terminology | The description explains `Ranged Roll` as choosing a number range for the dice total, but does not establish whether this is a formal mechanic name. |
| `18644` | Terminology | `Sagecrafting` is rendered generically as `마법물품 제작`; the row alone does not establish the canonical discipline name. |
| `18646` | Meaning / reference | The isolated `Testament Corpse` label has conflicting interpretations across locales. |
| `18650` | Meaning / source conflict | The Korean follows English's `905 yards`, while Japanese converts it to 827 meters; the wine types and exchange clause also vary among locales. |
| `18668` | Terminology | `Traveler` may identify a faction or a generic traveler; the isolated boast does not establish the category. |
| `18678` | Meaning / reference | The final `until you do` is elliptical, and the locale references differ on whether the speaker means obtaining the map, the key, or money. |
| `18694` | Meaning / lore reference | The hymn's line structure is preserved, but the references to Apotharni and capitalized `Teeth` are not resolved by the row. |
| `18705` | Terminology | The Korean recovery objective is clear, but `Dvergan` varies against `드베르가` elsewhere in the corpus. |
| `18718` | Meaning / source conflict | `give some another time` is incomplete in English; Japanese indicates a donation while Chinese suggests giving oneself more time. |
| `18726` | Meaning / reference | `Cynrics` is pluralized but the source does not establish whether it names a family, faction, or people. |
| `18735` | Proper name / place type | `Tirin's Rest` is rendered consistently as a name, but the row does not establish whether `Rest` names a settlement or another feature. |
| `18736` | Terminology | The skill is described accurately, but a canonical Korean term for capitalized `Dispelling` is not established by this row alone. |
| `18745` | Meaning / reference | `Binder's Lesions` does not establish whether Binder is a person, disease, or named affliction. |

## Rechecked Existing Findings

- Existing candidates at `18505`, `18522`, `18529`, `18560`, `18590`, and
  `18704` remain candidates against the current text.
- The candidate at `18639` is closed as `not-issue`: the same English sentence
  at `2732`, `18639`, and `21147` now has matching Korean text, and the current
  wording preserves the source meaning. The earlier shared-source proposal
  was already applied during duplicate normalization.
- Existing hold `18532` remains unresolved.
- Earlier accepted corrections are present and rechecked: `18516` (`수다쟁이
  해파리`), `18541` (explicit `아르진` subject), `18544` (conditional
  `그들도 널 찾고 있을`), `18626` (the nest and thralls were removed),
  `18671` (`또 만났네`), `18680` (`믿기 어렵겠지만`), `18681`-`18682`
  (single quote pairs), and `18747` (`바라니인` as an individual).

## Duplicate and Structural Checks

- All 250 IDs are present once and in identical order in English, Japanese,
  Chinese, and active Korean.
- Sixty-three exact-English duplicate groups touch this range (914 corpus
  rows); every group has identical Korean text.
- Logical line-break counts total 38 in English, 36 in Japanese, 38 in
  Chinese, and 38 in Korean. The only per-row difference is `18585`: English,
  Chinese, and Korean have two embedded breaks; Japanese has none and omits
  the final period. Korean follows English/Chinese.
- The localized `<cough>` label at `18547` keeps its angle-bracket wrapper.
  At `18614`, English, Chinese, and Korean preserve `{3}`, `{3}`, `{1}`,
  `{6}` in that order; Japanese alone reorders `{1}` and the second `{3}`.
  The localized wrappers and order at `18730` are preserved.
- No per-key speaker or playback order is inferred from asset links.

The ledger now contains 30,887 of 65,135 IDs (47.42%), leaving 34,248
unreviewed. The next sequential range is `18750`-`18999`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
