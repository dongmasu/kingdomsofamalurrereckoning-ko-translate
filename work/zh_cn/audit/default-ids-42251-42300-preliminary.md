# Preliminary Language Scan: `default` IDs 42251-42300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42251-42300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42254, 42286 | Sun / Sun Camp / `태양 야영지` | Confirm whether the short label “Sun” is the named Sun Camp and standardize the location. | English/Japanese say “Sun,” Chinese supplies “Sun Camp,” and Korean adopts the camp reading. The surrounding location/name context should settle this. | Medium |
| 42255 | Downloadable Content marker / `{*5다운로드 콘텐츠}` | Preserve the marker ID and verify the localized payload against the intended DLC display label. | Korean retains `{*5}` and localizes its visible label. Japanese uses the generic `items` payload, while English/Chinese name downloadable content; the label difference is locale-specific, not a marker-ID change. | Medium |
| 42257 | quickling / `퀵링` | Confirm whether Quickling is a species/name and standardize its Korean form. | Korean retains the command to rest and the speaker's intent to study the creature; the proper-term status is unresolved. | Medium |
| 42258 | Pitcairn Island / `핏케언섬` | Confirm whether the setting references the singular island or the Pitcairn Islands. | English/Chinese say singular Island, while Japanese uses the plural archipelago; Korean follows the singular source. | Medium |
| 42264 | Argine; Sun Camp; Travelers / `아르진`, `태양 야영지`, `여행자` | Confirm Argine's canonical spelling and whether `Travelers` is a formal faction in this sentence. | Korean retains her founder/leader role and hard-as-cold-iron characterization. The faction status and spellings remain terminology candidates. | Medium |
| 42265 | devotion / `추종자` | Preserve the idea of gaining devotion/loyalty rather than replacing the abstraction with the people who follow him. | English lists power, riches, and devotion; Korean uses `추종자` (“followers”), a related but more concrete object. | Medium |
| 42266 | Savant Engar / Delving Hall / `학자 엔가르`, `탐구의 전당` | Confirm whether Savant is a formal title/rank and standardize the Hall name. | Korean renders Savant generically as scholar; Japanese uses a mage rank and Chinese a learned-person title. Historical notes flag both terms. | Medium |
| 42274 | little nits / `하찮은 녀석들` | Preserve the contempt/insult strength and determine whether `nits` literally means lice or figuratively means troublesome people. | Korean uses a general dismissive phrase, while English/Japanese evoke nits/lice. The exact insult and target remain context-dependent. | Medium |
| 42279 | “They” overseeing the Midden / `그들은` | Preserve the source's unspecified overseers and the body/rot/rebirth metaphor; identify the group only from context. | Korean retains the pronoun without assigning an antecedent. The historical log explicitly asks who “they” are and flags the metaphysical claim. | Medium |
| 42287 | `We're here to serve.` / `저희가 도와드리겠습니다.` | Record the English/Korean meaning versus the Japanese farewell reading. | Korean follows English and Chinese as an offer of service; Japanese says “see you next time.” Do not treat the Japanese divergence as a Korean structural defect. | Medium |
| 42295 | Dead Kel/Akara / `그와 대등한 입장에서` | Verify Akara's pronoun/reference and preserve the claim's qualification as hearsay. | Korean follows English's `him` and retains that Dead Kel alone supposedly saw and spoke to Akara as an equal; the lore/identity question remains open. | Medium |
| 42296 | `proper language base` / `언어 기반` | Determine whether this is deliberately meta/game text, a source joke, or a technical term; avoid silently expanding it. | Korean closely follows the odd English phrase. Japanese/Chinese also retain a language-base wording; the historical audit calls out its intended meaning. | Medium |
| 42297 | Praetorians / `근위병들` | Confirm the faction/rank and standardize its Korean name. | Korean preserves the complaint about yielding to the Praetorians; the historical log explicitly flags the term. | Medium |

IDs 42251-42253, 42256, 42259-42263, 42267-42273, 42275-42278,
42280-42285, 42288-42294, and 42298-42300 generally retain the English
meaning on this first reading. Proper names, register, and recurring
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42250-42309 were checked. They
  specifically flag the DLC marker, quickling, Pitcairn Island, Argine/
  Travelers/Sun Camp, little nits, Midden overseers/rebirth, Gemstone,
  language-base meta wording, Akara, and Praetorians.
- The `{*5}` marker at 42255 and the `{1}`/loan-cost variables in the wider
  historical range were checked for identity. The current range preserves
  the marker ID and has no missing runtime variable.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42251-42300 once
  and in identical ascending order.
- Embedded line-break counts and numeric token sequences match across all
  four locales.
- ID 42255 retains one `{*5}` marker with the same marker ID/order; visible
  localized payloads vary by locale. ID 42291 preserves the 60% Burn chance
  and ingredient counts Tindertwig (3), Edelweiss (2), and Seaflax (1).
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42251-42300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42301.
