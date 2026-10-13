# Preliminary Language Scan: `default` IDs 10200-10249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10200-10249.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10201, 10245 | `Circle of Engard` → `엔가드의 결사` | Confirm whether `Circle` is an organization, place, or both; align the proper name across the title and return objective. | Both Korean rows use the same form. Japanese transliterates the name and Chinese interprets it differently, so the English source does not settle the institution type. | Medium |
| 10203 | Gale Crossing / “Not in Gale Crossing” | Confirm the place-name form and retain the speaker's fear-driven refusal to go out after dark. | Korean preserves the contrast and emphasis; the final `더더욱` gives a natural emphatic reading of the fragment. | Medium |
| 10209 | Shieldring / Helmgard / Ironfast / Faelands | Align the keep and region names with recurring place spellings. | Korean preserves all three keeps and their locations; their current forms are plausible but remain unverified against the official terminology source. | Medium |
| 10212 | `thresh` / eastern Sidhe → `스레시` / `시데 동부` | Confirm the creature name and align the Korean regional form for Sidhe. | Korean retains the unknown creature as a transliteration. The corpus uses both `시드` and `시데` for Sidhe; this row uses the latter. | Medium |
| 10215 | `Mitharan sound` → `미타란의 소리` | Confirm whether this is a musical tradition/style, the sound of a place, or another named concept. | Japanese explicitly reads it as Mitharan music; Korean's literal “sound” preserves the ambiguity but is less idiomatic without context. | Medium |
| 10222 | `Trigger Arrows` → `기폭 화살` | Confirm whether this is a named ability/item and whether `trigger` means explosive detonation or activating arrows. | Korean preserves the compact UI-label shape, but the isolated row does not identify the mechanic. | Medium |
| 10224 | `Difficulty: {*1Easy}` | Preserve the localized label while validating the runtime marker identity/order. | The embedded payload is localized (`Easy` / Japanese and Chinese equivalents / Korean `쉬움`); all four rows retain the same `*1` marker at the same position. This is not a structural discrepancy. | High |
| 10225 | Kollossae / `Beckoned` → `콜로새` / `선택받은 자` | Align the people-name and determine whether `Beckoned` is a formal title. | Korean retains the gratitude and direct address. The Japanese omits the title and Chinese uses a chosen-one reading; the title remains context-dependent. | Medium |
| 10226 | mining `claim` → `채굴권` | Confirm whether `claim` means a mineral claim/site or a more general possession. | Korean preserves the attempted taking and near-loss; Chinese also supports a mining-claim reading, while the English alone is broad. | Medium |
| 10236 | Fyragnos / Belen / “death's greath throes” | Review the four-stanza chant's names, imagery, source typo, and cadence together. | Korean preserves the stanza pattern and all 15 source line breaks. It renders the apparent source typo `greath` through the intended “death throes” image; the proper names remain provisional. | Medium |
| 10242 | source typo `Get ouuta here.` | Preserve the clear dismissive intent without reproducing a likely typo. | Korean `여기서 꺼져` conveys “get out of here”; Japanese also uses a concise dismissal. | High |
| 10246 | `Hark! That face ... it is none other!` | Preserve the archaic admiration while leaving the referent of `it` unspecified. | Korean uses `보라!` (“behold”), supported by the visual description of the face. The source's `Hark` and omitted referent remain context questions. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 10201, 10209, 10212, 10225, 10236,
  and 10246 against the active English, Japanese, Chinese, and Korean rows.
- Compared the repeated `Circle of Engard` title/objective forms at IDs 10201
  and 10245.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV line-break counts and runtime-marker identities/order match
  throughout this range. ID 10236 retains its source lineation; ID 10224's
  localized `*1` label text correctly differs by language.
- The numeric and runtime identities in ID 10202 are retained in the same
  `{3}`, `{1}` order across all four locales.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat name and term questions above as settled.

## Batch Status

IDs 10200-10249 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
