# Sequential `default` Revalidation: IDs `52250`-`52499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 67 existing ledger fingerprints; all match. Existing rows
  remain unchanged, and the other 183 IDs are added in ascending order.
- Recorded seven current correction-candidate IDs and 28 evidence-limited
  holds; 215 IDs have no current finding. These groups do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `52250` | Speech level / naturalness | `고맙네` shifts into a marked `-네` register, then the same line uses conversational `끝났을 거야`, `산더미야`, and `실례할게`. Consider `도와줘서 고마워` or another consistent conversational form. | Medium-high |
| `52337` | Naturalness | `대중은 자네가 참가하길 외쳤지만` is a stiff rendering of the public clamoring for the addressee's participation. Consider `대중은 자네를 참가시키라고 아우성쳤지만`, preserving the dismissed-rumor contrast. | High |
| `52351` | Formatting | `Witch Knight` is rendered `마녀기사` without the compound spacing used elsewhere. Consider `마녀 기사 아니라(Anira) 처치하기`; the existing English name pairing and objective meaning remain intact. | High |
| `52369` | Title / format | The exact-English duplicate group `Irion, King of Cups` has 20 IDs, including this one. `컵의 왕 이리온(Irion)` pairs only the personal name, not the title. Consider the group-consistent form `컵의 왕(King of Cups) 이리온(Irion)`; this remains a proposal, not a bulk edit. | High |
| `52425` | Naturalness | `누구나 기억하는 아주 오래전부터` is awkward for `for as long as anyone can remember`. Consider `사람들이 기억하는 한 오래전부터`, while retaining the Watchers' long-standing presence on the island. | Medium-high |
| `52464` | Naturalness | `자네가 길을 따라 거둔 성과` follows `successes along the road` too literally. Consider a contextual phrasing such as `산길에서 거둔 성과`, preserving the report of a bloody affair without implying a crossroads or bloodbath. | Medium |
| `52485` | Speech level / naturalness | `감탄했어` is conversational, but `자네를 좋게 말해 두겠네` shifts to a marked `-네` ending. Japanese is consistently conversational. Consider `스칼드(Skald)에게 자네를 좋게 말해 둘게` or another consistent informal form. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `52251` | Meaning / source conflict | English says “Eight and one by night,” Japanese reads it as 81, and Chinese as nine bushels. Preserve the cryptic Korean wording; do not guess a number or unit. |
| `52271` | Meaning | `the project of the gods` is rendered as `신들의 계획의 일부`. Japanese supports a plan reading and Chinese describes creation; the exact metaphor and relation are not settled by the row. |
| `52301` | Terminology / referent | `Grand Bursars` may name an office, a group, or a place. The Korean title is retained bilingually, but the label alone does not establish its referent. |
| `52302` | Terminology / referent | `the Crossing` may be a named place or a crossing/passage. Korean preserves the English place-name form pending stronger context. |
| `52310` | Meaning / referent | `Ossuary` can denote a bone repository or a bone vessel; Japanese and Chinese favor an urn, while Korean says `납골당`. The physical referent is not established here. |
| `52317` | Meaning | `one of your kind` may mean one mortal individual or a member of the addressee's kind. Korean preserves the species reading without enough speaker context to choose more narrowly. |
| `52318` | Terminology | `our order` may refer to a magical school, an organization, or a religious order. Keep `교단` provisional rather than inferring the institution. |
| `52323`, `52398` | Terminology / title | `Warden` may be a formal office or a generic keeper/warden. The rows do not identify the precise institution or role beyond the title. |
| `52324` | Meaning / referent | `rid us of her` is euphemistic. Korean `없애 준다면` preserves the ambiguity; whether it explicitly means killing Anira is not established. |
| `52334` | Meaning / literary form | The poem retains its stanza and line breaks, but its shifts among water, souls, the Well, pattern, harmony, and balance remain fragmentary across the locales. |
| `52346` | Terminology / lore | `Delver` may be a title or profession, and `sorrows` may be ordinary grief or a named force. The Korean keeps the image without resolving either lore term. |
| `52389` | Meaning / literary form | The opening `So simply Famor` and the poem's epithet/image remain unclear across the locales. Preserve the current five-line translation rather than inventing a smoother but unsupported reading. |
| `52403` | Meaning / terminology | Capitalized `Sorrow` may name a force or express ordinary grief; the other locales use generic sorrow wording. Keep the Korean bilingual form pending lore context. |
| `52405` | Meaning / tone | `Bloody` may be an intensifier or part of an epithet. Japanese and Chinese omit a corresponding modifier, so the intended force and whether Korean should express it remain uncertain. |
| `52416` | Meaning / referent | English and Chinese say `theater`; Japanese says `altar`. Korean follows English, but the location/device identity cannot be settled from this line. |
| `52423` | Meaning / structure | The English journal text ends in an incomplete conditional. Korean preserves uncertainty about following the instructions; the intended continuation is absent. The existing ledger disposition is retained. |
| `52430` | Terminology / title | `Master Onesimos` is rendered `명장 오네시모스`; the isolated line does not establish whether `Master` is a craft rank or a formal honorific. |
| `52432` | Terminology / format | The `{1}` control and lockpicking instructions are preserved, but the exact in-game referent of `slider` and its Korean control term are not established by the locale text. |
| `52444` | Meaning / referent | The dog-command image shifts between `she`, `he`, and a bench, and the identity of the subject keeping the speaker and militia orderly is unclear. Korean follows the English without assigning an actor. |
| `52454` | Terminology / title | `The Red Marches` may be a formal region name or a translatable frontier term. The paired Korean form is retained pending the setting's naming convention. |
| `52456` | Proper name / title | The Korean form of `Kreger the Devout` and whether `Devout` is an epithet or formal role are not settled by the row. |
| `52457` | Terminology / title | `Maid of Windemere` may name a formal Fae role rather than a generic maid. The current paired Korean title is retained. |
| `52459` | Meaning / tone | The repeated “more will rise” threat and religiously charged `salvation` are translated directly, but the intended doctrinal or taunting force is context-dependent. A prior `not-issue` ledger row is preserved; this report records the unresolved question without overwriting it. |
| `52467` | Terminology / meaning | The succession letter's institutional titles and the distinction between `wisdom` and `intelligence` need integrated terminology review. The paragraph sequence and 14 embedded line breaks are preserved. |
| `52479` | Terminology / address | `Beckoned` may be a formal title or a generic address. The locale references differ, so retain the current paired term. |
| `52483` | Meaning / referent | The promise that Angharad will meet her family “not from Dead Kel's prow” preserves a specific ship image whose implication is not established by this excerpt. |
| `52489` | Meaning / referent | English `it` refers to the material being transported in crates, but the antecedent is absent. Korean preserves the pronoun rather than guessing the substance. A prior `not-issue` ledger row is preserved; this report records the unresolved reference without overwriting it. |

