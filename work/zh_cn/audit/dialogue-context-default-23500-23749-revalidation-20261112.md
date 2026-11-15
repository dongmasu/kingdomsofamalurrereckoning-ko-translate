# Sequential `default` Revalidation: IDs `23500`-`23749`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese, including existing findings, terminology decisions, register, and
  layout.
- Rechecked 62 existing ledger records and added 188 previously unrecorded
  IDs. Ten new correction-candidate IDs and two evidence-limited holds were
  recorded. Two previous candidates were cleared; two were retained with
  updated evidence.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `23504` | Terminology / name pairing | The standalone skill or action label `Sprint` is rendered `질주` without the requested English pairing. Consider `질주(Sprint)`; confirm the exact in-game label treatment when editing. | Medium-high |
| `23536` | Terminology / name pairing | The creature/name label `Selkie` is rendered `셀키` without its source spelling. Consider `셀키(Selkie)`; the canonical Korean transliteration of related Selkie terms remains separately unresolved. | High |
| `23595` | Objective form | `Leave Ghennig` is rendered as the imperative `게니그(Ghennig)를 떠나라`. Use the established neutral objective form, such as `게니그(Ghennig) 떠나기`, without changing the destination. | High |
| `23618` | Meaning / naturalness | `하이페리언을 일으켜 세웠으니` can suggest physically standing a person up. English `raised`, Japanese `浮上`, and Chinese `升空` describe the Hyperian rising or being lifted. Consider `하이페리언(Hyperian)이 떠올랐으니` or another context-verified equivalent; retain the celebration and Festival of Ethene. | Medium-high |
| `23624` | Terminology / name pairing | The isolated combat label `Poison Damage` is rendered only as `독 피해`, unlike paired damage labels elsewhere. Consider `독 피해(Poison Damage)`. | High |
| `23641` | Format / localized marker payload | The four `{*1...}` wrappers are preserved, but their English payload labels (`gem`, `socketed`, `equipment`, `socket`) remain untranslated in Korean while Japanese and Chinese localize them. Translate the payloads consistently with Korean UI terminology while preserving each wrapper and its order; verify runtime substitution before changing marker grammar or order. | High |
| `23661` | Objective form / name pairing | `Find the Unending Dream` is rendered `끝없는 꿈 찾기`, omitting the English pairing for the named objective. Consider `끝없는 꿈(The Unending Dream) 찾기`. | High |
| `23716` | Terminology / name pairing | `Niskaru Lord` is split as `니스카루(Niskaru) 군주`, leaving the full creature type unpaired. Consider `니스카루 군주(Niskaru Lord)` while retaining `피라그노스(Fyragnos)` and its juvenile vulnerability. | High |
| `23723` | Objective form | `Defeat Dead Kel` is rendered as the bare noun phrase `데드 켈(Dead Kel) 처치`. Use the neutral action form `데드 켈(Dead Kel) 처치하기`. | High |
| `23741` | Format / item-name pairing | `Small Mitharan Prismere Blades` pairs `Mitharan` and `Prismere` separately but leaves `Small` and `Blades` unpaired. Consider pairing the complete item label: `소형 미타란 프리즘미어 칼날(Small Mitharan Prismere Blades)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `23535` | Meaning / name | `Tirin's Rest` may be a named place or a lodging/rest stop. Japanese specifies a way station, while English and Chinese support a more general “rest” reading. Retain `티린의 안식처(Tirin's Rest)` pending location context. |
| `23702` | Terminology / rank | `Private Sterling` is rendered `스털링 일병`. Japanese `兵卒` and Chinese `列兵` do not establish the exact Korean-equivalent military grade. Retain the current rank provisionally rather than changing `일병` to `이병` without the game's rank system context. |

## Rechecked Findings And Structure

- Existing candidate `23508` is cleared. Its earlier concern about the
  Oracle's gendered reference was resolved by the already-applied neutral
  `그 사람`; the current row preserves the sacrifices, rewards, reliability,
  and trust.
- Existing candidate `23635` remains open for speech level and naturalness.
  The Korean moves from the theatrical plain command `다가오라` to
  `당신이군요` / `뭘 원하죠`, while Japanese and Chinese use a conversational
  plain recognition and question. The deliberate shift from invocation to
  recognition is retained, but does not by itself explain the Korean
  honorific shift. Asset-level quest association does not identify the exact
  speaker callback.
- Existing candidate `23648` is cleared because the previously approved
  correction is already present; the line now asks naturally which side's
  war is imminent and preserves the separate plan to seize the city.
- Existing candidate `23662` remains open. `하찮은 존재` is more insulting
  than English `mundane thing`, Japanese `ありふれた`, and Chinese `世俗的`;
  the earlier direction `다른 곳으로 가라, 평범한 자여. 이 일은 필멸자와
  상관없다.` remains supported.
- The range touches 59 exact-English duplicate groups (1,397 corpus rows).
  Korean matches within every group. Japanese variants in short prompts,
  greetings, names, and repeated dialogue are not normalized mechanically
  without per-key context.
- Per-row logical line-break counts and normalized runtime/control-token
  sequences match across all four languages throughout the range. The
  localized-marker payload issue at `23641` is recorded separately from
  wrapper/order integrity.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 34,566 of 65,135 IDs
(53.07%), leaving 30,569. Sequential coverage reaches ID `23749`; the next
range is `23750`-`23999`.
