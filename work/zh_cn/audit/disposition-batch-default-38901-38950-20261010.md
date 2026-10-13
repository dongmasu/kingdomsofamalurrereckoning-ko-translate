# Disposition Batch: `default` IDs 38901-38950

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, two `not an issue`, and four uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38909 | Domus Politica / `정치회관(Domus Politica)` | Uncertain: the institution's name has recurred with several Korean forms. The translation is understandable and traceable, but this row cannot establish the canonical Korean name or parenthesis convention. |
| 38918 | Scurvy / `비열한 놈` | Not an issue: English is ambiguous between the disease and an insult, but Japanese clearly uses a scoundrel/villain sense. Korean follows that insult reading; the Chinese disease rendering is a source-locale divergence, not proof of a Korean error. |
| 38934 | the Sorrows / `소로우즈(House of Sorrows)` | Uncertain: English says the branch locates the Sorrows without naming the House. Japanese, Chinese, and Korean give different entity readings; prior decisions do not establish that this is specifically the House of Sorrows. |
| 38941 | Orison / `오리슨(Orison)` | Uncertain: English capitalization and Japanese transliteration support a name, while Chinese reads as prayer. This conflicts with ID 38699's generic Korean `기도`; prior Orison decisions defer its identity and standard form. |
| 38950 | Ratofer's Charter / `라토퍼의 인가장` | Uncertain: English and Japanese indicate a charter/document, while Chinese suggests a permit. Korean's authorization-certificate wording is plausible, but the item function is not established by this label. |
| Other rows in IDs 38901-38950, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- Earlier Domus Politica findings at IDs 38018, 38073, and 38258 remain open.
- Sorrows identity and Orison's rite/name status remain unresolved in prior
  decisions, including the recently recorded IDs 38621, 38699, and 38934.
- The source-keyed audit has a documented gap for IDs 37700-40349. These
  are working dispositions, not independent linguistic approval.

## Verification

- The four source locales contain IDs 38901-38950 once and in matching order.
- Runtime structure and line breaks match in the preliminary comparison;
  `{LINE_SPACE}`, nested markers, `{1}`, and the listed staff damage values
  are preserved.
- No CSV bytes changed. Active default CSV SHA-256 remains
  `45b41507cbcbce6468e5f18194e71a870b6f6c1e955774299f9b3c3de25ddc5a`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38950. Resume at ID 38951; 26,184
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38951-39000-preliminary.md`. The next unused decision ID is
D-12514.
