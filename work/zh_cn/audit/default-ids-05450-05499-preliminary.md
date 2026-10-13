# Preliminary Language Scan: `default` IDs 5450-5499

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5450-5499.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled applicable historical questions and checked meaning, names,
  tone, markup, and line breaks.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5450 | ...가장 위대한 논쟁에서 이긴 모양이군. 이제 중앙 광장(Concourse)은 정말 장관이야! | Confirm whether the “greatest debate” is a formal Kollossae challenge and whether `Concourse` is a named location rather than a generic plaza. | English/Japanese/Chinese agree on the debate and the Concourse's changed appearance. Korean preserves both but selects the generic `중앙 광장`; the exact place type remains unsettled. | Medium |
| 5451 | Ability-slot tutorial containing `{1}`, `{LINE_SPACE}`, `{2}`-`{5}`, and two `*1` ability labels. | Translate the visible labels inside both `*1` wrappers while preserving the wrapper IDs/order, placeholders, button order, and line-space token. | English/Japanese/Chinese localize the visible ability labels while retaining the same wrapper structure. Active Korean leaves `abilities` and `ability` in English. | High |
| 5452 | ...내 유물을 사용해 자원을 모으기로 했어. 땅을 뜯고 찢는 필멸자들의 조그만 방식 대신 말이지. | Preserve the contrast between resource gathering with the relic and destructive extraction by mortals; verify what the relic does. | All sources contrast the relic method with ripping/tearing the land. Korean retains the disdainful voice and the stated agreement. | Medium |
| 5453 | `A Dimming Wait` → `저물어 가는 기다림` | Determine whether this capitalized phrase is a poem/title or an ordinary descriptive label. | English capitalization suggests a title; Japanese is less specific and Chinese is literal. Korean provides a plausible title-like rendering, but context is absent. | Low |
| 5454 | `The Lykeios` → `라이케이오스(Lykeios)` | Confirm whether Lykeios is a school, institution, or other named establishment before interpreting its decline/closure. | English/Japanese/Chinese all say it has lost popularity and may close. Korean retains the proper name and closure question. | Medium |
| 5457 | `Woven Sativa Fibers` / `{*3Physical}` | Confirm Sativa as a plant/material and translate the visible `Physical` category label inside `*3` without changing the wrapper ID. | English/Japanese/Chinese localize the wrapper's visible category; Korean leaves `{*3Physical}` in English. The surrounding sentence describes a material used for potions dealing with the Physical category/world. | High |
| 5459 | `Cambodia` → `캄보디아` | Confirm whether this is intentional in-world content, a localization test string, or a stray external reference; retain it pending context. | The same standalone country name appears in all four sources, giving no evidence that it is a translation error. Its setting relevance is unexplained. | Low |
| 5464 | Tywili refugees claim Tuatha burned their village; the speaker disbelieves them because Tuatha should not be in Summer Court territory. | Preserve the skeptical, dismissive voice and the political contradiction without asserting whether the refugees are lying. | English/Japanese/Chinese agree on the refugees' claim and the speaker's disbelief. Korean retains the claim and the rhetorical question. | High |
| 5465 | ...그분 말씀대로 네가 왔군. 커스우드(Cursewood)에서 기다리는 우리 왕 비사란(Bisarane)을 찾았나? | Identify the antecedent of `he` and the speaker's relation to King Bisarane if surrounding dialogue establishes it. | English/Japanese/Chinese retain the unspoken antecedent. Korean preserves the honorific and “our king” but cannot resolve who predicted the arrival. | Low |
| 5466 | ...남부 시드(Sidhe)의 데티르(Detyre)로 가는 길... | Confirm whether `Sidhe` is a region/realm and standardize the geographic hierarchy and both place-name spellings. | English/Japanese/Chinese locate Detyre in the southern Sidhe. Korean follows the source, though `시드` may not distinguish realm from region. | Medium |
| 5467 | ...미든(Midden)만큼 마법이 깃든 곳은 세상에 거의 없어... 페이보다도 오래된 존재들의 고향... | Preserve Midden as a named ancient place and keep its inhabitants' identities deliberately unspecified. | All references describe a uniquely magical ancient place inhabited by things older than the Fae. Korean retains the setting term and age comparison. | High |
| 5468 | ...클리엣 아른(Clyeth Arne)의 가보인 지팡이와 부적... | Confirm Clyeth Arne and Dolve Arne spellings, and whether the inherited Staff/Talisman are formal item names. | English capitalizes the heirlooms; Japanese/Chinese also identify a family heirloom staff and talisman. Korean conveys inheritance but lowercases the item categories. | Medium |
| 5470 | `piece of the Well of Souls` talisman | Confirm whether the talisman is physically a fragment of the Well or a separate item enhanced by it; preserve the life-force mechanic. | The English grammar is malformed, while Japanese/Chinese/Korean all interpret the talisman as a magically enhanced piece/fragment of the Well. Korean retains the stated function without inventing a specific damage type. | Medium |
| 5475 | ...그걸로 니스카루(Niskaru)를 불러낼 수 있는 줄도 몰랐어... 누군가는 알고 있었지. | Keep the summoning function and the contrast between the speaker's ignorance and an unidentified person's knowledge. | English/Japanese/Chinese agree on the unknown item's use and unnamed knowledgeable party. Korean preserves both unknown referents. | High |
| 5477 | ...하늘에 떠 있는 도시... 우리 종족의 가장 위대한 업적이자... 실패작이지. | Preserve the simultaneous pride and regret, without adding the unnamed city's identity. | All sources describe a floating city as both the people's greatest achievement and failure. Korean keeps the contrast. | High |
| 5479 | Introductory copy with `{LINE_LEFT}{*1Welcome to the Faelands}{LINE_LEFT}` | Translate the visible welcome label inside `*1`; preserve both `LINE_LEFT` markers and the `*1` wrapper. Keep the gender-neutral Korean references and product title consistent with project convention. | Japanese and Chinese localize the visible heading; active Korean leaves `Welcome to the Faelands` in English. Korean otherwise handles “him or her” neutrally and retains the character's discovery premise. | High |
| 5481 | 나는 나메리아 켄트(Nameria Kent), 니암(Niahm)의 자매야. | Confirm whether `Sister of Niahm` means a biological sister or a religious/member title; standardize both names. | Japanese/Chinese indicate siblinghood; English remains ambiguous. Korean's `자매` preserves the ambiguity. | Medium |
| 5485 | ...마이르가 이리온(Irion)을 떠난 것 같아... 발라드 속 연인들처럼... | Preserve that Maire left Irion and the contrast with their former romantic appearance; verify title/name consistency. | The references agree on the apparent separation and former lovers' image. Korean retains the contrast without explaining why they parted. | Medium |
| 5486 | Four-line Lightning/Stun/Shocking damage tooltip with costs and percentages. | Keep all four line breaks, distinguish Lightning Damage from Shocking Damage, and preserve the 80/15/30%/4-second/32-Mana values. | English/Japanese/Chinese agree on the values and line structure. Korean retains the four lines and separates `번개 피해` from `감전 피해`. | High |
| 5490 | Pyromancer Louisa Ealan quote about not laughing at burning foes. | Confirm the title/name forms and preserve the mock-formal, dryly humorous quote. | English/Japanese/Chinese retain the speaker's admonition and the ironic description of pointing and giggling. Korean keeps both quotations and their formal tone. | Medium |
| 5491 | ...사투르닌(Saturnyn)과 투아사보다 먼저 슬픔의 집(Sorrows)을 찾으려면... 장로(Eldest)... | Confirm whether `the Sorrows` is the House/faction and standardize `Saturnyn`/`Eldest`. | English leaves `Sorrows` and `Eldest` capitalized; Japanese uses a proper group name and Chinese translates Sorrows descriptively. Korean chooses House of Sorrows and a generic elder title. | Medium |
| 5494 | 내 가문은 복수의 집(House of Vengeance)이었으니... 하지만 그들을 광기로 몰아넣은 것이 나를 괴롭혔지. | Confirm `House of Vengeance` as a formal Fae House/faction and clarify what “what frenzied them tore at me” means emotionally or physically. | English/Japanese/Chinese differ in how the final clause expresses distress. Korean reads it as psychological torment, a plausible interpretation but not certain. | Medium |
| 5497 | ...쓸모없는 약속어음 말고 진짜 동전으로. | Preserve the contrast between actual coin and worthless promissory notes; note the English misspelling `promisary`. | All references support the promissory-note meaning. Korean follows the intended word despite the English typo. | High |
| 5498 | `Scholia Arcana` → `스콜리아 아르카나` | Standardize the organization's Korean name using its other occurrences and the project's terminology authority. | All sources identify the mage organization; Japanese/Chinese use established local-language forms. Korean transliterates the English name consistently with nearby entries, pending glossary decision. | Medium |
| 5499 | `We leave these scoundrels to the sea:` → `이 악당들은 바다에 맡기리라:` | Preserve the verse-like fragment and terminal colon until the continuation/context is found. | English/Japanese/Chinese all provide an incomplete-sounding line ending in a colon. Korean retains the fragment and punctuation without completing it. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 5450-5452, 5453, 5457, 5459,
  5461, 5464-5468, 5470, 5475, 5477, 5479, 5481, 5486, and 5490-5499
  against active Korean and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts match across all four locales for every row.
- Wrapper identities/order match where present. At IDs 5451, 5457, and
  5479, active Korean retains English visible label text inside otherwise
  matching wrappers.
- No active CSV structure or text was changed.

## Batch Status

IDs 5450-5499 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
