# Sequential `default` Revalidation: IDs `31000`-`31249`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 79 existing ledger entries and added 171 IDs. Findings are
  proposals, not approved translation edits.
- The new IDs contain 11 correction candidates and one evidence-limited hold.
  Existing findings at `31002` and `31060` were promoted from `not-issue`;
  the earlier candidate at `31085` was cleared.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `31000` | Naturalness | The line `세월에 닳아 가는 순환은 오랜 세월을 거듭하며 돌아가` repeats the time/age idea and reads awkwardly. English `The time worn cycle turns with ages` and Japanese `時をすり減らす円環は年を追うごとに変化する` support a more compact poetic line, such as `세월에 닳아 가는 순환은 시대와 함께 변해 가.` Preserve the poem's existing paragraph breaks. | Medium-high |
| `31002` | Naturalness | `네가 내가 본 것들을 모두 봤다면` is cumbersome because of the adjacent `네가 내가`; Japanese omits the conditional while English and Chinese retain its meaning. Consider a smoother form such as `내가 본 걸 너도 봤다면 알 거야. 저 생물들은 위협적이야.` | Medium |
| `31009` | Rank / name format | English names the full rank and person, `Private Menyr`, while Korean pairs only `메니어(Menyr)` and leaves `이등병` outside the source label. Pair the whole name and rank, e.g. `메니어 이등병(Private Menyr)`. The exact-English duplicate at `15291` has the same Korean and should be considered together if approved. | High |
| `31011` | Speech level / meaning | Retain the earlier finding: the familiar address `dove` is rendered as the literary `그대여`, and `plot` means Grim's plan here. The quest-group review and Japanese support a conversational rendering such as `돌아왔군, 친구. 이제 계획을 마무리하고 대사제(Hierophant)에게 복수하자.` No individual speaker is inferred. | High |
| `31012` | Meaning | Retain the earlier finding: English `Delivered where?` and Japanese `どこへ配達する？` ask where the notices should be delivered, but Korean `어디로 배달됐는데?` asks where a completed delivery went. Consider `무슨 통지서? 어디로 배달하면 되지?` | High |
| `31024` | Terminology | Retain the earlier quest-specific finding: these are the ash-filled urns in the Teeth of Naros quest. Korean `항아리` is inconsistent with the aligned Japanese ash-urn wording and the established `유골함` term. Use `유골함` here; do not generalize this to unrelated pottery. | High |
| `31048` | Terminology / naturalness | Retain the earlier finding: the sacrificial `circles` in this quest are rendered `마법진` at `15473`, while `희생 의식의 원들` is awkward and inconsistent. Consider `약탈자들과 타락한 우리 동족이 만든 희생 의식의 마법진이 이 도시와 이 땅 곳곳에 있어.` | High |
| `31053` | Name / format | `High Roll` is the named dice game, and the same game is paired as `하이 롤(High Roll)` elsewhere, including `2902` and `11559`. Add the English pairing at its first mention here. | High |
| `31060` | Name / format | `Krast Brothers` is a named group. Korean omits the English pairing here, while the same group is paired as `크라스트 형제(Krast Brothers)` at `7607` and `13121`. Add the pairing in this sentence. | High |
| `31067` | Name / format | The long chapter text repeatedly names Ysa, but Korean uses `이사` without pairing it as `이사(Ysa)`; the same text pairs Ohn and other named terms. Add the source name at Ysa's first mention, without repeating it at every subsequent mention. | High |
| `31081` | Speech level / naturalness | Retain the earlier finding: `놀랍군` sounds stiff next to the conversational English and Japanese `驚きだよ`. Consider `놀라워` or another natural conversational ending; do not infer a shared speaker from asset membership. | Medium |
| `31113` | Terminology | The project term for the magical collectible `Lorestone` is `로어스톤`, supported by the official Korean manual and the terminology record. The help text instead uses `전승석` for `Lorestones`. Align it to `로어스톤` while preserving the localized display wrapper. | High |
| `31127` | Shared-source consistency / naturalness | Retain the earlier finding: the sentences `Cowardice drives her ambition, a fear of being discovered.` and `We Varani make our own outcomes.` also occur at `27683`, but their Korean wording differs. Consider aligning the shared clauses as `그녀의 야망은 들통날까 두려워하는 비겁함에서 나와.` and `우리 바라니(Varani)는 스스로 결과를 만들어 내지.` Keep the distinct surrounding clauses at each ID. | High |
| `31144` | Title / format | English directly addresses the player by the rank `Adept`, but Korean `숙련자여` omits its English pairing; the rank is paired as `숙련자(Adept)` in the same range at `31062`. Add the pairing without changing the command's register unless a separate voice decision supports it. | Medium-high |
| `31179` | Terminology / name | Retain the earlier finding: this is the named `Verdant Blades`, already rendered `푸른 칼날(Verdant Blades)` at `32241` and `33619`. Align the name and remove the unsupported heirloom nuance in `유품`, e.g. `푸른 칼날(Verdant Blades)은 아버지의 것이었어.` | High |
| `31183` | Meaning / naturalness | English `go after the Court` and Japanese `英雄院を狙う` describe targeting the Court, not chasing it. Replace `궁정을 쫓아가다` with a natural verb such as `궁정을 노리다`. The asset does not establish which specific Court is meant, so do not expand the referent. | High |
| `31186` | Name / format | English identifies `old Niels MacNutter` by full name, but Korean `늙은 닐스 맥너터` omits the source pairing. Add `닐스 맥너터(Niels MacNutter)`; retain `늙은` only if it is intended as the source's age description rather than part of the name. | High |
| `31193` | Item-name format | The item label is `Flawless Mitharan Sustaining Grip`; Korean pairs only `Mitharan` and leaves the rest of the named label unpaired. Consider pairing the complete label, e.g. `흠 없는 미타란 지속의 손잡이(Flawless Mitharan Sustaining Grip)`. | Medium |
| `31207` | Name / format / naturalness | This quoted account names `Artess` without English pairing, and the Korean ends `일주일 뒤에...에서 만나자`, leaving a case particle attached to an intentionally unfinished destination. Japanese also stops after “in a week's time...”. Pair `아테스(Artess)` and preserve the unfinished ending without `에서 만나자`; retain the quotation framing used by the other locale sources. | High |
| `31218` | Place-name / format | Retain the earlier `Sacred Pools` finding. This is a named place in SQ93 and currently appears as `성스러운 연못` without English pairing. Consider `성스러운 연못(Sacred Pools)`; keep the English/Japanese/Chinese pool-versus-spring distinction visible rather than extending the term to unrelated springs. | Medium |
| `31224` | Place-name / format | `Serpent's Tale` is the named tavern in this line, but Korean `뱀의 이야기 주점` has no English pairing. Consider `뱀의 이야기 주점(Serpent's Tale)`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `31072` | Meaning / location | English `cove`, Japanese `洞穴` (“cave”), and Chinese `海湾` (“bay”) differ on the location type. Korean follows English with `만`. Retain it pending stronger location evidence; do not silently change it to a cave. |

## Earlier Findings Rechecked

- The existing candidates `31011`, `31012`, `31024`, `31048`, `31081`,
  `31127`, `31179`, and `31218` remain open.
- Promote `31002` (naturalness) and `31060` (name pairing) from their earlier
  `not-issue` dispositions based on the current wording and terminology checks.
- Clear the existing candidate at `31085`: the current row already uses
  `페일링 완드(Paling Wand)` and `아다루스 동굴(Adarus Hollow)`, matching
  the established name and location forms.
- The other 68 previously recorded IDs were rechecked and remain not flagged.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- Sixty-nine exact-English duplicate groups touch this range (1,402 corpus
  rows); every group has matching Korean. No exact-English duplicate group
  is wholly contained within the range.
- Per-row newline counts and normalized runtime/layout-token sequences match
  across English, Japanese, Chinese, and Korean, including localized display
  wrappers. The poem and long chapter text retain their existing layouts.

After this range, the ledger contains 40,097 of 65,135 unique IDs (61.56%),
leaving 25,038. Sequential coverage reaches ID `31249`; next:
`31250`-`31499`.
