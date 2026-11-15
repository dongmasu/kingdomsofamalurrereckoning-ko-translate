# Sequential `default` Revalidation: IDs `56500`-`56749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 66 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 184 IDs in ascending order.
- Five new correction candidates and two evidence-limited holds are recorded
  on new rows. Three prior candidates were rechecked without rewriting their
  existing ledger rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `56512` | `두 발 달린 자들 무리가` stacks two plural/group expressions and reads awkwardly. English and Japanese describe the two-legged people as the group who named the speaker but did not help. Consider `두 발 달린 자들이 내게 이 이름을 붙였지만, 도와주진 않았어!` |
| `56642` | In the SQ41 / Adar context, this is the binding magic circle, not a geometric `원`. The same quest uses `마법진` elsewhere, and the Japanese source explicitly uses `魔法陣`; retain the candidate to use `마법진` here. |
| `56700` | `것 같군` is stiffer than the surrounding casual `다시 와` and the Japanese conversational `みたいだね` / `おいで`. Consider `요금을 낼 돈이 부족한가 보네. 낼 수 있을 때 다시 와.` |

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `56628` | Meaning | English says she promised that *we* would rebuild Culn; Japanese likewise says they would rebuild it together. Korean `그녀는 컬른을 재건하겠다고 약속했어` shifts the promise to her alone. Consider `그녀는 우리와 함께 컬른(Culn)을 재건하겠다고 약속했어. 불가능한 일인 줄 알았어야 했는데.` | High |
| `56662` | Name / title format | English is `Templar Octienne`, while the Korean pairs only the personal name: `템플러 옥티엔(Octienne)`. Include the title in the parenthetical name, e.g. `템플러 옥티엔(Templar Octienne)`. | High |
| `56672` | Meaning / naturalness | English calls his betrayal “the coldest”; Japanese says it froze the speaker's heart and Chinese says it was the most cold-hearted. `가장 뼈아팠어` shifts this toward personal pain. Consider `그자의 배신이 가장 비정했어` or another natural rendering that retains the cruelty/shock. | Medium-high |
| `56696` | Name / format | This standalone location name is `Castaway's Cove`, but Korean has only `조난자의 만`. Consider pairing the Korean name with the English, e.g. `조난자의 만(Castaway's Cove)`. | Medium-high |
| `56722` | Meaning / naturalness | In context, `that ideal` refers to the city/covenant vision. Korean `그 이상을 배신했어` is ambiguous and can read as “betrayed more than that.” Japanese `それ` and Chinese `这个梦想` support an antecedent such as the vision or intent. Consider `하지만 우리는 그 뜻을 저버렸어.` | Medium |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `56732` | Meaning / term | English `pays their dues to the Hierophant` can mean meeting obligations or paying dues. Japanese describes fulfilling one's responsibility to the Guide; Chinese specifies dues, and Korean selects monetary `회비`. The line alone does not settle whether this is a payment or broader duty; retain pending stronger context. |
| `56736` | Meaning / source interpretation | English is fragmentary: `they were a myth, ancestors of the Almain`. Japanese says they were mythical beings and then identifies them as Almain ancestors; Chinese can be read as saying their ancestry is a myth, as does the current Korean. Do not choose between these readings without stronger context. |

## Repeated English and Structure

- Sixty-one exact-English duplicate groups across the corpus touch this range,
  covering 1,253 rows. Korean differs only in the `Hello?` group at
  `35013`, `38536`, `56591`, and `56942`. The `뭐?` at `56942` matches
  Japanese `何？`; the other Korean `안녕?` greetings align with the
  conversational Japanese and Chinese variants. Preserve these
  context-supported differences.
- Six rows contain embedded line breaks: `56536` (3), `56554` (5),
  `56572` (4), `56581` (10), `56586` (6), and `56714` (1). Totals are
  29/29/28/29 breaks across English/Japanese/Chinese/Korean. At `56581`,
  the Korean line count matches English and Japanese; Chinese has one fewer
  break. Preserve the poem's existing Korean lineation.
- Runtime/display marker identities are retained. At `56572`, Korean follows
  the Japanese/Chinese order for the Chaos cores, realm dungeons, and nodes;
  English serializes the core marker earlier. At `56618`, Korean follows
  English's button → mode → meter order, while Japanese and Chinese place
  the meter condition first. The sentence order is coherent in each version;
  these source-layout differences do not by themselves establish a Korean
  formatting error. The marker sequence at `56687` is identical.
- Of 250 IDs, 199 have indexed asset associations, represented by 206 links
  across 130 assets; 51 have no indexed asset. Of the 184 newly recorded
  IDs, 133 are linked through 140 links across 74 assets. Asset associations
  do not establish per-key speakers or playback order.

## Range Result

- All 66 pre-existing ledger rows remain unchanged; 184 new IDs were
  appended in ascending order.
- The ledger covers 58,960 of 65,135 unique `default` IDs (90.52%), leaving
  6,175 unrecorded IDs. Sequential coverage reaches `56749`; next is
  `56750`-`56999`.
- The three rechecked candidates and five new candidates require separate
  approval before any translation CSV edit. No translation CSV was changed.
