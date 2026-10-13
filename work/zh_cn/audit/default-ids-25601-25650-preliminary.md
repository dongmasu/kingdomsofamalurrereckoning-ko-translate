# Preliminary Language Scan: `default` IDs 25601-25650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25601-25650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25601-25603 | `Day ?` / Rathir rulers / General Tilera / Piercing Light | Verify the incomplete day counter, identity of the secret governing body, and the artifact's established Korean name. | The Korean keeps the question mark and preserves the council's secrecy and the battle-readiness update. Japanese calls Piercing Light “Light Spear,” while Korean follows the English item name. | Medium |
| 25604-25612 | QA Testers / Maid / Warsworn Archer / title match / Cadogan Twayn / Kollossae / Travelers | Standardize faction/race names and determine the tournament title-match context and Travelers' origin. | Korean preserves the hired fighters' former Warsworn affiliation and the Travelers' origin question; Japanese treats QA Testers as untranslated English. | Medium |
| 25613-25618 | Briar / Camden / Bronwen / Carasta Arawyn | Verify names and preserve the letter salutation, waiting-for-Camden implication, and conversational voice. | Korean retains the “today may be the day” uncertainty and the named corner; the locale spellings vary. | Medium |
| 25621-25628 | save-space prompt / Shieldring Keep / Lorestones / Carasta trader / Ordo / `{1}` | Validate UI terminology and the placeholder; clarify the stone path and the uncertain trade reference. | All four locales retain `{1}` in the gem-removal message. English, Chinese, and Korean describe a possibly unsettled deal with the Carasta trader, while Japanese recasts the line as an already-needed trade. | High |
| 25632-25637 | Dydyn letter / graylung / Acae / Walen / Fae Blades / Walls | Verify names and the disease term; determine whether “Walls” is a district, institution, or literal walls. | Korean preserves the formal casualty notice and leaves “brother” gender-neutral as `형제`; the disease is rendered as gray-lung disease. The Walls passage describes a labor system supporting a small leadership group. | Medium |
| 25639-25643 | Jakasen / Bristletongue / Font / Mercantile / Hireling | Standardize proper names and the skill label; confirm the role/category represented by `Hireling`. | Korean retains the headache-related loss of memory. Japanese renders `Hireling` as “third-class mercenary,” whereas Korean says `고용인`, which can denote a hired person without clarifying the game's role label. | High |
| 25645-25649 | Guardian / Akara vessel ceremony / experience bar | Confirm whether Guardian is a title and retain the implication that a person is offered as a vessel to Akara. | Korean preserves the ceremony and vessel reading. The experience tutorial retains the source's progress-to-level explanation. | Medium |
| 25625 | uncertain Carasta trade | Preserve the unresolved “is or isn't striking” phrasing until context clarifies the deal's status. | Korean keeps both alternatives, though its final phrasing is awkward; Japanese recasts the trade as not yet settled. | Medium |

## Historical Audit Reconciliation

- Rechecked the existing source-keyed questions for IDs 25600-25649. Names,
  the trade reference, the disease, Walls, the Hireling label, and the
  Akara-vessel wording remain open candidates.
- No separate older audit finding was located for IDs 25601-25650 beyond the
  source-keyed questions in `from-ja_jp/open-questions.md`.
- Cross-checked recurring forms for Rathir, Tilera, Piercing Light, Warsworn,
  Kollossae, Travelers, Camden, Carasta, Shieldring Keep, Lorestones, Ordo,
  Dydyn, graylung, Acae, Walen, Bristletongue, Font, Mercantile, Hireling,
  Guardian, and Akara.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25601-25650 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- Runtime-token signatures match, including `{1}` at ID 25628.
- The 50 rows contain no detected line-break, token-order, or other structural
  exception.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25601-25650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25651.
