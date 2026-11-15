# Sequential `default` Revalidation: IDs `9500`-`9749`

- Date: 2026-11-11.
- Scope: current Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Seventy-two existing ledger records have current fingerprints and retain
  their dispositions. All 178 previously unrecorded IDs were compared and
  recorded.
- Thirteen new IDs have correction candidates. Nine have evidence-limited
  findings; none overlap.
- No translation CSV, source resource, or extracted game asset was changed.
- Of the 178 new IDs, 136 have indexed asset links and 42 do not. Asset links
  remain context clues, not proof of a line's speaker or playback order.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9568` | Name/title pairing | `Lord Godric Payne` is paired only as `고드릭 페인(Godric Payne) 경`. Consider pairing the full source form as `고드릭 페인 경(Lord Godric Payne)`, preserving the speaker's confident, flattering tone. | High |
| `9577` | Name pairing | The sentence names Nuala, Cadoc, and Aethan, but only Cadoc is paired. Add source-local English to the other two short names without expanding them to surnames from separate records. | High |
| `9597` | Name pairing | `Ansilla` is an explicit place/person name in the strategic statement but has no English pairing. Consider `안실라(Ansilla)`; retain the barrier image and the plan to topple Ansilla. | High |
| `9627` | Name pairing | `Teeth of Naros` is the confirmed named region, with canonical Korean `나로스의 이빨(Teeth of Naros)`. The current row omits the English name. | High |
| `9646` | Name pairing | The capitalized `the Executioner` is the named figure being introduced, not an ordinary executioner role. Consider the established `처형인(The Executioner)` pairing; preserve the speaker's boastful teaching offer. | Medium |
| `9647` | Name pairing | Of the four named ettin shamans, only Duxtir has English. Pair Ansir, Merog, and Sul individually, preserving the four-target objective and the warning that the party may not return. | High |
| `9673` | Name pairing | `House of Sorrows` is the confirmed faction `비탄의 집(House of Sorrows)`, but the phrase is unpaired here. Preserve the explanation of why death troubles the House's Fae. | High |
| `9684` | Name/title pairing | `Motus Mining Village` is rendered `모투스 광산 마을` without the source label. Consider pairing the full displayed name, while keeping it distinct from the registered Motus Mining company. | Medium |
| `9691` | Name pairing | `Crying Eyes` is the confirmed site name `흐느끼는 눈(Crying Eyes)`. The location is unpaired at its first mention in this passage. | High |
| `9721` | Name pairing | `House of Sorrows` is unpaired, as is the place `Ysa`; consider pairing both as `비탄의 집(House of Sorrows)` and `이사(Ysa)`. Preserve the report of Cydan's refuge and the speaker's shame. | High |
| `9744` | Name pairing | `Foe's Hearth` is a named meeting place in Cursewood but appears only as `포즈 하스`. Consider `포즈 하스(Foe's Hearth)` without treating it as an alias of Cursewood. | High |
| `9746` | Objective naturalness | `Deal with Nuer's Blasphemy` becomes the stiff `신성모독을 처리하라`. Japanese explicitly uses “stop”; consider `누어(Nuer)의 신성모독을 막아라`, retaining the objective form. | High |
| `9748` | Name/title pairing | The complete card/person label `Irion, King of Cups` is only partially paired as `컵의 왕 이리온(Irion)`. Consider pairing the full label, retaining the established `이리온(Irion)` spelling. | High |

## Evidence-Limited Findings

| ID | Dimension | Reason |
| ---: | --- | --- |
| `9526` | Meaning / place type | English `Mission well`, Japanese monastery well, and Chinese preaching-place well do not establish whether `Mission` is a named site or an institution. Preserve the current objective pending its location context. |
| `9529` | Meaning / text type | English `Corpsman` usually denotes a medical role, while Japanese and Chinese say “corpse.” The isolated label does not resolve whether this is a role, entity, or UI term. |
| `9533` | Meaning | `Staff of Seawatch` may mean employees/household staff or retainers. Japanese supports retainers, Chinese supports inhabitants, while Korean chooses `신하들`; do not settle the social role from this row alone. |
| `9554` | Meaning / poetic form | The compressed rhyme and syntax are intentionally strange across all four languages. The Korean preserves the crawling/flower/root/bleeding-sun imagery, but the final `Dead and married be` remains unclear; do not rewrite it as ordinary prose. |
| `9581` | Localization status | `Business Development Manager` remains English in English, Japanese, and Korean, while Chinese translates it. The isolated string may be a deliberate role label or untranslated UI text; verify its use before changing it. |
| `9630` | Meaning / title status | `The Light of Day` can be a title or an ordinary phrase, and the row lacks context to decide whether `한낮의 빛` is a name or a literal rendering. |
| `9639` | Text type / localization status | `Other Voices` is unchanged in English, Japanese, and Korean but translated in Chinese. Without knowing whether it is a title, test label, or UI entry, preserve it. |
| `9650` | Meaning / name status | `Fae Hollows` may refer to the Fae's caves generally or to a named location/category. The current `페이(Fae)의 동굴` preserves the broad reading; do not invent a place-name annotation. |
| `9723` | Meaning / place status | Capitalized `the Quarters` may be a named district or a generic shelter/quarters. Japanese and Chinese do not settle the referent, so retain `쿼터스` pending scene context. |

## Duplicate and Structural Checks

- Fifty-four exact-English duplicate groups touch the range, comprising 1,102
  rows across the corpus. All groups have matching Korean translations.
- Logical line-break counts match across English, Japanese, Chinese, and
  Korean for all 178 new IDs. Runtime/layout token identities and counts also
  match. At `9729`, Japanese and Chinese place `{1}` before the fast-travel
  label, while English and Korean place it after; Korean follows the English
  instruction order and remains intact.
- Eight Korean strings contain 28 existing embedded CRLF breaks:
  `9536` (1), `9583` (6), `9603` (3), `9647` (6), `9652` (4), `9690` (2),
  `9714` (3), and `9733` (3). All were preserved.
- Current terminology records supersede older open questions: `Felltown` at
  `9500` is correctly `펠타운(Felltown)`; `Scholia Arcana` at `9530` and
  `9713` uses the established `스콜리아 아르카나(Scholia Arcana)`; `The
  Midden` at `9537` uses `미든(The Midden)`; and `Southern Lights` at `9739`
  uses the confirmed `남극광(Southern Lights)`.
- `9536` already contains the previously accepted broader `모든 날붙이`
  wording. `9539` and `9546` also retain their previously accepted revisions.
  No earlier disposition was reopened.
- No individual speaker or playback order was inferred from asset membership.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
