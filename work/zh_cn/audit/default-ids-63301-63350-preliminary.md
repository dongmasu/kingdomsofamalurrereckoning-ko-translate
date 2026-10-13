# Preliminary Language Scan: `default` IDs 63301-63350

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63301-63350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63301 | `Primos` / `프리모스`; Silent Choir | Confirm Primos as a title and preserve that the Silent Choir withdrew from the city. | Korean follows English/Japanese. Chinese generalizes Primos to “leader/chief” and calls the Silent Choir a silent cult; the latter are proper-name candidates. | Medium |
| 63303 | `Mithroliths` / `미스로리스` | Verify the proper name and whether the grandmother's lullaby originated near the standing Mithroliths. | Korean preserves the speaker's belief and location relation. Chinese calls them carved stones; English/Japanese retain the named term. | Medium |
| 63304 | death-notice delivery | Preserve that killing a person involved in the deliveries prevents the speaker from completing them. | Korean follows the source's causal relation. The identity of the person and notices is not stated. | Low |
| 63306 | Mana absorption / `+10 Mana Stolen per Hit` | Keep the exact stat as a flat 10 Mana stolen per hit, separate from the damage increase. | EN/KR describe a flat amount per hit; Japanese says `+10%` Mana absorbed per hit. Korean follows English, not the Japanese percentage. | High |
| 63307 | childhood among lambs / hero stories | Preserve the shy-child voice and excitement about Amalur's heroes. | Korean retains the image of sleeping beside lambs in a pen and the speaker's youthful enthusiasm. | Low |
| 63308 | Travelers rumors / odds | Preserve the casual invitation to test one's luck amid uncertainty and rumors. | Korean retains the conversational tone and reference to the Travelers. | Low |
| 63309 | Frost Trap | Preserve additional damage `20`, `30%` stun chance, and `4` seconds. | The Korean values match English, Japanese, and Chinese. Korean correctly renders `Stun` as a status effect; verify the official ability label in a terminology pass. | Medium |
| 63312-63313 | High King danger / mantle | Retain the seers' warning of pursuing danger and the claim that only the addressee qualifies to take up the role. | Korean preserves the warning and appointment rationale. The specific mantle and danger require surrounding quest context. | Medium |
| 63314 | Hroth / Tyr / Champion | Verify names and whether Hroth's son defeated him to become the current Champion. | Korean follows English; other locales use different phonetic name renderings and JA refers to the Champion as a guardian. | High |
| 63316 | Chaos Portal/Rifts/Sight tutorial | Preserve the prerequisite to close every connected Rift, localized UI labels, and `{LINE_SPACE}{1}` control sequence. | All four locales have matching four newline characters and the same marker order: three `{*1...}` spans, `{LINE_SPACE}`, then `{1}`. Korean localizes the marked labels. | High |
| 63319-63320 | Aloren/Cassera and ancient rivalry | Preserve the speaker's regret and the childhood stories of an ancient rivalry, without resolving who turned on whom. | Korean follows English's uncertainty. Japanese reads that the speaker was made a target; Chinese mentions a sudden attack, showing unresolved context. | Medium |
| 63322 | Wyvyrn-Gifres wordplay | Preserve the contrast between speaking against Wyvyrns and speaking to Gifres. | Korean captures the two readings as criticism versus direct conversation. Names/group boundaries remain unclear and should not be normalized from this line alone. | High |
| 63323 | match partner roster | Verify Vigor Broadshield, Helga Swanwhite, and Aesa Alfarinn spellings and preserve each person's role. | Korean keeps all three candidates and the swordsman/mage/rogue descriptions. Locale transliterations vary; no roster-wide normalization is implied. | Medium |
| 63326 | “tales are cheap” | Preserve the dismissive idiom and warning that legends mislead. | Korean renders the first clause as stories being insufficient rather than inexpensive; the intended idiom is likely worth checking against voice/context. | Medium |
| 63329 | Keloren's Legion swords | Preserve that Tarrick Smith made the item from shattered swords of an elite Alfar contingent whose last soldiers died defending Mel Senshir. | Korean retains the plural swords and sacrifice. The exact item type and Keloren spelling remain terminology candidates. | Medium |
| 63332 | Hierophant Shrine / “one chain” | Verify the Shrine term and preserve the contrast between many freedoms and one binding rule for Travelers. | Korean retains the ritual obligation and metaphor. Japanese calls the site a Guide's altar; Chinese calls it a high-priest shrine. | High |
| 63338 | `festival of Ethene` / `에테네의 축제` | Confirm whether this is a named festival and preserve the command to continue the revels. | Korean follows the English event name and celebratory tone; Japanese and Chinese use different phonetic forms for Ethene. | Medium |
| 63340 | `Fateweaving` / `운명 엮기` | Determine whether this is a skill, discipline, or general concept. | The isolated label is nominalized in Korean; JA treats it as a named activity, while Chinese uses a short “Weave Fate” form. | Medium |
| 63345 | `fastings` / `지하 통로` | Resolve the English term against the apparent underground-location reading. | Korean follows Japanese's underground-passage interpretation. English says `fastings`, while historical notes flag this as possibly inconsistent or erroneous; retain as an open source discrepancy. | High |
| 63348 | Blackened Hall journal | Preserve the 22-day duration, the stones' long memory, lost daylight, regret over treasure, and fear the dungeon is the final resting place. | Korean retains the complete first-read narrative and all locale lineation. `Blackened Hall` may be a named place; Korean renders it descriptively as a “blackened hall.” | Medium |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the trial-room announcement, lobby error, Khamazandu's return to
prison, the crescent blades, poison clue, Alyn Shir, Reckoning label, Apotyre
future, Gallows End warning, stolen-item notice, and Marga's secrecy request.
Findings remain provisional.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 63250-63349, including
  Primos/Silent Choir, Mithroliths, death notices, Mana theft, Traveler
  rumors, Frost Trap, Hroth/Tyr, Chaos Portal markers, Aloren/Cassera,
  Wyvyrn/Gifres, the partner roster, Keloren's Legion, the one-chain rule,
  Ethene, Fateweaving, `fastings`, and Blackened Hall.
- The historical note spans IDs 63250-63349; entries outside this batch
  were not counted as reviewed here.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63301-63350 once
  and in identical ascending order.
- Embedded newline counts match for every row, including the Chaos Portal
  tutorial at 63316 and the Blackened Hall journal at 63348.
- Runtime-marker identities/order match. ID 63316 preserves three localized
  `{*1...}` spans, `{LINE_SPACE}`, and `{1}` in order.
- Values at 63309 match across all locales; at 63306, English/Korean use
  flat `+10 Mana` while Japanese specifies `+10%`.
- No translation CSV edit was made.

## Batch Status

IDs 63301-63350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63351.
