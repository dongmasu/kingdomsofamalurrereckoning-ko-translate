# Preliminary Language Scan: `default` IDs 46601-46650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46601-46650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46604 | Warsworn / `전쟁의 맹세자여` | Prefer the established project faction form `워스원` unless context requires an explanatory rendering. | English addresses a Warsworn member by faction; the current Korean translates the compound generically rather than using the recurring proper-name form. | High |
| 46606 | Belen's Testament; Orbocant | Reconcile the English/Chinese Testament with Japanese's Belen Covenant wording and confirm canonical forms for both names. | Korean follows English on the faction and retains the priest/inside-Rathir question; this is consistent with the historical source discrepancy elsewhere. | Medium |
| 46610 | `Lower` / `낮음` | Determine whether this is a quality, rank, direction, or UI category before fixing the Korean label. | The isolated one-word source cannot establish its category; the historical audit explicitly leaves this label open. | Medium |
| 46612 | ancient spider-inhabited castle and its overthrow | Preserve the distinction between the castle being overthrown and the witch's alleged involvement. | Korean retains the rumor and speaker's lack of knowledge; “함락” can suggest a military capture and should be checked against setting context. | Medium |
| 46617 | Sons of Laz / `라즈의 아들들` | Confirm the faction's canonical form and retain the assessment that they are vile but easy to outwit. | Korean follows the English name and both judgments; spelling and faction status remain provisional. | Medium |
| 46618 | “spared the sword” / `칼을 휘두르지는 않았군` | Preserve the implication that the addressee refrained from killing, then retain the honor-versus-cruelty question. | Korean describes not swinging the sword, which is plausible but more literal than the idiomatic English; the historical log requests context for the source phrasing. | Medium |
| 46622 | topsider / `지상인` | Confirm whether this is a surface-dweller label or a named people/status. | Korean gives a natural surface-dweller reading; English capitalization and historical notes leave the term's status open. | Medium |
| 46626, 46628, 46650 | template/test labels | Preserve `Don't Use Template`, `FAIL LINE 2`, and `[DO NOT USE]` as likely development/test strings unless separately verified. | Korean translates the first label but leaves `FAIL LINE 2` and `[DO NOT USE]` verbatim; the historical audit explicitly calls `FAIL LINE 2` a test label. | Medium |
| 46633 | deadly Headhunter Cyrus Pepper; Warden Rask | Verify whether `deadly` means notorious or literally dangerous and confirm the Warden's formal role. | Korean uses `악명 높은` for “deadly” and `감시관` for Warden; it retains the item-turn-in and reward objective. | Medium |
| 46635 | kind but flawed ... even mortal | Preserve the source's final mortal qualification and keep it attached to the king's flaws. | Korean retains kindness, flaws, and mortality; the trailing ellipsis is represented as a continuing clause. | Medium |
| 46637 | Stealth potion recipe | Preserve all four ingredient names, quantities, and the line/paragraph structure. | Korean retains Cripplespore Caps, Sky Blossom, Bloodroot, and Essence of Fate at 2/2/2/1. The historical audit flags reagent-name verification. | High |
| 46643 | `Victory {1}` | Preserve token identity and confirm whether locale-specific marker placement is intentional. | All locales retain `{1}`; Japanese places it before `勝`, English/Chinese after the word, and Korean after a space. | High |
| 46648 | “there aren't much women” / `여자가 별로 없다는 건 알아` | Preserve the speaker's embarrassed complaint and casual tone without copying the source's nonstandard grammar. | Korean naturally conveys that women are uncommon in the remote area and asks the listener to stop staring. | Medium |

IDs 46601-46603, 46605, 46607-46609, 46611, 46613-46616,
46619-46621, 46623-46625, 46627, 46629-46632, 46634, 46636,
46638-46642, 46644-46647, and 46649 generally retain the English meaning
on this first reading. Names and game terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46550-46649. It
  flags the “spared the sword” line at 46618, `Lower` at 46610,
  `Pledgeshield`, `Sons of Laz`, and related lore names.
- The same entry calls `FAIL LINE 2` at 46628 a literal development/test
  label; it remains unchanged in Korean. The four-ingredient potion recipe
  at 46637 retains its quantities and source layout.
- ID 46643 retains `{1}`. The source marker is present in all locales, with
  locale-specific word order.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46601-46650 once
  and in identical ascending order.
- All four locales preserve matching line-break counts, including the
  recipe's paragraph boundary.
- Runtime-token identities and counts match; no special whitespace or
  hidden-formatting discrepancy was found.
- The recipe quantities 2/2/2/1 and all other numeric details are retained.
- No translation CSV or immutable source file was edited.

## Batch Status

This read-only preliminary scan for IDs 46601-46650 is now dispositioned in
[`disposition-batch-default-46601-46650-20261010.md`](disposition-batch-default-46601-46650-20261010.md).
The dispositions are working review decisions, not independent final
linguistic approval. The next range begins at ID 46651.
