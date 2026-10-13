# Preliminary Language Scan: `default` IDs 25151-25200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25151-25200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25153 | Alabastra / Gadflow's remaining faithful | Standardize the region name and Korean term for Gadflow's followers; preserve the tactical danger of a marching army being spotted in the valley maze. | Korean keeps the conditional discovery and threat of being killed in the valleys. | Medium |
| 25155 | Taibreah | Verify the character's canonical Korean name. | Korean uses `타이브리아`; Japanese has a shorter/different transliteration. | Medium |
| 25156-25157 | farming restrictions / resistance / Varani / Ysa | Preserve that useful goods are banned and the speaker rejects violence while warning that the Varani want Ysa militarized. | Korean retains both positions; Chinese interprets “resort to violence” as abusing violence, a nuance not required by English. | Medium |
| 25161 | Scholia Arcana | Standardize the organization name and avoid treating the Japanese “university” paraphrase as the English source term. | Korean retains the proper organization name; English asks what it is, whereas Japanese and Chinese call it a university/academy. | Medium |
| 25164 | “dustling” | Confirm the established in-world slur for a mortal/human and preserve its insulting force. | Korean uses `먼지 인간`; Japanese/Chinese use dust-born/dust-child forms. | High |
| 25165 | Belen's herald and messenger / Assassin's boot | Determine whether one person has both roles or the boot is named for two roles/persons; verify Belen's name. | Korean uses `전령이자 사자`, treating the terms as two roles of one person; English punctuation is ambiguous and Chinese has the same coordination. | High |
| 25170-25171 | Shocking Duration / Sinsear / the Hollow / shadow-step | Standardize the stat and place/ability terms; determine whether shadow-step is a named ability or generic magical travel. | Korean uses `감전 지속 시간`, `공허`, and `그림자 도약`; Japanese describes a teleportation spell while Chinese treats it as a named ghost-step. | High |
| 25173-25175 | Pteryx eyries / Caeled / “Tuatha storm” / item on Eloren | Standardize creature/place names and preserve the growing-threat metaphor and uncertainty about the item's later history. | Korean keeps the survival, threat, and explicit uncertainty; the “storm” metaphor and proper-name readings vary. | High |
| 25177-25178 | Enconeg Holn / Travelers' life | Verify the name and preserve the comic emphatic claim that the Travelers' life is best anywhere. | Korean retains both the faction and emphatic voice; transliterations vary. | Medium |
| 25180-25181 | “changing things” / The Falling Footsteps | Clarify what was changed and later reversed, keep the wry tone, and verify whether The Falling Footsteps is a formal title. | Korean preserves the reversal and chuckle; no context identifies the object of “things.” | High |
| 25184 | Muse of Fate / arcane | Standardize the title and “arcane” terminology; preserve the ceremony proclaiming the player as Muse of Fate. | Korean uses `신비술` and a formal title-bestowal, while Japanese calls the title a “thinker of fate” and Chinese transliterates Muse. | High |
| 25188 | Orella Axl / occasional deliveries to the blacksmith | Verify the smuggler's name and preserve that the deliveries are occasional and reportedly made to the speaker's blacksmith friend. | Korean retains the relationship and delivery role; the other locales use varying name spellings. | Medium |
| 25190 | long, razor-sharp, barbed weapon | Preserve all three wound-based clues without deciding which weapon caused the injuries. | Korean retains length, sharpness, and barbs near the tip, matching the source's tentative inference. | High |
| 25193 | copyright notice / `{LINE_CENTER}` / NBSP | Preserve the copyright wording, control marker, and non-breaking space exactly in Korean. | EN/JA/KO share the same string and one U+00A0; ZH omits the NBSP and several ordinary spaces and changes punctuation. Korean matches the English source. | High |
| 25194 | contingency letter / “should the Alfar fail” | Clarify whether “fail” means military defeat and preserve the conditional non-aggression pact proposal between gnomes and Tuatha. | Korean retains the condition and proposed pact; Japanese appears to say the Alfar will be in trouble rather than clearly preserving the conditional. | High |
| 25196-25197 | Iluvia / “her kind” / Bolgan Brute | Verify the character and creature names and identify the referent of “her kind.” | Korean preserves the hoped-for easing of tension between peoples; the antecedent is not specified in the row. | Medium |
| 25198-25199 | Fate Shrine / Wencen the Bold / Court of Enchantments | Standardize the shrine, epithet, and court names; preserve the rebuild sequence and Wencen's leadership role. | Korean retains the materials-first sequence and identifies Wencen as court leader; English has the awkward connective “For Wencen” and locales use differing court names. | High |
| 25200 | cool ale after running in the sand | Preserve the casual relief and the idiom “nothing like” without making the speaker sound overly formal. | Korean retains the short, conversational sentiment and the ale reference. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 25153, 25155, 25164-25165, 25171,
  25174-25175, 25177, 25180-25181, 25184, 25193-25194, 25196-25197, and
  25199 against all four active locale rows. The name, slur, title, referent,
  source-ambiguity, marker, whitespace, and lore candidates remain open.
- Cross-checked recurring forms for Alabastra, Gadflow, Taibreah, Varani,
  Ysa, Scholia Arcana, Belen, Sinsear, the Hollow, Fateweavers, Pteryx,
  Tuatha, Travelers, the Font, Wencen, and the Court of Enchantments.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25151-25200 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- Runtime-token signatures match; `{LINE_CENTER}` at ID 25193 is retained.
- ID 25193 has a locale-specific whitespace/punctuation exception: EN/JA/KO
  retain one U+00A0 and the same spacing; ZH has no U+00A0 and omits spacing
  after punctuation. Korean matches English and Japanese byte-for-byte for
  this text.
- `{1}`, `{2}`, and `{3}` at ID 25115 in the preceding batch were separately
  validated; no such placeholder occurs in this range.
- No row keys, event sequence, or other structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25151-25200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25201.
