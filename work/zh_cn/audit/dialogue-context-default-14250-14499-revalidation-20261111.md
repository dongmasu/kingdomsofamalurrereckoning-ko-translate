# Sequential `default` Revalidation: IDs `14250`-`14499`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-seven existing ledger records were fingerprint-checked. Their
  supported findings were retained, except `14316` and `14496`, which were
  reclassified as correction candidates based on this range review.
- The other 183 IDs were reviewed and added to the ledger. Nine new
  correction candidates and 13 evidence-limited holds were recorded.
- Of the 183 new IDs, 136 have indexed quest-asset links and 47 do not; 10
  link to multiple assets. Asset associations do not establish an
  individual speaker or playback order.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `14255` | Naturalness / meaning | In this quest-log statement, `eliminate him` is supported as killing or disposing of Red Idward by Japanese `始末` and Chinese `将其杀死`. `그를 제거해야 한다` sounds mechanical and can obscure the intended action. Consider `그를 처치해야 한다`, preserving the speaker's resolve and the objective's wording. | High |
| `14316` | Naturalness / role wording | The active phrase `마을의 수석 방어관` is an awkward calque for `the village's chief defender`. Japanese identifies a militia captain and Chinese uses a chief defender; the precise office is not established. Consider the natural, role-neutral `마을의 수비대장 바튼(Barten)` rather than asserting a more specific formal rank. This updates the earlier uncertain ledger disposition. | Medium-high |
| `14319` | Naturalness | `순수한 마법으로 된 생명체` is understandable but awkward. The contrast is that Tuatha and Trolls are creatures made of pure magic. Consider `순수한 마법으로 이루어진 존재`, without adding a specific function for Prismere that the sources do not state. | Medium |
| `14335` | Naturalness / honorific form | The proclamation's whole paragraph should be smoothed, not just the title: `나의 여신 리리아(Lyria) 부인의 부름` is unnatural, and `이곳을 촌장이자 길잡이로 섬기겠다` is cumbersome. Consider `나의 여신이신 리리아(Lyria)께서 부르시는 소리를 들었으므로, 촌장이자 길잡이로 이 마을을 섬기겠다.` The statement that the villagers live and thrive by Lyria's grace can also be made more direct while retaining the solemn register. | Medium-high |
| `14355` | Meaning / naturalness | `the Maid has taken them` refers to both the King and the Court of Enchantments. `그들을 데려갔어` can sound as though both were merely escorted away. Japanese uses `奪っていった`, supporting the seizure meaning. Consider `시녀(The Maid)가 왕과 마법의 궁정(Court of Enchantments)을 모두 빼앗아 갔어.` | Medium-high |
| `14375` | Naturalness | `대상 위치에 범위 피해로 ...를 줍니다` stacks the area-damage phrase awkwardly. The four sources agree on 600 Fire Damage, 85 Burning Damage, and a 270 Mana cost. Consider `대상 위치에 범위 공격을 가해 화염 피해(Fire Damage) 600과 화상 피해(Burning Damage) 85를 줍니다.` Preserve the existing cost line and break. | High |
| `14388` | Honorific / terminology | The English label is `Lady Oleyn`; the active `레이디 올레인(Lady Oleyn)` transliterates the title rather than using the established Korean honorific style. Consider `올레인 여사(Lady Oleyn)`. | Medium-high |
| `14401` | Meaning / naturalness | English describes the door opening with a nearby lever; Japanese describes it opening when the lever is pulled. `근처 레버를 당겨 문을 열었다` adds an unexpressed active actor. Consider `근처 레버를 움직이자 문이 열렸다.` | High |
| `14442` | Naturalness | `신병의 예상 수명은 며칠로 잴 수 있어` is an awkward literal construction. All sources express the grim exaggeration that a recruit is expected to live only days. Consider `신병의 예상 수명은 며칠에 불과해.` | High |
| `14495` | Formatting / creature label | The full source subtype is `Taint Boggart`, but only `Boggart` appears in the parenthetical. Consider pairing the complete subtype as `스레시(Thresh) - 타인트 보가트(Taint Boggart)`. | High |
| `14496` | English pairing / title order | The existing `브레너 대사(Brenner Ambassador)` reverses the source title/name order inside the parenthetical. The established person-and-title form is `이름 대사(Ambassador Name)`; consider `브레너 대사(Ambassador Brenner)`. This reopens an existing ledger row; the political sequence itself is retained. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `14267` | Meaning / referent | English says `the light`; Chinese specifically says lamp, while Japanese says light and treats Reverie as meditation. Korean's general `빛` does not over-specify the object, and `몽상(Reverie)` follows the established term. Retain pending stronger context. |
| `14282` | Meaning | `You have proven differently` is compressed and can mean demonstrating originality or proving a difference. Japanese and Chinese diverge; retain `자네가 다르다는 걸 증명했지` rather than guessing the intended claim. |
| `14289` | Meaning / item type | `Almain Sojourner` may be a person or a ship. Japanese explicitly says immigrant ship, Chinese reads it as a wandering Almain, and Korean's `호` selects a vessel. Retain pending identification of the entry type. |
| `14293` | Meaning / idiom | `Make peace with your gods` may be literal reconciliation or an idiom about preparing for death. English and Japanese do not settle the intent; retain the direct Korean reading. |
| `14298` | Terminology | The epithet `God of Unrest` has possible social and psychological senses; `불안의 신` is plausible but not conclusively preferred over a turmoil/unrest rendering. Retain pending a terminology decision. |
| `14343` | Meaning / document structure | The colon in `Mission Brief from Shieldring Keep: Warsworn Ledger` does not establish whether this is one ledger containing a brief or two related document labels. Retain the current reading. |
| `14358` | Meaning / title | `Captain at Arms` is not resolved by the sources: Japanese says `兵長`, Chinese says weapons-department head, and English is ambiguous. Do not choose a military rank or weapon-office title without context. |
| `14368` | Meaning / proper name | English and Chinese read `calamity` as a disaster, while Japanese treats it as a ship name. The Korean `재앙` follows two sources; retain it pending context. |
| `14404` | Text type / title | `The Humbled` may be a named group/title or a descriptive label. The source context does not establish whether the Korean book-title brackets are appropriate; retain pending identification. |
| `14405` | Address / honorific | `Your grace` can indicate different ranks; Japanese uses a general honorific and Chinese uses “Your Majesty.” Korean `각하` is plausible, but the addressee's rank is not established. |
| `14420` | Terminology | `Super armor buff` may be a formal combat mechanic or a high-defense effect. Japanese and Chinese support the mechanic reading, but no project term establishes whether `방어구 강화 효과` is wrong or what Korean label should replace it. |
| `14428` | Meaning / referent | `that skin` may be a hide or a skin-container; the sources do not identify the object. Retain `가죽 주머니` as a plausible but unconfirmed interpretation. |
| `14431` | Terminology / proper name | `The Keening Curse` may use `Keening` as a proper term or as “lamenting.” Japanese transliterates it while Chinese supports the lament reading; retain `통곡의 저주` pending context. |

