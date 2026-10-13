# Preliminary Language Scan: `default` IDs 59651-59700

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59651-59700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59653 | The Hunter / `사냥꾼` card | Preserve the distinction between the person drawing the card and another person/event in that person's life. | Korean keeps the card's usual referent as someone or something in the subject's life and retains the danger-from-unknown-source interpretation. The English/Japanese/Chinese all support this distinction; the Fateweaver card term remains a setting glossary candidate. | High |
| 59663 | `실종된 난민들을 찾도록 도와줄 수 있었던 사람을 죽였다` | Preserve that the speaker killed someone who could have helped locate the refugees; do not infer whether the killing was intentional or accidental. | All four locales retain the speaker's responsibility for the death and the lost chance of help. Korean preserves both, while the motive/intent remains unstated. | High |
| 59670 | Comet Strike / Whirlwind / Minotaur Rush markers | Preserve all three localized special-attack labels in sequence and the distinction between base damage and damage over time. | Each locale has three `{*1...}` markers in the same order. Korean says the attacks can add damage over time to base damage; no marker/order or meaning discrepancy was found. | High |
| 59671 | Ayten / Freeman / `자유민들` | Align Freeman as a group/faction name where appropriate and retain the distinction between passing travelers and the town's other crime source. | Korean keeps both sources and the speaker's disdain. English, Japanese, and Chinese treat Freeman(s) as a named group/identity; Korean's unmarked descriptive form may read generically. | Medium |
| 59675 | ten bolgan eyes / war fires / Chernobog | Preserve the count of ten, placing the eyes on the pedestal, lighting the war fires, and drawing out the bolgan champion Chernobog. | Korean retains ten eyes, the pedestal, and Chernobog's appearance. Chinese recasts the eyes as offerings and Japanese describes lighting a lamp; the exact ritual/fire term remains open. | Medium |
| 59678 | Brother Fallon / St. Hadwyn's Mission / beads | Preserve the body location and the instruction to return the beads to the religious Mission north of town, deep in the forest. | Korean retains the overturned cart, Glendara woods, Didenhil advice, and destination. The formal Korean institution/place name remains a terminology question. | Medium |
| 59679 | duel “second” / `입회인` | Retain the role of the person accompanying/assisting a duelist, rather than interpreting `second` as second place. | English uses the duel role “second”; Japanese omits the label and Chinese reads it ordinally. Korean's `입회인` is plausible as a witness/assistant in the duel context. | Medium |
| 59683 | House of Sorrows / `슬픔의 가문` | Align the House name with other active forms without normalizing this isolated occurrence prematurely. | Korean preserves the instruction to study the House's history. The active corpus also uses `비탄의 집`, `비탄의 가문`, and other variants; prior audit entries flag the term as unresolved. | High |
| 59685 | Tirnoch the Merciful / `자비로운 티르노크` | Preserve the title, promised cleansing, and near-future certainty without treating the speaker's religious claim as objective fact. | English and Chinese name Tirnoch the Merciful; Japanese uses an honorific/descriptive form. Korean retains both the epithet and the promise that the event will happen soon. | High |
| 59690 | Fynwick / requested goods / payment | Clarify what “a few” refers to and preserve the offer of proper payment for bringing more. | English, Japanese, Chinese, and Korean leave the object implicit in this short exchange. Korean retains the initial check, approval of the amount, and promise of better payment for more. | Medium |
| 59692 | The Executioner / `처형인` | Confirm whether this is a card, skill, title, or another named label before deciding whether to retain or localize it. | The isolated capitalized English label has no disambiguating context. Korean provides a literal role/title rendering; the historical audit leaves its function open. | Medium |
| 59696 | Hierophant / `히에로판트` | Preserve the question about removing the Hierophant and verify whether the referent is a person, office, or title. | Korean follows the English proper form. Japanese translates it as a guide/leader and Chinese as a high priest, so the role is not settled by locale comparison alone. | Medium |
| 59700 | House / `우리 가문`; Saturnyn | Preserve the conditional escalation: if lasting peace for the House is impossible, at least end Saturnyn. Confirm whether House here is a faction or family. | Korean retains both conditions and the final target. English capitalizes House; supporting locales and Korean leave its exact institution/family sense open. This connects to the House question at 59607 and the faction-name consistency issue at 59683. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional terms include Metallurgy, the Hunter,
Sapling of Sorrow, the Widow, Storm Point, Coriana Anwon, Ayten, Freemen,
bolgan, Chernobog, Canneroc, Brother Fallon, St. Hadwyn's Mission, Rathir,
House of Sorrows, Tirnoch the Merciful, Fynwick, Ivan Hugues, Ventrinio,
Zefwyn, and Saturnyn.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `59650-59749`.
  Applicable questions include the Hunter card interpretation (59653),
  Sapling of Sorrow (59654), the title vendor (59662), the killed refugee
  helper (59663), Coriana Anwon (59667), special-attack names/markers
  (59670), Ayten/Freemen (59671), the ten-Bolgan-eye ritual and Chernobog
  (59675), Brother Fallon/St. Hadwyn's Mission (59678), the duel second
  (59679), Alfar Army (59682), House of Sorrows (59683), Tirnoch the
  Merciful (59685), Fynwick's goods/payment (59690), Executioner (59692),
  the Hierophant (59696), Ivan Hugues (59697), Zefwyn's locations (59698),
  and House/Saturnyn (59700). These remain open prompts, not accepted
  corrections.
- The source-keyed history records the House of Sorrows rendering as a
  corpus-wide question; the active Korean file itself contains multiple
  variants. No single form is treated as approved by this batch.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59651-59700 once
  and in identical ascending order. Each full `default` file has 65,135
  data rows with matching key order.
- Embedded newline counts match throughout the batch. The three localized
  markers at ID 59670 have matching identities and order. The ten-bolgan
  quantity at 59675 is preserved.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59651-59700 received preliminary review and working dispositions in
`disposition-batch-default-59651-59700-20261011.md`. These are not
independent final linguistic approval. Continue at `default` ID 59701.
