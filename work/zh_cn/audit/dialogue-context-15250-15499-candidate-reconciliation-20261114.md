# Candidate Reconciliation: IDs `15250`-`15499`

- Date: 2026-11-14.
- Scope: all ten current ledger candidates in this range, compared with
  English, Japanese, Chinese, and the active Korean translation.
- Eight already-applied corrections were confirmed; `15473` and `15499` were
  refined after source and style rechecks.
- Asset associations support grouping only. No individual speaker or
  playback order was inferred.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `15290` | Previously applied, confirmed | English's present-tense question about exploring Lykeios agrees with Japanese. The Korean `둘러보는 건 즐거워?` does not incorrectly make it a completed past experience. |
| `15295` | Previously applied, confirmed | `미술관` matches the Gallery/Art Gallery in the Gravehal restoration context and the correction recorded in the earlier `15000`-`15999` edit batch. |
| `15316` | Previously applied, confirmed | English, Japanese, and Chinese describe Caelrod and the speaker meeting again. `다시 만나게 되어 기뻐` avoids the potentially misleading idea that they became one or joined forces. |
| `15326` | Previously applied, confirmed | The current line pairs `스마일러(Smiler)`; its English name is no longer missing. No individual speaker is inferred from the asset association. |
| `15351` | Previously applied, confirmed | The named book is paired as `세이블의 서신(Missives of Sable)`, and the sentence makes clear that it can be offered to bargain for their freedom. |
| `15400` | Previously applied, confirmed | The current plain-style line naturally conveys that the speaker has dealt with mortals for more than several lifetimes without repeating `상대`. |
| `15419` | Previously applied, confirmed | The current line uses conversational plain speech and pairs the place as `타인힐(Tinehil)`, consistent with the English and Japanese. Its Korean wording had already changed in the worktree; the stale ledger fingerprint was refreshed. |
| `15473` | Refined | English and Chinese point to those who will help, while the previous Korean used past `도움을 준`. The line now says `이 마법진의 수호자들을 처치하는 데 도움을 줄 이들`, preserving the future/conditional meaning and avoiding the repeated `처치`. |
| `15474` | Previously applied, confirmed | The current journal entry already pairs both people, including `닐 케른(Nil Kern)`. Its narrative format is retained; no speaker is inferred. |
| `15499` | Refined | English, Japanese, and Chinese compare the addressee with the speaker as a hero, not with the speaker's lifetime deeds. The sentence now says `넌 나보다 열 배는 더 훌륭한 영웅이야` and uses natural plain speech, including `정말 기대돼`. This source-based correction supersedes the earlier retain decision in the `15000`-`15999` edit-batch report. |

## Related Finding

- `15342` is not included in the ten-candidate count: its ledger's overall
  disposition is `uncertain`, although the format field is marked candidate.
  `크리살라이(Chrysalae)` already includes the English pairing; the canonical
  Korean form remains unresolved under the existing terminology hold and was
  not guessed here.
- The linked assets and their handlers do not establish a particular
  speaker, branch, addressee, or playback order for these rows.

## Verification

- All ten in-range candidates are reconciled; cumulative reconciliation is
  870 / 4,015 (21.67%), with 3,145 remaining.
- Only `15473` and `15499` were edited in this pass. Fingerprints were
  refreshed for those IDs and for the already-edited `15419`; all 65,135
  ledger fingerprints now validate.
- Index and catalog reproducibility checks passed. The preservation-tool
  tests (11) and dialogue-context-index tests (9) passed.
- The active CSV retains its UTF-8 BOM, 65,135 ordered records, 71,838 CRLF
  and 244 LF-only line endings, with no bare CR. The CRLF-aware diff check
  passed.
- Source CSVs and extracted game assets were not changed.