## Source and Structural Checks

- Forty exact-English duplicate groups touch the 183 new IDs, covering 601
  rows across the corpus. One group, `You have come.` (`14256`, `29817`),
  differs in Korean (`왔네요` / `왔구나`); Japanese also differs in register
  (`来ましたね` / `来たわね`), so the Korean distinction was retained.
- Runtime placeholders, localized wrappers, named variables, and layout
  tokens match by structure across all four locales. At `14400`, localized
  content inside `{*1...}` differs as expected; the wrapper and argument
  structure match.
- Logical line-break counts match across all four locales for all 183 new
  IDs. Three Korean rows contain 12 embedded CRLF breaks: `14335` (10),
  `14375` (1), and `14399` (1). The corresponding source rows contain the
  same number of logical breaks. No line breaks were changed.
- The earlier preliminary concern about a plural-subject shift at `14346`
  was cleared against the active Korean: `우리에게 너밖에 없다는 걸` means
  that the addressee was the only choice for the speaker's group; it does
  not make `we` the subject of `I knew`.
- `14316` and `14496` were reclassified from their existing ledger statuses;
  the other existing candidate/uncertain dispositions in the range remain
  unchanged.
- Speaker attribution and playback order remain unknown unless separately
  supported by direct evidence. Asset and quest associations alone do not
  establish them. ID `14335` is an exception for authorship: the proclamation
  explicitly identifies Aurela Corelon in its first-person text; this does
  not establish any spoken-line mapping or playback order.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
