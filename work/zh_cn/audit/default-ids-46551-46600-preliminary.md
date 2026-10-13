# Preliminary Language Scan: `default` IDs 46551-46600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46551-46600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46551 | `+{1}` | Preserve the plus sign and variable exactly. | All four locales contain the same value marker and prefix. | High |
| 46554 | `with Physical` / `물리 피해` | Keep the source's fragmentary modifier form; confirm what item/stat label it qualifies. | English is an incomplete fragment. Korean supplies “damage,” while Japanese/Chinese also add explanatory wording. The historical audit flags this exact fragment. | Medium |
| 46561 | “as many cemeteries as settlements” | Preserve the parallel quantity comparison and the claim about the dead. | Korean retains the settlement/cemetery comparison and never-forget meaning; the comparison is rhetorical, not a numeric census. | Medium |
| 46563 | vessel referred to as “her” | Preserve the ship-as-feminine personification and both seaworthiness qualities where appropriate. | Korean retains the speaker's ship and its speed/seaworthiness but omits the English pronoun's personification. | Low |
| 46567 | three-paragraph Webwood silk journal | Preserve all three paragraphs, the normal-day-to-web-covered-trees chronology, and the silk/spider explanation. | Korean retains the three paragraphs, Clarent/Vess observations, increased spiders, and the narrator's uncertainty. | Medium |
| 46574 | Rathir / `라시르` | Standardize the place-name form with other active occurrences. | Korean uses `라시르`; recent rows use `라시어`, while Japanese/Chinese also vary. Meaning is clear but spelling consistency remains open. | Medium |
| 46576 | Ventrinio as “key to Alabastra” | Preserve the metaphorical access/importance and verify the canonical name form. | Korean keeps Ventrinio as the key to Alabastra and the death-mystery condition. | Medium |
| 46578 | `{*1[Active]}` ability text | Preserve the style-marker identity while localizing only its visible label; retain the armor trade-off and interruption resistance. | All locales use marker ID `*1` with a localized visible label. Korean retains reduced armor, short duration, interruption resistance, and increased damage. | High |
| 46579 | “gardens of fate” and blooms | Preserve the poetic claim that future events appear in the flowers. | Korean retains both the garden and bloom imagery; the pronoun/referent remains literary and contextual. | Medium |
| 46584 | Winter Fae memorial | Preserve the two stanzas, nine source line breaks, conditional rebirth, and memory-as-immortality conclusion. | Korean retains the complete memorial structure and all key claims about Gadflow, Tirnoch, tomb release, shared dreams, and hoped-for immortality. | Medium |
| 46586 | Private Eilis Ilver / `일병` | Verify the established Korean equivalent for the military rank and make it consistent with the Private at 46253. | Korean uses `일병` here but `이등병` for Private Odakirc at 46253. Both are plausible rank renderings, but usage should be standardized. | Medium |
| 46589 | Kollossae heir/ritual condition | Preserve the distinction between being a Kollossae and being the heir who may perform the ritual. | Korean retains both claims and the rhetorical challenge; the source's “Indeed, you are not” depends on preceding context. | Medium |
| 46592 | “like its owner” / `주인처럼` | Preserve the owner's comparison without inventing who or what the owner is. | Korean retains the comparison and expected profit; the owner referent is intentionally unresolved. | Medium |
| 46595 | sanctuary / `성소` | Determine whether this means a temple or another protected site before selecting the standard Korean term. | Korean uses a sacred-site form and retains the command to ensure a guard is watching inside. The historical audit leaves the site type open. | Medium |
| 46596 | Ironfast and Caerwyn | Standardize the location/person spellings and preserve that Caerwyn herself commissioned the construction. | Korean retains the scholar-archive description, original builder, and minimal change since construction. | Medium |
| 46599 | elder Manoise / Treatise on the Origins of the Faekind | Check whether “elder” means the older sibling and standardize the author's/institutional terms. | Korean conveys the elder Manoise and paper's title; Japanese also reads this as the older Manoise sibling, while Chinese uses a senior/elder form. | Medium |

IDs 46552-46553, 46555-46560, 46562, 46564-46566, 46568-46573,
46575, 46577, 46580-46583, 46585, 46587-46588, 46590-46594,
46597-46598, and 46600 generally retain the English meaning on this first
reading. Names and game terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46550-46649. It
  explicitly flags the fragment at 46554, the three-paragraph Webwood
  journal at 46567, the Winter Fae memorial at 46584, the sanctuary term at
  46595, the owner referent at 46592, and names including Hugues, Tirnoch,
  Ventrinio, Kollossae, Caerwyn, and Manoise.
- The localized visible label in `{*1[Active]}` at 46578 preserves style ID
  `*1`; the marker's readable payload differs by locale as expected.
- Later historical questions at 46610 and 46618 are outside this batch and
  were not counted as reviewed here.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46551-46600 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 46567 has two
  blank-line paragraph separators in every locale; ID 46584 has nine
  line breaks in every locale.
- Runtime-token identities match after accounting for the localized
  visible payload of `{*1[...]}`; no special whitespace discrepancy was
  found.
- ID 46551's plus marker is retained; no other material numeric-value
  discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

This read-only preliminary scan for IDs 46551-46600 is now dispositioned in
[`disposition-batch-default-46551-46600-20261010.md`](disposition-batch-default-46551-46600-20261010.md).
The dispositions are working review decisions, not independent final
linguistic approval. The next range begins at ID 46601.
