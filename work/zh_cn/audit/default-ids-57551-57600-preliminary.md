# Preliminary Language Scan: `default` IDs 57551-57600

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 57551-57600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 57551 | alchemy workbench/potions/alchemy markers | Preserve the three localized `{*1...}` labels while checking whether their order is intentionally language-specific. | English and Japanese place the labels in the order workbench → potions → alchemy; Chinese and Korean use workbench → alchemy → potions to match sentence syntax. All four retain three `{*1}` marker identities in sequence and the same line-break count; the visible labeled-marker order differs between locale pairs, not through missing markers. | Medium |
| 57553 | Mitharan Frosted Grip / `서리 장식 손잡이` | Confirm the crafting-component sense of `Grip` and the canonical rendering of `Frosted`. | English names a flawless Mitharan component. Japanese transliterates the whole item; Chinese renders a frosted grip. Korean conveys a grip/handle and frost decoration, but the exact material/affix terminology remains open. | Medium |
| 57557 | left block gate / right key / `맞는 열쇠` | Preserve the source's unusual left/right phrasing and confirm whether “right key” means the correct key or a key on the right. | English says the left block gate needs the “right key”; Japanese and Chinese resolve this as the correct/matching key. Korean follows that interpretation, which is supported but not certain without gameplay context. | Medium |
| 57562 | Brigand Hall / `도적단 회관` | Confirm whether this is a named hall, cave, or other location and standardize its Korean form. | English calls it a hall, Japanese calls it a brigand cave, and Chinese renders a robber hall. Korean follows the English structure but translates the name as a gang hall. | Medium |
| 57568 | ale-price/cork joke / `동전 한 닢`, spilled keg | Preserve the comic setup that a mug costs a coin but a rat stole the cork and spilled the keg. | English omits an explicit price number; Japanese specifies one coin for one mug, while Chinese/Korean retain the coin-and-spilled-keg joke. Korean does not add an unsupported numeric price. | Medium |
| 57570 | Unseelie Fae / Court of Winter / `언실리 페이`, `겨울 궁정` | Confirm canonical faction and court forms. | All sources identify Alabastra as home to the Unseelie Fae and Court of Winter. Korean preserves both as proper terms; transliteration should be standardized across the corpus. | Medium |
| 57574 | pattern convergence / air and light energies / `무늬 가운데 하나가 모이는 지점` | Clarify the “one such pattern” relationship and preserve that this place focuses air/light energies. | English calls the place a convergence of such a pattern and a focus of air and light. Japanese/Chinese also describe a central/focal place. Korean preserves the energies but its phrase about one pattern gathering among patterns is syntactically unclear. | Medium |
| 57577 | scavs in Storm Point garden / escorting the couple | Preserve the request to deal with the deadly scavs and then follow the couple to ensure safe arrival. | All sources agree on the couple, garden nest, and safe-arrival objective. Korean retains both the combat request and the escort step. | Medium |
| 57582 | Cynric boys / `시니릭 형제들` | Confirm whether “boys” refers to brothers/family members or simply the young men associated with Cynric. | English and Chinese call them the Cynric boys; Japanese calls them Cynric's people. Korean renders `boys` as “brothers,” adding a family relationship not established in this row. | Medium |
| 57585 | sanctity/putrescence / Gallows Tree / `성스러운 땅`, `교수대 나무` | Preserve the source's sacredness-to-corruption image and confirm the named Gallows Tree form. | All sources agree that Tuatha war and displayed corpses desecrate the land and tree. Korean retains the corpses, bloating/rot, and tree, but turns “sanctity” into “sacred land,” a more literal geographic image. | Medium |
| 57588 | dollop of paint / puzzle-piece edges / `물감 한 덩이` | Preserve the metaphor that the player changes the boundaries of puzzle pieces they encounter. | English, Japanese, Chinese, and Korean agree the player is no longer a piece but a portion of paint that covers/redefines other pieces' edges. Korean keeps both images and the transformative claim. | Low |
| 57593 | Pledgeshields / `서약 방패단` | Confirm the faction name and the intended sense of “nicks and dings” on its armor. | English says the speaker can do little besides repair minor scratches and dents on the Pledgeshields' armor. Korean preserves the faction and both types of damage; spelling should match the established group form. | Medium |
| 57595 | treatment of the Almain / Fellfire Pit essence | Confirm the earlier treatment/context and preserve the plan to repeat its success at greater scale. | English and Japanese say “with/on the Almain”; Chinese and Korean make the people the recipients of the success. Korean preserves the larger scale, other plant essence, and Fellfire Pit source, but the ethical/medical context remains open. | Medium |
| 57599 | Gambit / `+20%`, `5%`, Combo Point | Preserve +20% Evade Chance and 5% Health/Mana restored per Combo Point on detonation. | English, Chinese, and Korean agree on detonation; Japanese says on hit. Korean follows English/Chinese and preserves both percentages and the per-combo-point relation. This is a source-reference discrepancy to resolve in gameplay/context review. | High |
| 57600 | “What you in for, mate?” / `여긴 무슨 일로 왔어, 친구?` | Preserve the casual prison-context question without over-specifying a crime. | English and Chinese ask why the speaker is imprisoned; Japanese gives a general “why are you here?” Korean retains the colloquial question without naming a charge. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Proper names and terms remain provisional,
including alchemy workbench, potions, Mitharan Frosted Grip, Flooded
Cavern, Grian, Fae, Brigand Hall, Fire Rune, Alabastra, Unseelie, Court
of Winter, Tuatha, Darkvari, Zungar, Tirbolg, Emaire, scavs, Storm Point,
Deireadh, Akara, Gallows Tree, Aurenda, Pledgeshields, Almain, Fellfire
Pit, Witch Knight Malwyn, Archsage Caledus, Gambit, Combo Point, and
Eagonn.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `57550-57649`.
  Applicable prompts include Dame Oleyn/song and Fenian Cycle (57550),
  Mitharan Frosted Grip (57553), left-block/right-key wording (57557),
  Brigand Hall (57562), ale-price joke (57568), Unseelie (57570), scavs
  (57577), Cynric boys (57582), Akara myth (57584), paint/puzzle metaphor
  (57588), Pledgeshields (57593), Almain treatment (57595), and Gambit
  scaling (57599). These remain open prompts, not accepted corrections.
- Compared ID 57599's 5% restoration timing directly: English/Chinese/Korean
  say on detonation; Japanese says on hit. Korean follows the English
  primary source provisionally and preserves the values.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 57551-57600 once
  and in identical ascending order. The four full `default` files contain
  65,135 records with matching key order.
- Newline counts and raw runtime-marker identities/order match throughout
  the batch. At 57551, all locales have three `{*1}` markers, but their
  localized label order differs: English/Japanese workbench → potions →
  alchemy; Chinese/Korean workbench → alchemy → potions. This is recorded
  as a localized marker-order exception, not a missing-marker defect.
- Values at 57599 (`+20%` Evade Chance and `5%` Health/Mana per Combo
  Point) match across all locales. No other numeric discrepancy was
  identified in the range.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 57551-57600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 57601.
