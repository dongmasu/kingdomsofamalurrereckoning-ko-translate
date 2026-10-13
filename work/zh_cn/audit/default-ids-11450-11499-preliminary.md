# Preliminary Language Scan: `default` IDs 11450-11499

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11450-11499.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11454 | Tirnoch's grace → `티르노크의 은총` | Align the deity-name with corpus usage and retain the command to bow before Tirnoch's grace. | Korean preserves the command and religious register. The established active spelling is `티르노크(Tirnoch)`; the exact rendering of “grace” remains a terminology choice. | Medium |
| 11462 | Basilica Gnostra → `노스트라 대성당` | Reconcile with the recurring Korean form `바실리카 그노스트라`; do not treat either form as approved solely from frequency. | The same English institution is `바실리카 그노스트라` at IDs 4493 and 11019, while ID 11256 and this row use `노스트라 대성당`. All versions retain the direction to Scholar Nerenne. The historical question already flags this variation. | High |
| 11467 | Authority's order → `권위단의 질서` | Determine whether capitalized Authority is an institution, religious authority, or governing power; retain the epitaph and year. | Korean retains Valeryia's description, prayer to Mitharu, and 1439 date. Japanese describes the ruler's order and Chinese a theocratic order; neither establishes a named organization. The same unresolved wording appears at ID 411. | Medium |
| 11473 | Faer Gorta / magic paint | Align the creature spelling and clarify that the vial's color change signals enough kills to alter the paint's properties. | Korean preserves the causal sequence and names Faer Gorta. Chinese instead calls the creatures skeletons; other active rows use both `Fear Gorta` and `Faer Gorta`, so the canonical Korean name remains open. Historical notes flag the name and paint mechanic. | Medium |
| 11474 | `Activity - Shopping - Stall` → `활동 - 쇼핑 - 노점` | Verify whether this is an internal activity/state label or player-facing text before deciding how to localize it. | The English is a terse state-style label, not a sentence. Korean translates all components; Japanese and Chinese also localize the label differently. No context in this row establishes whether players see it. | Medium |
| 11476 | Abyss / cursed cloak / Reclamation Guild | Preserve the warning, relic name, signature, and full line layout; verify the Guild and artifact names against the corpus. | Korean retains the claim that the cloak's fragments bring death, cannot be destroyed, and must be scattered, hidden, and forgotten. All four locales have four embedded line breaks, including the blank line before the signature. Their wording of the relic and Guild differs; no naming decision is made here. Historical notes already flag this entry. | Medium |
| 11477 | `Stun Damage [DO NOT USE]` → `기절 피해 [사용 금지]` | Confirm whether this unused stat string should remain a translated diagnostic label or be retained in English. | Korean preserves both the stat and prohibition. Japanese and Chinese also localize the warning, but the row alone does not establish whether it appears in shipped gameplay. | Medium |
| 11478 | Altar of Doubt / reward vision | Preserve that the gods approve the justice brought to the Altar and show where the addressee can claim their due. | Korean retains both the judgment and the vision's location/reward function. Chinese says “gift” rather than “due”; the exact reward noun is not specified in English. | Medium |
| 11481 | Colet and the Echoes → `콜렛과 에코스` | Verify whether this is a named performance group and standardize both names. | Korean preserves the speaker's reflection that their successful run may be ending. Japanese and Chinese also treat Colet and the Echoes as names, though their transliterations/translation differ. Historical notes already flag this candidate. | Medium |
| 11484 | “There won't be any records left at the rate your going” → `이 속도면 남아나는 기록이 없겠어` | Retain the likely “records will be depleted at this rate” reading provisionally; note the English grammar error and the conflicting Chinese interpretation. | English has `your going`, likely a source typo for `you're going`; Japanese supports records running out, while Chinese reads the line as no one matching the addressee's record-setting pace. Korean follows the English/Japanese depletion reading. Historical notes already flag the ambiguity. | Medium |
| 11487 | Savant Reen / Preordained / Fateless One | Align the rank and faction names while preserving the claim that nobody can hide from the Fateless One. | Korean retains the contrast between the Preordained's influence and the Fateless One. Japanese identifies Reen as a first-class mage, whereas English uses Savant; proper-title translations remain provisional. Historical notes already flag all three terms. | Medium |
| 11489 | `Last Space` → `마지막 공간` | Determine whether this is a literal final space, a previous position, or an internal layout/navigation label. | Korean follows the English/Japanese literal “last space”; Chinese instead says “previous position.” No surrounding interface context is supplied by the row. Historical notes already flag the label. | Medium |
| 11494 | Blood Plague / boggarts → `혈역병` / `보가트` | Reconcile disease and creature terminology with recurring active forms. | Korean retains that boggarts carry the disease and nearly the entire village is infected. The disease appears as `피의 역병` at ID 34 and `혈역병` at IDs 131, 3060, and 11305; creature transliteration also needs corpus-level review. Historical notes already flag this. | High |
| 11495 | `The Black Atoll` → `《검은 환초(The Black Atoll)》라는 책` | Preserve the title/name but do not infer that it is a book until the object type is established. | English says the object is somewhere in Mudhold Fasting and is called the Black Atoll. Japanese and Chinese present it like a title, but none of the three sources explicitly says “book”; Korean adds that category. The preceding location name is itself unresolved at ID 11424. | High |
| 11496 | `Divine Sacrifice` → `신성한 희생` | Determine whether this is an ability, quest/title, or religious concept before finalizing the noun phrase. | Korean is a plausible literal rendering, but the isolated label does not identify its function. Japanese and Chinese also differ in whether the phrase emphasizes sacred sacrifice or a divine offering. Historical notes already flag the category question. | Medium |
| 11499 | Felltown → `펠타운(Felltown)` | Align the place-name form with recurring usage if one is established. | Korean retains the English name alongside its transliteration; Japanese and Chinese provide phonetic forms. This is a consistency candidate, not a confirmed spelling correction. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11454, 11467, 11473-11474, 11476-11478,
  11481, 11484, 11487, 11489, and 11494-11496. They remain open; historical
  candidates were not treated as approved.
- Compared Basilica Gnostra at IDs 4493, 11019, and 11256. The active Korean
  has competing forms; no canonical form was selected.
- Compared Blood Plague at IDs 34, 131, 3060, and 11305. Both `피의 역병`
  and `혈역병` remain in active text.
- Preserved ID 11476's four embedded line breaks. No translation change is
  authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- ID 11476 has four embedded line breaks in each locale. No runtime markers
  occur in IDs 11450-11499; no structural exception was found.
- Official Korean manual terminology could not be independently searched in
  this environment. Active CSV hashes match the recorded baseline; no active
  CSV was edited.

## Batch Status

IDs 11450-11499 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 11500-11549.
