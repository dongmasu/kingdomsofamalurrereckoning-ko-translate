# Preliminary Language Scan: `default` IDs 22401-22450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 22401-22450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 22404 | interrupted letter-reading dialogue | Preserve the hesitations and unfinished thought; review whether Korean adds an unsupported transition/question. | Korean retains the disfluency but reorganizes the trailing fragments into “so why did you come?” and “what can I do?”, while English leaves the clauses unfinished. Japanese also restructures the hesitation. | Medium |
| 22408 | Scion / successor / `후계자` | Keep the current Scion distinct from the successor Akara is preparing; verify the office/title terminology. | Korean identifies the speaker as a successor, while English uses the capitalized role `Scion` and Japanese transliterates it. Historical question reconciled; term remains provisional. | Medium |
| 22409 | Quicklings / `단명자들` / paths | Determine whether Quicklings is a named people and preserve the dismissive, clinical voice and the sequence of life stages. | Korean uses “short-lived ones”; Japanese says short-lived people, while Chinese treats Quicklings as a named species. The final “rushing predictably” clause differs from Japanese's “never stray.” Historical question remains open. | High |
| 22412 | `Arrow Storm` runtime label / `화살 폭풍` | Preserve the `{*1...}` wrapper and identifier; determine whether its display label should be localized consistently. | All locales retain the `{*1...}` wrapper and identifier `1`, two paragraph breaks, and the `+1` effect. English/Korean keep `Arrow Storm` inside the marker; Japanese/Chinese localize it. This is a marker-content difference, not a lost wrapper or effect value. | High |
| 22415 | `Select Space` / `공간 선택` | Identify whether this is a location-selection command, a controller/UI label, or a development string. | Japanese and Chinese both indicate selecting a location/space; Korean is literal and context-dependent. Historical question remains open. | Medium |
| 22419 | Faitir / family-curse pretense | Preserve the accusation that the listener is following Faitir under false pretenses, without shifting who is lying. | Korean retains the false-pretense claim and insult; Japanese wording can be read as the listener being deceived. Chinese makes the “led by the nose” implication explicit. | Medium |
| 22429 | Kandrian kings / `칸드리아 왕들` | Check the realm adjective and crown-name convention against other Kandrian references. | Korean communicates that the crown was restored but renders “Kandrian” as a local-form name rather than the established adjective candidate; source singular/plural construction is awkward. | Medium |
| 22430 | `Bring the Contract` / `계약서를 ... 가져가기` | Keep the physical-contract reading unless quest context shows this means reporting contract completion. | Korean follows English and Chinese literally; Japanese instead says to report completion of the request. Earlier audit questions about collect/complete distinctions make this worth contextual review. | Medium |
| 22432 | wandering well / Leechwood | Preserve that the enchanted well wanders through Yolvan and that Leechwood enables drawing water; verify the reagent's glossary form. | Korean matches English and Japanese. Chinese changes the well's pronoun/reference, but does not supply stronger evidence for a different Korean reading. | Medium |
| 22434 | thresh / `스레시` | Confirm the creature-name form and keep Luca Soren's feminine pronoun/reference. | Korean retains the creature as a threat and the return-to-inform-her objective. Historical creature-name question remains open. | Medium |
| 22439 | `touched by fate` / `운명의 선택을 받은` | Preserve the mocking implication that the listener acts as if fate chose them. | Korean captures the intended sarcasm; Chinese's literal “moved by fate” is a source-language ambiguity rather than evidence for a different reading. | Medium |
| 22441 | Dokkalfar assassin / Gwyn Anwy | Check recurring Korean forms for the people-name and character; preserve the sudden rescue and sequence of action. | Korean retains the approach, Gwyn's entrance from out of view, the stabbing, and her turn. The Dokkalfar form differs from common draft variants and needs corpus-level consistency review. | Medium |
| 22447 | Ysa Chapter House / Scholia Arcana initiate | Preserve that Cassera is an initiate of Scholia Arcana who fled its Ysa chapter house; standardize both institution and location names. | Korean follows English. Japanese also treats the location as a chapter house; Chinese is ambiguous about whether Cassera fled the site or joined the institution. Historical question remains open. | Medium |
| 22449 | `Outcast's Revenge` / `추방자의 복수` | Determine whether “Outcast” is a named person/faction or a generic excluded person; do not resolve the title from Japanese alone. | Japanese reads this as revenge for bullying, unlike English and Chinese. Korean follows the English title literally. Historical question remains open. | High |
| 22450 | Shrine / `성소` | Verify whether this refers to a shrine, temple, or sanctuary and align the recurring site term. | English says Shrine; Japanese and Chinese use temple/sanctuary-like terms. Korean follows English with “sanctuary.” | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 22408-22409, 22415, 22424, 22434,
  22447, and 22449 against the active locale rows. These remain open
  candidates; 22424's Chaos Node/weapon-core terms are retained for glossary
  review.
- Also checked recurring references around Scion, Quicklings, Chaos crafting,
  thresh, Scholia Arcana, Ysa Chapter House, and Outcast. Their Korean forms
  remain provisional pending broader context and glossary review.
- Official-manual text lookup remains unavailable; no canonical-form claims
  are made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 22401-22450 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including both
  breaks in ID 22412.
- ID 22412 preserves the `{*1...}` wrapper and marker identifier in all
  locales. The marker display text is localized in Japanese and Chinese but
  remains English in the English and Korean rows. After excluding that
  localized marker label, the `+1` gameplay value is preserved in English and
  Korean; Japanese/Chinese omit the explicit `+` value and need a separate
  source/reference check.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 22401-22450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
22451.
