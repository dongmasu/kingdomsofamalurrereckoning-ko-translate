# Preliminary Language Scan: `default` IDs 44451-44500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44451-44500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44459 | `"We are betrayed."` / `\"우리는 배신당했다.\"` | Remove or otherwise resolve the literal backslashes if they are not intentional display text; keep the quoted message and its wording. | The parsed Korean field contains U+005C backslashes immediately before both quote marks. English, Japanese, and Chinese have no such escapes. This appears as visible backslashes in the CSV text, not CSV quoting syntax. | High |
| 44465 | proto-Wells / `원형 샘` | Confirm whether `Wells` is the formal name of magical structures and standardize `proto-Well`. | English capitalizes `Wells` and describes Professor Hugues' experimental facilities. Korean's generic `샘` may lose a named-lore sense; historical notes leave this open. | Medium |
| 44466 | “Old Ost” / `늙은 오스트` | Confirm whether `Old` is an epithet/name or an age description. | English capitalizes `Old Ost`; Japanese and Chinese also include “old,” while the exact naming convention remains uncertain. | Medium |
| 44469 | Cayman Islands / `케이맨 제도` | Verify whether this real-world place name is intentionally present in the fantasy setting or is a source/reference anomaly. | All locales identify the Cayman Islands; historical audit explicitly flags the apparent setting anomaly. Korean faithfully preserves the source without resolving it. | High |
| 44470 | Notice of Duty / `복무 통지서` | Confirm whether this is a conscription order, assignment notice, or another formal document. | Korean's service notice is plausible; the exact legal/gameplay function is not established by the label alone. | Medium |
| 44471 | “Play a round, topsider.” / `한 판 하지, 지상 사람.` | Confirm what activity “a round” refers to and the intended social meaning of `topsider`. | Korean preserves the invitation and above-ground address; the activity is unspecified, and the term may be a setting-specific group label. | Medium |
| 44473 | `{1}, {2} Trainer` / `{1}, {2} 훈련 교관` | Confirm the variable order and whether the localized UI label should be `훈련 교관`. | All four locales preserve `{1}` then `{2}`. Korean keeps both variable identities/order and translates `Trainer`; exact label semantics remain open. | Low |
| 44476 | “currish stakes” / `저 비열한 놈들` | Recheck the malformed/unclear phrase and what is being paraded through Sun Camp; do not treat the current referent as confirmed. | English's `currish stakes` is obscure and may be a source error. Korean interprets it as vile people; Japanese also refers to “them,” but context is needed. | High |
| 44477 | Tinehil / hollow / `타인힐`; `페이의 골짜기` | Confirm the location and whether `hollow` is a named Fae site rather than a generic valley. | English says the person is in Tinehil, a hollow somewhere in the Midden. Korean preserves uncertainty but uses `골짜기`; historical notes flag the site type. | Medium |
| 44486, 44498 | Hierophant / `히에로판트` | Standardize the formal title with Korean occurrences rendered as `대사제` and confirm the den-specific label. | English uses the same capitalized title. Korean alternates transliteration and a translated title across nearby records; Japanese/Chinese also differ in interpretation. | Medium |
| 44495 | “we are a private people” / `외부인의 간섭을 꺼리는 민족` | Confirm whether `private` means reclusive/privacy-valuing rather than secretive or private property. | Korean gives a natural group-level interpretation and preserves the request to leave their dead where they lie; the exact cultural nuance is contextual. | Low |
| 44497 | St. Eadric's / `성 에드릭 교회` | Confirm whether this denotes a church, religious order, or institution before settling the Korean category noun. | English uses a possessive institution name without naming its type. Japanese refers to what St. Eadric offers, and the historical audit explicitly cautions against assuming “church.” | Medium |

IDs 44451-44458, 44460-44464, 44467-44468, 44472-44475,
44478-44485, 44487-44494, 44496, and 44499-44500 generally retain the
English meaning on this first reading. Names, institutional terms, and
source-context questions remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 44450-44549 was checked for
  the Widow/Canneroc, Cydan, Crownhold, Aloren, Selni/Lower Tunnels, Sveri,
  proto-Wells/Hugues, Cayman Islands, Notice of Duty, topsider, Trainer
  variables, Primos, `currish stakes`, Tinehil/Hollow, Sun Camp, Tome of
  Synthesis, Unbound Path, St. Eadric's, Hierophant, and related setting
  names.
- The historical log explicitly leaves the Cayman Islands, Notice of Duty,
  “play a round,” trainer fields, `currish stakes`, Hollow, and St. Eadric's
  institution type open. These remain unresolved candidates.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44451-44500 once
  and in identical ascending order.
- No embedded line breaks or hidden Unicode formatting characters were
  found.
- ID 44473 retains `{1}` then `{2}` in all four locales. The +30% Ranged
  Attack Damage value at 44484 is preserved.
- The literal U+005C backslashes in Korean ID 44459 are recorded as a text
  formatting concern; the CSV was not edited.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44451-44500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44501.
