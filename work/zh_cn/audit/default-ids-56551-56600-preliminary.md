# Preliminary Language Scan: `default` IDs 56551-56600

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56551-56600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56551 | `Scion` / `후계자` | Preserve the formal Scion identity and clarify Akara's attempt to correct his own mistake. | Korean translates Scion as “successor,” consistent with some rows but still part of the unresolved office-vs-generic-successor terminology issue. The rest of the sentence preserves the intended correction/creation relation. | Medium |
| 56552 | “craft circles around” | Preserve the idiom that Wivi greatly outclasses an average enchanter without literalizing circles. | Korean naturally says her crafted goods are much better than an ordinary enchanter's; Chinese translates the “circles around” image literally. | Medium |
| 56554 | poison-resistance potion / reagent names | Verify the canonical Korean plant/material names and keep all recipe quantities and layout. | Korean preserves Cripplespore Caps (2), Ysa's Breath (2), Seaflax (1), Essence of Fate (1), and the blank line; terms remain glossary candidates. | Medium |
| 56562 | Kurtorix / Shine and Shadow | Confirm Kurtorix as the searched location/target and the pair of dagger names. | Korean preserves failure to find the artifacts Avicenn described, discovery of the named dagger pair, and the return/verification objective. Chinese instead says the search failed to find “gods,” a source-language divergence. | Medium |
| 56553 | `[{1}] Used` | Preserve brackets and the `{1}` variable as a UI format candidate. | English, Chinese, and Korean include square brackets around `{1}`; Japanese omits them. The variable itself is unchanged in all four locales. | Medium |
| 56572 | Chaos Flame/Weapons/cores/realm dungeons/Nodes markers | Confirm the localized runtime-label order and standardize the Chaos terminology while preserving the tutorial's control prompt. | The marker frame and counts match, but Japanese orders the Chaos-core marker after the dungeon/node markers; English, Chinese, and Korean place it before them. Korean follows English/Chinese order. `{LINE_SPACE}` and `{1}` are preserved. | Medium |
| 56573 | “Paying business—as long as it's important” | Clarify whether `paying` means profitable work or a paid/important undertaking. | Korean says “if it's money-making… if it's important,” while Japanese says money-making work and Chinese interprets the aside as “as long as it is important.” The source's wordplay/aside remains context-sensitive. | Medium |
| 56581 | House of Ballads poem | Preserve all ten source line breaks and verify the speaker's title/epithets, the sacred-seat image, and the final Magwyr/Maid reference. | Korean has ten newline characters, matching English and Japanese; Chinese has nine and combines lines. Korean retains the poem's sequence but interprets `scepter of this house` as the house's scepter-bearing master; `Maid` and several epithets remain terminology candidates. | High |
| 56585 | `A child of dust` / `먼지의 자식` | Align with the established `Child of Dust` / `Child of the Dust` renderings and decide whether this lower-case use is generic or a title. | Korean says “child/offspring of dust”; other reviewed rows use `먼지의 아이` for the named epithet. The lower-case source may indicate a generic phrase, so do not normalize without context. | Medium |
| 56586 | Mairu / Apotharni / Kollossae / Kreios verse | Verify the creation/religious relationship and canonical names while preserving the stanza separation and progression. | Korean retains the bestowed heart, newly born Kollossae's deliverance, gods returning to the mountain, journey to the Teeth of Naros, and Kreios blessing. All four locales preserve the verse's paragraph breaks. | Medium |
| 56588 | Warsworn / Hirelings | Align Warsworn with the dominant `워스워른` and determine whether Hireling is a formal rank distinct from a generic mercenary. | Korean translates Warsworn as `전쟁맹세단` and Hirelings as `고용병`; Japanese identifies Hirelings as a third-class mercenary, while Chinese treats the line differently. | Medium |
| 56595 | “Shall we make our cases?” / `서로 변론해 볼까요?` | Confirm whether “make our cases” means present arguments in the debate or make separate claims. | Korean interprets it as debating/arguing each side; the preceding context is not present in this row. | Low |

Other reviewed rows generally preserve the first-read English meaning. Names
and terms remain provisional, including Akara, Wivi, Cripplespore, Ysa's
Breath, Seaflax, Essence of Fate, Kurtorix, Shine, Shadow, Sprite Showdown,
Thais, Dead Kel, Gadflow, Grian Shane, Gallows End, the Malloi family,
Mairu, Apotharni, Kollossae, Kreios, the Warsworn, Hirelings, Brownies,
Beckoned, Crownhold, Scion, Sydanus, Unseelie, and Mithros.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56550-56649`.
  Relevant prompts within this active range include the Wivi idiom (56552),
  potion ingredients (56554), Kurtorix/Shine/Shadow (56562), Chaos tutorial
  marker order (56572), the House of Ballads poem (56581), Child of dust
  (56585), the Mairu/Apotharni verse (56586), and Hirelings (56588).
- ID 56550 was reviewed in the preceding active report as the opening
  historical boundary. IDs 56551-56600 are reviewed once here; no active
  row is skipped or duplicated. Historical questions are prompts, not
  accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56551-56600 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- At 56553, `{1}` is preserved; English/Chinese/Korean retain square
  brackets while Japanese omits them.
- At 56572, marker identities/counts and control tokens are preserved.
  Localized marker order differs in Japanese as noted above; Korean matches
  English and Chinese. The `$M0_SQ06.ring_cost$` variable at 56598 is also
  unchanged.
- At 56581, Korean preserves the ten source line breaks; Chinese has nine.
  At 56554, the recipe preserves its blank separator, four ingredient lines,
  and quantities; 56586 preserves the verse/stanza breaks in all locales.
- No cross-locale numeric-value discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56551-56600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56601.
