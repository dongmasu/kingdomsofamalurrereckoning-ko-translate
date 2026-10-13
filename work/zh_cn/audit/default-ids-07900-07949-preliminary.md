# Preliminary Language Scan: `default` IDs 7900-7949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7900-7949.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7902 | `Projector` → `투사기` | Determine whether this is a device, UI label, or test string before settling on the noun. | English and Korean are isolated labels; Japanese/Chinese use a projector/device term, but context is absent. | Low |
| 7904 | `Fahrlangi Archmage` → `파를랑기 대마법사` | Confirm whether Fahrlangi is a people/place/name and whether Archmage is a formal rank; standardize the spelling and rank term. | The row is a short title/name label; locale transliterations differ. | Medium |
| 7906 | sprite theft of three heirlooms | Preserve the exact idol, mason's hammer, and brooch list; confirm whether `sprites` is a creature type or local group. | Korean retains all three objects and the owners' claim that sprites took them. | Medium |
| 7907 | `a live one` / `Traveler life` | Preserve the colloquial greeting and determine whether `Traveler` names a faction rather than a generic way of life. | Korean conveys a visitor to Star Camp and asks about Traveler life; the phrase is context-dependent. | Medium |
| 7908 | `Fate energy` / `Abilities` → `운명 에너지` / `능력` | Confirm official Korean gameplay terms while retaining the mix-abilities/special-attacks cause-and-effect. | Korean preserves the instruction and reward relation; canonical skill/resource wording should match the glossary. | Medium |
| 7910 | `Alyn` → `앨린` | Retain the English-linked spelling and reconcile phonetic variants in the integrated name pass. | English spells Alyn; Japanese gives a different sound. Korean matches the English-linked historical candidate. | High |
| 7913 | wheat/crop harvest metaphor | Preserve the contrast between healthy wheat and declining citizens without inventing a political cause. | Korean keeps the crop metaphor and untimely harvest image. | High |
| 7918 | `Two Knights and a Troll` | Retain the named ballad title and the speaker's recognition that the imprisonment spell matches it. | Korean preserves the title in book brackets and the sudden realization; Japanese and Chinese also treat it as a story. | Medium |
| 7923 | `Gastyr domain` → `가스티르 영지` | Confirm whether `domain` means territory, estate, or political claim; keep the suspicion about seizure as the speaker reclaims it. | Korean chooses `영지`, supported by the territorial context but not definitively established by the isolated line. | Medium |
| 7927 | `hold sway in Canneroc` / loyalty payment | Preserve the conditional political authority and reward offer without implying a formal job contract. | Korean retains control of Canneroc and generous payment for loyalty. | Medium |
| 7928 | `Mairu` / scholarly pursuits | Verify the group's identity and preserve the warning that its savagery will replace scholarship. | Korean retains the replacement contrast and the warning; `Mairu` spelling remains a corpus term. | Medium |
| 7931 | wife “was taken” → `아내를 빼앗겼지` | Retain the ambiguity between abduction and loss until context resolves it. | English omits how the wife was taken; Korean preserves the ambiguity rather than saying she died or was abducted explicitly. | Medium |
| 7938 | `Dverga` → `드베르가` | Standardize this people's name and retain the speaker's dismissive generalization. | English capitalizes Dverga; supporting locale spellings differ. | Medium |
| 7941 | `sand in the desert breeze` / `dove` | Preserve the figurative sand image and the familiar vocative; verify the established rendering of `dove`. | Korean retains the sand image and renders the address as `친구`; Japanese omits the image while Chinese preserves a peacekeeper address. | Medium |
| 7943 | Boderill “should be gone” → `떠났으니` | Keep the parallel command to leave Brunuath while leaving open whether Boderill departed or died. | English `gone` is ambiguous; Korean selects “has left,” as does Japanese. | Medium |
| 7944 | plans for the addressee and `those you serve` | Keep the served group unnamed and preserve the threat. | Korean follows English's unspecified group; Japanese narrows it to mages. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 7902, 7904, 7906-7908, 7910, 7913-7914,
  7918, 7923, 7927-7928, 7931, 7938, and 7941, 7943-7944.
- ID 7902 remains a context-dependent label. ID 7904 retains the Archmage
  rank with the name unresolved. ID 7906 preserves all three heirlooms and
  does not settle whether sprites are a creature type or group.
- ID 7907 retains the colloquial greeting and Traveler wording. ID 7908 keeps
  gameplay cause and effect. ID 7910 uses the English spelling Alyn. ID 7913
  keeps the crop/harvest metaphor; ID 7914 leaves the burned possessions
  unspecified.
- ID 7918 preserves the ballad title and interruption. ID 7923 keeps the
  Gastyr territorial claim provisional. ID 7927 retains conditional authority
  and reward without adding employment. ID 7928 keeps the warning and Mairu
  name.
- ID 7931 preserves the ambiguous fate of the wife. ID 7938 retains Dverga
  as a proper name. ID 7941 keeps the desert-sand image and uses `친구` for
  the familiar address. ID 7943 leaves Boderill's fate open; ID 7944 leaves
  the served group unspecified.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales.
- No active CSV structure or text was changed.

## Batch Status

IDs 7900-7949 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
