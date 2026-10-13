# Disposition Batch: `default` IDs 39101-39150

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, two `not an issue`, and three uncertain.
- CSV changes: IDs 39116 and 39122.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 39106 | Skoria / `스콜리아인` | Uncertain: English and Chinese support a Skoria identity and Japanese specifies a family, but the isolated line does not establish whether this is a family, people, or occupational lineage. Avoid an unsupported rewrite. |
| 39116 | Mel Aglir / `멜 아글리르는 엉망이야` | Accepted: remove the unsupported blanket judgment “is a mess” and render the source's list of Tuatha, the hiding local Lord, and unrest directly. Applied `하! 멜 아글리르에는 투아사가 돌아다니고, 현지 영주는 요새에 숨었고, 사방에 불온한 기운이 감돌아. 떠날 때 나도 데려가 줄래?` |
| 39119 | God-Gift / `고대의 신성한 선물` | Uncertain: English and Chinese identify a gift from God/gods, and Japanese says it was granted from heaven; whether God-Gift is a formal named concept and how to render it consistently remain unresolved. |
| 39122 | Sprite Infestation / `스프라이트 출몰` | Accepted: `출몰` is materially milder than English `Infestation`, Japanese's rampant/proliferation reading, and Chinese's calamity wording. Applied `스프라이트 창궐` to retain the intensity without inventing an attack. |
| 39131 | Pledgeshield Grunberg / `서약방패 그룬베르크` | Uncertain: the character is identified, but prior findings D-3831 and D-5429 and active variants leave the rank's canonical Korean form unresolved. |
| 39133 | `Fall, usurper!` / `쓰러져라, 찬탈자여!` | Not an issue: English and Chinese support “usurper,” which Korean preserves. Japanese's “plunderer” is a source-locale divergence, not evidence for changing the English-based Korean. |
| Other rows in IDs 39101-39150, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: the preliminary scan and source comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- This range falls within the documented source-keyed audit gap at IDs
  37700-40349. Prior Skoria, God-Gift, and Pledgeshield questions remain open
  and were not treated as approval.
- The Sagecrafting label at ID 39107 uses the manual-backed project term.
- The Japanese divergence at ID 39133 is retained as a source note; English
  remains the meaning authority.

## Verification

- The preliminary four-locale comparison reports matching keys/order, line
  breaks, and runtime markers; the F5 label at ID 39127 is preserved.
- The CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF endings.
- SHA-256 after the two accepted corrections:
  `2c7518f4ecefc3e05d81cf5e35d994c6739aa6951505d46d4397b44e2507613c`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 39150. Resume at ID 39151; 25,984
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-39151-39200-preliminary.md`. Decisions D-12530 through D-12536
are recorded in the register; the next unused decision ID is D-12537.
