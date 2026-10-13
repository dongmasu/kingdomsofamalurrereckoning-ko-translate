# Preliminary Language Scan: `default` IDs 26251-26300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26251-26300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26251-26252 | Sorrows / Hollow of Sinsear / Hollow of the Weeping King / `Lupoku's Luck` | Preserve the relationship between the title and place names; confirm `Lupoku` versus the established `Lopoku` spelling and the localized title. | The preserved historical audit explicitly flags the Lupoku/Lopoku discrepancy. The Korean draft uses `로포쿠`, consistent with the established glossary form, while the English item name spells `Lupoku`. Treat this as a source/name question, not a Korean correction decision. | High |
| 26253-26260, 26264, 26270, 26272, 26274, 26279-26282, 26287-26288, 26290, 26292, 26297-26298, 26300 | Dialogue voice, register, and agency | Recheck character context and speaker/listener roles, especially the pronoun/agency shift at 26274. | English 26274 says the addressee (“you”) would have stabbed and looted the speaker; Korean begins “예전의 나라면” (“if I were my former self”) and then says “널” (“you”), apparently shifting the actor to the speaker. Japanese also leaves the subject implicit, so English remains the meaning authority. This is a high-priority preliminary candidate. | High |
| 26255, 26257-26260, 26265, 26268, 26270-26276, 26278, 26281, 26283-26287, 26290-26296, 26299 | Mitharans / Niskaru / Ventrinio / Vagabond / Farrara / Horrinox / Ethene / Great Houses / Kollossae / Meathgra / Midden / Order / Lerkara Fel / Kandrian | Standardize proper names, factions, creature terms, and lore vocabulary against the project glossary and historical questions. | Existing historical questions already group most of these names and terms. `Vagabond` may be a named group or descriptive adjective (26268); `Order` lacks enough local context to settle its identity (26294); and the source's “great and greater strength” wording at 26291 is intentionally odd. Keep these open for integrated terminology review. | Medium |
| 26256, 26263, 26266, 26277 | Alchemy recipe / Adrenaline Surge / Chaos Weapon Core / localized difficulty and options wrappers | Preserve all recipe quantities, stat values, and marker wrappers; decide established item/ability wording consistently. | ID 26256 retains the reagent quantities 2/2/2/1 and blank-line/list layout. ID 26263 retains +25%. ID 26277 preserves two `{*1...}` wrappers in order in all locales; their enclosed labels are localized by design, not a token-identity mismatch. | High |
| 26261, 26271, 26275-26276, 26283, 26286 | Ballad / Farrara / Horrinox / Kollossae / Fae-giant history | Review literary imagery and proper-term capitalization without flattening the source's mythic voice. | Korean retains the stepwise reenactment of “Ring and Reprisal,” Farrara's selfless act, the fire-tunnel/other-side image, the serpent metaphor, and the hammer's Fae history. The referent of `the Ballad` at 26261 and the seasonal meaning in “all seasons” at 26271 should be checked with surrounding lore. | Medium |

## Historical Audit Reconciliation

- The historical source-keyed log groups 26252 with the controller/name and
  Sorrows questions, explicitly noting the `Lupoku` source spelling versus
  established `Lopoku`.
- It separately identifies Mitharans/Niskaru, Hugues/Ventrinio, Vagabond,
  Farrara/Horrinox/Ethene, Great Houses, Kollossae, Drowned Forest, Mitharu,
  the Order, Meathgra/Midden, and Lerkara Fel/Mel Aglir as terminology or
  context candidates.
- The historical log's existing issue inventory is not an approval of the
  active Korean. This pass preserves the 26274 agency concern for subsequent
  disposition.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26251-26300 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including the
  reagent list at ID 26256.
- At ID 26277, all locales retain two `{*1...}` wrappers with matching
  identities and order; the enclosed difficulty/options labels are localized
  by design and therefore are not identical token payloads.
- Recipe quantities and numeric bonus values are preserved. No key, order,
  line-break, or wrapper-count exception was found.
- Korean wording and all translation/source CSVs were not edited.

## Batch Status

IDs 26251-26300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26301.
