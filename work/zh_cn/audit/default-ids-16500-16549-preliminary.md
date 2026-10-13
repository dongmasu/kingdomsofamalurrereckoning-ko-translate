# Preliminary Language Scan: `default` IDs 16500-16549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16500-16549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16503 | “You're not one of my regulars” | Reconcile source disagreement before interpreting the relationship. | Korean follows English with `단골`; Japanese says the speaker's subordinate and Chinese says soldier. Korean is not clearly at fault, but the source difference changes the relationship. | Medium |
| 16504 | `Rathir Chapter` -> `라시르 지부` | Verify the institutional meaning of `Chapter` and standardize the Rathir name. | Korean conveys a branch/section; English and Japanese use a “chapter” term. Official faction terminology is not available here. | Low |
| 16518 | Amman / amulet curse | Preserve the condition that removing the amulet from its resting place triggers punishment. | Korean retains the curse and removal condition; the phrase `제자리에 꺼내는` is somewhat compressed. Japanese explicitly says removing it from the place where it rests; Chinese instead attributes removal to Amman. | Medium |
| 16523 | `Flawless Mitharan Divine Rivets` -> `완벽한 미타란 신성 리벳` | Verify the item's canonical quality/material terminology and consistency with Mitharu/Mitharan forms. | Korean retains the flawless quality and divine-rivet components; the full compound is a project terminology question. | Low |
| 16530 | Fae Cairns / `The Hero and the Maid` | Confirm whether Cairns is a named collection and standardize the ballad title. | Korean preserves the collection, title, delivery, and value; the relationship between “collection” and the Fae Cairns remains context-dependent. | Medium |
| 16534 | `{1} of 3 flowers bloomed` | Restore or otherwise account for the denominator `of 3`. | Korean says only `{1}송이가 피었습니다`; English, Japanese, and Chinese all retain the total of three flowers. The `{1}` runtime variable itself is intact. | High |
| 16535 | Mitharu / memory-stone lore | Preserve the contrast between permanent Fae memories and the narrator's confessions, along with all line breaks. | Korean retains the key contrast and the closing description; the eight embedded line breaks match the other locales. Some English phrasing is itself fragmentary. | Medium |
| 16541 | `Augur's chief scoundrel` -> `예언자단에서 가장 악랄한 자` | Verify whether Augur is an institution and whether `chief` denotes rank or is merely emphatic. | Korean identifies Augur as a group and renders the accusation as “most wicked”; the English allows a “chief scoundrel” reading. | Low |
| 16543 | reagent / recipe UI markers | Align the established Korean terms for reagents and recipes. | Korean localizes both marker labels and preserves `{*1...}` wrappers and `{LINE_SPACE}`. Japanese uses generic materials for reagents, while English/Chinese use reagent-specific wording. | Medium |
| 16549 | `Let me know if you find anything else` | Check the closing address/register against the speaker and surrounding dialogue. | Korean uses informal speech, consistent with English and Japanese; Chinese switches to a formal address. No Korean meaning loss is evident in isolation. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16503, 16508, 16516, 16518, 16523,
  16530, 16535, 16539-16541, 16543, and 16545 against the active four-locale
  rows. The source/name/term questions remain open; no historical note
  authorizes a translation edit.
- Cross-batch terminology candidates include Mitharu/Mithros/Mitharan, Hugues,
  Fae Cairns, Augur, Alfar, Tywili, and the Hero/Maid ballad title.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. Localized text inside the `*1` markers differs
  as expected; the wrappers and `{LINE_SPACE}` token are preserved.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16500-16549 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16550-16599.
