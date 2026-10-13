# Preliminary Language Scan: `default` IDs 9800-9849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9800-9849.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9803 | Sister Ceanna / followers of Lyria → `세안나 수녀` / `리리아` | Verify the name spelling and title against other religious references; preserve that the note was found on her corpse and identify her as one of Lyria's followers. | English, Japanese, and Chinese all say it was found on her body/corpse. Korean retains the relationship and physical context. | Medium |
| 9804 | `the Wolds` / `fateweaving` → `월즈` / `운명 직조` | Confirm the region spelling and whether Fateweaving is a formal discipline; preserve that the speaker was banished before studying under Simeon Crowe and had always felt the call. | Korean retains the sequence and renders fateweaving as a compound discipline. Name/term forms remain provisional. | Medium |
| 9805 | `written in the hand of Mitharu` → `미타루의 필체` | Determine whether the text is Mitharu's handwriting or a script taught to the Order's brothers; preserve the grave-letter context and training claim. | Japanese explicitly calls it Mitharu script; Chinese describes Mitharu handwriting; English is ambiguous. Korean chooses handwriting. | Medium |
| 9807 | `the sojourn` → `체류 의식` | Determine whether this is a named rite, a stay, or a journey; preserve that the speaker is asking to hear about it again. | Japanese reads it as a rite, Chinese as wandering/journeying, and Korean as a stay-ritual. | Medium |
| 9808 | `seasteel` → `해양강` | Verify whether this is a named material/alloy and align its Korean term; preserve the surprise at its rarity and value. | Japanese says “ocean iron,” Chinese “sea steel,” and Korean coins “ocean steel.” The exact material is not established here. | Medium |
| 9813 | Hecatyr / three-mother / father of the portal / Belen / Great Cycle | Preserve the myth's deliberate gendered paradoxes, necromancy bargain, disaster sequence, and the distinction between `magic of mortality` and `magic of Death`; verify names and cosmology without normalizing the source's unusual claims. | Korean retains the “three mothers” and “father of the portal,” the threat/bargain, and the final refusal. Some wording differs across references, including the relationship between mortality, Death, and the Great Cycle. | Medium |
| 9814 | `serve his time in the War` → `전쟁 복무` | Preserve the mother's request and the required service in the War; verify that this means military service rather than serving a punishment during wartime. | Japanese explicitly interprets it as required military service. Korean follows that reading and preserves the unexpected outcome of Walen's scheme. | High |
| 9818 | `defend both` / `garrison there` | Keep the two protected locations and garrison site unspecified unless surrounding context identifies them; preserve the low-risk rationale. | English omits both antecedents; Japanese/Chinese/Korean retain that ambiguity. | High |
| 9822 | `Thresh` → `스레시` | Confirm whether this is a named enemy/type and align its Korean form; preserve the direct objective. | English capitalizes `Thresh`; Japanese transliterates it and Chinese uses a creature description. Korean uses a provisional phonetic form. | Medium |
| 9828 | Father Etair / St. Eadric's Almain mission | Verify the saint's spelling and whether `mission` names a chapel, mission house, or monastery; preserve the southeast location and hill-ruin landmark. | Japanese says monastery, Chinese says mission/chapel, and English is broader. Korean chooses “mission.” | Medium |
| 9830 | `Take heart of it` → `그 사실을 명심하라` | Resolve the unusual English phrase: it may mean remember the tree's importance or draw strength from it; preserve that the Gallows Tree's strength will be needed later. | Korean follows the “keep this in mind” interpretation; Chinese explicitly says remember it, while English/Japanese also permit drawing courage/strength. | Medium |
| 9836 | `{3}% chance for +{1} {2}` | Preserve all three placeholders and verify their rendered order/meaning; do not reorder the Korean template without runtime evidence. | English, Chinese, and Korean use `{3}`, `{1}`, `{2}`. Japanese uses `{3}`, `{2}`, `{1}`. Korean matches English/Chinese. | High |
| 9837 | `White Dove Supply` → `화이트 도브 보급소` | Determine whether this is a named supply location/business and align `White Dove` with other place/faction names. | English/Japanese/Chinese retain or translate the same name; Korean uses a phonetic form plus a supply-shop label. | Medium |
| 9839 | Detect Hidden / Scarab Salts / Sky Blossom recipe | Align the skill and ingredient names with established Korean terms; preserve the temporary effect, workbench, quantities, and recipe spacing. | Korean retains both ingredients and quantities and the multi-line recipe layout. The official skill/item glossary remains unverified. | Medium |
| 9843 | `Docent` promotion → `강사 직급` | Treat `Docent` as a formal Scholia Arcana rank unless context disproves it; do not assume it simply means lecturer. | English explicitly says “rank of Docent”; Chinese says lecturer and Japanese uses a master/teacher title. Korean expresses a rank but may be too generic. | High |
| 9846 | `FAIL LINE 2` untranslated | Determine whether this is internal QA/test text or player-facing content; document it as an English-only row without silently replacing it. | English and Japanese retain the text; Chinese translates it as a failed dialogue line; Korean retains English. Visibility is unknown. | Medium |
| 9847 | Vigor Broadshield / Helga Swanwhite / Aesa Alfarinn | Verify all three names and preserve each companion's distinct combat role and the first-match selection context. | Korean retains three options and their roles, but the proper-name spellings remain provisional. | Medium |
| 9849 | `Prison-breaker!` → `탈옥시켜 준 영웅` | Preserve the speaker's recognition/exclamation while checking whether the address means a prison-breaker or the hero who helped them escape. | English/Chinese are compact labels; Japanese explicitly says “savior from that time,” which Korean also expands to a helpful-hero reading. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9803-9808, 9813-9814, 9818,
  9821, 9828, 9830, 9836, 9839, 9843, 9846, and 9847 against active rows.
- Added active-row checks for IDs 9822, 9837, and 9849.
- At ID 9813, Chinese has 13 embedded line breaks while English, Japanese,
  and Korean have 14; Korean follows English/Japanese.
- At ID 9836, Japanese reverses the `{1}`/`{2}` placeholder order; Korean
  matches English and Chinese.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV line-break counts match except ID 9813 as recorded above.
- Runtime placeholder order matches except ID 9836 as recorded above.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name and term questions above as
  settled.

## Batch Status

IDs 9800-9849 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
