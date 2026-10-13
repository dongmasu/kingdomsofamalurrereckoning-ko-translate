# Preliminary Language Scan: `default` IDs 19200-19249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19200-19249.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19200 | “I think I'll hold on to it” | Keep the object's identity unstated unless surrounding context resolves it. | Korean preserves generic `그건`; Japanese identifies a ring, while English/Chinese do not. This matches the historical note. | Medium |
| 19202-03 | two sides of a coin / elemental effects | Preserve the day/night contrast and exact 25% ice-damage reduction. | Korean keeps both images and the 25% value; no mechanical difference was found. | Low |
| 19204 | Mad Dog / Mad Men | Preserve the nickname/team-wordplay and determine whether both are formal names. | Korean transliterates both as `매드 독`/`매드 맨들`; the row lacks context to distinguish nickname from team. | Medium |
| 19205 | `{*1[Active]}` / intimidation skill | Confirm official terminology for the active marker, intimidation, damage reduction, and knockdown. | Korean localizes the marker, preserves its wrapper and paragraph break, and retains both effects. | Medium |
| 19206 | Anokatos's followers / guards | Clarify the escort relationship and the destination implied by “here.” | Korean preserves the request and groups the guards with the speaker; the sentence remains context-dependent. | Medium |
| 19207 | Castle Dusk / broken crown / Graem Halg | Verify the castle and wizard spellings and preserve the question linking the crown's breaking to the castle's decline. | Korean keeps the causal question and name forms; historical notes retain both as glossary candidates. | Medium |
| 19210 | `Laz` | Replace neither text nor source here; flag the active Korean cell as a likely copy/paste mismatch for formal review. | English/Japanese/Chinese contain the character name `Laz`; Korean ID 19210 instead exactly duplicates the “two sides of a coin” sentence at ID 19202. Key/order checks show ID 19210 remains in the correct row, so this is a cell-content mismatch, not row displacement. | High |
| 19211 | Understyle / Gardens / Trellis | Confirm whether Understyle and Trellis are proper place/structure names and align their forms. | Korean transliterates both names and preserves the “before mortals came” temporal contrast. | Medium |
| 19214 | “debase Fae sorcery” / Fae hollow | Preserve the speaker's condemnatory stance without softening it or adding a rationale. | Korean retains the accusation and the hollow's farming/sorcery relation. | Medium |
| 19219 | `Oathblade` | Determine whether this is a formal weapon name or type and align with other occurrences. | Korean uses `서약검`; English/Japanese/Chinese leave the label untranslated. | Medium |
| 19229-31 | Minn the Grinner / Deep Slumber / Cradle | Align the nickname and named rite/place terms while preserving the warning about stolen possessions. | Korean conveys the high-stakes gambling and the theft from the Cradle after Deep Slumber was interrupted. Historical questions remain. | Medium |
| 19232 | Cape Solace / Ollie Madsen / Myfa | Verify names and whether “new arrival” implies a castaway; preserve the request to show him the restored site. | Korean retains the names and arrival context; historical note flags the castaway nuance. | Medium |
| 19234 | the Sorrows | Determine whether this denotes the House/faction or a separate location; preserve that knowledge alone is insufficient. | Korean uses `비탄의 집`, while Japanese/Chinese interpret the term differently. | Medium |
| 19238-39 | Grian / master locksmith / Dispelling +1 | Align the locksmith rank and retain the exact temporary skill increase without adding an unstated unit. | Korean uses `명망 높은 자물쇠공` and says `1 증가`; Japanese adds “level,” which English does not specify. | Medium |
| 19243 | Benwick Athelm / thumos / Faer Gorta / Root Golems | Verify names and specialized substance term; preserve the two separate kill thresholds and paint vials. | Korean retains two vials, the third painting, and separate Faer Gorta/Root Golem conditions. | Medium |
| 19248-49 | Alfar route / logistics | Preserve the covert-route condition and the completed logistics/preparations. | Korean retains the route beneath the Alfar and the danger, and says the logistics and journey preparations are complete. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 19200, 19204-07, 19211, 19214,
  19219, 19222, 19228-29, 19231-32, 19234, 19238-39, and 19243 against
  active rows. They remain preliminary; no historical note authorizes a
  translation edit.
- Added the ID 19210 duplicate-cell candidate after comparing its source-keyed
  row with ID 19202. No neighboring key/order displacement was found.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19200-19249
  in identical order.
- No row-count, key, physical line-break, or runtime-token identity
  difference was found. ID 19205 retains the localized `{*1[Active]}` marker
  and one physical line break.
- No semantic numeric-value mismatch was found. Korean's `1분` at 19218
  corresponds to English “a minute”; Japanese's digit-based quantities at
  19243 correspond to spelled-out counts in the other locales.
- The Korean text at 19210 is an apparent duplicate of 19202, despite correct
  row alignment; translation CSV wording was not edited.

## Batch Status

IDs 19200-19249 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19250-19299.
