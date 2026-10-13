# Consolidated Review: Chinese-Only `affix` Fallbacks (D-19545)

- Date: 2026-10-12; decision D-19545.
- Scope: all 55 provisional Chinese-only fallback keys, grouped as 11
  distinct terms across variants 12, 14, 21, 22, and 24.
- English is the semantic authority; Japanese is used for form/register;
  Chinese is supporting evidence. Exact German, Spanish, French, Italian,
  and Russian rows were also checked where available.
- These are working dispositions, not independent final linguistic approval.

## Decisions

| ID | English | Active Korean before review | Disposition | Evidence and rationale |
| ---: | --- | --- | --- | --- |
| 55 | `of the Fated` | `*운명*` | accepted | English grammar and German, Spanish, French, Italian, and Russian render a person or people determined by fate. This matches `of the Destined` at ID 369, whose established active form is `*운명지어진 자*`. Chinese `宿命` is compatible but less specific. Apply the exact person-denoting form consistently to all six active variants. |
| 101 | `Favors's` | `호의의` | uncertain | English is malformed and the locale readings diverge among favor, good fortune, gifts, and patronage. The item/effect context needed to select one is unavailable. |
| 115 | `of the Reckoned` | `*심판받은 자*` | uncertain; linked | Judgment, recompense, and punishment readings remain. Keep linked to D-18173; do not count its five fallback keys again. |
| 117 | `Fortune's` | `행운의` | uncertain; linked | Luck, fate, and the named Fortune remain possible. Keep linked to D-18175; do not count its five fallback keys again. |
| 124 | `Ruin's` | `폐허의` | uncertain | The sources allow physical ruins, destruction, or a named force; no item context settles the distinction. |
| 202 | `Slayers` | `처치자` | not an issue | English, Chinese `杀戮者`, and the available European/Russian agent nouns all describe slayers or killers. Korean `처치자` preserves that agent sense; Korean need not mark the source plural in this modifier. Link the existing variant-11 disposition in D-18196. |
| 255 | `Kismet's` | `키스멧의` | uncertain | English/German/Italian preserve `Kismet`, while other locales interpret it through fate, predestination, or existential readings. The intended in-game concept and Korean rendering are not established. |
| 341 | `of Clairy` | `*클레어리*` | uncertain | English, Japanese, German, and French support the proper name `Clairy`; Spanish, Italian, and Russian instead support clarity. No context resolves the source conflict. |
| 444 | `of the Willful` | `*의지가 굳은 자*` | uncertain | Korean selects resoluteness, while English and several locales can mean stubborn or obstinate. The intended trait is not established. |
| 496 | `Prime` | `최상급` | uncertain | Locale readings diverge among primeval, fundamental, first, and elite. The equipment tier/effect context is unavailable. |
| 527 | `Aurora` | `오로라` | not an issue | The source may be a name or the natural phenomenon, but Korean `오로라` preserves either reading without choosing between them. Chinese `极光` supports the phenomenon reading; no Korean text error is established. This supersedes D-18197's uncertainty for variant 11 only. |

## Accepted Edit

| ID / variants | Previous Korean | Applied Korean | Rationale |
| --- | --- | --- | --- |
| 55 / 11, 12, 14, 21, 22, 24 | `*운명*` | `*운명지어진 자*` | Preserve the person-denoting English `the Fated`; reuse the established parallel `of the Destined` at ID 369. |

No edits were authorized for uncertain rows. The five Chinese-only ID 202
keys link to the already dispositioned variant 11; ID 527's five fallback
keys and variant 11 were reviewed together. ID 115 and 117 fallback keys
remain linked to D-18173 and D-18175.

## Counts and Integrity

- The 55 Chinese-only keys now comprise 5 `ACCEPTED`, 10 `NOT_AN_ISSUE`,
  and 40 `UNCERTAIN` rows (140 total fallback keys overall: 5 accepted,
  95 not an issue, 40 uncertain).
- Of the 40 unresolved fallback rows, the ten at IDs 115 and 117 remain
  linked to their existing six-variant decisions and are not double-counted
  in the broader decision ledger.
- Active `default` totals remain **2,456 accepted / 25,349 not an issue /
  10,719 uncertain** (38,524). Its SHA-256 remains
  `84f6eac5ab61cca00b219d2949605f086a86daca0ddeb5d132321c959ad71ebd`.
- Active `affix` pre-edit SHA-256:
  `c31f35a98a4b2875cc6d44c46c4404c2249f4ec6f758dae3543a07c917def676`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-affix-fated-term-D19545/locatexts_zh_cn.koalocatext_affix.csv`.
- Active `affix` post-edit SHA-256:
  `611fed1a67bc8eeb277a621e92f463e8b7a451c285ede8dc273e2940e8e0903f`.
- The active CSV retains its UTF-8 BOM, 3,451 ordered data rows, all
  `(ID_Linha, Tipo_Variante)` keys, and 3,452 CRLF endings. Replaying only
  the six approved `Texto` substitutions against the backup reproduces the
  active file byte-for-byte; no other bytes changed.
- Updated fallback inventory SHA-256:
  `b39250c9fa4af532eae9809bfd4681bd95aaa960292c92da534e532e2bd1295d`.
  The inventory retains 140 unique, ordered keys and now records 5
  `ACCEPTED`, 95 `NOT_AN_ISSUE`, and 40 `UNCERTAIN` rows.

## Remaining Holds and Resume

The 40 unresolved fallback rows are IDs 101, 115, 117, 124, 255, 341, 444,
and 496, each at variants 12, 14, 21, 22, and 24. IDs 115 and 117 remain
linked to D-18173/D-18175. The nine remaining `default` uncertainties
remain D-18027 IDs 62755, 62789, 62792, 62796, 62797, 62798, and D-18038
IDs 62867, 62869, 62899; their latest grouped reviews do not provide new
evidence to close them.

At the D-19545 checkpoint, the planned next step was to search for new
item/lore context starting with `Favors's` (ID 101), not to repeat the
source-only comparison. D-19546 instead found new cross-dialogue evidence
for ID 444 and resolved it; the current state and resume point are in
[`D-19546`](consolidated-affix-willful-followup-D19546-20261012.md).
Do not call the review complete while the remaining default and affix holds
remain unresolved. Keep their counts separate.
