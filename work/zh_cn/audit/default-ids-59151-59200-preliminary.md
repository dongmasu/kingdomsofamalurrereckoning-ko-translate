# Preliminary Language Scan: `default` IDs 59151-59200

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59151-59200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59152 | thumos / `투모스` / magical paint | Preserve the named substance and its role in restoring the fourth painting; retain the two-vial/Boggart/Root Golem conditions. | All four locales retain both vials and the separate kill thresholds. English uses “thumos”; Korean transliterates it, while Japanese and Chinese use different phonetic forms. The term and proper names remain provisional. | Medium |
| 59155 | steal-detection percentage / `#NAMED_ICON_STEALTH_EYE#` | Preserve the percentage's relation to the stealth-eye icon and the chance of being caught while stealing each item. | All locales retain the named icon and the percentage explanation. Korean accurately states that the percentage below the icon is the chance of being caught. | High |
| 59156 | Belen's Testament / `벨렌의 유언 결사` | Align the faction rendering with the other active forms `베일렌 결사` (58994) and `유언 결사` (59059). | All locales agree Giran fell under the faction's influence and that the speaker killed him and controlled puppets. Korean preserves the event but uses a third Korean name form for the same Testament faction. This is a terminology consistency candidate, not an approved correction. | High |
| 59167 | House of Vengeance / the Cur / `복수의 전당`, `그 커` | Verify whether “Cur” is a named enemy/title or a generic insult and align the House name with faction terminology. | English and Japanese preserve a capitalized/name-like `Cur`; Chinese translates it as a dog. Korean transliterates it after the demonstrative, which may read awkwardly or leave the referent unclear. | Medium |
| 59170 | St. Odwig's Perpetual Mission / `상설 선교소` | Preserve the institution's formal name and the speaker's cautious welcome; verify the Korean rendering of “Perpetual Mission.” | English and Japanese identify a formal mission, while Chinese uses “Eternal Mission.” Korean's `상설 선교소` conveys a permanent institution but may sound administrative rather than religious. | Medium |
| 59172 | “What are they for?” / `그건 어디에 쓰는 거야?` | Resolve the plural antecedent from context and preserve that the speaker asks about the purpose of multiple items/people. | English asks “What are they for?” while Korean uses singular `그건`. No row-local context identifies the antecedent; retain as an open number/antecedent question. | Medium |
| 59179 | Block Dodge / `막기 회피` | Align the combat-skill name with established terminology for the mechanic replaced by Teleport. | All locales preserve that Teleport unlocks in place of Block Dodge. Korean renders the compound literally; the official/project term remains to be checked. | Medium |
| 59190 | fragmented plea / poison / `감사... 자비를` | Preserve the speaker's broken, dying delivery without changing “Thank... mercy” into a fluent sentence; retain every pause and request to end the suffering. | All locales preserve the segmented plea and poisoning. Korean retains ellipses but its opening `감사... 자비를` is fragmentary in a way that may be intentional or may misparse the English wording. | Medium |
| 59191 | Master's Tallow / `장인의 수지` | Confirm whether this is a named crafting material and align it with established “tallow” terminology. | English names Master's Tallow, Japanese interprets it as secret oil, Chinese as master grease, and Korean as artisan resin. The exact material is unresolved; do not normalize from the name alone. | Medium |
| 59194 | “hardly sporting” / `너무 시시하잖아` | Preserve the complaint that the other person's conduct is unsporting/unfair, if that is the intended idiom, rather than merely boring. | English “hardly sporting” can criticize fairness or sportsmanship; Japanese and Korean interpret it as dull/boring, while Chinese refers to sport. The context of a game and changed mind is insufficient to settle the nuance. | Medium |
| 59197 | Officer's Hall / the Burn | Preserve the two locations and the speaker's return instructions; keep “the Burn” consistent with earlier place-name questions. | All locales retain the people in Rathir and the speaker's location in the Officer's Hall on/in the Burn. Korean keeps the named place untranslated as `번`; its capitalization/place status remains part of the wider terminology review. | Medium |
| 59200 | Red Legion / formula crates | Preserve that the Legion is formidable but slowed by carrying multiple crates of formula. | English, Japanese, Chinese, and Korean retain the contrast and plural crates. Korean's `제조법` is a reasonable rendering of “formula”; the item/category remains contextual. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Reverie,
Benwick Athelm, thumos, Boggarts, Root Golems, Mallion Anwon, Giran,
Belen's Testament, Summer Fae, Kollossae, Scholia Arcana, Kells Cafferty,
the Rose of Kandrian, House of Vengeance, the Cur, St. Odwig's Perpetual
Mission, Sandstone Villa, Shadow Walk, the Travelers, Gossamer End, Didenhil,
Blood Plague, Coilsbain Caverns, Jottun, Master's Tallow, Mitharu, the Burn,
and Red Legion.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `59150-59249`.
  Applicable prompts include Reverie (59151), thumos (59152), the stealth
  percentage and icon (59155), the Testament and its influence (59156), the
  Summer Fae (59159), Kollossae (59161), House of Vengeance/the Cur (59167),
  the Perpetual Mission (59170), Sandstone Villa (59174), the stock
  ledgers/bills of trade (59175), the Travelers (59180), the Chaos Sight
  description (59182), Gossamer End (59184), Didenhil/Blood Plague/Jottun
  (59187), and the fragmented plea (59190). These remain open prompts, not
  accepted corrections. The older note's Ethene-at-59151 label was stale or
  misaligned; all four active source rows identify Reverie dialogue there.
- The Testament spelling at 59156 adds a third current Korean rendering to
  the two forms already observed at 58994 and 59059.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59151-59200 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Embedded newline counts match throughout the batch. Localized marker
  identities/order at 59155 are retained; the icon and percentage syntax
  remain present. No numeric-value discrepancy was found.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59151-59200 received a preliminary reading and a working disposition.
The disposition and its one accepted correction are recorded in
`disposition-batch-default-59151-59200-20261011.md`; they are not independent
final linguistic approval. Continue at `default` ID 59201.
