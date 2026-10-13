# Disposition Batch: `default` IDs 55651-55700

- Date: 2026-10-10. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- One accepted correction, 36 `not an issue` IDs, and 13 uncertain IDs.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 55693 | `몇 년 늦긴 했지만 내가 처녀 역할을 할게.` | `몇 년 더 나이를 먹긴 했지만, 내가 처녀 역할을 할게.` | English's “a few years too late” is an age joke: Japanese explicitly says she is a little too old, and Chinese also frames it in terms of age. The prior Korean read it as simply being late. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55653 | Uncertain | The Gale Crossing reference is clear, but Japanese phonetic and Chinese translated forms do not establish a canonical Korean place name. |
| 55655 | Uncertain | Menetyre is retained with its English form; Japanese and Chinese phonetics differ, so a canonical Korean spelling remains open. |
| 55657 | Uncertain | The Might path's melee/toughness/stun/heavy-weapon description is preserved, but the canonical game-school label requires alignment beyond the established `힘` attribute term. |
| 55664 | Uncertain | The boast of being king and protector is conveyed; whether `Undersewer` is a named place or comic description remains unclear. |
| 55669 | Uncertain | The Tuatha/Fae distinction and lack of remorse are retained; `High King` has competing title forms elsewhere in the corpus. |
| 55671 | Uncertain | English says `mission`, Japanese specifies a monastery, and Chinese a preaching institution; the Korean institution type cannot be confirmed. |
| 55678 | Uncertain | The grate, entry to the vaults, search for the Missives, and one-way exit warning are retained; `Livrarium`, `Missives`, and the access structure need setting context. |
| 55679 | Uncertain | The descriptive Korean label is plausible, but `Cureseeker` may be a formal title or group name. |
| 55682 | Uncertain | The repair/follow objective is clear; canonical terms for Chaos Sword, Skald, and Cinderpit remain provisional. |
| 55683 | Uncertain | `+1`, the first two tiers, and all three ability categories are retained; exact game/UI scope of the tier bonus needs context. |
| 55690 | Uncertain | Distance from the front and mistaken expectation of safety are preserved; canonical Korean form for `Faelands` varies across the corpus. |
| 55691 | Uncertain | Korean follows English and Chinese's retribution reading of `he'll get his`; Japanese instead suggests he may someday become master of the place, leaving a source/context conflict. |
| 55692 | Uncertain | The Petal-to-elixir purpose is retained, but the identity and number/category implied by `the Almain` and the ingredient's name remain open. |

## Not an Issue

The remaining 36 IDs preserve the apparent English meaning and structure.
Among the preliminary candidates, the Motus Mining idiom at 55659 conveys
the company's established presence; the red-name and line-space markers at
55661 are intact; the accepted `부름받은 자` form and fate-vision statement
at 55663 are retained; the miner's resolve at 55666 is preserved; context
supports the explicit Fate reading at 55673; draft ale at 55675 is supported
by Japanese; the unclear food referent and interrupted letters at 55687 and
55698 remain unresolved rather than invented; and Korean follows the English
idiom at 55700 despite Japanese's literal-cold reading.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55651-55700 once
  in identical ascending order; each default CSV contains 65,135 records.
  There are no embedded line breaks in this batch. At 55661, all locales
  preserve the `{*2...}` marker followed by `{LINE_SPACE}`; the translated
  marker payload is localized as expected.
- Rechecked the source-keyed historical entry for IDs `55650-55749`.
  It flags the names, path, corporate idiom, marker text, title, mission,
  Fate reference, ale, Livrarium/Missives, Cureseeker, weapon/puzzle terms,
  ability tiers, unresolved pronouns, Faelands, `he'll get his`, Petal/
  Almain, and the role-play age joke. The cross-locale age evidence supports
  the accepted correction at 55693; the other historical prompts remain
  provisional unless dispositioned above.
- The pre-batch active CSV and byte-identical backup both hash to
  `b7f2d4e954b22835187090dafa6559abdd1de6e4dd97b99706d757b4d7733e84`.
  Backup:
  `/private/tmp/ko-translate-backups/20261010/locatexts_zh_cn.koalocatext_default.before-resume-55651.csv`.
- Post-edit active CSV SHA-256:
  `4a6fe2e92b2eacfdfff0e5907554e3bd78d09e55bc877a8088c1db4487731384`.
  Only the approved `Texto` cell at ID 55693 changed. The UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings are preserved.

Decisions D-16794 through D-16808. Direct register totals after this batch:
1,631 accepted, 10,995 `not an issue`, and 10,335 uncertain (22,961 total);
next D-16809.

Resume at `default` ID 55701; 9,434 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-55701-55750-preliminary.md`](default-ids-55701-55750-preliminary.md).
