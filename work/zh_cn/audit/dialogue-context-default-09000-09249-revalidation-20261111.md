# Sequential `default` Revalidation: IDs `9000`-`9249`

- Date: 2026-11-11.
- Scope: current Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Eighty existing ledger records had current fingerprints and were retained.
  All 170 previously unrecorded IDs were compared and recorded.
- Eleven new IDs have correction candidates. Ten have evidence-limited
  findings, including `9072`, which also has a naturalness candidate.
- No translation CSV, source resource, or extracted game asset was changed.
- `9131` explicitly identifies the speaker's office as Elund, not a personal
  name. No personal identity, other line's speaker, or playback order was
  inferred from the asset's NPC list.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9035` | Naturalness / UI terminology | This passive ability uses `{*1[패시브]}`, while entries such as `8864` use `{*1[지속 효과]}` for the same source wrapper. Consider the established visible label `지속 효과`, retaining wrapper ID and line break. `둔기 충격 전투에 숙달되면` is also stiff for knowledge of blunt trauma; a direction such as `타격 기술에 숙달되어 기절한 적에게 주는 피해가 증가합니다` avoids implying an additional blunt-weapon-only condition absent from the effect description. | Medium |
| `9056` | Naturalness | `쇳조각 몇 푼에 옛 친구가 배를 가를 정도니까` awkwardly combines a metal object with a money unit. English says an old friend would gut the listener for a piece of tin; Japanese uses petty money. Consider `푼돈 때문에 옛 친구조차 네 배를 가를 정도니까`, retaining the threat and lack of safety rather than introducing a new literal item. | High |
| `9072` | Naturalness | `마침내 무덤에서 파헤쳐져 나왔구나` is awkward passive phrasing in direct speech. English explicitly says `exhumed`; do not erase it merely because Japanese says awakening. Consider `이제야 무덤 밖으로 나오게 됐구나`, retaining the exhumation image. Resolve the separate register hold before finalizing the sentence ending. | Medium |
| `9091` | Name consistency / pairing | The journal's `에피 크룩생크` lacks English pairing and differs from standalone `64164`, `에피 크루익섕크(Effie Cruikshank)`. Review the spelling together and pair the chosen form; the existing label is evidence of inconsistency, not proof that its transliteration is the final standard. Preserve the scientist, former Allestar research-team role, continued research, and necessity of stopping her. | High |
| `9124` | Name / title pairing | `Lord Godric Payne` appears as `고드릭 페인(Godric Payne) 경`, pairing only the name. Consider `고드릭 페인 경(Lord Godric Payne)` under the combined name-and-title convention. Preserve the sharp accusation and Warsworn threat; do not soften the warning. | High |
| `9132` | Name / event pairing | `Battle of Galafor Plain` is unpaired `갈라포 평원 전투`, although Klurikon is paired. Consider `갈라포 평원 전투(Battle of Galafor Plain)`. The son's `slipping away` remains deliberately unspecified; do not invent a death, illness, or departure. | High |
| `9175` | UI naturalness | `Eyebrow Intensity`, Japanese eyebrow darkness/density, is `눈썹 농도`. Consider the more natural appearance-slider label `눈썹 진하기`, without changing the control's function. | High |
| `9193` | Dialogue naturalness | The retrospective explanation ends `이곳으로 왔다` / `명상에 몸을 바쳤다`, sounding like a written history. Japanese is deliberately solemn, so preserve that gravity while considering conversational endings, e.g. `그래서 알라레인(Alarane)과 나는 떠나 이곳으로 왔지. 통곡하는 왕(Weeping King)이 바라셨을 대로, 죽음을 명상하는 데 몸을 바쳤어.` This is a proposal about delivery, not proof of either listed NPC's voice. | Medium |
| `9211` | Naturalness / title pairing | `병사, 델프릭(Delfric) 성주와 대화하게` combines a stiff vocative with 하게체 and partial title pairing. Consider a natural military instruction such as `델프릭 성주(Castellan Delfric)와 이야기해 봐.` Preserve the source's soldier address if required by verified context; do not invent a personal relationship or equate this title with Ancient without evidence. | Medium |
| `9227` | Name consistency | `Leanashe Tentacle` uses `리어나시`, while the confirmed `monster:leanashe` glossary entry and standalone `23115`/`43013` use `리아네시(Leanashe)`. Consider `리아네시 촉수(Leanashe Tentacle)`. The existing glossary explicitly lists this ID and rejects the `리어나시` variant. `9232` already has `리아네시` and does not need a species-spelling correction. | High |
| `9249` | Naturalness | `내 도움 요청에 누가 답해 줄 줄은 몰랐어` is grammatically possible but clumsy and repetitive in spoken Korean. Japanese expresses surprise that anyone responded. Consider `솔직히 내가 도와 달라고 했을 때 누가 응해 줄 거라곤 생각 못 했어. 무시당하는 데 익숙하거든.` Keep the resignation, not just a generic thanks. | High |

