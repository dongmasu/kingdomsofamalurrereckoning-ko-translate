# Preliminary Language Scan: `default` IDs 30651-30700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30651-30700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30662 | `할아버지에게서 재료를 채취` for `harvesting my grandfather` | Preserve the deliberately strange joke while checking whether “harvesting” means extracting resources from the grandfather or has another in-world sense. | Korean keeps the resource-extraction wording and the partnership punchline. The historical audit explicitly flags whether this is literal or a resource-harvesting joke. | Medium |
| 30663 | `필멸자의 사슬 치마` / `페이 사냥꾼의 각반` for the Chausses poem | Confirm what `Chausses` denotes in this item and use a consistent Korean armor term while retaining the eight-line rhythm/image. | Korean preserves all eight source lines and the chain/legwear imagery, but the poem describes chain as a skirt and names the Faehunter Chausses as `각반`. The exact garment and intended wordplay need item context. | Medium |
| 30664 | `트래블러` for `Traveler` | Standardize the formal faction name against Korean forms such as `여행자` / `여행자들`. | This row transliterates the faction name; the active corpus uses both phonetic and semantic forms. The line presents becoming a Traveler as a life choice. | Medium |
| 30668 | `친구` for the address `dove` | Confirm whether `dove` is an affectionate or patronizing nickname and preserve its interpersonal tone. | English directly addresses the player as “dove”; Korean omits that image and uses generic `친구`. Historical notes explicitly flag the form of address. | Medium |
| 30669 | `이 메모장을 가득 채우고 있다` for `fills this page of notes` | Preserve that the cramped handwriting fills a page, not necessarily the entire notebook. | English identifies a page; Korean says the handwriting fills the notebook. Japanese refers to the note as covered in writing. | Medium |
| 30672 | `리케이오스의 수장` for `master of the Lykeios` | Confirm whether `Master` is a formal academic rank/title and standardize the institution's head title. | Japanese explicitly calls Onesimos the head of the school; Korean says head/leader. The institutional role is clear, but the title convention is not. | Low |
| 30676 | `콜로사이` for `Kollossae` | Standardize the race name to the dominant active form `콜로세`. | The active Korean corpus repeatedly uses `콜로세(Kollossae)`; this row uses `콜로사이`. The source is a named race in a mythology description. | High |
| 30680 | `그들의 피를 바쳐` for `with their blood` | Confirm whether the blood is explicitly offered/sacrificed or whether the source only identifies it as the means by which the blessing was won. | English says the speaker used the Warsworn and “with their blood” won the blessing. Korean makes the offering explicit; Japanese and Chinese also lean toward blood being offered/used. | Medium |
| 30681 | `숙련자 이그나스` for `Adept Ignas` | Confirm whether `Adept` is a formal rank and standardize its Korean title form. | The row is an objective naming an opponent by title. Korean translates the rank generically; other rows use different title/transliteration conventions. | Medium |
| 30686 | `케일드 해안` for `Caeled Coast` | Standardize the coastline spelling and retain that the auras' meaning and origin are both unknown. | The Korean preserves the uncertainty and beauty report. The proper-name transliteration varies across the corpus and needs the integrated terminology pass. | Low |
| 30694 | `프레토리안들` for `the Praetorians` | Confirm the faction/guard unit's canonical name and Korean spacing/plural convention. | The line describes the unit confiscating a jewelry box. Historical notes flag the Praetorians and the location of the Adessa Armory. | Low |
| 30696 | `생명력 흡수 15%` | Preserve the exact 15% lifesteal effect on all attacks. | All four locales retain 15% and the all-attacks scope. No value discrepancy was found. | High |

Rows 30651-30661, 30665-30667, 30670-30671, 30673-30675, 30677-30679,
30682-30685, 30687-30693, 30695, and 30697-30700 generally retain the
English meaning on this first reading. Their names, register, fragments,
item/rank terms, and surrounding quest context remain for the integrated pass;
no separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30600-30699 was checked against
  the applicable rows, including Preordained, Maire, Arhaus/Sihtric, Sidhe,
  the grandfather-harvesting joke, Faehunter/Chausses, Lykeios, Kollossae,
  Adept Ignas, Caeled Coast, Praetorians, Echo Stone, and lifesteal.
- The narrower historical questions at 30661-30663, 30668, 30670,
  30672, 30674, 30680, 30686, 30689-30691, 30694, 30696, and 30699
  were reviewed against the active rows. The antecedent of `it` at 30674
  remains unavailable in the isolated line; the eight-line poem and named
  icon marker were checked directly.
- ID 30663 retains all eight lines. ID 30690 preserves the exact
  `#NAMED_ICON_360_RB#` control marker. ID 30674's Arena revenue and tavern
  functions are both present; what “it” refers to remains contextual.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30651-30700 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match, including the poem at 30663 and named-icon control at 30690.
- Numeric meaning is retained: the `XI` in `Chaos Thrall XI` is the same
  rank number as Japanese `11`; the 15% lifesteal and -5% stealth sight-range
  effects retain their values and directions.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30651-30700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30701.
