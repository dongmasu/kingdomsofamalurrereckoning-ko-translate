# Preliminary Language Scan: `default` IDs 54401-54450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54401-54450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54403 | `면죄의 화관(Wreath of Absolution)` | Confirm the established term and whether this named wreath is a literal object, symbol, or ability. | Korean preserves the English compound; Japanese and Chinese also interpret it as a named wreath/crown. | Medium |
| 54404 | `잠깐만, 자기` for `A moment, love` | Check the intimacy/register of `자기` against the speaker and the established Korean endearment style. | Korean is more explicitly intimate; Japanese omits a vocative and Chinese says “beloved.” English supports an endearment but not its exact level. | Medium |
| 54405 | Record of Payment / gem, Tear, 4,000 gold | Preserve all three quantities, the payer, and the full-reward statement despite the source's awkward syntax. | Korean retains one gem, one Tear of Mitharu, 4,000 gold, and the return-of-heirloom rationale. The document's line breaks and values match the other locales. | High |
| 54408 | `텔로그루스에게 죽음을!` for `Down with Telogrus!` | Confirm whether this is a generic anti-Telogrus chant or an explicit death threat. | Korean chooses “death to Telogrus,” stronger than a general “down with” slogan; Japanese uses an equivalent hostile exclamation and Chinese says defeat. | Medium |
| 54409 | Lekka awaiting death / `이제 어서 끝내` | Preserve the urgency while clarifying whether the speaker orders Lekka's death or says his fate is already set. | Korean keeps the impatient command; English/Japanese frame Lekka as awaiting/is meant to die, while Chinese is more explicit about acting. | Medium |
| 54410 | 30% damage reduction / 10 seconds / 25 Mana | Preserve the effect amount, duration, and cost. | Korean retains 30%, 10 seconds, and 25 Mana on the same two-line layout. | High |
| 54417 | Florian's loose tongue / denial | Keep the sarcastic insistence that neither speaker nor Florian knows anything. | Korean retains the repeated denial and `입 가벼운` characterization without changing the claim. | High |
| 54419 | wife's killer already dead / find Kurn and end him | Preserve the source's apparent contradiction and direct request rather than silently reconciling who is dead. | Korean mirrors both statements: the killer is dead, then the speaker asks the Beckoned to find Kurn and kill him. Japanese/Chinese also retain the tension. | High |
| 54422 | `우리 교단` for `our order` | Confirm whether this is a religious order, university, or other faction and standardize the group term. | Korean chooses a religious body; Japanese says “our school” and Chinese says academy. English remains generic. | Medium |
| 54425 | `쓰레시(thresh)` / Aurenda's Light | Verify whether `thresh` is a creature/species and preserve the tentative attribution of the thieves' deaths. | Korean retains the lowercase creature-name form and the source's “presumably” inference; the objective's illusion/return sequence is intact. | Medium |
| 54426 | pet bear increases `체력` | Determine whether the effect is current health, maximum Health, or another stat. | English says health, Japanese says life, Chinese explicitly says maximum health, and Korean says health. The exact stat is not settled by English alone. | High |
| 54427 | `크로우(Crows)` after tournament | Confirm whether Crows is a formal event/group name and preserve its temporary end until next year's possible event. | Korean treats Crows as a named group and retains the conditional return. English/Japanese capitalize it; Chinese uses a group-like term. | Medium |
| 54429 | `아우렐라(Aurela)` / priestess | Reconcile English/Chinese `Aurela` with Japanese `Correlon`; preserve the description of her adventurous nature before taking the priestess's mantle. | Korean follows English, which Chinese also supports. This is a proper-name source conflict, not a structural mismatch. | High |
| 54433 | amnesty in exchange for Canneroc lives | Clarify who receives amnesty and preserve the conditional exchange and the speaker's claim not to rely solely on spiders. | Korean explicitly says the addressee is pardoned in exchange for residents' lives; surrounding plot context should confirm the parties. | Medium |
| 54438 | threat over accusations | Preserve the speaker's denial, judgment that the thought is offensive, and threat to teach the addressee not to accuse them. | Korean follows English. Japanese/Chinese soften or omit the final retaliatory threat; retain the discrepancy as a tone question. | High |
| 54439 | “honor of a natural death” / fighting through pain | Preserve the apparent paradox between granting a natural death and spending the final moments fighting through pain. | Korean retains both ideas rather than resolving the source tension. | High |
| 54440 | `그녀가 오신다` | Confirm whether the reverent/honorific arrival register is intended. | English is simply “She comes”; Japanese uses an honorific arrival and Korean follows that reverence, while Chinese is neutral. | Medium |
| 54442 | `$TR_Shell.minn_wager$` gold label | Preserve the runtime variable exactly and verify the UI label/order in context. | Korean retains `$TR_Shell.minn_wager$` and the gold unit in parentheses; the token is unchanged. | High |
| 54444 | `효과 보유자` for `Effect Holder` | Determine whether this is a technical UI/debug role and use the project's established terminology if player-facing. | Korean is literal; the isolated label does not reveal its UI context. | Medium |
| 54450 | `중국` for `China` | Determine whether this is a localization label, region/name fragment, or another UI string. | Korean follows the literal language/region name; the historical audit flags the fragment as ambiguous. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Kirby, Lekka, the
Teeth of Naros, Hystis, Idylla, Mitharu, Gloamfrost, Akara, Aurenda,
thresh, Crows, Aurela, Narca, Canneroc, Lord Ysa, Uduath, Fate's weave,
Effect Holder, and Flawless Mitharan Piercing Shaft.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries for IDs `54350-54449` and
  `54450-54549`. Relevant questions include the 1-gem/1-Tear/4,000-gold
  payment record (54405), 30%/10 seconds/25 Mana effect (54410), Lekka
  (54409), the wife's killer/Kurn contradiction (54419), Gloamfrost (54421),
  `thresh` (54425), current vs. maximum Health (54426), the Crows (54427),
  Aurela/Correlon (54429), Pteryx population (54431), Canneroc amnesty
  (54433), the softened accusation threat (54438), natural death (54439),
  reverent arrival (54440), wager variable (54442), Effect Holder (54444),
  and the Mitharan Piercing Shaft (54448).
- Historical validation confirms the 54405 quantities, 54410 effect values,
  and `$TR_Shell.minn_wager$` at 54442. Direct structural checks found no
  key/order, line-break, or token discrepancies.
- Historical range `54450-54549` begins at active ID 54450. This report
  includes that boundary row once; the next active batch starts at 54451.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54401-54450 once
  and in identical ascending order.
- Physical line-break counts match throughout, including the payment
  record at ID 54405 and effect tooltip at 54410.
- The 54405 quantities, 54410 effect/duration/cost, and 54442 runtime
  variable are preserved. No localized marker-order variation occurs.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 54401-54450 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-54401-54450-20261010.md`](disposition-batch-default-54401-54450-20261010.md):
four accepted terminology/meaning corrections, seven uncertain findings,
and 39 `not an issue` IDs. The dispositions are not independent final
linguistic approval. Continue at `default` ID 54451.
