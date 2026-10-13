# Preliminary Language Scan: `default` IDs 52051-52100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 52051-52100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 52051 | `사반트 리언(Savant Reen)` | Confirm `Savant` as the character's rank/title and standardize Reen's spelling. | English identifies a named person/rank; Japanese and Chinese also render Savant as a rank/title. The precise institution is not stated in this row. | Medium |
| 52054 | `처형인(Headsman)` | Confirm whether Headsman is a named pursuer/creature or the generic office “executioner.” | Korean translates the term as an executioner while preserving that the scouts are being picked off. Japanese also uses a transliterated Headsman, suggesting a possible named threat; English capitalization is inconclusive. | Medium |
| 52059 | `구성원은 한 번도 바뀌지 않았어` for “no change to the lineup” | Clarify whether this means membership, team composition, or the Lords' lineup. | Korean preserves the sense that no lineup change has occurred since the person brought them in. Chinese may interpret it as there being no new Lords; the English remains ambiguous. | Medium |
| 52060 | `난민들이 희생된 건 내 잘못이야` for refugees “were lost” | Determine whether the refugees died, disappeared, or were otherwise lost. | English uses the ambiguous `lost`; Japanese says they died, and Chinese says they went missing. Korean's `희생된` implies death, so scene context should settle the choice. | High |
| 52066 | `불려온 자(The Beckoned)` | Confirm whether “The Beckoned” is a formal title and the canonical Korean term. | Korean preserves the capitalized title bilingually and the claim that the addressee answered the community's prayers. Japanese and Chinese use their established destiny/calling terms. | Medium |
| 52067 | `무덤 파는 자, 달리는 자, 야수` | Confirm whether the three card labels are named cards/omens and standardize their titles. | Korean retains the three parallel images. Japanese and Chinese treat them as named card types; their lore meaning is not recoverable from this line alone. | Medium |
| 52069 | Cipher / Hyperian / Anokatos sequence | Preserve the restoration and unsealing sequence without collapsing the named entities. | Korean retains the Cipher being whole, the addressee's recovery, unsealing Hyperian to stop Anokatos, and the additional accomplishment. | High |
| 52071 | `다른 이들을 축하하며 맞이하고 싶었지` for “celebrate with others” | Confirm whether the intended contrast is hospitality/welcoming others versus killing them, or celebrating together. | English says “celebrate with others”; Japanese explicitly paraphrases this as welcoming other races, which Korean follows. The public-house context supports hospitality, but the source phrase is broader. | Medium |
| 52072 | `나도 최선을 다할게` | Treat the English row as an unfinished fragment and avoid inventing its object/completion. | English ends “I will do my best” with no punctuation or stated task. Korean supplies a natural sentence ending but does not invent an object; Japanese similarly completes the fragment. | Medium |
| 52076 / 52084 | Lyria / `리리아` | Confirm whether Lyria denotes a goddess, religious faith, or both. | Korean renders “hold fast to Lyria” as believing in Lyria and compares her to surrounding waters. Japanese explicitly calls people Lyria worshippers; Chinese also presents Lyria as a deity-like figure. | Medium |
| 52088 | `습격자가 ... 그들이 폐허로 달아나는` | Confirm the number/identity of the escapee(s) referred to by `them`. | English introduces one mysterious attacker, then uses plural `them`; Korean preserves a singular attacker and plural pronoun. Japanese makes the escaping party an enemy, and Chinese also retains plural pronouns. | Medium |
| 52090 | `준비가 되면 네가 털어놓겠지` for “you will share” | Clarify what the addressee will share and whether it means revealing a secret or sharing something else. | The English omits the object. Korean and Japanese interpret it as a disclosure/confession; the three dead mages are a preceding aside, not an explicit object. | Medium |
| 52093 | `쓰레기 더미` for “Refuse Pile” | Confirm whether this is a UI/container category rather than a named location. | Korean gives the ordinary garbage-pile sense. Chinese uses “refuse stack,” while the English capitalization may indicate an inventory/UI label. | Medium |
| 52094 | `살짝 사용한 냄새` | Preserve the joke while checking natural Korean phrasing for an item that smells “slightly used.” | Korean follows the source's intentionally odd smell description literally; the phrasing is awkward but may be deliberate humor. | Medium |
| 52095-52096 | Two poems: Grim's coup rhyme and the Gravehal/Ulftsen ballad | Review rhyme, names, and imagery while retaining the exact line layout. | Korean preserves each source line break and the poem narrative. The compact 52095 rhyme loses some English sound-patterning; 52096 includes obscure “gray-dusk fastings” and “bright-tide” imagery whose exact lore meaning remains uncertain. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names/terms remain open for consistency, including Onesimos,
Winter Court, Lords of Valor, Harst, Gorhart, Grim, The Beckoned,
Gravedigger, The Running Man, The Beast, Cipher, Hyperian, Anokatos,
Loremaster, Phasmer Humm, Rithen, Lestla Alstard, Lyria, Seelie Fae,
Soulbind, Magnus, Cydan, Ost, Apotyre, Destiny, Refuse Pile, goldsilk,
Irion, Solsvard, Ulftsen, Draug-bane, and Gravehal. Existing Korean forms
were preserved.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 52051-52149. It flags
  the Savant rank, Headsman, Winter Court epithets, Lords of Valor lineup,
  missing refugees, Beckoned, card names, Cipher/Hyperian/Anokatos,
  Loremaster, the hospitality/public-house contrast, the unfinished 52072
  fragment, Lyria, the Soulbind curse, attacker pronouns, the crazy-maiden
  insult, the unspecified sharing at 52090, Destiny UI, Refuse Pile, used-
  smell joke, poems, and canonical names.
- The historical structural note specifically covers the localized
  `{*1[Active]}` marker at 52068 and lineation at 52095-52096; both were
  rechecked below. Questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 52051-52100 once
  and in identical ascending order.
- Physical line-break counts and detected runtime-token identities/order
  match throughout this range. ID 52068 preserves its `{*1}` marker and
  line break. IDs 52095-52096 preserve their source poem lineation. No
  hidden format/control characters were detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 52051-52100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 52101.
