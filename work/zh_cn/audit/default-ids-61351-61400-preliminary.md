# Preliminary Language Scan: `default` IDs 61351-61400

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 61351-61400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 61355 | Red / `레드(Red)` | Confirm whether Red is a person, title, or faction name and preserve the speaker's wary characterization. | Korean retains the capitalized name and the claim that Red will do anything to get what he wants; the source-keyed audit asks for its status. | Medium |
| 61356 | `Thresh` / `스레시`; `Sidhe` / `시드` | Verify the creature type, tree-spirit description, and canonical Korean forms for Thresh and Sidhe. | Korean preserves the vicious Fae/tree-spirit definition and location; the historical audit flags both terms. | Medium |
| 61357 | unfinished Telling fragment | Preserve the incomplete sentence and trailing comma until its continuation is known. | Korean retains the broken “looming death” phrase and final comma; English is deliberately truncated in the active row. | Medium |
| 61361 | Travelers of legend / `트래블러스` | Confirm Travelers as a formal group and align its Korean name with other corpus occurrences. | Korean calls the speaker a member of Travelers and retains Spinning Tom, Maire, and Irion; other rows use both phonetic and translated forms. | Medium |
| 61362 | “Give us a wink” / rusty-nail husband joke | Preserve the flirtatious banter and the “rusty nail” insult without flattening the innuendo. | Korean retains the wink, endearment, and husband's comic description; the historical audit asks for the intended innuendo. | Medium |
| 61363 | `exchequers` / larger investment installments | Confirm whether this is a minimum transaction size, installment size, or another treasury policy. | Korean says the finance staff accept investments only in larger amounts; the English policy wording is ambiguous and the historical audit asks for its exact meaning. | Medium |
| 61364 | Chosen / Kobold dagger | Confirm whether Chosen is a formal enemy group and retain the repeated one-dagger-per-enemy instruction. | Korean preserves the repeated action and Kobold dagger; English capitalizes Chosen and the historical log flags both terms. | Medium |
| 61376 | Rivener Tarsus / `리베너 타르수스` | Determine whether Rivener Tarsus is a person, place, title, or entity in the speaker's role within the Telling. | Korean keeps the proper-name form without selecting a category; the source-keyed audit explicitly asks for its identity. | Medium |
| 61379 | Ansilla's “almost as incompetent son” letter | Preserve the sarcastic inheritance threat and verify the distinction between a child retaining control of the land and physically defending it. | Korean keeps the bastard-child insult and estate threat, but `영지를 ... 지켜 내면` can read as defending the land rather than retaining the speaker's tenuous control over it. | Medium |
| 61380 | `Prismere` / `프리즘어` | Confirm whether this material name should be localized or retained as a proper resource term. | Korean transliterates the material with an English parenthetical; the historical audit asks whether Prismere should be localized. | Medium |
| 61383 | Private McGowan / `맥고완 일병` | Verify whether `Private` is the intended military rank and preserve the camp-protector abuse of position. | Korean renders the rank and the protection-from-punishment detail; the source describes McGowan as a Warsworn mercenary. | Medium |
| 61394 | Chaos tutorial labels/markers | Preserve the four localized `*1` marker identities and `LINE_SPACE`/`{1}` control tokens in order; verify the target UI wording for immunity, armor, weapons, and damage. | Korean retains marker/control-token order and explains that Chaos Armor must be broken with Chaos Weapons. The source-keyed audit asks for mechanics and display text. | Medium |
| 61395 | `First Scion` / `첫 계승자` | Confirm whether Scion is a formal title/office and align it with the project term inventory. | Korean renders First Scion as `첫 계승자`; the speaker's upbringing and Akara reference are otherwise retained. | Medium |
| 61398 | “across the water” / `물 건너` | Verify the geography and whether the troops are stranded at both Dolve Arne and Rathir. | Korean says some troops are stuck in both locations; the source-keyed audit asks whether “across the water” applies to both. | Medium |
| 61400 | fathers / making the Fallen One | Confirm who “we” are, why they call themselves the Fallen One's fathers, and how their creation caused their sin. | Korean preserves the broken arrival, remaking, and resulting sin; the theological/lore relationship is unresolved. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register, including the Apule miners' madness, Niskaru from
the Rifts, the Primos order, the ship-stripping threat, the Chaos tutorial,
and the weapon-gap anecdote. Other source-keyed entries without an immediate
meaning-shift candidate were also checked: anger (61374), Primos orders
(61375), hope after loss (61378), the bribe variable (61384), Brogan Adair
(61387), Cassera (61390), audience response (61391), mortality (61392), and
Preordained/Great Library (61399). Provisional names and terms include Red,
Thresh, Sidhe, Telling, Oreyn Vilsar, the wasted valley, Travelers,
Spinning Tom, Maire, Irion, Kobold, Alyn Shir, Apule, Niskaru, Rifts,
Primos, Rivener Tarsus, Lord Ansilla, Prismere, Gorhart, Warsworn,
Private McGowan, Brogan Adair, Cassera, Telogrus, First Scion,
Preordained, Dolve Arne, and the Fallen One. Existing Korean
bilingual-name formatting is retained as found; this pass does not impose a
global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked prompts in the archived `61350-61449` range for Red (61355),
  Thresh/Sidhe (61356), the truncated Telling (61357), Travelers (61361),
  the wink/rusty-nail line (61362), exchequers (61363), Chosen/Kobold
  (61364), Apule/Rifts (61369-61370), anger (61374), Primos orders (61375),
  Rivener Tarsus (61376), hope after loss (61378), Prismere (61380), bribe
  variable (61384), Brogan Adair (61387), Cassera (61390), audience
  response (61391), mortality (61392), Chaos tutorial tokens (61394), First
  Scion (61395), across-water geography (61398), and Preordained (61399).
- Also checked the source-keyed concerns for the Ansilla letter at 61379
  and the Fallen One creation passage at 61400.
- These remain unresolved historical questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 61351-61400 once
  and in identical ascending order.
- Embedded newline counts match throughout the batch, including the two
  paragraphs in ID 61379.
- Runtime-token sequences match; the cost variable at ID 61384 and the
  localized Chaos markers, `LINE_SPACE`, and `{1}` at ID 61394 are retained.
- Numeric values and variable identities are preserved.
- No translation CSV edit was made.

## Batch Status

IDs 61351-61400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 61401.
