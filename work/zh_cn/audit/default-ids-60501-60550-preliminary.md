# Preliminary Language Scan: `default` IDs 60501-60550

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 60501-60550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 60503 | `...ilera` / `... 티레라(Tilera)` | Preserve the deliberately truncated opening while confirming whether Tilera is the intended completion; verify Icebrine and the journal's first-person chronology. | Korean infers Tilera from nearby context and preserves four paragraphs. English, Japanese, and Chinese all have a truncated opening; the historical prompt specifically asks to verify Tilera and Icebrine. | Medium |
| 60504 | kite shield / `금속제 연꼴 방패` | Confirm the Korean equipment term for “kite shield” and preserve the limit that only the heaviest blows penetrate it. | Korean transliterates the shield shape as `연꼴 방패`; Japanese calls it a kite shield. English says it fends off all but the heaviest blows. | Medium |
| 60506 | `Palestinian Territory` / `팔레스타인 지역` | Establish whether this is intentional in-world text, a real-world/test label, or a raw internal value before deciding how to display it. | All locales contain a standalone territory label; there is no sentence context. | Low |
| 60509 | Lyria as goddess / `리리아가 ... 여신인 까닭` | Retain the source's fragmentary “Why Lyria is...” construction and clarify whether this is a lore heading, sentence fragment, or continuation. | Korean remains a reason-clause fragment; Japanese rewrites it as a complete assertion, while English and Chinese are fragmentary. | Medium |
| 60513 | Preordained / `예정된 자들` | Confirm whether this is a formal group name/title and adopt the glossary form consistently. | English capitalizes the name; Japanese and Chinese interpret it as people appointed/destined. Korean follows that interpretation. | Medium |
| 60520 | Orwae / `오르웨이` | Identify who “Orwae” addresses in the old Red anecdote and whether “this place has a magic all its own” is a quoted saying or a report. | Korean preserves the direct address and reported quote; the historical prompt leaves the addressee open. | Medium |
| 60522 | “research on the growth of magic” / `마력의 성장에 관한 마법 연구` | Preserve the stated research purpose without inventing a particular magical mechanism; check whether the repeated “magic” wording is intentional. | The English is redundant; Korean renders the stated growth-of-magic topic directly. Japanese shortens it to research on magic's development. | Medium |
| 60525 | High Priestess Tirin / `티린 대여사제` | Verify the title/name and the Glen Suthain-to-Rathir founding sequence against established lore. | Korean preserves all four claims about leading, finding Rathir, sheltering/guiding the people, and shaping them. Historical notes request a name/history check. | Medium |
| 60527 | Bloodseeker's Fulcrum / `피추적자 확대 지렛목` | Confirm canonical Korean for the item/attribute name `Bloodseeker's Fulcrum` and `Fulcrum`; keep the source's `Flawless Mitharan` modifiers distinct. | Korean retains the modifier stack but uses a literal rendering of Bloodseeker and Magnifying Fulcrum. The exact item terminology remains open. | Medium |
| 60528 | Keepers / `수호자들` | Determine whether Keepers is a named faction/title or a generic role. | English capitalizes the plural; Japanese uses “watchers” and Chinese uses “guardians.” Korean uses a generic guardians form. | Medium |
| 60532 | `Failed To Link Loc` | Confirm whether this is a raw localization/system error and should remain verbatim rather than be translated. | English, Chinese, and Korean retain the exact string; Japanese translates part of it. The historical audit identifies it as a likely raw system/localization error. | Medium |
| 60534 | “them” / kills returned to feed the Crudok | Identify the creatures “them” refers to and whether “kills” means corpses or game kills. | Korean interprets “kills” as prey and names Crudok as the eater. Japanese explicitly says bodies/corpses; Chinese uses people killed. | Medium |
| 60540 | Logan Darrow / Hugo pronouns | Resolve the source's shifting `he`/`she` references before assigning gender or relationship in Korean. | Korean follows the English pattern: Hugo and `him`, then a female `she` mage. Japanese repeats Hugo as the target; Chinese also has shifting pronouns. The historical prompt flags the ambiguity. | Medium |
| 60542 | former Prince of Sorrows / `비탄의 왕자` | Confirm whether this is a formal former title and its relationship to the House of Sorrows. | Korean preserves the former-title contrast and the isolated war against Tuatha; Japanese identifies the House of Sorrows, while Chinese gives “Prince of Sorrows.” | Medium |
| 60547 | Champion Engard / `챔피언 엥가드` | Confirm Engard's identity and whether `Champion` is an honorific/title or role label. | Korean preserves the English title and name; the historical prompt asks for the character's identity. | Medium |
| 60549 | Cape Solace / `케이프 솔러스` | Verify the canonical place-name form and keep it consistent with other corpus occurrences. | Korean transliterates the name; Chinese translates it semantically as “Cape of Solace.” | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Itran the Shade,
Matrim Hawkins, Tilera, Icebrine, kite shield, Night Barghest, Lyria,
Alfar, Tuatha, House of Valor, Preordained, Fae of Sorrows, Rathir City
Watch, Feride, Glen Suthain, Eli Tems, Bloodseeker's Fulcrum, Keepers,
Tome of Synthesis, Great Library, Brownies, Crudok, Logan Darrow, Hugo,
Harst, Primos, Meathgra, Champion Engard, and Cape Solace. The period-only
entry at ID 60550 is preserved as source punctuation. Existing Korean
bilingual-name formatting is retained as found; this pass does not impose a
global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed historical entries for IDs `60501-60550` in the
  archived `60450-60549` question range. Applicable open prompts include
  Itran the Shade (60501), Tilera/Icebrine and the four-paragraph journal
  (60503), the kite shield (60504), the real-world-sounding Palestinian
  Territory label (60506), Night Barghest (60507), Lyria's fragmentary role
  (60509), sword/scabbard label (60510), House of Valor tournament (60512),
  Preordained (60513), Fae of Sorrows (60516), Chakram modifiers (60518),
  Rathir City Watch (60519), Orwae/old Red (60520), Feride's research
  wording (60522), High Priestess Tirin/Glen Suthain (60525), Eli Tems
  (60526), Bloodseeker's Fulcrum (60527), Keepers (60528), the
  Tome/Great Library sequence (60531), raw `Failed To Link Loc` (60532),
  Brownies/Crudok referents (60534), Logan Darrow/Hugo pronouns (60540),
  Prince of Sorrows (60542), and Champion Engard (60547).
- Canonical names, title choices, and unresolved source grammar remain
  provisional. These prompts are open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 60501-60550 once
  and in identical ascending order. All four full `default` files retain
  matching key order.
- Embedded newline counts match throughout the batch, including all four
  paragraphs at ID 60503.
- Runtime-token identities and order match. Chakram values `+6` and `+20%`
  at ID 60518 are retained in all four locales.
- The six-year quantity at ID 60503 is retained; Japanese alone writes it
  as an explicit numeral.
- No translation CSV edit was made.

## Batch Status

IDs 60501-60550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 60551.
