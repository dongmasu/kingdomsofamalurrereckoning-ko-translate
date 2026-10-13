# Preliminary Language Scan: `default` IDs 60801-60850

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 60801-60850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 60810 | `while Dodging` / `회피 중` | Check whether the concise UI label should read as an active state or “while dodging.” | Korean is compact and understandable; the English is a modifier/condition and the historical audit asks for the game's UI context. | Medium |
| 60813 | Greatsword / Warrior localized markers | Retain all three localized markers in their source order and verify the established Korean category labels. | Korean has three `{*1...}` markers corresponding to the English greatsword/greatswords/warrior labels. Marker identities and order match; displayed terms are `대검` and `전사`. | Medium |
| 60817 | Travelers' “beloved” guide | Preserve the sarcastic contrast between “beloved” and the guide's being a pompous despot. | Korean retains the quoted praise and the speaker's hostile correction; Japanese supports the sarcastic reading. | Medium |
| 60818 | footpads / `발싸개` | Confirm whether `footpads` is a named footwear category or a generic soft, quiet shoe. | English describes dried reeds and wool woven together, painted, minimally protective, and nearly silent. Korean preserves the material and function; exact item-category terminology remains open. | Medium |
| 60820 | “he” / `그는` | Identify the male referent from dialogue context before making any more specific rendering. | All language rows retain a pronoun or equivalent, but this isolated line does not identify who is being asked after. | Low |
| 60829 | “Family arms?” / `가문 무기` | Confirm whether `arms` means a family weapon or heraldic arms. | The Korean chooses “family weapon”; the surrounding mention of having been to war supports that reading, but the English fragment remains ambiguous. Japanese says family heirloom weapon, while Chinese also uses family weapon. | Medium |
| 60832 | `Varani Wayfarer` / `바라니 방랑자(Varani Wayfarer)` | Verify whether this is a formal title, character label, or descriptive phrase before standardizing its bilingual display. | Korean retains the English label and gives a literal Korean rendering; Japanese and Chinese use corresponding ethnic/group terms. | Medium |
| 60835 | shamans “are rallying them” / `선동하고 있어` | Check whether the shamans are gathering/recruiting the group or inciting it to action. | Korean's `선동` implies incitement; English `rallying` can be broader, and Japanese/Chinese also suggest leadership or gathering. `prominent` is retained as `유력한`. | Medium |
| 60838 | `the Order` / `교단` | Confirm the institution's canonical Korean term and whether this is a religious order or another organization. | Korean uses `교단`; English supplies only the capitalized name, and the source-keyed historical audit leaves the institutional sense open. | Medium |
| 60842 | `one of our House` / `우리 가문의 일원` | Confirm whether `House` is a formal faction name distinct from a family/household. | Korean preserves membership and the warning but uses `가문`; capitalization in English suggests a possible formal group. | Medium |
| 60844 | Keep's “second floor Gallery” / `2층 갤러리` | Verify whether Gallery is a named Keep upgrade/area and retain the second-floor relation. | Korean preserves the location and construction status. The Japanese instead reads this as an art gallery, while English leaves the type of Gallery underspecified. | Medium |
| 60848 | “mild poison simulates death” / `순한 독` | Confirm whether “mild” describes low toxicity/dose and preserve the approximate one-day fake-death effect. | Korean retains the claimed duration and awakening, but `순한 독` may sound like harmlessness rather than the source's uncertain poison strength. | Medium |
| 60850 | Primos entry permission | Confirm who the Primos are and whether the plural permission addresses a group. | Korean preserves the permission to enter and conduct business. The isolated line and cross-language references do not identify the Primos' exact group/role. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Bareth, the
Kollossae, the Beckoned, Ironfast, Gwyn, Wesnon, Hadwyn, the Cycle, the Fae,
the Travelers, House of Sorrows, Adessa, Rathir, Varani, Finna, Arbos,
Paddy, Keep, Dareios, Teeth of Naros, Oda, Walen, Nesta, Cadwallon, and
Primos. Existing Korean bilingual-name formatting is retained as found;
this pass does not impose a global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked IDs in the archived source-keyed question range
  `60750-60849`: the applicable prompts for 60810, 60813, 60817-60818,
  60824, 60829, 60832, 60835, 60838, 60842, 60844, and 60848 remain
  unresolved questions, not accepted corrections.
- Also checked the separate historical prompt for ID 60850 in the
  `60850-60949` range. The Primos' identity remains unclear from this row.
- No historical disposition was treated as approval.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 60801-60850 once
  and in identical ascending order.
- Embedded newline counts match throughout the batch.
- Runtime-token sequences match; the cost variable at ID 60806 and all three
  localized markers at ID 60813 are retained.
- No numeric values or source line breaks were lost.
- No translation CSV edit was made.

## Batch Status

IDs 60801-60850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 60851.
