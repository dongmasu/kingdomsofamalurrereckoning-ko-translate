# Preliminary Language Scan: `default` IDs 8600-8649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8600-8649.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8601 | `Sceptres` → `홀` | Confirm the established Korean name for this weapon category and keep both damage modifiers attached to it. | Korean preserves +4 physical damage and +15% damage on separate lines; the category is rendered as `홀`. | Medium |
| 8608 | `Arcane Carrack` → `비전의 대형 범선` | Determine whether this is a specific ship type, named item, or fantasy location before fixing the Korean term. | English names a carrack; Japanese and Chinese also indicate a carrack/large sailing vessel, while its in-game category is not given here. | Medium |
| 8610 | `Even` → `짝수` | Resolve whether this isolated label means an even number or a tie/game result; reconcile with ID 8342. | Japanese and Korean read “even number”; Chinese reads “tie.” Neither English occurrence has enough context by itself. | Low |
| 8617 | Scaith / descendants / Scaith blood | Determine whether `Scaith` names an individual, people, or family and preserve the curse's ancestry relation. | Korean retains the bones hunting descendants and their hunger for Scaith blood; Chinese explicitly treats Scaith as a family/group. | Medium |
| 8619 | `Beggar's Bluff` → `거지의 벼랑` | Confirm the named place and whether `Bluff` is a cliff, bluff, or district; retain the speaker's derogatory framing of refugees. | English capitalizes the place name; Japanese and Chinese also interpret it as a cliff. Korean adds the English name in parentheses. | Medium |
| 8624 | `second his duel` → `입회인` | Clarify the role of a “second” in the duel: assistant/representative versus a mere witness; retain the bargain and colloquial voice. | English uses the specific duel role `second`; Japanese says attendant and Chinese says deputy, while Korean's `입회인` may imply only attendance/witnessing. | Medium |
| 8625 | Crows / Magnus / Arena Grand Champion | Keep the tournament result and leadership-to-title inference clear; align the `Crows` name with IDs 8393 and 8549. | Korean retains the champion sequence and renders Crows as `크로우스`, matching ID 8549 but differing from `크로우즈` at ID 8393. | Medium |
| 8627 | Aloff / Chernobog / Bolgan offering | Preserve the ten Bolgan requirement, their eyes as the offering, and the condition for being deemed worthy to fight. | Korean retains the count, offering, lair, and worthiness condition. Proper-name forms remain candidates. | High |
| 8629 | `Tindertwig` / `{*3Fire}` | Preserve the plant-name question and localized marker identity/order; do not treat the translated marker label as a structural mismatch. | All locales retain marker ID `*3` in the same order; its visible label is localized (`Fire` / `炎` / `火焰` / `화염`). | High |
| 8637 | `Beckoned!` → `선택받은 자여` | Confirm whether `Beckoned` is a formal title/address and standardize against other occurrences; preserve the urgent address and betrayal question. | Korean renders the title by meaning; the English capitalization and prior Beckoned notes suggest a recurring title. | Medium |
| 8639 | malformed Archsage/possession quest sentence | Retain the apparent objective without concealing that the English is grammatically defective; clarify the relationship between indifference, possession, and the sorceress only with context. | Korean follows the apparent Japanese/Chinese reading that the sorceress is fostering indifference and must be stopped from controlling the Archsage. | Medium |
| 8645 | `Gallows End` → `교수대의 끝` | Reconcile with the established place-name candidate `갤로스 엔드` at ID 48400 and repeated literal renderings at IDs 8401 and 8464. | English names the island; active Korean again translates the name literally. | High |
| 8646 | Sylvan spear / Tuatha / Spire | Verify the material/name sense of `sylvan` and standardize Tuatha; retain the imagined battle and life beyond the Spire. | Japanese calls the spear Silvanite, Chinese uses a wooden spear, and Korean says `실바나이트`. Korean uses `투아타`, inconsistent with `투아사` elsewhere. | Medium |
| 8649 | Ametair / Aergase / Arduath / Sidhe / `deal with` | Standardize the names and `hollow` location; avoid fixing `deal with Ametair` as “kill” unless context confirms it. | English is nonspecific, Japanese says confront, Chinese says negotiate, but Korean explicitly says `처치하고` (kill). | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8608, 8619, 8629, 8639, and 8649
  against all four language rows.
- ID 8610 remains linked to the earlier ambiguity at ID 8342. The Crows
  spelling at ID 8625 agrees with ID 8549 but not ID 8393. The literal
  `Gallows End` form at ID 8645 repeats the candidate already recorded at
  IDs 8401 and 8464.
- Historical candidate wording remains evidence only and does not authorize
  translation edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- Runtime-marker IDs and order match after treating localized `{*3...}`
  display labels as the same marker ID. ID 8629's `Fire` label is translated
  in all target texts as expected.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.

## Batch Status

IDs 8600-8649 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
