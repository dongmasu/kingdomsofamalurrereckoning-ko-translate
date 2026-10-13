# Preliminary Language Scan: `default` IDs 31451-31500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31451-31500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31452 | `워터홀 다운` / `셀키 베일` | Confirm the canonical forms and whether `Waterhall Down` is a cave/location name and `Selkie Veil` a formal relic name. | English names both; Japanese describes a waterfall-basin cave and renders the veil semantically, while Chinese says “water cave” and transliterates the relic. Korean follows the English names; retain pending terminology review. | Medium |
| 31456 | `도크알브 부랑자` for `Dokkalfar vagrant` | Keep the English meaning provisionally; investigate the Chinese `merchant` discrepancy if surrounding context becomes available. | English and Japanese describe Ratofer as a vagrant/wanderer, while Chinese calls him a merchant. Korean follows English/Japanese. | Medium |
| 31464 | `행잉 멘`, `블러드그린`, `속삭이는 마녀`, `바론넷` | Confirm whether these are the formal names of a group and three associated figures/titles; standardize their Korean forms. | English uses capitalized names. Japanese renders Hanged Men as a pirate group, while Chinese uses a generic “hanged ghosts” phrase. The English alone does not settle the exact identities. | Medium |
| 31467 | Attack tooltip values | Preserve range, damage types, quantities, duration, and costs exactly. | Attack 1 staggers targets within 5 m and deals 8 Physical Damage for 10 Mana. Attack 2 fires five blade projectiles, each dealing 50 Piercing Damage and 12 Bleeding Damage over 6 seconds, for 15 Mana. Korean preserves each value and effect. | High |
| 31490 | `포럼` / `리브라리움` | Confirm whether Forum and Livrarium are formal institution/place names and standardize their Korean forms. | English capitalizes both. Japanese semantically renders them as council and library; Chinese transliterates Livrarium but describes Forum as a plaza. Korean transliterates both pending setting-context review. | Medium |
| 31491 | `나로스의 이빨`, `하이페리언` | Preserve the intended treasure location and stone comparison; note the English grammar errors for integrated review. | English has “It lays” and “a stone ... that resemble.” Korean resolves the antecedent as the treasure and preserves the Hyperian comparison without reproducing the source errors. Japanese omits the comparison's final punctuation. | Medium |
| 31492 | `소로우즈` for `the Sorrows` | Determine whether Sorrows here means a faction, beings, or another formal setting term; keep the name consistent pending context. | Saturnyn's stated objective is “the Sorrows.” Japanese describes the power of lament, while Chinese calls them sorrowful spirits. Korean treats it as a proper name, following the English capitalization. | Medium |
| 31494 | `14자` limit for crafted-item words | Preserve the maximum and verify how the limit should be expressed for Korean text and the game's naming constraint. | English specifies individual words no longer than 14 letters; Japanese and Chinese also retain 14. Korean preserves the value as 14 characters, but the exact counting unit is language-dependent. | Medium |
| 31496 | `트래블러스` | Confirm this is the formal affiliation name and keep its rendering consistent. | English capitalizes Travelers and distinguishes affiliation from the group's specialty in fair exchange. Korean retains the faction name and the contrast that they may steal but do not make it their trade. | Medium |
| 31498 | `보스 디비언트` for `Voss Deviant` | Determine whether this is a person's name, title, or role before fixing the Korean form. | The row is an isolated capitalized label with no context. Japanese and Chinese also transliterate it, so they do not resolve the name/title question. | Low |
| 31499 | `정신의 균형을 잃은 모양` for `not evenly balanced` | Keep the referent and intended sense of “balanced” open; check the preceding dialogue before finalizing. | The English says the speaker showed someone the truth of his ways, then says he may not be evenly balanced. Korean interprets this as mental imbalance; it may instead refer to fairness or another kind of balance. | Medium |

Rows 31451, 31453-31455, 31457-31463, 31465-31466, 31468-31489,
31493, 31495, 31497, and 31500 generally retain the English meaning on
this first reading. Names, register, lore terminology, and context-dependent
references remain candidates for the integrated pass; no separate
high-confidence wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical entries for IDs 31400-31499 were checked
  against this batch. They specifically flag Waterhall Down/Selkie Veil,
  Ratofer as vagrant versus merchant, Hanged Men and the named figures,
  attack values, Meropis, the cardinal directions, murghan, Forum/
  Livrarium, Sorrows, the 14-letter item constraint, Travelers, Voss
  Deviant, and the meaning of “evenly balanced.”
- ID 31456 follows English and Japanese for Ratofer's status; the Chinese
  divergence remains explicitly recorded rather than silently adopted.
- The 14 limit at ID 31494 is preserved, with the distinction between
  English letters and Korean characters left for terminology/UI review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31451-31500 once and in identical order.
- Embedded line-break counts match throughout this range.
- Runtime-marker identities and order match; no marker discrepancy was
  detected.
- Numeric meaning is retained at ID 31467, including the 5 m range, 8/50/12
  damage values, five projectiles, 6-second duration, and 10/15 Mana costs.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31451-31500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31501.
