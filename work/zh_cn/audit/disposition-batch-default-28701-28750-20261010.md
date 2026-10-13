# Disposition and Edit Batch: `default` IDs 28701-28750

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28701-28750, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, two `not an issue`, and ten uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28707, 28750 | Frost Trap stats / named icon | Not an issue: `55` Ice Damage, `15` Freezing Damage over `5` seconds, and `40` Mana remain distinct; `#NAMED_ICON_GRAY_360_B#` is preserved. |
| 28729 and remaining ordinary text/structural checks | `신성모독` / “desecrations”; IDs/order, breaks, and other unflagged dialogue | Not an issue: Korean naturally conveys the acts of desecration and their effects on reveries/soul; no additional isolated correction is supported. IDs/order and normalized markers/breaks match across locales. |
| 28704 | Mitharu's power / “your beads” / “each one” | Uncertain: English leaves the devotional locations implicit and says beads gain strength; Chinese supplies temples and prayer beads, while Japanese omits beads. Confirm the ritual/object context before replacing `구슬` or resolving the antecedent. |
| 28705 | `모금함에 모인 돈` / “share from the collection” | Uncertain: Japanese/Chinese support fundraising/donations, but English keeps the contents euphemistic. Retain pending scene context. |
| 28711 | `공성 파괴자` / `Siege-breaker` | Uncertain: capitalized address may be a formal title or epithet; locale renderings vary from heroic title to military rank. |
| 28714 | `혼자 공연하고 있어` / “a solo act” | Uncertain: performance is plausible, but English may refer to the current act/performer; preserve pending speaker context. |
| 28718 | “Good Alfar” / Ansillas as an investment | Uncertain: the line combines a people/family label with business wordplay; locale punctuation and phrasing differ. |
| 28724 | “Do I look like a Gifre?” | Uncertain: English and Korean preserve the joke, but Gifre's identity/reference is not established in the isolated dialogue. |
| 28726, 28730 | Winter Fae nature / Vraekor | Uncertain: the broad lore relationship is retained, but `nature` and the deity's canonical spelling need integrated glossary/context review. |
| 28739 | Missives planted on Argine / public removal | Uncertain: the forged-evidence plan is retained, but English/Japanese/Chinese differ on whether the Missives are letters/book(s) and on the exact delivery action. |
| 28748 | `보름(Vorm) 형제의 산장` / “the Vorm brother's lodge” | Uncertain: English is singular, Japanese says a lodge run by a Vorm brother, and Chinese/Korean suggest plural brothers/family. Do not infer number without context. |
| Other named terms in IDs 28701-28750 | Rast, Travelers, Magnus, Mitharu, Ansilla, Drewn, Argine, Master's Pick, Sinsear, Tuatha, Scholia Arcana, Alfar, Alyn Shir, Amethyn, Bede, Gifre, Summer Court, Winter Fae, Malthon, Champ, Telogrus, Lyenna, Dead Kel, Lyria, Sidhe, and Vorm | Uncertain: preserve current identities pending canonical name, faction, item, deity, and lore terminology alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28701-28750 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
- No Korean `Texto` cell or source CSV changed in this batch.
- Active default CSV SHA-256 remains
  `e15a2796db09695a4845f9efa9f884ac4eb35cb815bf5289fe2774ceb25f4224`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 881 accepted, 3,018 `not an issue`, and
  5,060 uncertain (8,959 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28751; 36,384 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
