# Sequential `default` Revalidation: IDs `25000`-`25249`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 64 existing ledger records and added 186 previously unrecorded
  IDs. Twenty new correction-candidate IDs and one evidence-limited hold were
  recorded.
- Cleared existing findings at `25157` and `25204` because the active text
  already uses the previously proposed wording. Retained the other four
  existing candidates and the existing hold after checking their evidence.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `25031` | Format / item-name pairing | `Flawless Mitharan Frosted Rivets` is paired only at `Mitharan`. Pair the complete item label, e.g. `완벽한 미타란 서리 리벳(Flawless Mitharan Frosted Rivets)`, without inferring an equipment slot. | High |
| `25052` | Format / title pairing | `Fort Olghorn Alliance` is rendered `올그혼 요새(Fort Olghorn) 동맹`, leaving the complete alliance title unpaired. Consider `올그혼 요새 동맹(Fort Olghorn Alliance)`. | High |
| `25055` | Format / item-name pairing | `Flawless Mitharan Sharpening Fulcrum` is paired only at `Mitharan`. Pair the complete source label, e.g. `완벽한 미타란 연마 받침(Flawless Mitharan Sharpening Fulcrum)`. | High |
| `25056` | Format / item-name pairing | `Master Mitharan Energizing Bindings` is paired only at `Mitharan`. Pair the full item name, e.g. `장인의 미타란 활력 결속구(Master Mitharan Energizing Bindings)`. | High |
| `25105` | Objective form / name pairing | `Kill Marten's Mates` is a quest objective but is rendered as the bare noun phrase `마튼의 동료 처치`; the personal name is also unpaired. Consider `마튼(Marten)의 동료 처치하기`. | High |
| `25118` | Name / format | The legendary vigilante `the Executioner` is a named title in the description but appears only as `처형인`; the item `Boots of Last Breath` is already fully paired. Add the exact title, e.g. `처형인(The Executioner)`, while retaining the complete item-name pairing. | Medium-high |
| `25128` | Objective form | `Talk to Ost Ordura` is rendered `오스트 오르두라(Ost Ordura)와 대화`, unlike the established `-하기` objective form. Consider `오스트 오르두라(Ost Ordura)와 대화하기`. | High |
| `25131` | Terminology / title pairing | `Castellan of Helmgard` is translated as `헬름가드(Helmgard)의 성채 사령관`, leaving the formal office title unpaired. Consider `헬름가드(Helmgard)의 성채 사령관(Castellan)`; this does not identify the individual office-holder. | Medium |
| `25150` | Objective form / name and title pairing | `Speak to Lieutenant Drefan` is rendered with a bare objective and pairs only the personal name. Consider `드레판 중위(Lieutenant Drefan)와 대화하기`. | High |
| `25163` | Speech level / naturalness | Korean ends with the marked `-시오` (`가시오`), while Japanese addresses the listener plainly and Chinese uses a neutral departure/blessing. Consider a natural plain blessing such as `우리 도시의 축복과 함께 가.` No speaker is inferred. | Medium-high |
| `25171` | Meaning / terminology | `the Hollow` is rendered `공허`, which means emptiness. Japanese and Chinese both identify a cave (`洞穴`). Use a cave/hollow term such as `동굴`; whether this is a formal place-name remains unestablished. | High for the landform; name status unresolved |
| `25184` | Format / title pairing | The awarded Fate title `Muse of Fate` is rendered `운명의 뮤즈` without the English title. Add the exact name, e.g. `운명의 뮤즈(Muse of Fate)`. | High |
| `25190` | Meaning / naturalness | `horribly mauled` is rendered `처참하게 난도질당했다`, which specifies repeated blade strikes. Japanese describes a badly wounded corpse and Chinese describes it as mauled; use a more neutral form such as `시체는 끔찍하게 훼손돼 있었다` before the clues about the weapon. | Medium-high |
| `25197` | Terminology / full-name pairing | The creature type `Bolgan Brute` is rendered `볼간(Bolgan)의 거한`, pairing only the species and separating the compound type. Consider `볼간 거한(Bolgan Brute)`. | High |
| `25205` | Format / item-name pairing | `Flawless Mitharan Illuminator's Shaft` is paired only at `Mitharan`. Pair the full label, e.g. `완벽한 미타란 계몽자의 자루(Flawless Mitharan Illuminator's Shaft)`. | High |
| `25208` | Format / line layout | The Korean text has 14 embedded line breaks, compared with 11 in the Japanese-derived template and Chinese. Several Korean breaks divide clauses differently from the Japanese layout. Align the passage's paragraph and line structure with the Japanese template while preserving all content and the source's intentional lineation. | High |
| `25210` | Format / item-name pairing | The capitalized `Border Permit` is a specific permit in the line, but is rendered only as `국경 통행증`. Consider `국경 통행증(Border Permit)` while preserving the “right hands” meaning. | Medium-high |
| `25241` | Format / title pairing | The heading `Forward: Primal Magic Examined` is rendered `서문: 원시 마법 고찰` without its English title. Pair the full heading, e.g. `서문: 원시 마법 고찰(Forward: Primal Magic Examined)`. | Medium |
| `25242` | Format / terminology | `Kollossae Law` is capitalized as a formal law/code; Korean `콜로사이(Kollossae) 법` pairs only the people-name. Consider `콜로사이 법(Kollossae Law)`. | Medium-high |
| `25247` | Speech level / naturalness | The line shifts from plain `그들은 돕기는커녕` to polite `미안해요` / `익숙하지 않아서요`; Japanese remains plain. Keep one register throughout, for example `그들은 돕기는커녕... 미안. 이런 이야기는 익숙하지 않아서.` | High |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `25214` | Speech level / addressee | Korean uses honorific forms (`주인이 되셨군요`, `말이죠`), while English addresses the listener directly and Japanese/Chinese are neutral. The row alone does not establish whether deference to the Keep's new master is intended; retain pending explicit dialogue context. |

## Rechecked Existing Findings

- Retained the existing format candidate at `25058`: the active text already
  pairs Jakasen, but still renders the named magical spring only as `샘`;
  the established form is `샘(The Font)`.
- Retained `25071`'s naturalness/register candidate. The line still shifts
  from casual speech to honorific wording within a single utterance.
- Retained the finding at `25185`: `앨럭` conflicts with the established
  `알럭(Aluck)` spelling and the objective lacks the English name pairing.
- Retained the `25202` speech-level/honorific candidate. The active text still
  uses `하오체`; the references do not establish whether the address to the
  Beckoned is intentionally deferential.
- Retained the evidence-limited hold at `25173`; the Korean register changes
  within the line and speaker/scene-stage evidence remains unavailable.
- Cleared `25157`: its active wording already matches the previously proposed
  `나도 이 점은 믿어. 하지만 폭력을 쓰진 않겠어.` and `군사 기지` wording.
- Cleared `25204`: its active wording already matches the earlier proposed
  natural rendering about investing many hours and bearing callouses.

## Duplicate And Structural Checks

- The range touches 60 exact-English duplicate groups (1,260 corpus rows).
  Korean text matches within those groups; Japanese variants for short
  prompts remain source evidence and were not used to infer speakers.
- Line-break counts and normalized runtime/control-token signatures match
  across all four languages except the documented line-layout candidate at
  `25208`.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.
- Dialogue register checks were marked not applicable for objective,
  interface, label, item-description, journal, book, and other non-spoken
  entries.

After recording this range, the ledger contains 35,678 of 65,135 IDs
(54.78%), leaving 29,457. Sequential coverage reaches ID `25249`; the next
range is `25250`-`25499`.
