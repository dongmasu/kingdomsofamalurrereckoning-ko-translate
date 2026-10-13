# Disposition Batch: `default` IDs 57151-57200

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English
  meaning, Japanese voice/register, Chinese supporting evidence, historical
  audit prompts, terminology, structure, runtime markers, and values. These
  are working dispositions, not independent final linguistic approval.
- Four accepted corrections, 37 `not an issue` IDs, and nine uncertain
  findings.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57157 | `조툰은 야만적인 종족이지만, 그 잔혹함은 키워 낼 수도 있고 쉽게 억누를 수도 있어.` | `조툰은 야만적인 종족이지만, 그 잔혹함은 쉽게 부추길 수도 있고 쉽게 억누를 수도 있어.` | English compares how easily Jottun cruelty can be fostered and controlled. The revision makes the ease apply to both actions and keeps the casual register. |
| 57165 | `들었어? 안원(Anwon) 집안 아들이 독살당했대!` | `들었어? 안원(Anwon) 집안 아들이 독을 먹었대!` | English, Japanese, and Chinese say the boy was poisoned but do not state that he died. `독살당하다` can assert death by poisoning. |
| 57181 | `서둘러. 마을 사람들이 내 형량을 줄이겠다며 날 죽이기로 하기 전에.` | `서둘러. 마을 사람들이 내 형기를 줄여 주겠다며 날 처형하기 전에.` | Preserve the dark execution/shortened-sentence joke while replacing the awkward construction that made killing sound like a stated method. Japanese explicitly resolves the threat as execution; English and Chinese preserve the sentence-length wordplay. |
| 57199 | `살가죽을 벗기고, 살을 발라내고, 뼈에서 찢어 놓겠다.` | `네 살가죽을 벗기고 뼈에서 살을 발라내 주마.` | English's deliberately graphic threat separates skin, flesh, and bone. The correction keeps that image in natural Korean rather than the unclear final phrase. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 57153 | Uncertain | `Flawless Mitharan Fortified String` is a crafting-component name, but the exact item category and established Korean term for `Fortified String` are unresolved. |
| 57159 | Uncertain | `the Sorrows` may refer to a people/faction, the House, or a sorrow-related power; the locales do not establish one reading. |
| 57162 | Uncertain | The sentence meaning is preserved, but the active corpus contains competing Korean spellings for `Prismere`; do not normalize one occurrence in isolation. |
| 57164 | Uncertain | The breakup/continued-presence contrast is intact, but the canonical Korean names and status of the Preordained and Vagabonds remain unsettled. |
| 57168 | Uncertain | English `business` may mean a transaction or a broader shared task; the isolated line does not resolve the referent. |
| 57171 | Uncertain | The attempt to raise the Hyperian, its rejection of Arkes, the deaths, and its sealing are preserved. The entity and the intended referent of `itself` require surrounding lore context. |
| 57184 | Uncertain | The assistant's aspiration and scholars' collaboration are preserved, but the canonical Korean name/form of Basilica Gnostra remains unsettled across the corpus. |
| 57193 | Uncertain | The formal welcome and question are preserved. `Beckoned` is rendered with the established player-title form, but the proper-name spelling `리케이오스` competes with `라이케이오스` in the active corpus. |
| 57195 | Uncertain | English says five crews of recruits deserted, while Japanese says five individual recruits and Chinese describes five deserters. Korean follows English; the source discrepancy remains unresolved. All five bottles of field medicine are retained. |

## Not an Issue

The 37 IDs are 57151-57152, 57154-57156, 57158, 57160-57161, 57163,
57166-57167, 57169-57170, 57172-57180, 57182-57183, 57185-57192,
57194, 57196-57198, and 57200. They preserve the evident English meaning,
Japanese-supported voice/register, quantities, or source ambiguity. This
includes the Jottun watch, the twin-blade skill, the goodwill line, and the
all-miners' sightings.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 57151-57200
  once and in identical ascending order. Their full `default` key order
  matches across all 65,135 records.
- Runtime-marker identities/order and line-break counts match throughout
  this range. `{1}` at 57158 is preserved in all four locales. No numeric
  value discrepancy was identified.
- Punctuation differs in long-dash use at 57171, 57175, and 57184; Korean
  retains the event and phrase relationships. The five-crews/five-recruits
  discrepancy at 57195 is retained as uncertain rather than silently
  resolved.
- Rechecked the source-keyed historical entry for IDs `57150-57249`.
  Relevant prompts at 57153, 57157, 57159-57165, 57171, 57175-57178,
  57181, 57184, 57186, 57190, 57193-57195, and 57199 are resolved here as
  accepted, `not an issue`, or open uncertainty. Remaining prompts in the
  historical range continue with the next batches. ID 57150 was already
  counted in the preceding batch and is not counted again.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57151/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `ad156bc1d92e5249d20c628cfda8bd8b175d4a1cee1e3acc07ce327bd62f6506`).
  Post-edit active default SHA-256:
  `798449b6c6a4705a353159b12699215f307ef6e66d7182740165fc0323f7ceee`.
  Only the four accepted `Texto` cells changed. The UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

D-17217 through D-17229 record the nine uncertain findings and four accepted
corrections; D-17230 records the remaining 37 `not an issue` IDs. Direct
register totals: 1,681 accepted, 12,075 `not an issue`, and 10,677 uncertain
(24,433 total); next D-17231.

Resume at `default` ID 57201; 7,934 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57201-57250-preliminary.md`](default-ids-57201-57250-preliminary.md).
These are working dispositions, not independent final linguistic approval.
