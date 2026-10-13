# Preliminary Language Scan: `default` IDs 28101-28150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28101-28150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28101-28103, 28105-28107, 28109-28119, 28121-28128, 28130, 28132-28134, 28136-28139, 28142-28146, 28148-28150 | Dialogue, names, terms, and objectives | Recheck register and recurring setting/name terminology in the integrated pass. | Korean generally follows the English meaning. The active `Beckoned`, Fae, title, and proper-name forms remain candidates for corpus-wide reconciliation. | Medium |
| 28104 | Localized `services` marker / `{1}` control | Preserve the `*1` wrapper, button placeholder, and order; check the localized action in the UI. | Normalized marker identity/order matches the other locales. Korean translates the marker payload and retains `{1}` after it. | High |
| 28107 | Alchemical formula “released” | Preserve that the stolen formula could cause devastation if disseminated/released, without making it sound like the formula itself is physically freed. | Korean says `풀려나면`, which can refer either to releasing the formula or letting it loose. Japanese says it is spread; the source context is a stolen formula whose release could cause harm. | Medium |
| 28116, 28120, 28129, 28135, 28140 | Lyria blessing / Warlock Destiny / `dove` / Emerald Lady / Court of Enchantments | Reconcile deity, Destiny, familiar-address, and title terminology with related rows. | Korean preserves the dialogue and ability relations. `dove` remains a recurring unresolved vocative; `Emerald Lady` is rendered as `에메랄드 여왕`, making her rank more specific than English. | Medium |
| 28120 | `흑마법사 운명` for `The Warlock` | Confirm the class/Destiny name and the established terms for mana recovery and Blink. | English and Chinese describe a Destiny/class, Japanese uses a destiny label, and Korean translates Warlock semantically. The effects (faster mana recovery and poison-enhanced Blink) are retained. | Medium |
| 28129 | `도브(Dove)` | Resolve the repeated familiar/vocative `dove` without assuming it is a character's proper name. | English uses lowercase “dove” as direct address; Japanese omits it and Chinese calls the addressee a “peace messenger.” The current Korean transliteration is traceable but may read as a name. | Medium |
| 28135 | `에메랄드 여왕` for `Emerald Lady` | Preserve the source's `Lady` title unless context establishes that “Queen” is the canonical title. | English says `Lady`; Japanese and Chinese also differ in title form, and Korean follows the Japanese-style “Queen” rendering. Historical notes list the Emerald Lady as a title/name consistency item. | Medium |
| 28138 | `그들은` for `they` | Identify the plural referent before selecting or clarifying the Korean antecedent. | The English clause says “they're no myth” without naming the referent in this row. Korean keeps the ambiguity; the historical question specifically asks what `they` refers to. | Low |
| 28141 | `Trav` / Camp Moondown | Confirm who or what `Trav` names and whether Moondown is a place traversed together or a party traveling with him. | English syntax permits more than one attachment. Japanese treats Trav as the subject and Moondown as a separate consideration; Korean's `와 함께` can imply Trav and the camp moved together. The historical inventory explicitly flags this row. | Low |
| 28142, 28147 | Ragnarr/Praetorian Paige / Last Breath armor | Standardize proper names, ranks, and the armor/item title; retain the battle outcome and crafting relation. | Korean preserves the battle and armor-rebuilding events. The historical inventory groups these names and terms for glossary review. | Medium |
| 28148 | “will you not you end my suffering?” | Treat the repeated `you` as an English source typo, not a meaning-bearing repetition. | English contains a duplicated pronoun; Japanese and Chinese express a single request. Korean also uses a single request to end the speaker's suffering and save others. | High |

## Historical Audit Reconciliation

- The source-keyed 28100-28199 inventory flags Beckoned, Dynwel, Saturnyn,
  Mitharu/Mitharan, Kollossae, Warlock, Cranalt, Traveler, Hierophant,
  Bhaile, Emerald Lady, Well of Souls, Gale Crossing, Court of Enchantments,
  Moondown, Ragnarr, Tearscotter, Deirdre, Last Breath, Maire, Crownhold,
  the `dove` address, the referent of `they` at 28138, and the referent of
  `Trav` at 28141.
- These historical notes remain open questions and do not approve a
  particular spelling or interpretation.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28101-28150 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales. ID 28104's marker wrapper and
  `{1}` placeholder are preserved.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28101-28150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28151.
