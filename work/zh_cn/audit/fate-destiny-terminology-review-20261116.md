# Fate and Destiny Terminology Review

- Decision: D-21882
- Review period: 2026-11-15 to 2026-11-16
- Scope: English `Fate` / `Destiny` terminology in `base`, `default`, and
  `affix`, checked against aligned Japanese, Chinese, and Korean rows.

## Decision

Use `운명` for `Fate` and `숙명` for `Destiny`. English determines which term
is being translated; Japanese `運命` / `宿命` corroborates the distinction,
and Chinese is supplementary evidence. This is a project-specific terminology
decision, not a claim that the English words are never synonyms in ordinary
English.

The distinct source labels are now:

| English | Korean |
| --- | --- |
| `Codex of Fate` | `운명의 서(Codex of Fate)` |
| `Codex of Destiny` | `숙명의 서(Codex of Destiny)` |
| `Destiny Stone` | `숙명의 돌(Destiny Stone)` |
| `Unbind Destiny` | `숙명의 속박 풀기(Unbind Destiny)` |
| `of Destiny` (`affix:304`) | `*숙명*` |

The Korean distinction between the two Codex labels does not establish whether
they refer to the same physical object. The older D-21512 and D-21736 records
remain intact as historical decisions; D-21882 supersedes only their Korean
canonical wording.

## Scope And Application

The English `default` source contains 166 keys with the whole word `Destiny`
or `Destinies`. The review changed 162 Korean cells; four already kept the
distinction: `35295`, `43931`, `48728`, and `54424`. The five `base` source
keys (`2705`, `2750`, `2787`, `4625`, `4647`) were updated. All six active
variants of `affix:304` were updated. In total, 173 Korean text cells changed.

In mixed-source rows, the edit was limited to the Korean span corresponding
to `Destiny`; `Fate` remains `운명`. This includes `default:1369`, `2005`,
`2064`, `5514`, `6602`, `7042`, `10351`, `11329`, `17034`, `39846`, `40865`,
`43425`, `44413`, `48215`, `48429`, `52956`, `54811`, `59512`, `60101`,
`60407`, and `61101`. Existing `Fateless One` wording `운명 없는 자` was
preserved at `33922`, `35295`, `43931`, and `54803`. Other established Fate
terms, including `Fateweaver`, `Fateweaving`, `Twists of Fate`, `Essence of
Fate`, and `Tapestry of Fate`, were not normalized to `숙명`.

The reusable glossary now distinguishes `Codex of Destiny` and `Destiny
Stone` from `Codex of Fate`. The translation-exception index records the
general term boundary and the affix delimiter. The dated decision register
and earlier audit reports were not rewritten.

## Application And Verification

The reproducible application plan is
[`apply-fate-destiny-terminology-20261115.py`](apply-fate-destiny-terminology-20261115.py).
It checks the source-key counts, applies mixed-source rules by ID, and invokes
`tools/replace_text_preserve_eol.py` with the full expected old text for each
cell.

After application, only the 162 changed `default` IDs' four-language
`source_fingerprint` fields were refreshed. The proper-name occurrence index
was synchronized for 174 cached Korean snapshots across 81 indexed keys,
using byte-span edits to preserve its mixed line endings and all other fields.
The exact-English repeated-source index was regenerated from the active
four-language tables.

English, Japanese, and Chinese source files were not modified. All unrelated
CSV fields, row order, IDs, variants, and review dispositions were preserved.
