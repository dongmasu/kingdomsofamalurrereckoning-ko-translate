# Preliminary Language Scan: `default` IDs 5200-5249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5200-5249.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled applicable historical questions and checked meaning, names,
  tone, markup, and line breaks.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5200 | 신시어(Sinsear) | Confirm the pronunciation/name and whether this is a proper place/person term; Chinese gives a non-name interpretation. | English and Japanese treat `Sinsear` as a name, while Chinese translates it as “land of blazing fire.” Korean follows the English name, but the intended referent remains unclear. | Medium |
| 5203 | ...네 용기만으로도 누구든 뭐든 확신하게 만들 수 있지. 무슨 뜻인지 안다면 말이야. 누구든... 뭐든. | Preserve the deliberate suggestive double entendre and hesitation; do not flatten the line into ordinary persuasion. | English repeats “anyone” and “anything” with an explicit hint; Japanese and Chinese also trail off suggestively. Korean retains the pause and repetition, though the allusion may be less clear without scene context. | Medium |
| 5204 | Ancient inscription and four-line poem beginning `도시, 잠들어 어둡고 고요하라...` | Preserve poem lineation and stanza spacing. Record that the Chinese source has one fewer explicit line break than English, Japanese, and the active Korean; do not normalize the source CSV. | The Korean has 12 line breaks, matching English/Japanese; Chinese has 11. The wording is fragmentary prophecy, so lineation is part of its presentation. | High |
| 5206 | Five-paragraph letter beginning `사랑해. 언제까지나 사랑할 거야...` | Preserve the emotional progression from grief and repeated promises to anger and threat; check the final image of bringing Death in “sorrowful robes.” | English, Japanese, and Chinese all escalate from heartbreak to a threat against the recipient's family. Korean preserves the progression, repeated promises, and final image without changing the addressee. | Medium |
| 5213 | ...아르카디움(Arcadium)의 상인들에게 수익을 나눠 달라고 요구하는 일도 있어. | Confirm whether `Arcadium` is a city/commercial district and whether the task is coercive collection, negotiation, or an ordinary request for a share. | English says merchants in the Arcadium are to share profits; Japanese frames it as demanding a share, while Chinese calls it an arena. Korean follows the English place-name and Japanese action. | Medium |
| 5215 | 오디의 이야기(1480) | Determine whether `Odi Speaks` is a book/title, speech, or authored record; preserve the date. | Japanese says “Odi's account,” Chinese says “Odi's speech,” and English title capitalization suggests a document or work. Korean's `이야기` is broad but may obscure the title form. | Low |
| 5219 | ...스레시(Thresh)는 굴로 돌아오면 고르구아스(Gorguath)의 품에 안겨... | Confirm whether Gorguath is the living host/shell itself or a named lair/place, and standardize both terms. | English personifies Gorguath as embracing the Thresh; Japanese/Chinese support the living-shell imagery. Korean preserves the relationship, while the entity categories remain lore questions. | Medium |
| 5220 | ...결혼반지를 회수해 다른 이에게 건네라는 계약이 들어왔다. | Keep the quoted objective distinct from the contract's destination/issuer; confirm the formal meaning of “proffered to another.” | English and Chinese say the ring is to be offered to another person; Japanese phrases the quest as recovering it and returning for the reward. Korean follows the English objective and preserves the quoted nuance as a report. | Medium |
| 5225 | ...헬리우스(Helius)께서 미소로 우리를 따뜻하게 해 주시는 듯하군요. | Preserve the formal, flattering religious metaphor and character voice rather than rendering it as literal weather. | English, Japanese, and Chinese personify Helius as warming the speaker with a smile. Korean retains the metaphor and formal register. | High |
| 5226 | ...본보기로 삼으려고 그 뒤로 계속 우리에 가둬 뒀지. | Retain that the captive is being displayed as an example, while noting that the English leaves “an example” without an explicit audience/object. | All references say the bandit has remained caged since the arrest. Korean supplies the likely purpose (“as an example”) without adding a specific audience. | Medium |
| 5229 | `Maid of Windemere` → `윈더미어의 시녀` | Standardize `The Maid` as the Windemere title; check whether `시녀` incorrectly suggests a household servant. | English capitalizes the title; Japanese uses a heroine/warrior-like epithet and Chinese says “young woman.” The Korean literal rendering may misstate her role. | Medium |
| 5237 | ...늙은 파스머(Phasmer)가 이 일에서 제일 힘든 몫을 맡게 됐어... 서신(Missives)을 가진 그녀를 붙잡을 거야. | Clarify the “short straw” joke and whether `Missives` is a named document/set of documents; preserve the mission's target. | English calls the task the short straw and says Argine has the Missives. Japanese and Chinese describe the Missives as a book/document. Korean retains the joke and uses `서신`, but the named-object status remains uncertain. | Medium |
| 5239 | `Maid of Fortune` → `행운의 시녀(Maid of Fortune)` | Verify this is a vessel name, not a person/title, and use the project's ship-name convention if confirmed. | Japanese explicitly adds a ship suffix; Chinese also names a ship. English is title-like, while Korean reads as a person/title and appends the English source. | High |
| 5241 | `The Telling` → `텔링(The Telling)` | Confirm the setting-specific meaning of `Telling` and whether the line refers to a rite, performance, or story-cycle ending. | English personifies/capitalizes the term; Japanese and Chinese use distinct event/concept readings. Korean preserves the source term but does not resolve the referent. | Medium |
| 5243 | Long pagination/markup test string | Preserve the diagnostic purpose and all markup during any later editing. Flag that the Chinese source has a different wrapper/token sequence from English, Japanese, and active Korean. | English/Japanese/Korean begin with `{LINE_LEFT}` and place the `{*5...}`, `{*3...}`, and `{*1PJML}` wrappers in that order. Chinese omits the initial `{LINE_LEFT}` and orders/localizes the visible wrapper contents differently. This is a cross-locale structural discrepancy, not a Korean correction to make in this preliminary pass. | High |
| 5246 | ...골동품상이라고도 불리는 글리아날(Glianal)... | Confirm whether `Antiquarian` is a collector/scholar title rather than a dealer/shopkeeper; align `Child of Dust` with its established in-world form. | English names Glianal “the Antiquarian”; Japanese describes an antique collector and Chinese an antiquities scholar. Korean `골동품상` can imply a merchant. `Child of Dust` is capitalized and appears setting-specific. | Medium |
| 5247 | `Third leg` → `세 번째 다리` | Keep the literal fragment provisionally; determine whether “leg” means an anatomical limb, stage/round, or component in the interface/context. | Japanese says third point and Chinese says third round, diverging from the English anatomical reading. The row is isolated and has no disambiguating context. | Low |
| 5248 | 연계 점수 1점당 연막탄 재사용 대기시간이 20% 감소합니다. | Verify `Combo Point` against the game's established Korean combat-resource term; preserve the per-point 20% cooldown reduction. | English/Japanese/Chinese agree on the mechanic and percentage. The Korean meaning is clear, but the resource name needs glossary consistency. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 5204, 5206, 5219-5220, 5224-5226,
  5229, 5237, and 5241-5248 against the active Korean and matching sources.
- Kept questions for other resource types separate.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts match for 49 rows. ID 5204 has 12 breaks in
  English/Japanese/Korean and 11 in Chinese; the discrepancy is recorded.
- ID 5243 has a different Chinese markup/wrapper sequence. English, Japanese,
  and active Korean share the other sequence; no CSV was changed.
- No active CSV structure or text was changed.

## Batch Status

IDs 5200-5249 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
