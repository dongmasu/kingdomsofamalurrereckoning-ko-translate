# Disposition and Edit Batch: `default` IDs 28801-28850

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28801-28850, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: three accepted, seven `not an issue`, and eleven uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 28802 | `연구실을 단계별로 구성했으니 난이도도 점차 높아질 거야.` | `실험은 단계별로 조정했으니 난이도도 점차 높아질 거야.` | English describes pacing a study to create a difficulty gradient; Japanese explicitly describes adjusting the experiment, and Chinese also refers to research pacing. The current `연구실` suggests a physical laboratory and `구성` obscures the staged experiment. |
| 28835 | `사람들이 널 얻은 건 축복이야.` | `사람들은 네가 있어 복 받은 거야.` | English and Japanese say the people are blessed by having the addressee. The correction retains the praise in natural Korean rather than calquing “obtain you.” |
| 28843 | `출혈 중인 적을 공격할 때마다 14% 확률로 추가 피해 180을 줍니다.` | `출혈 상태인 적을 타격할 때마다 14% 확률로 추가 피해 180을 줍니다.` | English explicitly says “each hit against a Bleeding enemy”; Japanese and Chinese also describe hits/attacks against bleeding enemies. `타격` preserves the per-hit trigger more precisely than an attack action. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28812 | Taking the master's place after Andronikos's death | Not an issue: Korean's succession wording is supported by English's “fill the master's shoes” and Japanese; the speaker's skepticism is retained. |
| 28817 | Black blades made from Akara-Tor volcanic glass | Not an issue: Korean preserves the material, magical shaping, prized-relic status, and the island without Fae inhabitants; Japanese's alternate `Fae-blade` wording does not override the English. |
| 28818 | `부름받은 자` / Beckoned | Not an issue: the established project rendering is retained, as is the shopkeeper's offer. |
| 28823 | Sigil-stone and landmark sequence | Not an issue: Korean distinguishes the landmark stone from the sigil stones and preserves the activation order and stated purpose. |
| 28831 | Block values | Not an issue: Magic `13`, Melee `10`, and Ranged `10` are retained on separate lines. Canonical Korean block terminology remains open. |
| 28848 | Adessa upgrade price variable | Not an issue: `$NQD_City_Adessa.upgrade_price$` is preserved exactly and `Gold` is localized without changing the price variable. |
| IDs 28801-28850 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the IDs once in the same order; the preliminary check reports matching line-break counts and normalized runtime-token identities/order. |
| 28804 | Fragment `of Lightning Warding` | Uncertain: retain the incomplete fragment; the canonical item/effect term and neighboring UI context are not established. |
| 28806 | “working his followers into a froth” | Uncertain: Korean conveys agitation, but English's frenzy idiom, Japanese's transformation reading, and Chinese's incitement reading differ in force. |
| 28808 | “Punctuality is not one of your people's strengths. And you have so few.” | Uncertain: the joke may pivot from few strengths to a small population; locale interpretations differ and the target group is context-dependent. |
| 28819 | Guardians of “these circles” | Uncertain: English and Korean suggest magic circles/ritual sites, while Chinese reads guardians of the Cycle. Keep pending quest/lore context. |
| 28827 | `Myself? ... Our House ... We` | Uncertain: the source shifts between singular and formal/royal plural; Korean does so as well, but the speaker's voice and House of Pride rank need context. |
| 28831 | Korean term for `Blocks` | Uncertain: values are correct, but the canonical combat-stat verb remains unresolved. |
| 28836 | Capitalized `Traveler` in an insult | Uncertain: it may name the Travelers faction rather than a generic traveler; preserve the interruption and insult pending glossary alignment. |
| 28839 | `master-less apprentice` | Uncertain: Korean implies the apprentice lost the master; English only says master-less, Japanese implies the master died, and Chinese shifts to near completion of training. |
| 28842 | `upstart` | Uncertain: Korean `신참` may soften the disparaging sense; English and Japanese are more pejorative, while Chinese says novice. |
| 28849 | Ambush once the castle is in sight | Uncertain: the visibility threshold is preserved, but the referent of “him” and the exact creature/name wording need context. |
| Other named terms in IDs 28801-28850 | Fae Speakstone, Secandra, Farrara, Hallam, Chaos/Telogrus, Andronikos, Straton, Wencen, Cydan, Akara-Tor, Beckoned, Sacrificial Altar, Nerotelos, Tuatha, Florion, Almain, Fateless One, House of Pride, Stowaway, Fateweaver, Amethyn, Apotyre, Gravehal Keep, Jottun, and Crownhold | Uncertain: defer canonical names, factions, item types, titles, and lore terms to integrated terminology review. |

## Verification

- Only the approved `Texto` cells at IDs 28802, 28835, and 28843 changed.
  IDs, order, variants, and all other CSV fields were left untouched.
- The active default CSV retains its UTF-8 BOM, `72,046` CRLF endings, and
  `39` pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `TO_BE_VERIFIED`.
- Register totals after this batch: 884 accepted, 3,031 `not an issue`, and
  5,084 uncertain (8,999 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28851; 36,284 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
