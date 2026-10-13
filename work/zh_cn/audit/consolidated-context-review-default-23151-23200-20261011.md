# Consolidated Context Review: `default` IDs 23151-23200

- Review date: 2026-10-11.
- Scope: the fifteen keys left uncertain in the earlier disposition for IDs
  23151-23200, compared by exact ID across English, Japanese source,
  Japanese-derived Korean, Chinese, active Korean, and prior terminology
  decisions.
- Result: thirteen keys resolved (three accepted edits, ten `not an issue`);
  IDs 23178 and 23200 link to existing unresolved corpus-wide terminology
  decisions and are not recounted.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18562 | 23151 | Six Patrons / six deities | not an issue | English's six-deity pantheon and the followers seeking a new path are preserved. The Korean pairs `여섯 수호신` with `Six Patrons`; unresolved global naming preference alone is not a row-level error. |
| D-18563 | 23156 | Home Office / Motus Mining handbook | not an issue | The English sentence concerns a Motus Mining branch handbook, and Japanese `本社` supports company headquarters. Korean `본부` preserves that reading; Chinese's government-department reading is a source-locale divergence, not proof the Korean is wrong. |
| D-18564 | 23159 | Hierophant and Maire / Irion's return | accepted | Change `없어진 뒤로` to `없이`. English says Irion never returned without the Hierophant and Maire; it does not say they disappeared. Japanese and Chinese also describe their absence without establishing a prior disappearance. |
| D-18565 | 23163 | Tuatha took `it` | not an issue | English leaves the stolen object's antecedent unstated, and Japanese, Chinese, and Korean preserve that same omission. No unsupported object is added. |
| D-18566 | 23164 | old-ledger request | not an issue | The request to bring the ledger directly to the speaker and its friendly, direct register are retained; no missing scene context is needed to understand the line. |
| D-18567 | 23171 | Seers / Destiny / Blink | accepted | Change singular `선견자(Seer)는` to plural `선견자(Seer)들은`, matching English and Chinese. Add `(Destiny)` to `운명` so the capitalized game term remains traceable without choosing a new global Korean canon; mana recovery, spell development, and short-distance teleportation remain intact. |
| D-18568 | 23175 | Follow Egan to the Veil | not an issue | The follow objective and both source names are retained as `이건(Egan)` and `장막(Veil)`. Whether the Veil is a place, portal, or boundary is not required to translate this objective. |
| D-18569 | 23181 | Crow tournament state | accepted | Change `까마귀(Crow)` to `크로우(Crow)`. English defines Crow as the status a gladiator enters when last alive on a team, not as a bird; the revised text keeps the term identifiable without inventing a bird metaphor. |
| Linked | 23178 | Beckoned address | uncertain; not recounted | Link to D-7304 and the grouped Beckoned review D-18212. The sentence meaning and protective concern are preserved; only the corpus-wide Korean title choice remains open. |
| D-18570 | 23184 | Beggar's Bluff / refugee wordplay | not an issue | The hill, monthly arrival, refugee, and speaker's dismissive `fool` are preserved. Korean also retains `Beggar's Bluff` beside its literal rendering, so place-name canon does not block this row's meaning. |
| D-18571 | 23185 | Lyria/Lunala, Durek Axe, Tirin songs | not an issue | The three song sections, claims, and English-aligned imagery are present. Korean lineation matches English and Japanese; Chinese alone omits the blank line before `The Durek Axe`. Remaining lore spelling preferences are not translation omissions. |
| D-18572 | 23190 | Sagecrafting | not an issue | The exact label was already resolved at IDs 14693, 23190, and 55761 by D-18209 using the established official-manual term `마법물품 제작`; the active cell matches. |
| D-18573 | 23196 | stylized sleep line | not an issue | Korean retains both the speaker's intention to sleep now and the stylized lovely/sweet sleep phrase, consistent with Japanese and Chinese. Whether the string is dialogue or a UI message does not change its meaning. |
| D-18574 | 23199 | Hollow / Paling Wand | not an issue | English's capitalized Hollow is represented as `할로`, while Paling is rendered as `창백한`; the queried wand and search objective remain. Japanese and Chinese differ on the wand adjective, but the English-led Korean is a defensible direct rendering and no concrete Korean error is established. |
| Linked | 23200 | Travelers | uncertain; not recounted | Link to D-7313 and the existing corpus-wide Travelers naming issue. Korean conveys the plural traveler group; this isolated label cannot settle whether the capitalized source is a formal faction name. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23159, 23171, and 23181 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23159 | `히에로판트도 메이르도 없어진 뒤로 이리온(Irion)은 돌아오지 않았어.` | `히에로판트도 메이르도 없이 이리온(Irion)은 돌아오지 않았어.` |
| 23171 | `신비한 에너지와 조율된 선견자(Seer)는 마나를 자연적으로 회복하며 주문의 힘을 계속 키워 갑니다. 이 운명을 선택하면 숙련된 주문술사가 되어 점멸(Blink) 능력으로 짧은 거리를 순간이동할 수 있습니다.` | `신비한 에너지와 조율된 선견자(Seer)들은 마나를 자연적으로 회복하며 주문의 힘을 계속 키워 갑니다. 이 운명(Destiny)을 선택하면 숙련된 주문술사가 되어 점멸(Blink) 능력으로 짧은 거리를 순간이동할 수 있습니다.` |
| 23181 | `팀의 마지막 생존자가 된 검투사는 까마귀(Crow)가 돼. 팀에서 선수가 탈락해도 토너먼트가 계속 진행되게 하는 방식이지.` | `팀의 마지막 생존자가 된 검투사는 크로우(Crow)가 돼. 팀에서 선수가 탈락해도 토너먼트가 계속 진행되게 하는 방식이지.` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23159-23171-23181-D18562-D18574/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`51865f8296a0403a4687c5c130ba65373d1d795dc1fd0252ebd0668da1822b46`.
Post-edit SHA-256:
`ce88c5ad4bde545d5c7e85a49881b38c1549ff469424390cd8a739c9be6ad1a0`.
Reversing only the three approved cell substitutions reproduces the backup
byte for byte. The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and
73 pre-existing bare-LF endings are preserved. English, Japanese source,
Japanese-derived Korean, Chinese, and active Korean each contain all
65,135 IDs in the same order.

D-18562-D-18574 resolves thirteen keys: three accepted and ten `not an
issue`. Linked IDs 23178 and 23200 remain covered by existing uncertain
counts and are not recounted. Totals are 2,040 accepted, 23,480
`not an issue`, and 13,004 uncertain (38,524 counted). Next D-18575 at
`default` ID 23201. The earlier working dispositions are reconciled in
[`disposition-batch-default-23151-23200-20261010.md`](disposition-batch-default-23151-23200-20261010.md).
