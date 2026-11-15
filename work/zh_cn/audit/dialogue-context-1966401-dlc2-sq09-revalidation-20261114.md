# Dialogue Context Revalidation: `1966401.quest_bxml` (`DLC2_SQ09`)

- Date: 2026-11-14.
- Scope: all 110 `default` IDs linked by the current asset index; 107 have
  an exact `.quest_bxml` link in the append-only review ledger.
- The asset explicitly contains `QUEST_ID DLC2_SQ09`, four Kollossae NPC
  symbols (`Heliodorus`, `Korrinna`, `Dareios`, and `Hystis`), and 38
  dialog-line handlers. This confirms the quest-level grouping only; it does
  not map individual localization IDs to speakers, branches, or playback
  order.
- Ledger link gaps `47737`, `47842`, and `47947` store `1966401` without the
  `.quest_bxml` suffix. Their existing ledger rows were preserved.

## Rechecked Findings

| ID | Result |
| ---: | --- |
| `30718` | The earlier uncertainty about whether Hystis is a person is resolved by quest context: the same SQ09 asset includes Hystis as an NPC, and `default:28911` describes him as a Kollossae hermit who assigned these tasks. `만나러 가야 해` is supported by Japanese and the quest context; the Korean was retained. No speaker was inferred for this line. |
| `43941` | The previously approved register correction is already present: `더는 미룰 수 없겠어. 이제 떠나야 해. 도와줘서 고마워, 부름받은 자(Beckoned). 수고비로 이 금화를 받아.` It matches the conversational source without the former 하게체. |
| `44930` | The previously approved meaning and name-format correction is already present: `다레이오스(Dareios)가 죽어서 히스티스(Hystis)가 임무를 마치는 걸 도울 수 없게 됐다.` |
| `52546` | The exact function of `the Beckoned` as title versus descriptive address remains uncertain. The existing `부름받은 자(Beckoned)` preserves either reading, so it was retained. |
| `63960` | The current `나로스의 이빨(Teeth of Naros)` and `이디라(Idylla)` pairings are complete and the sentence preserves the source meaning. No change was needed. |

## Cross-Checks

All 110 linked rows were checked against English, Japanese, Chinese, and the
current Korean text. Eight exact-English duplicate groups (17 rows) have
identical Korean within each group. No logical line-break or brace-token
signature mismatch was found.

No translation or ledger change was needed in this asset pass. Existing
dispositions and fingerprints remain unchanged. Asset co-occurrence and
serialized handlers do not establish individual speakers or playback order.
