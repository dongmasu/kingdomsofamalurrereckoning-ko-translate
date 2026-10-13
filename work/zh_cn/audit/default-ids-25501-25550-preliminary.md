# Preliminary Language Scan: `default` IDs 25501-25550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25501-25550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25501-25506 | Master Farraglen / Witch Knight Anira / Tilera / Xerastes / Hierophant / Moon Camp | Verify names/rank and determine whether the Hierophant and “our guide” are the same figure; standardize camp naming. | Korean treats Hierophant and guide as distinct references, consistent with English/Chinese; Japanese uses “guide” for both. The reward weapon and Anira objective are retained. | High |
| 25502 | “fleshy one” | Confirm the established in-world insult for a mortal and preserve its contemptuous force. | Korean uses `살덩이 인간`; Japanese omits the insult and Chinese substitutes a generic diminutive. | High |
| 25507-25508 | Brit Codgan / cellar goods | Verify the name and whether the speaker describes a smuggler's storage pattern around town. | Korean retains the cellar locations and slipping in/out when no one is around; other locale spellings vary. | Medium |
| 25510-25512 | Crows / drinking-and-flame boast / Captain Brattigan | Determine whether Crows is a team/faction and preserve the speaker's boast and captain title/name. | Korean explicitly calls Crows a team and retains the drunk-fueled flame boast; the faction sense is not explicit in the short rows. | High |
| 25513-25519 | Renevel / Rathir / Alarane / Einar Longnose / Nyxaros / Anokatos | Standardize names and region spelling; preserve the urgent search for a way to stop Anokatos. | Korean retains the objective and uses forms that differ from Japanese/Chinese transliterations. | Medium |
| 25522-25528 | Black Arick / Leanashe1 / Varen / Scholia Arcana / Spiritweave / Savant Engar / Tala-Rane | Verify the epithet/name boundaries, whether the trailing `1` in Leanashe1 is literal, and rank/item/place terminology. | Korean retains the numeral as a separated suffix (`리어나시 1`); other locales attach it or translate the name. | High |
| 25529 | studying magic outside libraries | Preserve the speaker's contrast between practical, outdoor learning and secluded book study. | Korean retains the dismissive contrast and all three landscapes. | Low |
| 25530-25532 | thousand years of peace / brother / Fae hero | Preserve the ruler's promised peace and protection, the betrayed sibling relation, and the hero's effect on people's imagination. | Korean retains the 1,000-year claim and betrayal; `친형` specifies an older brother, supported by Japanese but not explicit in English. | Medium |
| 25534-25537 | Guardian's vessel / Kora Thresh / Rite of Valor / Jottun and Ettin kinship / monument and ruin | Verify whether “vessel” means the Guardian's body; standardize names and ritual terms; preserve the long-dormant awakening and historical claims. | Korean reads vessel as the Guardian's body. ID 25537 preserves the monument-to-ruin surprise; English's “sealed ourselves way” appears malformed for “away.” | High |
| 25538-25539 | Lorestones on mini-map / “leave well enough alone” | Preserve the map tutorial and the idiomatic warning to stop interfering. | Korean retains the UI instruction and renders the idiom as leaving matters alone and backing off. | Medium |
| 25540-25542 | Wreath of Absolution / Chaos Enemies tutorial | Standardize ritual and Chaos terms; preserve every control marker, link wrapper, and the two explanatory paragraphs. | All locales retain three `{LINE_LEFT}` markers, one `{LINE_SPACE}`, and one `{*1...}` link wrapper in matching order. The linked heading is localized in JA/KO but remains English in ZH. | High |
| 25543 | `Active Quest: {1}` | Preserve the exact runtime placeholder and order. | All four locales retain `{1}` after the localized label. | High |
| 25544-25545 | Tuatha fragment / Lapidus Leaf | Resolve the dialogue fragment from context and verify the item-name form. | Korean retains the fragment and objective; locale names for Lapidus vary. | Medium |
| 25548-25550 | punishment / first Fae arrival and Detyre / Refugees | Preserve the source's firm-but-just sentence and the self-punishment implication; verify the historical claim and standardize Detyre. | English ID 25548 has incomplete grammar (“Likely punish herself much worse”); Korean supplies the implied subject. The last Fae-origin claim and Detyre forms vary by locale. | High |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 25501-25508, 25510-25519,
  25522-25528, 25530-25537, 25540-25545, and 25548-25549 against the active
  locale rows. Name/rank consistency, the fleshy-one slur, smuggler storage,
  Crows, Leanashe1, title/item terms, the vessel, Fae hero, monument/ruin,
  tutorial markers, placeholder, source grammar, and Detyre remain open.
- Cross-checked recurring forms for Master Farraglen, Anira, Tilera,
  Xerastes, Hierophant, Moon Camp, Brit Codgan, Crows, Brattigan, Rathir,
  Nyxaros, Black Arick, Leanashe, Varen, Scholia Arcana, Savant Engar,
  Kora Thresh, Jottun, Ettin, Lorestones, Wreath of Absolution, Chaos
  Enemies, Lapidus Leaf, and Detyre.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25501-25550 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- Runtime-token signatures match, including `{1}` at ID 25543. At ID 25542,
  all locales retain the same control/link wrapper identities and order;
  localized link contents differ as expected.
- Tutorial values, event order, and paragraph structure are retained. No
  structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25501-25550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25551.
