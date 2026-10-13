# Preliminary Language Scan: `default` IDs 59001-59050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59001-59050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59005 | Hero and the Maid / Maid of Windemere / `영웅과 처녀` | Confirm whether “Maid” is the established person/title rather than “maiden,” and keep the tale title consistent with the named Maid. | English calls the figure the Maid and names the tale “The Hero and the Maid”; Japanese uses a heroine-like title and Chinese a young woman. Korean uses `처녀` for both, which is plausible but may narrow the title's role or age. | Medium |
| 59008 | Brother Delf / bandit kin / St. Odwig's Mission | Preserve that Delf is to be killed for a crime against his bandit kin, and that his criminally acquired treasure becomes available afterward. | All references retain the agreed killing, treasure, and location. Korean's `배신한 죄` makes the crime specifically betrayal, supported by the context but more explicit than the English wording. | Medium |
| 59010 | “His mind” holds the secret / `그의 정신은 ... 비밀을 품고 있어` | Clarify whether the secret is in the person's thoughts/mind, knowledge, or some discoverable mental content; avoid treating it as a physical object without context. | English is deliberately ambiguous. Chinese takes the person as dangerous but as holding the method; Japanese says he knows the secret. Korean follows the literal mind reading and then refers to “that secret.” Historical question remains open. | High |
| 59011 | Aodh / Sedeas / lightning analogy | Preserve the analogy that the place is to lightning as Aodh is to fire and Sedeas to ice; verify names and whether they are elemental embodiments. | Korean makes the implicit relation explicit as “symbols,” which is a plausible reading. All locales retain the three-part comparison; names remain provisional. | Medium |
| 59012 | Agni's books / `장부` | Determine whether “books” means accounting ledgers or books/records generally. | Japanese and Korean read the material as financial ledgers, while the English and Chinese wording is broader. The surrounding match/troll context does not conclusively settle the document type. | Medium |
| 59014, 59015, 59044 | Cann-Rane, Anru Besin, Pedeoras / selective English parentheses | Track name spelling and bilingual annotation without applying a global format change. | Korean adds English parentheticals to Cann-Rane and Pedeoras but not Anru Besin; this matches the corpus-wide unresolved display convention rather than proving any individual form wrong. | Medium |
| 59021 | Death's Cryptic Hand / `죽음의 수수께끼 손` | Verify whether this is a named item/ability and whether a more natural Korean genitive construction is needed. | English and Chinese treat it as a title-like name; Korean preserves the components but the current phrase may read awkwardly as “death's riddle hand.” No correction is applied pending item context. | Medium |
| 59022 | Castellan / Oathblade / Heart of Sibun / Tala-Rane | Confirm title forms and the exact pass/Wolds geography; preserve the order of dispatch, meeting, and location details. | All four retain the vault, stolen Heart, advance party, and southern location. Korean translates Castellan and Oathblade as roles/titles; their capitalization and established Korean forms remain open. | Medium |
| 59032 | Balor / claws / dodging localized markers | Preserve all three localized marker identities and their Balor → claws → dodging order. | All four locales retain three `{*1...}` markers in the same order, with correctly localized payloads. No token loss or reordering was found. | High |
| 59038 | “collective spine” / `결속력` | Preserve the claim that the warriors lack shared resolve or cohesion as a group, not individual strength. | English, Japanese, Chinese, and Korean contrast capable warriors with a group lacking unity/reason to fight. Korean's `결속력` is a natural contextual rendering of the metaphor. | Medium |
| 59047 | Potential, Realized / `실현된 잠재력` | Determine whether this is a skill, achievement, or other UI title and align title capitalization/word order. | English capitalizes both words; Japanese and Chinese use title-like forms, while Korean gives a natural phrase. Historical audit leaves the label type open. | Medium |
| 59050 | Madding Wind / Agarth / release task | Confirm the place-name spelling and preserve the player's objective to locate and free Agarth after entering. | English, Japanese, Chinese, and Korean agree on entry, location search, and release. Proper-name display forms remain provisional. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Provisional names and terms include Crownhold,
Alabastra, House of Pride, Tuatha, Idylla, Red Idward, Brother Delf, St.
Odwig's Mission, Aodh, Sedeas, Agni, Cann-Rane, Anru Besin, Ventrinio,
Death's Cryptic Hand, Castellan, Grian Shane, Heart of Sibun, Oathblade,
Gwyn Anwy, Tala-Rane, the Wolds, Chernobog, Apule, Balor, Thelgood,
Pedeoras, and Madding Wind.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `58950-59049`.
  Applicable prompts include the Hero and Maid synopsis (59005), Red
  Idward/Brother Delf/St. Odwig's Mission (59008), “his mind” as the secret
  to enter Alabastra (59010), the Aodh/Sedeas lightning analogy (59011),
  Agni's books (59012), Death's Cryptic Hand (59021), Castellan/Oathblade/
  Heart of Sibun and the southern Tala-Rane pass (59022), the Rathir poem
  (59024), the free-bird metaphor and Apule's offer (59029-59030), Balor
  marker labels (59032), the “collective spine” metaphor (59038), and
  Potential, Realized (59047). These remain open prompts, not accepted
  corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59001-59050 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Embedded newline counts match throughout the batch. At 59032 the three
  localized markers retain their order and identity; no numeric-value
  discrepancy was found.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59001-59050 received a subsequent working disposition pass documented
in [`disposition-batch-default-59001-59050-20261011.md`](disposition-batch-default-59001-59050-20261011.md):
12 items remain uncertain, 38 were dispositioned as not an issue, and no
CSV correction was accepted. The preliminary findings above remain evidence
notes, not independent final linguistic approval. Continue at `default`
ID 59051.
