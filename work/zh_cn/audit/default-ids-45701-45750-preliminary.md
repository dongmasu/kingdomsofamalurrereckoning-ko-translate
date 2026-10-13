# Preliminary Language Scan: `default` IDs 45701-45750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45701-45750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45701, 45748 | `Red` / `레드(Red)` | Determine whether Red is the same person, a faction, or a name used differently in the two lines. | At 45701 English and Chinese personify Red, while Japanese reads Red Legion; at 45748 all references frame Red as an individual/faction figure. Korean preserves the English name without resolving identity. | Medium |
| 45703, 45742 | `Castellan` / `성주` | Confirm whether Castellan is a formal rank/title and standardize it across the standalone label and plural objective. | Korean consistently uses a lord-of-the-castle sense; Japanese and Chinese also use a governor/castle-lord term. | Medium |
| 45706 | `Headsman` / `처형자` | Check whether the capitalized term is a named executioner/title rather than a generic executioner. | The line contrasts those who fall to the Headsman with prisoners held at Tinehil; the English capitalization suggests a possible proper role/name. | Medium |
| 45707 | `Basilica Gnostra` / `그노스트라 대성당` | Confirm the canonical location spelling and whether Basilica should be rendered as a basilica or cathedral. | English provides a proper name; Japanese omits Gnostra and Chinese uses a “great cathedral” form. Korean preserves both the name and institution. | Medium |
| 45708 | `Mitharu's order` / `미사루의 질서` | Resolve whether `order` means Mitharu's cosmic order or a religious organization, without overriding the English with unsupported context. | English and Chinese can mean order/structure; Japanese reads it as a religious order. Korean follows the former reading. | Medium |
| 45710 | `Court of Summer` / `여름 궁정` | Align the faction/court title with other seasonal Courts. | Korean translates the title, while Japanese transliterates and Chinese uses a court/royal-house form. | Medium |
| 45713 | `Sagecrafting goods` / `마법물품 제작 용품` | Verify the official Korean term for Sagecrafting and whether the current nested “crafting goods” wording is natural and consistent. | The English identifies a merchant of specialist Sagecrafting supplies; Japanese transliterates the skill and Chinese calls the goods enchanting items. | Medium |
| 45720 | `Banned items here` / `금지된 물건은 여기서 구해` | Confirm whether this is a vendor sign advertising prohibited goods or a restriction notice. | Korean explicitly reads as an offer to obtain banned goods here; the isolated English fragment and Chinese do not fully settle its function. | Medium |
| 45722 | `Dispelling` skill / `해제 기술` | Standardize the named skill and ensure the permanent-bonus effect remains explicit. | Korean preserves that reading the book permanently improves the reader's skill; terminology differs across Japanese and Chinese. | Medium |
| 45729 | Erathi reliquary / `에라시 성유물함` | Confirm whether the item is a reliquary and whether “oldest, shiniest junk” is dismissive description of its contents. | Korean retains the reliquary, age, shine, and dismissive tone; the referent of “it” depends on context. | Medium |
| 45731, 45741 | Acatha; murghan; banshaen | Confirm canonical location and creature spellings, and preserve that banshaen strengthen murghan. | Korean retains the flooded-plain location and the creature-strength relation; Japanese/Chinese use different transliterations or descriptive creature names. | Medium |
| 45733 | Jenniker's Device; Rond Farm; Cranalt | Verify proper-name forms and distinguish the artifact's setting from its deactivation. | Korean preserves the failed setting, return to Cranalt, artifact deactivation, and the goal of ending the Rond family's madness. | Medium |
| 45737 | Tirin poem / `티린` and `도크알브` | Review the archaic voice, ambiguous introductory clause, names, and quoted prophecy without changing its layout. | Korean retains the content and all seven line breaks, including the blank-line separator; English/Japanese/Chinese differ in how the opening and Lyria's “hand” are construed. | Medium |
| 45739 | `The Crossing` / `교차점`; Keepers / `수호자들` | Confirm whether Crossing and Keepers are formal names/titles rather than generic terms. | English capitalizes both; Korean renders them descriptively, Japanese quotes Crossing, and Chinese uses generic terms. | Medium |
| 45743-45744 | House of Sorrows, Winter Fae, Skoria family | Standardize faction and family terminology. | Korean retains House of Sorrows in English alongside transliteration and renders Winter Fae and the Skoria family as group names; Chinese translates the House name more freely. | Medium |
| 45747 | Fate meter, Reckoning, Tirnoch prompt | Preserve marker identities and controls; record the Japanese-only localized marker reorder. | English, Chinese, and Korean order the three localized `*1` markers as Fate meter, Reckoning, Tirnoch; Japanese places `{1}`/`{2}` before Reckoning and Tirnoch. Each locale retains all three marker IDs and both controls. | High |
| 45749 | `Trellis` / `트렐리스` | Confirm whether Trellis is a proper location and preserve the threat to a mortal who remains there. | English capitalizes Trellis; Korean retains it as a place name, while Japanese and Chinese use more generic gathering-place/shelter readings. | Medium |

IDs 45702, 45704-45705, 45709, 45711-45712, 45714-45719,
45721-45728, 45730, 45732, 45734-45736, 45738, 45740, 45745-45746,
and 45750 generally retain the English meaning on this first reading.
Dialogue register and names remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45650-45749. It
  specifically flags Red's identity, Basilica Gnostra, Mitharu's order,
  Court of Summer, Sagecrafting, Caeled Coast, Dispelling, the Boggart
  gesture, the Erathi reliquary, Acatha/murghan, Rond Farm, Tirin's poem,
  Crossing/Keepers, banshaen/Castellan, House of Sorrows/Winter Fae,
  Skoria, and Trellis.
- ID 45747's localized marker text and runtime structure were checked
  against the historical note. The Japanese marker-order difference is
  recorded as a locale-specific structural exception, not an edit request.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45701-45750 once
  and in identical ascending order.
- All four locales preserve matching line-break counts, including all seven
  breaks and the blank paragraph separator in ID 45737.
- Runtime markers and control variables are retained. At ID 45747, all
  locales preserve three localized `*1` markers plus `{1}` and `{2}`; only
  Japanese changes their order.
- Japanese spells out `2` at 45704 (“both of you”) and `1` at 45742
  (“every single Castellan”); these are compatible with the English meaning,
  not confirmed numeric discrepancies.
- No special-whitespace or hidden-formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45701-45750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 45751.
