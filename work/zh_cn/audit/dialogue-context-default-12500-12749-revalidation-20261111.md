# Sequential `default` Revalidation: IDs `12500`-`12749`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-nine existing ledger records were retained after their four-language
  fingerprints were verified. The other 181 IDs were compared and added.
- Five newly recorded IDs have correction candidates. Twenty-one retain
  evidence-limited findings; no candidate and hold overlap.
- Of the 181 new records, 135 have indexed quest-asset links and 46 do not.
  Six IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `12545` | Terminology / format | English is `Ambassador Kulder`; the active Korean title reverses the English title/name order as `쿨더 대사(Kulder Ambassador)`. Use the established `쿨더 대사(Ambassador Kulder)` form. The same reversed parenthetical occurs in the longer introduction at ID `17` and the matching title at `33632`; review these linked uses together when applying an approved edit. | High |
| `12550` | Meaning | English says `our sister`, and Chinese does not specify relative age; only Japanese says younger sister. Korean `여동생` adds an age distinction supported only by the Japanese reference. Use an age-neutral sibling wording while preserving the speaker's regret and the counterfactual. | High |
| `12571` | Meaning / address | English and Chinese say only `my brother`; Japanese specifies an older brother. Korean `형` additionally presumes a male speaker and an older sibling. Use an age-neutral form such as `내 형제인 루이(Louis)` without changing the expedition account. This also restores the direction of the earlier accepted correction, which is absent from the current active row. | High |
| `12585` | Meaning / tone | `If this is what it takes ... so be it` expresses acceptance, while Korean `기꺼이 하겠어` makes the speaker sound more eager. Japanese `別に構わないわ` supports a matter-of-fact acceptance. Recast the ending along the lines of `그렇다면 받아들이겠어`, retaining the speaker's resolve. | Medium |
| `12673` | Meaning / threshold | English says `over 10,000`, and Chinese says more than 10,000; Korean `10,000개 이상` includes exactly 10,000. Preserve the strict threshold, for example `범죄 관련 뇌물로 금화 10,000개 넘게 쓰기`. Japanese uses an at-least reading, but English is the primary meaning source. | High |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `12505` | Meaning / idiom | English says the war is “out there,” Japanese treats it as someone else's affair, and Chinese says the war has begun. The current spatial reading follows English, but the cross-locale divergence remains unresolved. |
| `12508` | Meaning / referent | `Dvergan Raider` may identify a raider or a raiding vessel; Japanese explicitly reads it as a pirate ship. The isolated label does not settle the category. |
| `12537` | Meaning / referent | `Ynadon` may be a person, place, or deity, and `mercy` may mean clemency or divine favor. |
| `12591` | UI meaning | The isolated `Scholarship` label could denote financial aid, academic study, or another UI category. |
| `12593` | Title / referent | `Argine, Queen of Staves` may be a card, rank, character epithet, or title; the locale spellings do not settle its role. |
| `12596` | Terminology | Runtime/layout wrappers, paragraph structure, and marker order are preserved. The exact canonical Korean names for the Chaos Realm concepts are not established by the available glossary evidence. |
| `12609` | Meaning / text type | The line may be promotional/bookshop copy or dialogue, and `transfixed upon the page` has more than one plausible rendering. The current visitor-facing Korean is coherent, but the isolated key does not establish the intended framing. |
| `12634` | Meaning / syntax | The English fragment about the Hierophant's will and the alternative possibility that the rumor is false has an unclear grammatical relation. The Korean preserves both possibilities without resolving the source syntax. |
| `12637` | Terminology / text type | The `[DO NOT USE]` warning is preserved, but the canonical rendering and player-facing status of `Scourge Armor` are not established. |
| `12643` | Meaning | `Past life` can mean a previous incarnation or the speaker's earlier life; Japanese and the other references do not fully agree. |
| `12653` | Meaning / lore | `Volatility` could mean instability, unpredictability, or change. The Maid's relation to that condition is not further explained by this row. |
| `12664` | Meaning / idiom | The compound comic insult, especially `take-it-in-the-eye-for-a-sigh`, is deliberately or accidentally obscure. The references do not support a single confident Korean interpretation. |
| `12670` | Naturalness / idiom | The established regional name is `변경지`; the greeting `Many tidings to you` remains archaic, and the references differ on whether it is a blessing or an offer of news. Keep the current greeting provisional rather than inventing a settled idiom. |
| `12671` | Names / lore | English and Japanese support the church reading, while Chinese says temple. The Korean follows English and retains the named Unbound and Order, but their exact institutional relationship is not established here. |
| `12675` | Meaning / names | The English describes scales taken from the skinned hides of Murghan and Banshaen, while Chinese interprets these as creature categories. The Korean follows English, but the creature identities and hide/scale relation remain unverified. |
| `12687` | Tone / idiom | The pause in `youthful... discretion` may signal self-deprecation or a euphemism for youthful indiscretion. The references preserve the ambiguity. |
| `12700` | UI meaning | `Notices of Duty` may be a muster/quest summons or notices describing assigned duties; the isolated UI label does not resolve the intended function. |
| `12714` | Proper name | `Valor Arena` has competing Korean forms in the active corpus. The current `용맹의 투기장` is understandable, but this row alone does not establish the canonical name. |
| `12727` | Meaning / lore | `That pattern` could refer to the Fae cycle or a broader order; the English/Japanese/Chinese formulations differ. The current names and battle account remain traceable. |
| `12737` | Meaning / context | The fragment `What ‒ you have!?` lacks its object. Korean specifies `찾았다고`, but the available row does not establish what was found; Japanese and Chinese also complete or interpret the fragment differently. |
| `12742` | Proper names / referent | `Sparrows` may be the named faction, while `Rathir Quays` may be a named district or simply the docks. The current Korean preserves the suspected-killer question but the labels remain context-dependent. |

Previously accepted wording was checked against the active rows. The
corrections at IDs `12580`, `12606`, `12617`, `12645`, `12654`, `12692`,
and `12715` remain reflected in meaning; ID `12571` is the exception noted
above.
The standardized forms at IDs `12523` and `12528` remain consistent. ID
`12670` uses the established `변경지` regional name; only its greeting remains
uncertain. No speaker or playback order was assigned.

## Duplicate and Structural Checks

- One hundred eighty exact-English duplicate groups touch the 181 new IDs,
  comprising 795 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout-token identities, wrapper
  classes/order, and brace balance match across all four languages. Localized
  text inside `{*1...}` display wrappers varies as expected at IDs `12596`
  and `12739`.
- Logical line-break counts match across English, Japanese, Chinese, and
  Korean for all 181 new IDs.
- Seven Korean strings contain 12 existing embedded line breaks: `12602`
  (2), `12616` (1), `12624` (2), `12630` (2), `12640` (1), `12672` (2),
  and `12682` (2). Their existing bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
