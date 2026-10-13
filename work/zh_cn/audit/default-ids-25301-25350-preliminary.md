# Preliminary Language Scan: `default` IDs 25301-25350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25301-25350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25301-25302 | “I'll sell some” / Audra | Preserve the unspecified plural quantity and verify Audra's name. | Korean retains “some” without inventing a count; locale name spellings differ. | Low |
| 25303 | Hungary | Treat as the country name, not the common noun “hunger.” | English, Japanese, and Korean identify Hungary; Chinese uses `饥饿` (“hunger”), a clear meaning divergence. | High |
| 25304 | Beckoned / celebrations | Preserve the invitation to enjoy and participate in the celebration. | Korean retains both the invitation and participation request; register varies by locale. | Low |
| 25307, 25309 | Tyr / High King Titarion | Standardize the deity and royal-title forms against the Korean glossary. | Korean uses `티르` and `최고왕 티타리온`; source locales retain/differ in transliteration. | Medium |
| 25310 | “control the show” | Determine whether the speaker means controlling a performance, public appearances, or their own presentation under scrutiny. | Korean chooses a stage/show metaphor (`무대는 우리가 장악`); Japanese emphasizes appearance, while English leaves the idiom ambiguous and Chinese is literal about controlling a show. | High |
| 25311-25312 | Wyvyrn-Gifres / House of Ballads | Standardize the family compound and faction name. | Korean retains the combined house name and renders House of Ballads as `발라드의 집`; official/formal naming remains a consistency question. | Medium |
| 25314-25316 | Lord Besin / Fahrlangi / Eamonn Isle / “Finale” / amphora | Verify names, whether “Finale” is a quest-stage label, and the vessel and sacred-spring terms. | Korean preserves the pursuit, three spring locations, and amphora objective; spellings and label readings vary. | High |
| 25317 | `+50% Magic Damage` | Preserve the exact value, scope, and blank-line layout. | Korean retains `+50%` and the all-magic scope; all locales preserve the blank separation. | High |
| 25319 | Sidhe | Confirm that Sidhe is a dangerous place name and standardize its Korean form. | Korean transliterates it as `시드(Sidhe)`; Japanese transliterates it and Chinese gives a generic “fairyland” reading. | High |
| 25321-25324 | Tender's Path / Dead Kel / Elza Postlethwaite / Hall of the Firstsworn / Menetyre | Verify title, character, and location spellings; preserve the threat and letter's meeting request. | Korean retains the hammer-remains question, Dead Kel threat, and mysterious-letter objective; names and “Tender” role vary. English ID 25324 uses an opening curly quote in “I‘ve.” | High |
| 25325-25329 | Forsaken Plain / Champion / Rikka Egest / Fate bonus / mission monk | Standardize region/title/name terms and retain the gossip's scandal implication and exact `+15% Fate` stat. | Korean preserves the numeric bonus and embrace; locale names vary, and “mission” may denote a religious outpost/institution. | High |
| 25332-25335 | patron / Fomorous / Stowaway troll / Pathieu Jarian / hybrid Destiny | Preserve the patron's responsibility and debt, the troll's history, the bounty hunt, and the two-class unlock. | Korean retains the obligation, pre-raising sewer history, and hybrid destiny; names and “silver-back” creature description need consistency review. | High |
| 25336 | Young Races / “currency of telling” / Lorestones | Determine whether “telling” is a named Fae tradition and preserve the metaphor of Lorestones being replaced by a new medium. | Korean calls it a new medium of oral tradition; Japanese describes a preservation method and Chinese a medium of heavenly mandate. | High |
| 25340-25344 | Valor Arena Guard / Map Slot / Maura Chalin / Summer Court / Vraekor | Standardize UI/place/faction/deity names and preserve the prediction that neutrality ends voluntarily or by outside force. | Korean retains the two alternatives and the rebirth/blessing claim; transliterations and the map-slot label vary. | High |
| 25346-25348 | healing failure / Glasspillar Caves / Scions | Preserve the implication that others now know she can err and standardize cave and group names. | Korean retains the loss of healing, first mistake, and ceremonial amulet requirement; localized place/group forms differ. | High |
| 25350 | Priestess / “Is he, then?” | Resolve the pronoun/addressee from adjacent dialogue and preserve the decision to consult the Priestess. | Korean retains the question and action; Japanese omits the “is he?” question and Chinese preserves it more directly. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 25300, 25307, 25309-25312, 25314-25316,
  25319, 25321-25329, 25332-25336, 25340-25344, 25346-25348, and 25350
  against the active locale rows. The deity/faction/name forms, ambiguity,
  stage/vessel terms, Sidhe, title and place names, hybrid destiny, “currency
  of telling,” neutrality, and pronoun antecedent remain open candidates.
- Cross-checked recurring forms for Tyr, Lyria, High King Titarion,
  Wyvyrn-Gifres, House of Ballads, Fahrlangi, Eamonn Isle, Rathir, Galafor,
  Snowmelt Pass, Sidhe, Dead Kel, Hall of the Firstsworn, Menetyre, Idylla,
  Fate, Vraekor, Scions, and the Priestess.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25301-25350 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales; no runtime token
  occurs in this range.
- Numeric values are retained, including `+50% Magic Damage` at ID 25317 and
  `+15% Fate` at ID 25328. No structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25301-25350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25351.
