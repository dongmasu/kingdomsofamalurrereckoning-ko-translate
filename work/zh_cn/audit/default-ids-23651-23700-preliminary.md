# Preliminary Language Scan: `default` IDs 23651-23700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 23651-23700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 23651 | Galette | Determine whether Galette is a character, food, item, or place name before standardizing its Korean form. | Korean transliterates the isolated label; context is absent. | Low |
| 23652 | `I done hearing requests` | Treat the source grammar as an error and preserve the intended refusal to hear more requests. | Korean naturally renders the intended meaning; Japanese supports the same reading and Chinese is malformed differently. | Low |
| 23653 | Vietnam | Determine whether this is intended content or a developer/test artifact. | All four locales name Vietnam; the historical audit explicitly leaves the string's status open. | Medium |
| 23654 | `{*1[Active]}` / shadow-magic attacks | Preserve the marker and line break, and align stagger, Pierce, and Bleeding terminology. | Korean keeps the marker, newline, forward arc, stagger, repeat-button instruction, and damage types. Japanese/Chinese localize the marker label; Korean retains `Active`. | Medium |
| 23655 | “Damned quiet, damned fools” / concerned | Preserve the exasperated mutter and the quick, apologetic shift to concern. | Korean retains both insults and the change in tone. | Low |
| 23659 | greatest devotee / taken up the mantle | Clarify whether mantle means a name, identity, title, or role. | Korean explicitly says imposters took the addressee's name and status; the source leaves the exact sense open. | Medium |
| 23664 | House of Ballads / role losing meaning | Align House of Ballads with the established faction/title form and preserve the plan to rename its sorrows. | Korean uses `발라드의 궁정` and retains the speaker's rule and renaming intention. Historical group-name question remains open. | Medium |
| 23666 | Sworn to War / mercenary creed / Niskaru vigil | Standardize the faction and preserve the parallel commitments to its creed and to striking every Niskaru threat. | Korean retains both commitments and the active threat response. | Medium |
| 23669 | Escape the Trial | Confirm whether this is a quest objective, action label, or menu command. | Korean uses an infinitive-style objective; the isolated line does not settle the UI role. | Low |
| 23675-23676 | Beckoned / Circle of Engard / House of Valor / Fae rites | Align Beckoned and House terms, and preserve that the Circle seeks to restore rites lost when mortals took the House. | Korean uses `부름받은 자` and `용맹의 전당`; both differ from other provisional renderings. It retains the Circle, mortal takeover, and lost rites. | High |
| 23678 | family legacy says “it will” / son's death | Identify the omitted antecedent and preserve the mother's uncertainty and refusal to watch her son die while hope remains. | Korean supplies “the remedy works” from context but keeps uncertainty and the hope-based motive. | Medium |
| 23679-23680 | Detect Hidden / Fateweaving | Align both ability names with the Korean UI/glossary decisions. | Korean uses `숨은 것 감지` and `운명 엮기`; historical glossary questions remain open. | Medium |
| 23681 | Preordained / abduct and terrorize | Standardize the faction name and retain its single stated task. | Korean preserves the abduction and intimidation purpose. | Medium |
| 23682 | Owaiglyn's soldiers / “cleared the gates” of Mel Senshir | Clarify whether the soldiers secured the gates or cleared enemies away from them; standardize names. | Korean says they secured the gates; English is ambiguous and Japanese/Chinese read it as clearing/sweeping the gates. | High |
| 23684 | “don't let the righteousness fool you” | Preserve the warning against a false appearance of justice and the accusation of self-interest. | Korean renders the phrase as pretending to be righteous and retains the claim about everyone in Whitestone. | Medium |
| 23685 | retired healer / arena wages / back in business | Preserve the return-to-work joke and distinguish “business” from a specific business venture. | Korean says the speaker would be foolish not to work again; Japanese/Chinese also support returning to practice. | Low |
| 23690 | “hold it again” / time running out | Identify the object and whether “hold” means hold, wield, or wear it. | Korean says to hold it in the hand; Chinese says wear it again and English leaves the object unnamed. Historical question remains open. | High |
| 23691 | fourth map / “pieces” | Preserve that the objective is to find fragments belonging to the fourth map. | Korean uses `지도 조각`, supported by Japanese/Chinese. Japanese writes the ordinal as 4; the value is unchanged. | Low |
| 23692 | Red Marches / “make it alone” | Preserve the speaker's hesitation and whether “make it” means reach the destination or cope alone. | Korean says they may not manage alone; the destination and uncertainty remain. | Medium |
| 23693 | rain of Prismere / filth | Verify Prismere as material/lore and retain the cleansing metaphor. | Korean preserves the material name and the promise to wash away filth. | Medium |
| 23696 | Summer and Winter Fae “are indeed one” | Determine whether “one” means one people, nature, or underlying entity without narrowing the lore claim. | Korean says the two are in fact one; English leaves the precise relationship open. | High |
| 23699 | Captain Janya | Verify the character's name and align its Korean form. | Korean uses `자냐`; the isolated grave label does not provide additional name evidence. | Low |
| 23700 | Guinea | Determine whether this is the country name or an in-world/test string. | Korean transliterates the English label; no context resolves the intended referent. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 23651, 23653-23654, 23659,
  23664-23666, 23669, 23675-23676, 23678-23682, 23690-23693, 23696, and
  23699-23700 against the active rows. Faction, name, marker, lore, and
  context questions remain preliminary.
- Cross-checked recurring forms for Galette, Vietnam, Active, Nix,
  House of Ballads, Sworn to War, Niskaru, Beckoned, Circle of Engard,
  House of Valor, Detect Hidden, Fateweaving, Preordained, Owaiglyn,
  Mel Senshir, Whitestone, Mithros, Prismere, Summer/Winter Fae,
  Captain Janya, and Guinea.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 23651-23700 exactly
  once and in identical order.
- ID 23654 preserves one embedded line break and the `{*1[Active]}` marker in
  all locales; marker labels are localized by Japanese/Chinese only.
- No other line-break or runtime-marker discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 23651-23700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
23701.
