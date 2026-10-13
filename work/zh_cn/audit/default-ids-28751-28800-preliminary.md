# Preliminary Language Scan: `default` IDs 28751-28800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28751-28800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28751-28760, 28763-28766, 28768-28774, 28776-28778, 28780, 28783, 28785-28786, 28788, 28790, 28793-28796, 28800 | Dialogue, lore, names, item/UI labels, and objectives | Recheck register, established names, and terminology in the integrated pass. | Korean generally conveys the English. Varani, Ayten, Prismere Basin/Orb, Brit Codgan, Keen, Klurikon, Archsage/Adept, Hallam the White, Dread/Panic, Caerwyn, Niskaru, Faelands, Fateless One, Chaos Realm, Goodchild, Quays/Rathiri, Primal Duration, notices, Searstalk, Arhaus Vorm, and Zungars remain terminology/context candidates. | Medium |
| 28755 | `그자를 믿을 수 있어` for a gender-neutral `there's no one` | Avoid adding a gender or a specific person's identity; confirm whether the line refers to a guide already established in context. | English does not identify gender or referent. Japanese also leaves it general; Chinese uses a feminine pronoun. Korean's `그자` can sound marked or dismissive despite the neutral English. | Medium |
| 28761 | `네 종족 중 한 사람` for “one of your kind” | Confirm whether “kind” means the addressee's race/species or another group, and preserve that the bauble was found on a corpse. | English is deliberately broad; Chinese narrows it to a human, while Japanese says mortal. Korean uses “your kind” without choosing a species. | Medium |
| 28762 | `기다리게 하지 말게` for “I wouldn't keep ... waiting” | Check whether the speaker is advising/warning the Adept or stating their own intention; preserve the address/rank. | English is an indirect warning/advice formula. Japanese is an imperative and Chinese states the speaker will not keep the Archsage waiting; Korean also uses direct advice. The role `Adept` remains a terminology question. | Medium |
| 28765 | `백색의 할람(Hallam the White)` | Determine whether “the White” is a formal epithet, hair description, or title, and preserve the question about who sent the addressee. | English capitalizes the epithet. Japanese has “White Hallam,” while Chinese explicitly reads “white-haired Hallam.” Korean retains the epithet but does not settle its sense. | Medium |
| 28767 | `공포` / `공황` for `Dread` / `Panic` | Confirm whether these are formal ability/status names and preserve the guaranteed critical-hit condition. | English guarantees a critical hit against enemies in Panic. Japanese expresses 100% chance; Chinese says guaranteed critical damage. Korean preserves certainty but renders the names as ordinary status terms. | High |
| 28771 | `제단 표면 위의 반지에 불이 붙었다` | Preserve that the ring ignited while on the altar; check whether the source means contact with the surface or simply its location there. | English says it ignited “upon the surface”; Chinese explicitly says touching the altar caused ignition, while Japanese and Korean describe it as on the altar. The causal contact is not explicit in English. | Medium |
| 28775 | Block values: 92 Magic, 69 Melee, 69 Ranged | Standardize the Korean combat verb for `Blocks` and keep all three damage categories and values. | All four sources preserve 92/69/69. Korean uses `막습니다`; Japanese uses block, while Chinese uses a parry verb. This remains a UI terminology question. | High |
| 28776 | `축 늘어진 손` for “limp hand” | Do not add that the hand was severed; preserve that the note was crumpled and held in the dead bandit's hand. | English says `limp hand`; Japanese says the hand has lost vitality. Chinese alone says the hand was severed. Korean follows English/Japanese without adding dismemberment. | High |
| 28779 | `질서` for `the order`; `서부 패란즈(Faelands)` | Clarify whether `the order` is a named organization and align the regional name with the glossary. | English says the order faced a crisis after Caerwyn's death and the last Niskaru left the western Faelands. Korean preserves this sequence; names and the sense of “fade away” remain open. | Medium |
| 28782 | `대지의 기운을 받아 다시 힘을 얻어야 해` | Preserve the speaker's need to leave the cave temporarily and renew themself through the land without over-specifying the mechanism. | English says “renew myself with the land”; Japanese says reconnect with the earth, Chinese says be reborn on the land, and Korean interprets it as receiving the land's energy/regaining strength. | Medium |
| 28784 | `……그랬지` for the fragment `... I was.` | Retain the broken/context-dependent opening until its preceding dialogue is known; do not silently complete the sentence. | English is explicitly a fragment. Japanese and Chinese translate it as “that was so / I once was,” and Korean likewise supplies a retrospective acknowledgment. Historical audit flags this fragment. | Low |
| 28789 | `알려주실 겁니다` for “will reveal” | Check whether the Majesty reveals/shows information or verbally tells it; preserve the formal honorific register. | English and Japanese use a reveal/show sense, whereas Chinese says the Majesty will tell it. Korean uses “let you know,” a plausible but less literal rendering. | Medium |
| 28792 | `라시르(Rathir)의 주민 수만큼` for “as many ... as full Rathiri” | Recheck the odd comparison and the intended scale of the number of Varani sailors; retain the lazy-bones brother detail. | English is compressed/unclear. Japanese interprets this as as many sailors as all Rathir citizens, Chinese as “as the whole Rathiri,” and Korean makes the population comparison explicit. Rathiri/Rathir terminology also remains open. | Low |
| 28797 | `투린이 때 이르게 죽었으니` and return the scroll to Jedda | Preserve the quest action: Turin's death means the speaker must return his scroll to Jedda, not merely report his death. | English, Japanese, and Korean all say to return the scroll; Chinese instead says to tell Jedda of Turin's death. The historical inventory associates a “cards” metaphor with ID 28797, but the active English/Japanese/Chinese/Korean row is about Turin's scroll. Treat that historical ID reference as an audit-index mismatch pending reconciliation, not as evidence about this row. | High |
| 28798 | Relentless Assault: 10 seconds, -30% Armor, 35 Mana | Preserve duration, armor reduction, and cost; confirm the canonical ability name and Korean stat label. | English, Japanese, Chinese, and Korean agree on 10 seconds, 30% reduction, and 35 Mana. Korean preserves the source order and values. | High |
| 28799 | `축복` | Clarify what the speaker means by “blessing” and whether the newcomer sees it as favorable treatment; retain the warning and hesitant tone. | All locales preserve the speaker's doubt that the event is truly a blessing. The preceding context is needed to determine whether it is a ritual, honor, or other treatment. | Medium |

## Historical Audit Reconciliation

- The historical inventory for IDs 28700-28799 flags the proper names and
  terms in this batch, especially the fragment at 28784, and asks to review a
  “cards” metaphor at 28797.
- Direct inspection of all four active locale rows shows that ID 28797 is
  about returning Turin's scroll to Jedda. The historical “cards” reference
  may point to another ID or reflect an indexing error; it remains recorded
  as an audit mismatch rather than silently reassigned.
- ID 28775's three block values are preserved. Other candidate questions
  remain open and are not approved terminology decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28751-28800 once,
  in identical order.
- Embedded line-break counts and extracted runtime-token identities/order
  match across all four locales. ID 28775 retains 92 Magic, 69 Melee, and 69
  Ranged damage blocked.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28751-28800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28801.
