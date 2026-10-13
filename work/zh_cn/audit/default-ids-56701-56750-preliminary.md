# Preliminary Language Scan: `default` IDs 56701-56750

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56701-56750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56704 | Warsworn / `전쟁맹세단` | Align the faction's Korean display form with the dominant corpus rendering, pending terminology decision. | English, Japanese, and Chinese identify the Warsworn heroes. Korean translates the name descriptively, while many other active rows use `워스워른(Warsworn)`; the conflict is already documented and should not be normalized row-by-row. | Medium |
| 56713 | `it` / `그걸` | Confirm what the speaker no longer expects to use and preserve the intended weary tone. | English leaves the object unstated; Japanese interprets it as the speaker's head, and Chinese instead suggests an old life/body. Korean retains a neutral pronoun and avoids choosing among these readings. | Medium |
| 56716 | job board / `일자리 게시판` | Confirm the object shown in context; retain the English/Japanese job-board reading provisionally. | English and Japanese explicitly say job board, while Chinese says workbench. Korean follows English/Japanese. | Medium |
| 56718 | Madding Wind / free storage | Verify the inn/store reference and whether “free storage” means merchants use the establishment as a stash. | All sources describe unnamed village merchants using Madding Wind as free storage and asking around to identify them. The place and storage mechanic need contextual confirmation; this is an explicit historical prompt. | Medium |
| 56722 | Hyperian / covenant with Ethene | Preserve the Hyperian at the city's center, Ethene's request to build the city and form a covenant, and the betrayal of that ideal. | Korean follows English's `itself` and “covenant” as `맹약`; Japanese shifts to what Hyperian envisioned and leaves the covenant's parties less explicit. Historical notes flag the covenant and unfinished fate line. | Medium |
| 56724 | `you shall serve yours…` / `너희의 운명을 섬기게 되리라` | Keep the fragment unfinished and do not resolve the referent or number of `yours` without context. | English is deliberately truncated/elliptical; Japanese says “fulfill your role,” while Chinese also leaves an incomplete “your...” phrase. Korean interprets `yours` as “your fate,” which may be influenced by the preceding “fateless one.” | High |
| 56725 | Cranwyns / `크랜윈 가문` | Confirm the family/group name and whether the exclamation means “never fail” or “never lose.” | English uses `fail`, Japanese says no mistakes, and Chinese says never lose. Korean follows English; the group name and boast remain historical terminology prompts. | Medium |
| 56726 | Cape Solace / `위안 곶`; Gravehal Keep / `그레이브홀 요새` | Reconcile the established Korean place-name forms without normalizing this row in isolation. | The three references agree on the route past the two locations, but Korean's translated `위안 곶` differs from the competing transliterations used elsewhere. The historical audit identifies the Cape Solace form as inconsistent; keep both names provisional. | Medium |
| 56727 | `Sworn to war!` / `전쟁에 맹세하라!` | Determine whether this is an oath, battle cry, faction motto, or the title-like phrase `Sworn to War`. | English capitalization and the short exclamation leave its function open; Japanese and Chinese phrase it as an oath to fight/war. Korean makes it a direct imperative. Historical questions already connect it to Warsworn terminology. | Medium |
| 56730 | `{1}({2})` destroy prompt | Preserve both variables and their order, and verify the Korean object particle handling in the runtime UI. | All four locales retain `{1}` followed by `{2}` in parentheses. Korean's `을(를)` accounts for variable-dependent object marking; no variable is missing or reordered. | Low |
| 56732 | Hierophant dues / `회비` | Confirm whether `dues` means membership fees, tribute, or broader obligations to the Hierophant. | English says everyone “pays their dues”; Chinese explicitly says membership fees, while Japanese describes fulfilling obligations. Korean selects the fee sense. This is a documented historical question. | Medium |
| 56734 | bolgan country / `단단히 자리 잡고 있어` | Check whether the second sentence should retain the military-entrenchment image in “digging in.” | English, Japanese, and Chinese describe the red devils as digging in/holding ground; Korean preserves their firm presence but not the explicit military image. | Medium |
| 56735 | protect the ring / `반지가 완성될 때까지` | Identify what is being completed and preserve the instruction to defend the ring until then. | English has the grammatical error `its finished`; Japanese says until the effect appears and Chinese specifies completion of the enchantment. Korean follows the literal ring-completion reading, which is possible but may obscure the intended process. | Medium |
| 56736 | Almain ancestry / `그들이 알마인의 조상이라는 이야기는 신화` | Preserve the unresolved antecedent and distinguish “they are mythical ancestors” from “their being ancestors is a myth.” | English's appositive `a myth, ancestors of the Almain` is ambiguous. Japanese describes mythical beings who are Almain ancestors; Chinese says the ancestors themselves are a myth. Korean frames the ancestry claim as a myth, selecting one reading. | High |
| 56739 | Vraekor / `브레이코르` | Align this spelling with the already documented competing Korean transliteration, without a global replacement. | The sources identify the same fire god. This row uses `브레이코르`, while another active entry records `브라에코르(Vraekor)`; the canonical Korean form remains unresolved. | Medium |
| 56743 | Vonn's ship / solitary rock / `외로운 바위` | Clarify whether the speaker means an isolated island or a literal rock and preserve the option to leave. | English and Chinese say solitary rock; Japanese specifies an island. Korean follows the rock wording, while the preceding surf/breakers and offshore ship make the geographic referent uncertain. | Medium |
| 56749 | Jottun Runelord / `조툰 룬로드` | Confirm canonical spelling and compound/title treatment. | English, Japanese, and Chinese retain a named Jottun rank/title; Korean transliterates both parts. The historical audit leaves this term open. | Medium |
| 56750 | Eldest / Great Scale / `엘더스트` / `대저울` | Confirm the named rank, Caelrod-Alarane counterpart relationship, and Great Scale location form. | All locales identify Caelrod and Alarane as counterparts and direct the player back to the Great Scale. Korean preserves the route and names; `Eldest` and `Great Scale` have unresolved variants elsewhere. This row begins the next historical question range and is included only once here. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese conversational register. Proper names and titles remain
provisional, including Allo, Warsworn, Cape Solace, Gravehal Keep, Madding
Wind, Secandra, Hyperian, Ethene, Beckoned, Cranwyns, Crilgarin, Bassawin,
Vraekor, Vonn, and Jottun Runelord.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56650-56749`.
  Relevant prompts in the active range include Madding Wind (56718),
  Hyperian's covenant and the unfinished line (56722-56724), Cranwyns and
  `Sworn to war` (56725, 56727), Star Camp dues to the Hierophant (56732),
  the Almain ancestry statement (56736), Bassawin/Vraekor (56739), and the
  Vonn/solitary-rock passage (56743), plus Jottun Runelord (56749). These
  remain prompts, not accepted corrections.
- ID 56750 is the first row of historical range `56750-56849`; it is
  included once as the final row of this active batch. No active row is
  skipped or duplicated.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56701-56750 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch.
- `{1}({2})` at 56730 is preserved in the same order in all four locales.
- The two dagger-stat lines at 56714 preserve `+3` physical damage, `+10%`
  damage, and the line break; no cross-locale numeric discrepancy was found.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56701-56750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56751.
