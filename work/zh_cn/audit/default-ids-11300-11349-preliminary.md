# Preliminary Language Scan: `default` IDs 11300-11349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11300-11349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11300 | grain / Cranalt / poisoned river | Preserve the speaker's broken realization and uncertainty about the contaminant. | Korean keeps the blessing/unease contrast, suspects the grain, and says something in Cranalt is still poisoning the river. The sources differ slightly on the broken phrase, but no cause beyond grain is established. Historical notes already flag this. | Medium |
| 11302 | `Traveler` → `여행자` | Determine whether this is a generic traveler or the proper title/group `Traveler(s)`. | The isolated label is capitalized in English. Korean uses the generic `여행자`, while the corpus elsewhere often retains `트래블러스(Travelers)` for the faction. Context is needed before choosing a title form. | Medium |
| 11304 | `The Crossing` → `크로싱(The Crossing)` | Retain the named-location reading provisionally and reconcile the Japanese/Chinese generic readings. | English capitalizes the Crossing and links it to the land's magical essence. Korean preserves the name and the Fae's connection; Japanese reads it as a power intersection and Chinese as a passage. Historical notes already flag this. | Medium |
| 11305 | `The Blood plague` → `혈역병` | Standardize the disease term with the existing `피의 역병(Blood Plague)` form, pending glossary approval. | English names the Blood Plague; the Korean term differs from active ID 34 and other occurrences using `피의 역병`. Japanese retains the English-derived name and Chinese uses a blood-plague term. Historical notes already flag consistency. | High |
| 11307 | storage device / downloadable content / `{LINE_SPACE}` | Preserve restart behavior, unsaved-progress warning, and the marker while verifying exact console/UI wording. | Korean states the DLC is unavailable until restart, asks whether to restart now, and warns unsaved progress will be lost. The single `{LINE_SPACE}` remains in place across all four locales. Historical notes already flag this system prompt. | High |
| 11309 | Dannestar / Winter Court exiles | Verify the island and Court names; retain the past banishment to the lonely shore. | Korean preserves the island's natural isolation and the exiles' history. Japanese says Winter Court palace exiles, while English and Chinese say Winter Court exiles; the institution term remains provisional. | Medium |
| 11315 | `the Trellis` / Court of Summer / High King | Confirm whether Trellis is a named gateway/place and use the established Court/High King titles. | Korean treats Trellis as a proper name and preserves its gateway role. Japanese calls it a gathering place and Chinese a trellis; English capitalizes it. This repeats the historical Trellis question at ID 11231. | Medium |
| 11317 | gems “speak” / cut / color | Preserve the magical experience and confirm whether cut refers to gem facets/craft. | Korean says the gems communicate their cutting and color, matching the English/Japanese/Chinese fragments. It does not imply ordinary literal speech beyond the source's magical claim. Historical notes already flag this. | Medium |
| 11318 | Jottun / Coilsbain Cavern / `the tunnel back` | Keep the source's collapsed-tunnel wording open and verify which passage failed. | English contains the duplicated/malformed phrase “the the tunnel back.” Korean interprets it as the rear passage collapsing. Japanese says the back underground passage; Chinese says the tunnel. The remaining-exit objective is retained. Historical notes already flag the ambiguity. | High |
| 11327 | Shocking Damage / Storm Bolt | Verify official Korean damage/ability terminology and preserve the exact 60% and 55% effects. | Korean states a 60% increased chance for Shock damage to propagate and 55% increased Storm Bolt damage. Japanese/Chinese use alternate localized names; the values and relationship are retained. Historical notes already flag these terms. | High |
| 11329 | Hugues / Agarth / Fateweaver / Arden | Verify the personal-name spellings and preserve the claim of having no fate as reported rather than as established fact. | Korean retains Agarth's uncertainty (`듯하다`), the possible first mortal without fate, and the meeting with Arden in Yolvan. Historical notes already flag the names and Fateweaver term. | Medium |
| 11332 | `Belen's Testament` → `벨렌의 성약` | Confirm the organization/cult name and align it with other Testament entries. | Korean preserves the faction name and “burns bright” image. Japanese identifies it directly as a group/cult, while English capitalizes the name. Historical records flag similar Testament-versus-document ambiguity elsewhere. | Medium |
| 11340 | `Beckoned` → `선택받은 자` | Confirm the project's canonical title and preserve the speaker's formal gratitude. | Korean renders the title generically as “chosen one.” Chinese does the same; English/Japanese retain the distinct title. Historical notes already flag the Beckoned title in other rows. | Medium |
| 11345 | `Witchknight` → `마녀 기사` | Align the compound title/spacing with other Witch Knight/Anira references. | Korean preserves that this item and the prior rewards should be used to defeat the Witchknight. Historical entries show both `Witch Knight` and `Witchknight`; the canonical Korean title remains open. | Medium |
| 11347 | `Petrichor` / `a skinful` | Verify the reagent's official name and whether skinful is a full animal-hide container or simply a large amount. | Korean retains Petrichor and interprets the quantity as one full leather bag. Japanese says one bagful; English and Chinese evoke a skin-container measure. Historical notes already flag this measure. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11300, 11304-11305, 11307, 11309,
  11317-11318, 11327, 11329, 11340, and 11347. They remain open; historical
  candidates were not treated as approved.
- Cross-checked the `Blood Plague` rendering at ID 11305 against active ID
  34; the Korean forms differ.
- Confirmed `{LINE_SPACE}` remains at ID 11307 and the ability values at ID
  11327 remain `60%` and `55%`.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- The system marker at ID 11307 and numerical values at ID 11327 are
  preserved; no structural exception was found.
- Official Korean manual terminology could not be independently searched in
  this environment. No active CSV was edited; checkpoint hashes remain
  unchanged.

## Batch Status

IDs 11300-11349 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 11350-11399.
