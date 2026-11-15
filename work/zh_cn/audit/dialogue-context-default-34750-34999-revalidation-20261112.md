# Sequential `default` Revalidation: IDs `34750`-`34999`

- Date: 2026-11-12.
- Compared every in-range row in English, Japanese, Chinese, and active Korean.
- Rechecked 72 existing ledger entries and reviewed the other 178 IDs.
  Findings are proposals, not approved translation edits.
- Twenty new correction-candidate IDs and six new evidence-limited holds were
  recorded. Two older candidates were cleared; two existing findings received
  a separate hold.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `34765`, `23465`, `11896` | Consistency / naturalness | These bounty-completion lines have the same English structure and identical Japanese and Chinese, but Korean varies in sentence construction and register. Use one natural journal-style construction such as `화이트스톤(Whitestone) 주민과 아포타이어(Apotyre) 전역을 위협하던 세력을 없애는 데 힘을 보탰다. [가문명]의 범죄 행각은 이제 끝났다.`, preserving each family name. | High |
| `34817` | Meaning | `holy hollow` is reduced to the generic `성스러운 곳`; Japanese explicitly identifies a cave (`洞穴`). Consider `성스러운 동굴` while retaining the sentence's uncertainty about Gadflow. | High |
| `34821` | Name / format | The standalone `Vekreth and Arylia` label has neither source name paired. Pair both names, e.g. `베크레스(Vekreth)와 아릴리아(Arylia)`. | High |
| `34831` | Name / format | `Allyn` is named in the armor's history but appears only as `앨린`. Add `(Allyn)` without changing the account of her prayer or discovery. | High |
| `34835` | Name / format | The sentence names `Asa`, rendered only as `아사`. Add `(Asa)` and retain the troop-mustering statement. | High |
| `34841` | Naturalness | `funeral barge` is literally rendered `장례용 배`. Consider a more natural threat such as `이제 그 배가 네 장례선이 될 거야`, preserving the ship name `레퀴엠호(The Requiem)`. | High |
| `34844` | Name / title format | The letter salutation `To Templar Vinthur` pairs neither the title nor name. Use a complete label such as `템플러 빈서(Templar Vinthur)에게:`. | High |
| `34860` | Naturalness / stat format | `(획득 골드 영구적으로 +5%)` is compressed and awkward. Consider a clear stat form such as `(획득 골드 +5% 영구 적용)`, preserving the permanent +5% Gold Looted effect. | Medium |
| `34864` | Name / format | `Kel` is unpaired in `켈이 맞았어`. Add `(Kel)` while retaining the villagers description. | High |
| `34866` | Naturalness | `싸울 것을 맹세하고 그 조직의 일원이 될 거야` is stiff and unclear. Make the vow and membership relation conversational without naming an unsupported organization; see the separate hold below. | High |
| `34870` | Name / format | `Lyra` is named but unpaired. Add `(Lyra)` at the reference without changing the complaint about her adventures. | High |
| `34872` | Meaning / register | English `Yes?` and Japanese `はい？` are a brief, polite response. Korean `무슨 일이야?` asks what happened and is informal. Consider `네?` or another concise response that preserves the source's open question and polite tone; do not infer the speaker. | Medium-high |
| `34878` | Terminology | `cisterns` is `저수지` here, while the same Idylla water-storage system is `저수조` at `34126`, `53549`, and `56007`. Use the established `저수조` term; retain the separate uncertainty about the city's foundations below. | High |
| `34884` | Name / format | `the Testament` is rendered `테스타먼트` without its English source form. Add `(The Testament)` or the source-appropriate short form, without deciding which Testament group is meant. | High |
| `34885` | Name / title format | `Scholar Airancourt` pairs only `Airancourt`. Pair the full source label, e.g. `학자 에어랑쿠르(Scholar Airancourt)`. | High |
| `34892` | Place-name format | `Murderer's Hold` is a complete capitalized location label but appears only as `살인자의 요새`. Pair the full source label while retaining the current Korean wording pending the location-type question below. | High for pairing |
| `34896` | Label / format | `The Id Was Killed!` is rendered `이드 처치!` without the source label. Add `(The Id)` while preserving the concise event style; the entity's precise category remains on hold below. | Medium-high |
| `34895` | Meaning | English `will not suffer the footsteps of men` uses `suffer` to mean tolerate, supported by Chinese `不再受人类荼毒`. Korean `발자취를 반기지 않을` weakens this to mere lack of welcome. Consider `인간의 발걸음은 용납하지 않을 테지. 페이(Fae)도 마찬가지야.` | Medium-high |
| `34904` | Item-name format | The standalone item label `Mana Pendulum` appears only as `마나 진자`. Add `(Mana Pendulum)` while retaining the Korean wording. | High |
| `34912` | Epithet / format | `Lady Oleyn` is paired, but the other three named designations are not. Pair the complete titles `Knight of the Golden Knot`, `Destroyer of Sreng`, and `Keeper of the Fenian Cycle`; retain the existing Korean translations and their sequence. | High |
| `34916` | Name / title format | `Templar Octienne` pairs only the name. Use a complete form such as `템플러 옥티엔(Templar Octienne)`. | High |
| `34925` | Name / format | `Ariel` is unpaired in the objective `Meet Ariel in Bonnlach`; add `(Ariel)` and preserve the established `본라흐(Bonnlach)` form. | High |
| `34936` | Organization / format | Capitalized `the Order` is rendered only as `조직`. Add `(the Order)` without identifying the organization or conflating it with the separate `Order` reference at `34866`. | Medium |
| `34952` | Item-name format | `Flawless Mitharan Immunity Trim` is a complete item label, but only `Mitharan` is paired. Pair the full label while preserving its existing Korean wording; keep the exact sense of `Trim` on hold below. | High for pairing |
| `34968` | Name / title format | `Lord of Dolve Arne` is rendered as `돌브 아르네(Dolve Arne)의 영주`, pairing only the place name. Pair the complete title/name phrase, e.g. `돌브 아르네의 영주(Lord of Dolve Arne)`. | High |
| `34977` | Faction / format | `House of Sorrows` is rendered as `비탄의 집` without its source form. Add `(House of Sorrows)` while retaining the separate `The Eldest` pairing. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `34801` | Meaning / metaphor | `better off lost in the mud of a Dverga tunnel` is an insult whose exact image is not settled by the isolated line. Korean `진창에 묻혀 있는` may imply burial; retain pending stronger context rather than inventing a more specific fate. |
| `34866` | Organization / title | The capitalized `Order` and the phrase `sworn to war` may name a formal group or status. The Korean can be made more natural, but this row and its asset association do not establish the group's identity or an approved Korean title. |
| `34882` | Meaning / tone | English and Chinese say `I give up!`; Japanese says `いい加減にして！` (“Cut it out!”). Korean `항복이야!` follows English/Chinese, but the locale conflict prevents a more specific correction without dialogue context. |
| `34884` | Organization | `the Testament` may name a faction, order, or other group. English capitalization and the differing Japanese/Chinese renderings do not establish the exact entity. The missing English pairing is a separate candidate. |
| `34892` | Place / label | English names `Murderer's Hold`; Japanese identifies Didenhil Prison, while Chinese describes a fortress. The row does not settle whether `Hold` is a prison, fortification, or formal place name. |
| `34896` | Entity / label | All locales treat `Id` as a name, but this event label does not establish whether it is a creature, person, or other entity. Pairing the source label is separate from deciding its category. |
| `34952` | Item terminology | `Trim` may be a crafting component or a decorative/edge term. The paired item label can be restored without choosing a more specific Korean item type. |
| `34994` | Name / source conflict | English says `Bloody`, Japanese expands this as `Bloody Bones`, and Korean uses `블러디 본즈`. Do not add a guessed English parenthetical or normalize the name until the source form is reconciled. |

