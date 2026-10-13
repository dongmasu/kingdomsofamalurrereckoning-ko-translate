# Preliminary Language Scan: `default` IDs 12050-12099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12050-12099.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12054 | Spell-hit trigger / health drain / 10 stacks | Preserve the trigger as landing a spell, not merely casting one; retain the stacking and health-drain details. | English says `whenever landing a spell`, and Japanese says each time a spell hits. Korean explicitly says when a spell hits an enemy. Chinese says “when casting,” a broader trigger. The existing historical question is resolved in favor of the English/Japanese-supported Korean reading, pending consolidated review. | High |
| 12055 | `collector of the dead` → `죽은 자를 모으는 자` | Determine whether this is a literal corpse collector, a person who collects the dead, or a formal epithet. | English lowercases the phrase, Japanese uses “corpse collector,” and Chinese mirrors “collector of the dead.” Korean preserves the ambiguity; context is required for a title decision. Historical notes already flag it. | Medium |
| 12058 | `Mayor Flanagan` / `words of comfort` | Verify the speaker's revelation and preserve the two distinct ideas: trusting Flanagan and believing her comforting words. | Korean retains both clauses, though `믿고 ... 믿었다니` repeats the verb. English and Japanese also repeat the trust/comfort relation; this may be stylistic rather than an omission. | Low |
| 12065 | `They are laughable. They leave him disregarding...` | Determine who “they” are and whether they ignore, distract him from, or cause him to disregard his pitiful reality. | The English syntax is unclear. Japanese and Chinese paraphrase the idea differently; Korean follows the reading that “they” look away from his condition. Historical notes already flag it. | Medium |
| 12069 | Destiny / block or suffer an attack rather than dodge | Align `Destiny` and combat terms for blocking, enduring, and dodging an attack. | Korean preserves the source's melee-specialist profile and comparative advice. English/Japanese emphasize withstanding attacks; Chinese interprets the alternatives as parry or absorb. Historical notes already flag terminology. | Medium |
| 12071 | `Warsworn` → `워스원(Warsworn)` | Reconcile this form with the active `전쟁맹세단(War Sworn)` at ID 11958 and other Warsworn uses before choosing a canonical faction name. | Both rows refer to joining the same faction; the current Korean forms differ. Frequency or a single source spelling does not settle the preferred Korean term. | High |
| 12091 | `Alfar Border Permit` → `알파르 국경 통행증` | Verify the official term and whether “any man or woman in Mithros” is literal or rhetorical. | Korean preserves the permit name and inclusive wording. Japanese/Chinese support the same basic meaning but use different name forms. Historical notes already flag both questions. | Medium |
| 12094 | `Monetary?` → `금전적인?` | Retain the deliberately fragmentary one-word question unless context shows it is a repeated category label. | Korean supplies the adjectival “monetary?” reading; Japanese is similarly fragmentary and Chinese renders it as “currency?” Historical notes already flag it. | Medium |
| 12096 | `.` | Preserve the one-character source placeholder rather than inventing content. | English, Japanese, and Korean contain the same period; Chinese is also punctuation-only. Historical notes already flag the placeholder. | High |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12054, 12055, 12065, 12069, 12091,
  12094, and 12096 against the active Korean and all three source locales.
  ID 12054's trigger is consistent with English and Japanese; the remaining
  questions stay open.
- The Warsworn/War Sworn term difference between IDs 11958 and 12071 is an
  additional corpus-consistency candidate.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and runtime-token sequences match
  across all four locales in this range. No structural exception was found.
- Proper names use selective English-parenthetical marking. This is recorded
  for corpus-level consistency review, not global normalization.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12050-12099 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12100-12149.
