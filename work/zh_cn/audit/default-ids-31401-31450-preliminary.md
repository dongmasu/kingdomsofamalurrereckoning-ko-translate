# Preliminary Language Scan: `default` IDs 31401-31450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31401-31450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31401 | `비터 프로스트 병사` for `Bitter Frost Soldier` | Confirm whether Bitter Frost is a named faction/unit or a descriptive modifier; standardize its Korean form. | English capitalizes the compound. Korean transliterates both words and translates Soldier; Japanese/Chinese also vary between transliteration and semantic rendering. | Medium |
| 31403 | `오스블레이드 켄트` / `덫 사냥꾼 일` | Confirm Oathblade as Kent's formal role/title and the setting-specific meaning of `trapper's work`; preserve the sarcastic `Serves him right`. | English says the Castellan sent Oathblade Kent to do trapper's work. Japanese and Chinese interpret this as setting traps/hunting; Korean says trapper's work. The precise task and Oathblade status remain historical questions. | Medium |
| 31409 | `Living Quarters` as `거주 구역` | Check whether this capitalized place/facility has a canonical Korean name or is a generic living area. | English capitalizes the location and says it is maintained as a resting place open to all. Korean translates it descriptively. | Low |
| 31410 | `바라니 전쟁 사제` for `Varani war-priest` | Confirm the formal cultural/religious title and the canonical spelling of Varani. | The item description names a traditional Varani ceremonial robe. Korean preserves the group and role in a natural compound; the precise title is not settled here. | Medium |
| 31413 | `하우스 오브 소로우즈` for `House of Sorrows` | Preserve the named faction/place and standardize transliteration across its occurrences. | English capitalizes the House; Korean transliterates the formal name. Other locales translate it semantically, so consistency with the project's chosen House-name convention remains open. | Medium |
| 31420 | `타이달 풀스` / `킵 안뜰` for `Tidal Pools` / `Keep Courtyard` | Verify both as formal location names and align their Korean forms with the existing glossary/corpus. | The quest text capitalizes Tidal Pools and Keep. Korean transliterates the former and the latter as `킵`; earlier historical notes flag Tidal Pools and Zefwyn Lan. | Medium |
| 31426 | `네 명에서 다섯` for source typo `four us ... we're five` | Preserve the intended change from four trapped people to five and record the source grammar error without reproducing it in Korean. | Korean correctly resolves the malformed English as four people becoming five. Japanese and Chinese independently confirm that reading. | High |
| 31428 | `때가 됐어, 그래, 정말 때가 왔어` | Retain the incantatory repetition of `time`; keep the bodily threats as parallel fragments rather than normalizing the poem/dialogue. | English repeats “time” three times and follows with falling, suffocation, and silence. Korean retains the repetition and sequence. | Medium |
| 31430 | `프라이토리언` for `Praetorians` | Confirm the formal faction/role name and standardize the group term. | English capitalizes the group; Korean transliterates it. Japanese/Chinese use generic legion/imperial-guard terms. | Medium |
| 31435 | `{*1[Active]}` tutorial wrapper | Preserve the `{*1...}` marker identity/order and confirm the localized `Active` label and the tap/hold mechanics. | Korean keeps the wrapper and its position. The text describes marking targets, then holding the button to detonate all marked enemies; source line break and control sequence are preserved. | High |
| 31436 | `전투 염주` for `war-beads` | Confirm whether this is a formal Jottun artifact category and the intended hunting use. | The item is described as mass-produced beads that aid warriors in hunting prey. Korean renders the item as war-beads/rosary; Japanese and Chinese use similar bead imagery. | Medium |
| 31439 | `그게 맞는 줄 알았는데` for `I thought that was it` | Keep the antecedent of `that` unresolved; do not identify the expected object or result without context. | English does not specify what the speaker thought was “it.” Korean preserves the deictic reference; Japanese/Chinese also keep it broad. | Medium |
| 31442 | Ten-line Nix and Maid of Windemere poem | Preserve all ten source lines and review the Nix transformation, gender/reference shifts, and the formal title `Maid`. | Korean retains the line count and the human-transformation sequence. English calls Nix `it` in some lines and `him` in another; Korean naturally avoids assigning a grammatical gender but interprets the Maid as `시녀`. | Medium |
| 31444 | `의뢰인` / `게시판에 올려` for `payer ... put it on the board` | Confirm whether `payer` is a source typo for patron/client and whether “board” is a public quest/contract board. | The source says a payer with enough spare coin and persistence gets “it” posted. Korean interprets this as a client commissioning a notice; historical notes explicitly flag the payer/board meaning. | Medium |
| 31448 | `아버지가 왕국을 탕진해 잃어버린 왕자` | Retain the source's malformed, compressed description and avoid treating the Korean smoothing as a confirmed chronology. | English reads “He was raised, hunted and a beggar,” which is ungrammatical. Korean interprets that he grew up pursued and begging; Japanese/Chinese similarly infer a deprived upbringing. | Medium |
| 31450 | `수천 마리` and walking without touching ground | Preserve the speaker's hyperbolic description of rats covering Adessa's streets; do not convert it into a literal count-based claim. | English says thousands of rats and exaggerates that one could walk end-to-end without touching the ground. Korean retains both the scale and comic image. | High |

Rows 31402, 31404-31408, 31411-31412, 31414-31419, 31421-31425,
31427, 31429, 31431-31434, 31437-31438, 31440-31441, 31443,
31445-31447, and 31449 generally retain the English meaning on this first
reading. Their names, register, fragments, and lore terms remain for the
integrated pass; no separate high-confidence wording candidate was
identified.

## Historical Audit Reconciliation

- The historical source-keyed entries for IDs 31400-31499 were checked
  against this batch. They specifically flag Bitter Frost, Castellan/
  Oathblade/trapper's work, House of Sorrows, Tidal Pools/Zefwyn Lan,
  Magnus/Champion, Niskaru, Praetorians, Splitrock Depths, Jottun
  war-beads, `Bloody`, Nix/Maid of Windemere, payer/board, and the malformed
  prince description.
- The source typo at 31426 is rendered by meaning (four people becoming
  five), consistent with the historical note.
- The poem at 31442 retains ten source lines; no additional character,
  event, or relationship is selected beyond what the English states.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31401-31450 once and in identical order.
- Embedded line-break counts match, including all ten lines of the poem at
  31442.
- Runtime-marker identities/order match, including the `{*1...}` wrapper
  at 31435. Its inner label is localized as expected.
- Numeric meaning is retained for the 25 Niskaru objective (31427), four-to-
  five-person change (31426), and 45% health-siphon chance (31441).
- No CSV text or other source file was edited.

## Batch Status

IDs 31401-31450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31451.
