# Preliminary Language Scan: `default` IDs 55751-55800

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55751-55800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55751 | `전쟁을 거의 끝냈을 뿐 아니라` | Preserve the “all but ended” qualification while conveying that the player changed the war's destiny. | Korean retains the qualified near-ending, changed destiny, and gratitude of every mortal in the Faelands. | High |
| 55752 | `다크바리의 보물 은닉처` | Confirm whether Darkvari hoards are caches, hoards, or another named treasure-site type. | Korean preserves the grandfather-made parchment map and its function of revealing all locations in Apotyre. | Medium |
| 55753 | Patrick Morkan's wife / natural death and unnatural return | Clarify the supernatural agency implied by the contrast between natural death and being brought back. | Korean preserves the distinction that natural causes may have killed her but did not restore her; the source does not identify what did. | Medium |
| 55757 | `에틴미어` / Dalentarth | Confirm whether Ettinmere is a place/group name and retain that the shamans' threat to regional peace is eliminated. | Korean preserves both the completed action and the potential-threat relation. | Medium |
| 55759 | `두 번째 방 입구` for `SecondRoomEntrance` | Determine whether this is player-facing text or a debug/key-like label. | Korean translates the concatenated English identifier as a normal location label; context is absent. | Low |
| 55760 | Hiroen Kalt / stealth instructor | Confirm the canonical name spelling and preserve the endorsement of her expertise. | Korean retains her years of teaching and the superlative recommendation. | Medium |
| 55761 | `마법물품 제작` for `Sagecrafting` | Align this skill name with the approved Korean terminology. | English is a named crafting skill; Japanese uses jewelcrafting and Chinese uses enchanting, so the concept needs glossary/context review. | Medium |
| 55762 | `프라이드의 집(House of Pride)` | Confirm whether House of Pride is a faction/house name and standardize its Korean form. | English names a proper entity; the other locales range from phonetic rendering to a translated family name. | Medium |
| 55768 | `이런 일에 소질이 있나 봐` | Preserve the idiom “cut out for this sort of thing” and the speaker's wry surprise at being called a hero. | Korean conveys aptitude and retains the disbelief/irony. Japanese diverges in meaning, while Chinese supports the English idiom. | Medium |
| 55769 | `날 위해 피 흘려, 내 사랑` | Verify the speaker's threat/affection balance in “Bleed for me, love.” | Korean preserves both the demand for bloodshed and intimate address; register depends on speaker context. | Medium |
| 55771 | `네 카드를... 봐도 될까?` | Confirm whether the speaker requests a Fate-card reading rather than merely inspecting cards. | Lyria's attention and the game's Fate-card context support a reading; Korean retains the interrupted, tentative request. | Medium |
| 55775 | `발라드의 집을 다스리는 분` | Preserve that the mortal is the ruler of the House of Ballads and retain the speaker's surprised false start. | Korean keeps the recognition and extraordinary-reaction line; capitalization/title convention remains open. | Medium |
| 55778 | `언바운드(The Unbound)` | Confirm the faction's canonical Korean name. | English uses a formal group name; Japanese/Chinese translate the epithet while Korean transliterates it. | Medium |
| 55780 | `로어스톤 회수: {1}/{2}개` | Verify numerator/denominator semantics and document locale-specific placeholder order. | Korean and English order `{1}` before `{2}`; Japanese and Chinese reverse them to fit their sentence order. Both placeholder identities are preserved. | High |
| 55781 | `델프의 빚을 탕감해 줘야 한다` | Confirm that the objective is to forgive Brother Delf's debt, not collect payment from him. | English “absolve him of his debt” supports forgiveness; Korean follows that reading, while Chinese interprets it as seeking a reward. | High |
| 55784 | `언더시 패스팅(Undersea Fasting)` | Verify whether this is a named location and whether `Fasting` is the canonical spelling/type. | English uses a capitalized name and says to investigate its integrity; Japanese/Chinese interpret it as an undersea passage. | Medium |
| 55788 | `고용병` for `Hireling` | Check whether this instance carries the specific rank “third-class mercenary.” | Japanese makes the rank explicit, while English/Chinese are generic. Korean currently uses a generic hireling/mercenary term. | Medium |
| 55791 | `필멸자로서 지은 죄를 사면받고` | Preserve “mortal sins” as sins committed as a mortal without changing the escape bargain. | Korean retains the religious absolution metaphor and the condition that helping the speaker escape is the first step. | Medium |
| 55792 | stolen Permit / Hardy / caravan plunder | Confirm the Permit label and preserve Hardy's intent to strip the caravans of all valuables. | Korean retains the missing permit, named suspect, caravan target, and exhaustive theft threat. | Medium |
| 55794 | `더 높게` for `Higher` | Determine whether this isolated UI label is comparative text, a stat tier, or a named category. | The source is one word; Japanese transliterates it and Chinese renders “relatively high.” | Low |
| 55795 | `필멸자의 아침(A Mortal Morning)` | Confirm whether this is a title and whether “mortal” has an established Korean form here. | Korean preserves the mortal reference; Chinese appears to interpret “mortal” as fatal/deadly, while Japanese uses “mortal.” | Medium |
| 55796 | young recruit panics at battle | Preserve the speaker's self-mocking account and the rhetorical question about what they expected. | Korean retains enlistment, fear at seeing combat, and the implied self-doubt. | Medium |
| 55799 | `에센(Ethene)` | Confirm Ethene's canonical spelling and whether the line is a place, person, or standalone label. | English is an isolated proper-name string; other locales use divergent phonetic forms. | Low |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Apotyre, Darkvari, Ettinmere,
Dalentarth, Gwyn Anwy, Hiroen Kalt, Sagecrafting, House of Pride, Lyria,
House of Ballads, The Unbound, Lorestones, Brother Delf, Red Legion, Red
Idward, Undersea Fasting, Erathi Nexus, Hireling, Rithen, Hardy, Mortal
Morning, Ethene, and Archsage.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55750-55849`.
  Relevant prompts include the Deirdre boundary row (55750), the Darkvari
  hoards and Patrick Morkan account (55752-55753), Ettinmere (55757),
  SecondRoomEntrance (55759), Sagecrafting/House of Pride (55761-55762),
  “cut out for” (55768), “Bleed for me” (55769), Fate cards/Lyria (55771),
  the House of Ballads ruler (55775), The Unbound (55778), Lorestone
  placeholders (55780), Brother Delf's debt (55781), Undersea Fasting,
  Hireling, and Phasmer/Rithen (55784-55790), Hardy's stolen Permit (55792),
  Higher/Mortal Morning (55794-55795), and Ethene (55799).
- Historical boundary ID 55750 was already included in the preceding
  active report. It is not repeated here; the next active range begins at
  ID 55801.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55751-55800 once
  and in identical ascending order.
- All four files contain 65,135 default records. Newline counts and runtime
  token identities match. At 55780 the `{1}` and `{2}` placeholder order is
  English/Korean versus Japanese/Chinese; both placeholders are present in
  all locales.
- Active CSV SHA-256 values match the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 55751-55800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55801.
