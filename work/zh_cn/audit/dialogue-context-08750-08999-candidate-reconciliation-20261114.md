# Candidate Reconciliation: IDs `8750`-`8999`

- Date: 2026-11-14.
- Scope: all 19 current `overall=candidate` IDs in the numeric range, checked
  against the active English, Japanese, Chinese, and Korean rows and linked
  reviews.
- One row required a new Korean edit. Seventeen were retained as already
  corrected or adequately supported. `8992` remains held because the source
  languages support materially different nuances.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- No speaker or playback order was inferred from asset membership.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `8755` | Retained | `사냥꾼의 구덩이(Hunter's Pit)` already pairs the displayed name; the Japanese hideout wording does not establish a different site function. |
| `8788` | Retained | The current two-sentence wording preserves the source's initial advice and the speaker's separate comparison with themself. |
| `8795` | Retained | The location label is already paired as `라그날의 영웅 사당(Ragnall's Heroon)`; the precise type of monument remains undecided. |
| `8814` | Retained | The active line is a natural plain-spoken explanation and pairs Lord Ysa, Hallam the White, and Cairn. |
| `8817` | Retained | `가려내라고 하셨어. 자, 시작할까?` keeps respect for the Hierophant while maintaining a consistent conversational register. |
| `8831` | Retained | The ability description clearly distinguishes 19 physical damage, a five-second stun, six seconds of concealment, and 55 Mana; the source line layout remains. |
| `8848` | Retained | `운명의 실(Weave)` follows the established fate-weaving term; the solemn prediction remains intact. |
| `8855` | Retained | `마튼 스트랜드(Marten Strand)` and `마튼(Marten)` follow the reviewed name forms, and the companions' release from torment is preserved. |
| `8864` | Retained | `적을 더 오래 느려지게 합니다` conveys slowing rather than immobilization and retains the Ice Barrage damage effect. |
| `8877` | Retained | `워스원(Warsworn) 고용병(Hireling) 의뢰 게시판` correctly describes a request board, not recruitment. |
| `8886` | Retained | The text preserves the possibility that a larger enemy may pull the player instead; it does not make that outcome certain. |
| `8897` | Retained | The active line already distinguishes the descriptive `죽음의 교단` from the paired faction name `벨렌의 성약단(Belen's Testament)`. |
| `8904` | Retained | `글리니스(Glynis)` is paired, and the selection, childhood, and apprenticeship sequence matches the sources. |
| `8928` | Retained | The complete title is already paired as `겨울의 지고왕(High King of Winter)`. |
| `8947` | Corrected | Replaced the imperative quest title `잃어버린 역병 방호제(Plagueshield)를 모아라` with the established action form `잃어버린 역병 방호제(Plagueshield) 모으기`. |
| `8969` | Retained | `헨지(Henge)` is paired. The Korean keeps the English/Chinese claim that the Henge's magic was undone; the Japanese contradiction remains a separate evidence hold. |
| `8978` | Retained | The surname-only source is correctly paired as `아그니(Agni)` without expanding it to a full name. |
| `8992` | Held | English describes a simple kind of brilliance, while Japanese describes cleverness about trivial things. Keep the existing Korean pending stronger context rather than choosing a possibly different compliment or insult. |
| `8997` | Retained | The history already pairs `Plaguetimes`, `The Burning`, and `Orbocant`; its three-paragraph structure, 600-year interval, and source-qualified claims remain intact. |

## Changes and Verification

- Changed only the Korean text at `8947`, using the byte-preserving
  ID-scoped editor.
- Refreshed only `8947`'s `source_fingerprint` in the append-only review
  ledger. All other ledger dispositions and evidence links were preserved.
- Reconciled all 19 in-range candidates, including the evidence-limited hold
  at `8992`. Cumulative candidate reconciliation is 503 / 4,015 (12.53%),
  with 3,512 not yet reconciled.
- The existing `8992` hold and the Japanese/English source conflict at
  `8969` remain documented; neither was guessed away.
- The CSV retains 65,135 ordered records, its UTF-8 BOM, and the existing
  mixed line-ending inventory. No `src/` CSV or extracted game asset was
  changed. No commit was made.