## Evidence-Limited Findings

| ID | Dimension | Reason |
| ---: | --- | --- |
| `9009` | Meaning / rarity | English's `infrequent equipment` corresponds to Japanese's uncommon rarity, while Korean uses `고급`. The exact salvage/UI tier must be reconciled before replacing the rarity name. |
| `9071` | Register | Japanese is polite, with a reflective/ceremonial explanation; Korean mixes `밝히리라` with conversational `것이니까`. The asset lists two NPCs without per-key speaker or stage evidence. Keep the ceremonial intent and hold the final voice decision. |
| `9072` | Register / source nuance | Japanese is polite (`覚めました`, `けれど`), Korean is casual, and English/Chinese differ on the exhumation/awakening image. The naturalness proposal must not silently become a register or event reinterpretation. |
| `9093` | Register | Japanese's merchant greeting is casual (`こんにちは`, `用かな`), Korean is polite. The greeting alone does not establish which speaker or relationship requires either level. |
| `9151` | Meaning / type | `Orison` is transliterated by Japanese and Korean but translated as prayer by Chinese. The isolated label does not determine whether it is a name, item, or generic prayer. Carry forward the old hold. |
| `9179` | Meaning | Current Korean specifies a death notice, whereas English/Japanese say only notice. A wartime asset association is suggestive but not sufficient to prove that addition; retain pending actual notice/scene evidence. |
| `9215` | Idiom / formula | `Goodbye, fly high` is rendered literally as `잘 가, 훨훨 날아`; Japanese uses a normal farewell. It may be a Travelers formula, but asset membership alone cannot establish the motto or a safe idiomatic replacement. |
| `9228` | Literary meaning | The poem's paired witness/feed questions, gruesome imagery, and `Summer's West` need a stanza-level interpretation. Current Korean makes witnessing the loss a subordinate phrase. This pass compared all twelve lines but does not establish a uniquely correct rhetorical reconstruction; retain the existing literary hold and all twelve lines. |
| `9231` | Register / text type | The guard explains a restriction with `있다` / `받았다`; Japanese is plain, but an official guard can intentionally use a firm delivery. No line-level identity or adjacent turns are established. Do not mechanically convert every `-다` ending into casual speech. |
| `9232` | Text purpose | `Trigger Leanashe` may be an internal trigger label rather than a displayed instruction. Its species spelling already follows the glossary. Do not change `작동` to summoning/appearance or alter trigger semantics without evidence. |

## Maintained Decisions and Structural Checks

- Sixty-seven exact-English duplicate groups touch this range (1,249 rows
  across the corpus). Their Korean translations all match.
- Logical line-break counts, runtime/layout-token identities, and brace
  balance match across all four languages for the 170 new rows.
- The icon token `#NAMED_ICON_360_B#` at `9210` is unchanged. Localized
  text inside the passive wrapper at `9035` is not a control-token error.
- Three new Korean strings contain 14 existing CRLF embedded breaks:
  `9035` (1), `9050` (2), and the twelve-line poem `9228` (11).
- `9012` uses `장검` / `대검`, consistent with the active base-first weapon
  categories; `9005`'s boots question does not justify inventing a unique item
  name from the generic English noun.
- `9062` follows English/Chinese's Dvergan Raider; Japanese calls it a ship.
  This source disagreement does not justify changing the current noun.
- `9063` already has `더스트링(Dustling)`, and `9163` already has
  `샘(The Font)`; old terminology uncertainties do not override these
  current, paired forms.
- Earlier corrections remain at `9053` (repeated escape command), `9094`
  (direction of envy), `9114` (duel second), `9157` (Red Legion), `9207`
  (seller asks no questions), and `9234` (bargain's impending result).
- `9042`, `9064`, `9184`, `9213`, and `9236` were not rewritten as presumed
  player-facing strings. Credits/debug-like strings require separate evidence.
- Of the new IDs, 117 have indexed quest-asset links and 53 do not.

Current four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