## Rechecked Findings

- Eight existing candidates were reopened. The findings at `34765`,
  `34841`, `34866`, `34878`, `34895`, and `34952` remain supported.
- The prior `34790` candidate is cleared: the current Korean already uses
  the quest-reviewed `화염 물약` and the neutral `연금술사를 잃은 지도`,
  without deciding whether the alchemist died or left.
- The prior `34890` candidate is cleared for this ID: `무기 교관` already
  matches the established rendering at `13436`.
- The old `34877` terminology concern is not reproduced: the current Korean
  is the source-paired proper name `스콜리아 아르카나(Scholia Arcana)`.
- The equipment term `Longswords` at `34942` is consistently rendered
  `장검`, matching the active `base` terminology. No change is proposed.

## Repeated Sources And Structure

- Fifty-four exact-English duplicate groups (1,203 corpus rows) touch this
  range. Korean differs within two groups: `21640` / `34798` / `42562`
  (“I hope you're prepared to lose.”) and `23033` / `34837` (“The gods are
  good to us.”). Japanese also differs in both groups, supporting the
  ID-specific Korean wording; no forced unification is proposed. At `15322` /
  `34823`, Japanese differs in register while Korean matches.
- The repeated `Yes?` group includes `34872`; its Japanese `はい？` supports
  the register concern recorded above. Exact-English duplicates at `34901`
  / `36078` match in Korean.
- The 23 embedded line breaks match across all four languages. They occur in
  `34785`, `34800`, `34825`, `34826`, `34913`, `34930`, `34942`, and `34993`.
  Normalized brace/runtime-token and angle-markup signatures also match;
  `{1}{2}` at `34973` is preserved.
- Speaker attribution remains unassigned and dialogue order unknown; asset
  membership, quest identifiers, and serialized handlers do not establish
  per-key speakers or playback order.
- After this range is added, the ledger contains 42,887 of 65,135 unique
  `default` IDs (65.84%), leaving 22,248. The range has 21 overall
  candidates, eight uncertain IDs, and 221 not flagged. No translation CSV
  was changed.