## Rechecked Findings and Structure

- The 67 existing ledger rows were fingerprint-verified and left byte-for-byte
  unchanged. Their three current candidates at `52351`, `52369`, and `52464`
  remain supported; the existing hold at `52423` remains open.
- Earlier accepted corrections remain active, including the corrected
  sentence at `52352`, the Alfar-line direction at `52356`, the refusal at
  `52388`, and the approved terminology and wording changes at `52417`,
  `52422`, `52425`, `52443`, `52492`, and `52497`. The new `52425` candidate
  concerns only the separate “as long as anyone can remember” phrase.
- Two newly identified questions, at `52459` and `52489`, concern IDs whose
  earlier ledger rows say `not-issue`. The old rows remain unchanged; the
  current report records the renewed evidence-limited holds.
- Fifty-eight exact-English duplicate groups touch the range across the
  corpus, covering 59 target rows after excluding the punctuation-only
  period group. Korean wording matches within every group. The 20-row
  `Irion, King of Cups` group remains a title-format candidate.
- Five rows contain embedded line breaks: `52334` (3), `52354` (3), `52389`
  (4), `52467` (14), and `52469` (1). Each language has 25 embedded breaks
  in total, with matching per-ID counts. Runtime/display marker identities
  and order match across the range.
- Values were checked at the recipe quantities `2` and `1` in `52354`,
  `NUMPAD 5` at `52367`, `{1}` at `52372`, the loan variable at `52387`,
  and `+25%` / `65 Mana` at `52469`.
- Of 250 IDs, 203 have indexed asset associations, represented by 206
  ID-asset links across 125 assets; 47 have no indexed asset. Of the 183
  newly recorded IDs, 136 are linked and 47 are not. Asset links do not
  establish per-key speakers or playback order.

## Range Result

- This range has seven current correction-candidate IDs and 28
  evidence-limited holds; 215 IDs have no current finding.
- After adding 183 IDs, the ledger covers 55,806 of 65,135 unique
  `default` IDs (85.68%), leaving 9,329. Sequential coverage reaches
  `52499`; next is `52500`-`52749`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
