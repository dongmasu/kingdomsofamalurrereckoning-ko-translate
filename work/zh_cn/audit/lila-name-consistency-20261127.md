# Lila Name Consistency

- Date: 2026-11-27.
- Scope: all active `default` occurrences of the English name `Lila`, plus
  every Korean `릴라` occurrence in the three active localization CSVs.
- Canonical forms: `라일라(Lila)` for short references and
  `라일라 재닉(Lila Janick)` for full-name references.
- Pronunciation: the user confirmed “라일라” after listening to the name.

## Findings

The English candidate index links `Lila` to 11 `default` IDs:
`13140`, `15532`, `27248`, `29240`, `30697`, `30727`, `37465`, `41977`,
`42131`, `63566`, and `63609`. All four language rows were compared by ID.
Japanese `リラ` / `リラ・ジャニック` corroborates the reading; Chinese
supports the identity.

The active Korean files contained exactly two `릴라` rows, at `default:30697`
and `default:30727`; both refer to Lila. The other inconsistent Korean
spellings were also standardized at `default:13140`, `37465`, `41977`, and
`42131`. Existing canonical spellings at `15532`, `27248`, `29240`, `63566`,
and `63609` were retained. Short-name mentions, including repeated mentions
within a row, now carry `(Lila)`; complete names use `(Lila Janick)`.

At `default:13140`, English says “my sister Lila,” not “brother.” Japanese
specifies an older sister (`姉`) while Chinese specifies a younger sister
(`妹妹`), so the Korean corrects `형제` to age-neutral `자매` and does not
choose `언니` or `여동생`. At `default:30727`, English `She's` supports a
female pronoun but does not establish sibling age; the Korean uses `그녀는`.

The `person:lila-janick` glossary entry covers the full name and short-name
alias. The occurrence index records all 11 IDs and retains the dispositions
of its other entities.
