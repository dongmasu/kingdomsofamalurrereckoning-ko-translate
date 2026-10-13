# Preliminary Language Scan: `default` IDs 24651-24700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 24651-24700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 24651 | Ventrinio | Standardize the proper-name spelling. | Korean uses `벤티리니오`; recurring draft forms include different transliterations. | High |
| 24656 | Ettin WarPriest | Align the creature name and compound combat/religious title. | Korean uses `에틴 전쟁 사제`; preserve the distinct title/category in UI context. | Medium |
| 24658 | Freezing effects / Ice Barrage | Preserve both modifiers and standardize the ability name. | Korean retains +150% duration and +50% damage; all values match the other locales. | High |
| 24660 | First Sword | Determine whether this is an office/title or named opponent; standardize its Korean form. | Korean literalizes it as `첫 번째 검`; historical questions identify unresolved title/opponent context. | High |
| 24661 | bloody offering / war fires / ugly brute | Preserve the summoning sequence and the link between offering/fire and the creature's emergence. | Korean retains all three steps without adding a specific creature identity. | Medium |
| 24665 | Border Permit / sticky fingers | Confirm whether this is an official travel document and preserve the theft joke. | Korean retains the permit and explains why it is kept on the speaker; `손버릇 나쁜 사람` is idiomatic. | Medium |
| 24668 | The Widow | Determine whether this is a named card/title or the generic person “widow.” | Korean uses generic `과부`; capitalization and surrounding card names may indicate a title. | Medium |
| 24671 | The Maid / Nix / Cairns | Standardize Maid and Nix and identify what plural Cairns refers to. | Korean preserves the theft and effort complaint; `케언` is transliterated, but the collectibles' exact nature remains open. | High |
| 24673 | Winter Realm / “one mortal at a time” | Confirm the realm's canonical name and preserve the speaker's hostile, self-righteous tone. | Korean retains the war, declining magic, trespass, and one-at-a-time threat; `처리해서` makes the threat explicit. | Medium |
| 24676 | foremost scrivener / one page every three minutes | Preserve the boast and exact production rate; determine whether the slow rate is intentionally comic. | Korean says one page every three minutes. Japanese explicitly writes `1` and `3`, while English/Chinese use words and Korean uses the digit only for 3; the quantity is equivalent. | Medium |
| 24677 | St. Hadwyn's | Verify the institution type and proper name. | Korean uses `선교원`; Japanese says monastery and Chinese says mission/missionary institution. | Medium |
| 24680-24681 | Camden / mission brothers / unnamed god | Preserve the bond and farewell, then the prisoner's comic failure to recall the god's name. | Korean retains both speakers' intent and the joke; the mission affiliation and deity remain unidentified. | Medium |
| 24687 | Gnomes / Rathir letter / encouragement, not promises | Preserve neutrality and the explicit rule against making promises. | Korean retains the contrast and closing rule; the intended recipient/impact of the encouragement remains unclear. | Medium |
| 24688 | Ethene's love | Preserve that the accumulated trials and strife were in vain. | Korean follows English's “love”; Japanese uses a compassion/benevolence reading and Chinese supports love. | Medium |
| 24690 | “of that order, I was the first” / Weeping King | Identify the order and preserve the contrast between answering the King, bearing others' burdens, and hearing their sorrows. | Korean uses `교단`; Japanese specifies first disciple and Chinese has a different “first to rise” reading. | High |
| 24692-24693 | Fateweaving / Bristletongue / Gertern Asker / Asker's Alley | Standardize profession, seed, person, and location; preserve the livelihood and brewing objective. | Korean retains the livelihood, yield-forecast context, seed collection, and return destination. Transliteration and whether Asker's Alley is a pub or district need consistency review. | Medium |
| 24695-24696 | Idylla / Henge / Hierophant fell | Standardize names and clarify whether the Hierophant fell in battle, died, or lost office. | Korean has `이딜라`, `헨지`, and `대사제가 쓰러졌다`; Japanese explicitly says the Hierophant was deposed, so “fell” remains ambiguous. | High |
| 24698 | `{1} Socket` | Preserve the placeholder exactly and determine whether this names a slot or an action. | Korean retains `{1}` and uses `소켓`; Chinese instead uses an insertion verb, reflecting UI-context uncertainty. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 24658, 24660, 24665, 24671, 24673,
  24676, 24680-24681, 24687, 24690, 24692-24693, 24695-24696, and 24698
  against active rows. Ability values, First Sword, permit joke, Cairns,
  Winter Realm, scrivener rate, mission/god references, Gnome neutrality,
  order/Weeping King, Fateweaving names, Henge/Hierophant, and socket label
  remain preliminary candidates.
- Cross-checked recurring forms for Ventrinio, Ettin, Maid, Nix, Cairn,
  Winter Realm, St. Hadwyn's Mission, Rathir, Weeping King, Fateweaving,
  Bristletongue, Gertern Asker, Asker's Alley, Idylla, Henge, and Hierophant.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 24651-24700 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- Runtime-token signatures match; ID 24698 retains `{1}` in every locale.
- Numeric content is semantically preserved. At ID 24676, Japanese writes
  both `1` and `3`, Korean writes `3`, and English/Chinese spell out the rate.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 24651-24700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
24701.
