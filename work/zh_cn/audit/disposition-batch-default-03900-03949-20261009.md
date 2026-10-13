# Disposition and Edit Batch: `default` IDs 3900-3949

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 3900-3949.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Twenty-two findings were dispositioned: five accepted, three `not an
  issue`, and fourteen uncertain. Five accepted corrections were applied to
  five `Texto` cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3901 | `Nerenne` name rendering | Keep the traceable source name; no evidence supports a different spelling. | D-865: not an issue. |
| 3902 | `A fine day to you` greeting | Replace the literal good-day wish with a natural Korean greeting. | D-866: accepted. |
| 3903 | Bridgette's paradoxical identity statement | Preserve the statement without guessing possession or impersonation. | D-867: uncertain. |
| 3905 | Wife/monster/demon reveal | Preserve the English-led wording; the story referents and Japanese divergence remain unresolved. | D-868: uncertain. |
| 3906 | Underworld/job slang | Keep the neutral wording until the job's context establishes whether a criminal register is intended. | D-869: uncertain. |
| 3907 | `Tapestry` and `justice` lore terms | Defer terminology normalization pending corpus-wide context. | D-870: uncertain. |
| 3908 | `Bursars` institution/group | Defer the referent and number interpretation; the English has a number-agreement error. | D-871: uncertain. |
| 3911 | Exporter phrase naturalness | Replace the awkward modifier while retaining the unresolved landscape/fire imagery. | D-872: accepted. |
| 3913 | Delf, mission, and Red Legion deserters | Defer institutional naming and the dagger/deserter relation pending context. | D-873: uncertain. |
| 3915 | `Flame Locus` mechanic | Keep the established Korean mechanic term and supported removal action. | D-874: not an issue. |
| 3919 | `Child of Dust` | Defer title/species status and canonical lore terminology. | D-875: uncertain. |
| 3920 | Cult behavior not converting the speaker | Restore the explicit religious/conversion sense in natural Korean. | D-876: accepted. |
| 3923 | Beasts that act civilized | Replace the stiff literal phrase with a natural appearance-versus-reality contrast. | D-877: accepted. |
| 3930 | `Orison` | Keep the current traceable term until its rite/role/prayer referent is known. | D-878: uncertain. |
| 3932 | `Craft Hall` | Keep the plausible Korean wording; defer whether it is a proper location name. | D-879: uncertain. |
| 3935 | `a mite more coin` | Correct `훨씬` to reflect the source's small difference in amount. | D-880: accepted. |
| 3936 | `You know your place` | Preserve the current wording because the approving/condescending tone is unresolved. | D-881: uncertain. |
| 3937 | `Aggressive Progress Dial` | Defer whether this is internal/debug text or player-facing UI. | D-882: uncertain. |
| 3938 | `Pillager's Fulcrum` | Defer item type and proper-name/term choices. | D-883: uncertain. |
| 3941 | `Good luck on the wall` | Defer the wall-related activity because the isolated line lacks context. | D-884: uncertain. |
| 3944 | Inaccessible darker places | Preserve the image; physical versus metaphysical location is unresolved. | D-885: uncertain. |
| 3947 | Star Camp group's shared wish for Grim | Retain the three supported propositions and the group relationship. | D-886: not an issue. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 3902 | `좋은 하루 보내세요.` | `안녕하세요.` | D-866 |
| 3911 | `...라시르(Rathir)에 기반을 둔 수익 좋은 수출업자였지.` | `...라시르(Rathir)를 거점으로 큰 수익을 올리던 수출업자였지.` | D-872 |
| 3920 | `...이런 광신적인 행동을 봐도 마음이 바뀌지 않아.` | `...이런 광신적인 행태를 봐도 내게 신앙심이 생기진 않아.` | D-876 |
| 3923 | `...문명화된 것처럼 굴지만 전혀 그렇지 않아.` | `...문명적인 척하지만 실상은 전혀 아니야.` | D-877 |
| 3935 | `...네가 지금 가진 것보다 훨씬 더 많은 돈이 걸리지.` | `...네가 지금 가진 돈보다 조금 더 많이 걸지.` | D-880 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  3900-3949 once and in identical order.
- Embedded line-break counts and runtime markers were checked across all four
  locales in this range; no line-break or marker exception was introduced.
- The five accepted edits change only the approved Korean `Texto` cells and
  do not alter keys, row order, line breaks, or runtime markers.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `cd64e858bc0eb64ca2fd32239e7182fc988caa2ef3a8f865b1224fbdd2978c85`
- Cumulative dispositions: 204 accepted, 159 `not an issue`, and 523
  uncertain. Resume at `default` ID 3950.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
