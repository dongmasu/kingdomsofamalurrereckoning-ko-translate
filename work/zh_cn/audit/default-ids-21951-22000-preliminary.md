# Preliminary Language Scan: `default` IDs 21951-22000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 21951-22000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 21951 | rocks raining down / urgency | Preserve the immediate danger and command to move. | Korean retains the falling-rock warning and urgent imperative. | Medium |
| 21952 | Detyre ale / entire keg | Verify the regional drink term and preserve the boast that the speaker drank a whole keg before the fight. | Korean keeps the location term and amount, with a casual challenge. | Medium |
| 21956 | Child of Dust / Fate / purpose / reason | Confirm the lore title and whether “reason” means rationality or cause/purpose. | Korean says “이성,” matching one sense of reason; the three-part denunciation and separation from Fate are retained. | Medium |
| 21957 | request to borrow books | Preserve the polite request despite the casual Japanese reference. | Korean asks permission to borrow any books found on the island. | Low |
| 21958 | young master / recovery | Identify the young master and retain the servants' concern without adding a subject. | Korean preserves the conditional concern; Japanese identifies the person as Marion, which English does not. | Medium |
| 21960 | piercing damage / `+25%` | Align the damage-type term and preserve the blank line and value. | Korean has the introductory sentence, two embedded line breaks, and `+25%` piercing damage. | High |
| 21961 | Antechamber / ritual of penitence | Confirm the room's canonical title and ritual terminology; retain the player's required position. | Korean preserves reaching the Hyperian's antechamber with Anokatos and standing at its center for the ritual. | Medium |
| 21964 | Word of Mitharu / St. Eadric | Determine whether “Word” is scripture, doctrine, or divine utterance; align both names. | Korean uses “미타루의 말씀” and “성 에이드릭,” retaining the attributed title. | Medium |
| 21971 | potion wearing off | Preserve that the potion's effect should begin to wear off completely by this point. | Korean retains the expected timing and pleased reaction; exact aspect (“begin” versus “be completely worn off”) merits context review. | Medium |
| 21973 | Lady Coriana / Mallion / House Anwon | Verify names, family relation, and whether the closing phrase is a curse or lament. | Korean follows Japanese in identifying Mallion as her son; English leaves that relation implicit. The final exclamation remains a lament. | Medium |
| 21976 | first four tiers of unlocked Might Abilities / `+1` | Confirm whether +1 applies to each of tiers 1-4 or to the first four unlocked abilities; align the Might term. | Korean preserves `+1` and `4`, but places `+1` before “첫 4단계,” unlike English/Japanese ordering. Scope remains ambiguous. | High |
| 21977 | purge / taint | Align “taint” and “purge” with recurring corruption terminology. | Korean preserves the inability to cleanse the place without specifying a mechanism. | Medium |
| 21978 | three crafting components | Preserve the count and distinguish components from other crafting materials. | Korean retains the three-component rule. | High |
| 21981 | Aster / Tala-Rane | Align both proper-name forms with recurring usage. | Korean retains the ancestor's leadership of Aster's army and the duty to protect Tala-Rane. | Medium |
| 21983 | Tuatha Overlord guards / weapon shard / Master Belne | Verify names/title and preserve the recovery-to-forging sequence. | Korean retains the looted shard, required component, chosen weapon, and instruction to bring it to Master Belne. The English itself repeats the component/bringing objective. | Medium |
| 21984 | Fae / front door | Preserve the speaker's denial that the gate fight was meant to let a Fae walk in through the front entrance. | Korean retains the negation and the contrast with the Fae entering casually. | Medium |
| 21986 | `pintpots` / gnomes | Confirm the derogatory/diminutive force and preserve the warning about the gnomes turning vicious when they notice the player. | Korean renders the size implication as smallness and retains the conditional threat; the exact insult is not explicit. | Medium |
| 21988 | Borgue / Crows / new leader | Verify names and preserve the outcome plus the suggestion that the new leader is more than appearances suggest. | Korean retains the band's defeat and the announcer's qualified assessment. | Medium |
| 21989 | nested `{*3...}` / `{1}` / `{2}` | Preserve the nested localized wrapper and exact placeholder order. | English, Japanese, Chinese, and Korean contain the same raw marker structure and values. | High |
| 21990 | forge training / relatively cheap | Preserve the speaker's lightly qualified claim and casual register. | Korean retains “비교적” and the training-fee meaning; the ellipsis adds a pause but not a new claim. | Low |
| 21992 | Lord Saramer / High Loresage / Houses | Align the formal rank and the House of Ballads/House of Valor names. | Korean preserves the self-introduction, Ysa, both Houses, and the offer to answer questions. | Medium |
| 21993 | Goddess / heart of things / Fateweaver | Preserve the theological sequence and align Fateweaver terminology. | Korean renders “heart of things” as “만물의 본질” and calls her the one who truly weaves Fate; the metaphor/rank remains a terminology question. | Medium |
| 21998 | Amphora | Determine whether this is a named objective or the generic two-handled vessel. | Korean transliterates Amphora rather than using a generic jar term. | Medium |
| 22000 | `churls` / Warsworn / “kill me” | Confirm the insult's force and preserve the reported, contradictory shouting. | Korean calls them “천한 놈들” and retains the two shouted topics without reconciling their apparent contradiction. | Medium |

## Historical Audit Reconciliation

- Rechecked archived source-keyed questions for IDs 21956, 21958, 21960-21961,
  21964, 21971, 21973, 21976, 21983, 21986, 21988, 21992-21993, 21998, and
  22000 against the active English, Japanese, Chinese, and Korean rows.
- The prior items remain open candidates. ID 21976's numeric scope and ordering
  were checked directly; values are present, but their Korean sentence order
  differs from English.
- Cross-checked Child of Dust, Fate, Mitharu, Eadric, Anokatos, Hyperian,
  Coriana, Mallion, Anwon, Might, Tuatha Overlord, Belne, Borgue, Crows,
  Saramer, both Houses, Fateweaver, and Amphora against recurring usage.
  Official-manual text search remains unavailable; term confirmation is
  pending integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 21951-22000 exactly
  once and in identical order.
- ID 21960 has two embedded line breaks and `+25%` in all four locales.
- ID 21976 contains both `+1` and `4` in all locales. Korean orders these
  values differently in the phrase, so this is recorded as a semantic-scope
  question rather than a missing-value structural error.
- ID 21989's nested wrapper and `{1}`/`{2}` placeholders match exactly.
- No key, row-order, line-break, runtime-marker, or missing-numeric-value
  discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 21951-22000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
22001.
