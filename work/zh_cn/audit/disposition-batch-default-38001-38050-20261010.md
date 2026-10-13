# Disposition Batch: `default` IDs 38001-38050

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: five accepted, six `not an issue`, and four uncertain.
- CSV changes: IDs 38003, 38007, 38032, 38037, and 38046.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38001 | Return to Karth / `카스(Karth)에게` | Not an issue: Karth is the person identified elsewhere as Nanne's apprentice; the Korean dative is appropriate. Japanese's `カースの元へ` and Chinese's “go back and find Karth” support returning to him, not to a place. |
| 38003 | The Widow / `과부` | Accepted: change to `위도우(The Widow)`, reusing the accepted named-spider figure form at ID 3406 (D-703) and established display at IDs 3166 and 5939. |
| 38007 | Blood Plague / `혈액 역병` | Accepted: change to `혈역병`, reusing the explicit established-term disposition at ID 22310 (D-6997) and the dominant disease-name form in the active corpus. |
| 38008 | Saturnyn / `사투르닌` | Uncertain: the identity relation is preserved, but locale transliterations differ and a canonical Korean name is not established by this line. |
| 38010 | Arvia / `아르비아(Arvia)` | Uncertain: identity and source spelling are retained; authoritative pronunciation evidence for the Korean phonetic form is unavailable. |
| 38011 | The Queen On Eight Legs Marching | Not an issue: Korean retains both the queen and the marching-on-eight-legs image; the row alone does not establish a fixed title requiring a shorter form. |
| 38014 | `{3}`, `{1}`, `{2}` | Not an issue: all positional markers and their English order are preserved; Japanese alone reorders `{1}` and `{2}` for localized syntax. |
| 38018 | Domus Politica / `정치회관(Domus Politica)` | Uncertain: the institution is identifiable, but its Korean naming and parenthetical display convention remain unsettled across the corpus and locales. |
| 38023 | Anokatos / Ethene contact account | Not an issue: Korean preserves the English agency that Ethene contacted Anokatos. Japanese changes this to a prior contract and Chinese reverses the contact direction; neither overrides the English source. |
| 38032 | `scope of my people's fate` / `운명의 참상` | Accepted: revise to `우리 민족에게 닥친 운명의 전모` to restore the extent/full-course meaning without adding an explicit calamity absent from English. |
| 38037 | `Damn this wound....` / `이 상처만 아니었어도...` | Accepted: revise to `젠장, 이 상처...`; remove the unsupported counterfactual while retaining the frustrated interruption. |
| 38040 | Teeth of Naros / `나로스의 이빨` | Not an issue: this matches the established Korean region name recorded at ID 4748 (D-1147) and subsequent decisions. |
| 38045 | banshaen Priestess / murghan | Uncertain: the awakening inference and creature presence are retained, but canonical Korean forms for both lore terms remain unsettled. |
| 38046 | `serve your keep` / `네 요새를 지켜 주지` | Accepted: revise to `네 요새에서 일해 주지`, supported by Japanese's work-at-the-keep reading and Chinese's service reading; remove the unsupported promise to defend the fortress. |
| Other rows in IDs 38001-38050 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349, so no missing historical disposition was inferred.
- Existing named-term decisions were reused where applicable: The Widow
  (D-703), Blood Plague (D-6997), and Teeth of Naros (D-1147).
- ID 38014's Japanese-only placeholder-order variation is structural and
  does not justify reordering the Korean markers.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  38001-38050 once and in identical order, as recorded in the preliminary
  structural comparison.
- Only active Korean `Texto` cells at IDs 38003, 38007, 38032, 38037, and
  38046 changed.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings. Active default CSV SHA-256:
  `a4cf3a2bbc9a0cf8cdee1932ff371c266a676d02445a67113bd69f71d52c5a1a`.

## Checkpoint

Disposition is complete through ID 38050. Resume at ID 38051; 27,084
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38051-38100-preliminary.md`. The next unused decision ID is
D-12371.
