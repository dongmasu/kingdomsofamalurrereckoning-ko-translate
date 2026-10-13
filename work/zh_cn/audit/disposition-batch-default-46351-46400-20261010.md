# Disposition Batch: `default` IDs 46351-46400

- Date: 2026-10-10. Compared active Korean against English meaning, Japanese
  register and terminology, Chinese supporting evidence, source-keyed
  historical questions, and prior accepted decisions. This is a working
  disposition pass, not independent final linguistic approval.
- Decisions: three accepted, four uncertain, and one grouped `not an issue`
  disposition covering the other 32 IDs.
- CSV edits in this range: IDs 46366, 46380, and 46388. The carry-over
  correction at ID 46350 belongs to the preceding range and is documented
  there; it is not counted in this batch.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 46355 | Uncertain | English `our order`, Japanese “our academy,” and Chinese “our academy” do not establish the institution's exact identity; retain `결사단` provisionally. |
| 46357, 46364, 46367, 46371, 46373-46374, 46377, 46392-46393, 46396-46397, 46400 | Uncertain | The dialogue and descriptions retain their source meaning, but Wolves, Cloudcrest, Drewn, Darkvari, Bareth/murghan, Shadow Pass, Detyre, Primos, the Walls, Varani/Barghest, and Narca need canonical name, faction, or lore alignment. |
| 46363 | Uncertain | `미든이 타락` follows Japanese's corruption/fall reading, while Chinese says the Midden will rot. The exact sense of `corrupted` needs setting context. |
| 46365 | Uncertain | The English names St. Hadwyn's without specifying a site type; Japanese says monastery and Chinese says mission. `수도원` is plausible but not settled by the source set. |
| 46366 | Accepted | Change `통일된 통치자가 없자 ... 지금과 같은 꼴이 되고 말았다` to `통합을 이끌 통치자가 없어 ... 지금과 같은 모습으로 몰락했다`. English `unifying ruler` and Japanese `求心力のある支配者` describe a ruler who unifies/holds the region together, not a “unified ruler”; the revision restores that relation in natural Korean. |
| 46380 | Accepted | Change `개스티어 가문` and `개스티어 성` to `가스티르 가문` and `가스티르 성`. The same English `Gastyr` is rendered `가스티르` in the active corpus, and prior decision D-5948 explicitly notes that `가스티르 성` is the established repeated form while `가스티어 성` is an outlier. |
| 46388 | Accepted | Change `그래?` to `어?`. English `Aye?` is a short questioning response; Japanese `え？` and Chinese `啊？` support a surprised/interrogative Korean response rather than `그래?` (“Really?/Is that so?”). |
| 46398; remaining IDs in 46351-46400 excluding the IDs above | Not an issue | At 46398, `정당한 거래만 하자고` preserves the refusal and request to stick to legitimate business. The other remaining dialogue, UI, names, values, and structures preserve the English meaning; no further supported row-local correction was found. |

Decision IDs D-14186 through D-14193. Direct register totals after this
batch: 1,430 accepted, 4,587 `not an issue`, and 8,170 uncertain (14,187
categorized dispositions). The next decision ID is D-14194.

CSV SHA-256 before editing:
`d3fedcce4c331020157d9b70c60c632b8818e3d04003eb64cb403ab93807f91d`.
CSV SHA-256 after editing:
`e34ea1c3ae0044a9dd0ba7e706caa308cfc6465227b49ae5c94a1c1c09623301`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
are preserved. English, Japanese, Chinese, and Korean each contain IDs
46351-46400 once in ascending order; line-break counts and runtime markers
match after normalizing localized marker payloads. No material numeric
discrepancy was found.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 46366 | `통일된 통치자가 없자 타라레인은 지금과 같은 꼴이 되고 말았다.` | `통합을 이끌 통치자가 없어 타라레인은 지금과 같은 모습으로 몰락했다.` | Restore the “unifying ruler” meaning and the decline into Tala-Rane's present state. |
| 46380 | `브런이 개스티어 가문의 마지막 영주 이야기를 들려줬다. 개스티어 성 아래 세워진 거대한 볼건 야영지를 파괴하면 다른 이야기도 해 주겠다고 했다.` | `브런이 가스티르 가문의 마지막 영주 이야기를 들려줬다. 가스티르 성 아래 세워진 거대한 볼건 야영지를 파괴하면 다른 이야기도 해 주겠다고 했다.` | Align both occurrences with the established `Gastyr` spelling. |
| 46388 | `그래?` | `어?` | Match the questioning/surprised response supported by Japanese and Chinese. |
