# Preliminary Language Scan: `default` IDs 46651-46700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46651-46700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46651 | weasel / boil insult | Preserve the insults' escalating annoyance without flattening the boil metaphor. | Korean retains the weasel comparison and translates “boil” literally as an irritating boil; Japanese instead uses generic irritation. | Medium |
| 46652 | Pledgeshield Fenan, Harst, Customs House, Gwyn | Preserve the long quest chronology and verify canonical title/name forms. | Korean retains the vault-key plot, employer, Customs House lair, Harst search, Gwyn's release/reassignment, and later Rathir meeting. | Medium |
| 46654 | Arcadium / `아르카디움` | Confirm the named marketplace/location and retain its role in supplying prospectors. | Korean treats Arcadium as a proper name and keeps the markets as the other source of supplies. | Medium |
| 46661 | Dokkalfar city, quays, Emaire | Verify the city's identity and standardize Dokkalfar/Emaire forms. | Korean preserves the eastern coastal location and trade-volume comparison; the city itself is unnamed in this row. | Medium |
| 46662 | Rathir citizens selected for service; “a Notice” | Verify whether Notice is a formal conscription document/office and preserve the selection-to-service sequence. | Korean renders a call-up notice and subsequent service; English's capitalized Notice may be a formal label. | Medium |
| 46663 | “send regrets” / `유감을 전하러` | Confirm whether this is an apology or a formal expression of regret on Jorielle's behalf. | Korean preserves the protocol barrier and desire to help; the diplomatic speech act remains context-sensitive. | Medium |
| 46664 | Caerwyn “fair and mighty” / `아름답고 위엄 있는` | Check whether `fair` means beautiful, just, or both in this descriptive passage. | Korean follows Japanese's beauty reading and retains her power and ocean-facing pose; English permits more than one sense. | Medium |
| 46666 | Belen's Testament / `베렌의 성약` | Standardize the faction name and reconcile the earlier English/Chinese versus Japanese “Belen Covenant” variation. | Korean follows English and Chinese's Testament form and preserves the bright-burning metaphor. | Medium |
| 46668 | “the order” / `결사단` | Confirm whether this is a formal religious/military Order or a generic request by an organization. | Korean commits to a fellowship/order and retains the Almain shipment escort and speaker's uncertainty. | Medium |
| 46670 | Haxhi trolls; Shieldring Keep | Preserve that the contract concerned dealing with the trolls for Shieldring and that circumstances deteriorated. | Korean follows English; Chinese's “cargo going south” interpretation is unsupported by the English idiom `went south`. | High |
| 46675 | hostess / `안내원` | Check whether this is a formal host/hostess role or a tour-guide role, then standardize the occupation. | Korean conveys a guide-like role, matching Japanese; English/Chinese more directly say hostess. | Medium |
| 46678 | Drewn Ansilla succession and lockbox | Preserve the legitimacy condition, both heirlooms, lockbox, and Hillared's rival/childhood-sweetheart role. | Korean retains the full chain; `Verdant Blades`, `Seal of Ansilla`, and proper-name forms remain provisional. | Medium |
| 46682 | 40% Armor reduction; 14% Panic | Preserve both effects, exact values, and separate stat lines. | Korean retains 40% armor reduction and 14% panic chance on separate lines, matching English. | High |
| 46686 | Reverie / `몽상` | Determine whether Reverie is a named state/place or ordinary reverie before standardizing. | Korean reads the term generically while the English capitalizes it and refers to sitting within a circle's confines. | Medium |
| 46687 | “ballads and instrumetals” / `발라드와 기악곡` | Correctly interpret the apparent source typo as “instrumentals” without reproducing the typo in Korean. | Korean renders both musical forms naturally; Japanese also interprets the typo as instruments, while Chinese says instrumental music. | High |
| 46692 | incomplete `{*2` | Keep the malformed/truncated marker byte-for-byte; do not repair it during this preliminary pass. | All four locales retain the same unfinished marker. | High |
| 46695 | steward without a master/mistress | Preserve the character's formal-service anxiety and comic bolgan comparison. | Korean retains both the steward role and the humorous reversal. | Medium |
| 46696 | forty seasons / `마흔 계절` | Verify the setting's calendar duration before converting or localizing it. | Korean preserves the exact duration; the historical audit leaves the season-to-year relation open. | Medium |
| 46698 | Chest / `몸통` | Verify whether this is an equipment-slot/category label and use the established UI term. | Chinese reads it as chest armor and Korean as torso; the isolated label does not establish the intended category. | Medium |
| 46700 | Chamber of Trade / `교역 회의소` | Confirm whether this names a formal institution and standardize its official Korean rendering. | Korean retains the mandatory cargo inspection and rejection of bribery; historical notes ask whether the chamber is a named place. | Medium |

IDs 46653, 46655-46660, 46663, 46665, 46667, 46669, 46671-46674,
46676-46677, 46679-46681, 46683-46685, 46687-46691, 46693-46694,
46697, and 46699 generally retain the English meaning on this first reading.
Names and game terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46650-46749. It
  specifically flags Pledgeshield and the long journal at 46652, Rathir
  levy, Caerwyn, Belen's Testament, Haxhi, hostess, Drewn/Hillared Gastyr,
  Reverie, the malformed `{*2` at 46692, steward, forty seasons, Chest, and
  Chamber of Trade.
- The source typo `instrumetals` at 46687 is rendered as instrumental music,
  retaining the apparent intended meaning.
- ID 46682 preserves both values and lines; ID 46692 remains incomplete
  rather than being repaired.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46651-46700 once
  and in identical ascending order.
- All four locales preserve matching line-break counts.
- Runtime-token identities and counts match, including the incomplete
  `{*2`; no special whitespace or hidden-formatting discrepancy was found.
- ID 46682 retains 40% and 14%; all other numeric details remain intact.
- No translation CSV or immutable source file was edited.

## Batch Status

This read-only preliminary scan for IDs 46651-46700 is now dispositioned in
[`disposition-batch-default-46651-46700-20261010.md`](disposition-batch-default-46651-46700-20261010.md).
The dispositions are working review decisions, not independent final
linguistic approval. The next range begins at ID 46701.
