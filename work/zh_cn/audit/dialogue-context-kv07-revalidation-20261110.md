# KV07 / Gwyn Anwy Context Revalidation

- Date: 2026-11-10.
- Scope: all 129 `default` keys associated with `501659.quest_bxml` (`KV07`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID KV07`, the asset-level symbol `NPC_GwynAnwy`,
quest-state names including `found_mother` and `gwyn_ran`, and 58 serialized
`dialog_line_*` handlers. Its keys cover Gwyn's search for her mother, the
Mystic Hammer, the Hall of the Firstsworn, the Sacred Passage, Besin, and the
Niskaru Lord. The localization keys are not mapped to individual handlers,
speakers, branches, or playback order. The asset-level Gwyn symbol does not
establish her as speaker for every key.

All 129 keys are unique to this asset in the current index and were not
already present in the review ledger.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `1158` | meaning / naturalness / terminology | The same `Niskaru Lord's mountain prison` is rendered `산속 감옥` at `61591`; `산악 감옥` is awkward and may suggest a prison designed for mountains. Prefer `우리의 지식이 모두 이먼의 섬(Eamonn's Isle)에서 먼지만 뒤집어쓴 건 아니야. 니스카루(Niskaru) 군주의 산속 감옥이 어디 있는지 알아냈어.` | High |
| `5046` | meaning / naturalness / terminology | The established rendering of `Sworn to War` in this context is `전쟁에 맹세한 자`; `전쟁을 위해 맹세한 자` is an unnatural construction. Prefer `그는 왕자로 이곳에 왔다가 전쟁에 맹세한 자가 되어 떠났다고들 해.` | High |
| `22613`, `25368`, `35580` | naturalness / consistency | These rows repeat the same English, Japanese, and Chinese sentence: `Cloudcrest Mountain looks over the southern Hollowlands, west of here.` The current Korean varies its word order and phrasing. Use the same sentence in all three, retaining each row's distinct continuation: `클라우드크레스트 산(Cloudcrest Mountain)은 여기서 서쪽에 있으며, 남부 할로우랜드(Hollowlands)를 내려다봐.` | High |
| `40384`, `61804` | naturalness / consistency | Both rows contain the exact same English sentence, `Gwyn Anwy believes it must be re-forged there as well`, and the same Japanese and Chinese meaning, but Korean differs. Align both clauses to `그윈 안웨이(Gwyn Anwy)는 그곳에서 다시 벼려야 한다고 믿는다.` | High |
| `55488` | meaning / naturalness | The current opening nests the hammer, Fahrlang, Besin, and the Niskaru Lord in a difficult modifier chain. The parallel `1752` supports a clearer sentence-level rendering. Prefer `신비한 망치(Mystic Hammer)의 잔해를 손에 넣었다. 오래전 이곤(Eagonn)이 베신(Besin)처럼 니스카루(Niskaru) 군주(Niskaru Lord)를 풀어 주려는 파를랑(Fahrlang)의 음모를 막는 데 사용한 무기다. 이제 아이언패스트 요새(Ironfast Keep)로 가서 그윈 안웨이(Gwyn Anwy)를 만나야겠다.` | High |
| `58135` | meaning | `remains` refers to the broken remains of the hammer, not a person's corpse; `유해` is therefore a mistranslation. Prefer `망치 잔해는 네가 갖고 있고, 우린 대장간 앞에 서 있어. 더 필요한 게 뭐야?` | High |
| `60809` | terminology / format | `that Hammer` refers to the named Mystic Hammer. `그 망치(Hammer)` pairs only a generic noun with English and loses the established item name. Prefer `네 임무는 명확해. 신비한 망치(Mystic Hammer)를 찾아 아이언패스트(Ironfast)에서 그윈(Gwyn)과 만나.` | High |
| `33653` | naturalness / format | The English marks one hesitation, `it must ‒ I think ‒ be reforged there`; the Korean adds two overlapping hedges, `아마... 내 생각엔...`. Prefer `첫서약자 전당(Hall of the Firstsworn)에서 벼렸으니... 내 생각엔... 그곳에서 다시 벼려야 할 거야.` | Medium-high |

## Holds

No additional source-conflict or insufficient-evidence hold was identified in
this bounded pass. Proposed corrections remain unapplied.

## Coverage

All 129 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Eight correction findings affect 11 IDs. Four
exact-English duplicate groups already have identical text in all four
locales: `Hall of the Firstsworn` (three rows), `Speak with Gwyn Anwy`,
`Mystic Hammer` (three rows), and `I'll be at the ruins. Come as soon as you
can.` No embedded line breaks, runtime markers, or markup were found.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
