# Preliminary Language Scan: `default` IDs 17700-17749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17700-17749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17702 | Fae Adar / Burren Cove prison | Preserve both the jail location and the separate magic cage that still must be opened. | Korean retains the gate, cell, and inner magic cage; all references agree on the two-stage rescue. | Low |
| 17705 | Alsers / Bertsa / Teers / Testament | Verify the proper names and standardize Testament as a faction name. | Korean preserves the three alternatives and insult; the draft elsewhere uses both `테스타먼트` and `베일런 결사(Testament)`. | Medium |
| 17709 | `Briar:` | Determine whether the colon introduces a letter's addressee or a UI label. | Korean turns the name into “to Briar:” while English/Japanese/Chinese present a bare name with colon; context is absent. | Medium |
| 17711 | Spellcloak | Align the class/destiny name with the game's terminology. | Korean transliterates literally as `주문망토`; English/Japanese preserve the compound form and Chinese uses a robe/mage title. | Medium |
| 17717 | Hierophant | Standardize the religious title. | Korean uses `대사제(Hierophant)`, while other reviewed rows use `대사제`; Japanese calls it a guide and Chinese a high priest. | Medium |
| 17718 | Brun the Bard / Erran Gastyr / Castle Gastyr | Preserve the paternity evidence and Brun's wish for closure without changing it to secrecy. | Korean retains the illegitimate-son claim, letter, and emotional closure. Japanese's final clause says protecting Brun's secret, differing from English/Chinese/Korean. | Medium |
| 17721 | “holds me in her closest confidence” | Preserve the speaker's privileged trust while avoiding an unsupported exact rank in her circle. | Korean says the speaker is one of her most trusted people, a reasonable interpretation of the English idiom. | Low |
| 17722 | Gardens of Ysa / Crystal War | Verify whether Gardens is a named district and standardize the War name. | Korean preserves the weak defenses and recommendation to seize the city as a fortress; names are presented bilingually. | Medium |
| 17723 | source `Weve` typo | Preserve the intended “We've” sense without modifying the English source. | Korean conveys regained checkpoint control and difficulty; the English source omits the apostrophe. | Low |
| 17724, 17731, 17736 | `U03 exit trigger` / `FAILURE LINE` / `Magic02` | Determine whether these are developer strings, diagnostic labels, or player-facing UI before localization decisions. | Korean localizes two labels and preserves one literal; Japanese/Chinese also vary, so audience/context is unresolved. | Medium |
| 17726 | `Press START to Enter` | Preserve the button cue and action. | Korean retains both, while Japanese has only `Press START`; English/Chinese include entering. | Medium |
| 17732 | “Or rather... I have” | Retain the correction from “we” to “I” without supplying missing prior context. | Korean preserves the self-correction and revenue comparison; the sentence depends on the preceding line. | Medium |
| 17735 | creating the Well / Ventrinio's means | Determine whether `the Well` is the named Well of Souls and preserve the reckless use of available means. | Korean preserves the task and disregard for consequences; it renders Well generically, while context may identify the proper name. | Medium |
| 17745 | Lunala / Ethene / Gaea / Selinia / Arcane Veil | Verify names and relationships while preserving all four lore paragraphs. | Korean keeps the moon-goddess myth, messenger Titan, Gaea separation, stolen Veil, and monthly repetition. Locale transliterations vary. | Medium |
| 17749 | Horace / retrieval despite what happened | Preserve gratitude for the retrieval and the bravery despite Horace's fate. | Korean retains both clauses and does not infer what happened to Horace. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 17705, 17709, 17711, 17722,
  17724, 17731-17732, 17735-17736, 17745, and 17748-17749 against the
  active four-locale rows. They remain preliminary questions; no historical
  note authorizes a translation edit.
- IDs 17724, 17731, and 17736 retain their source-label uncertainty rather
  than being treated as confirmed player-facing text.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 17700-17749
  in identical order.
- Embedded line-break counts match. The four-paragraph myth at 17745 retains
  all six source line breaks across the four locales.
- Marker class/order and localized title payloads at rows in this range match;
  no structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17700-17749 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 17750-17799.
