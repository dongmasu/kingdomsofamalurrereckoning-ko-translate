# Preliminary Language Scan: `default` IDs 51801-51850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 51801-51850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 51801 | `리리아(Lyria)의 시종` for “Lyria Acolyte” | Confirm whether `Acolyte` is a religious rank, attendant, or quest/UI label. | Korean renders the name and uses `시종`; Japanese transliterates “acolyte,” while Chinese uses a disciple/novice term. The exact role is not established by this isolated label. | Medium |
| 51802 | Scholia Arcana initiation sentence | Check the truncated Japanese reference against the complete English before deciding Korean wording. | English and Chinese express finding a man at the location first; the Japanese row ends mid-sentence (`な`). Korean follows the complete English meaning. | Medium |
| 51803 | Long debug/page-layout test string | Reconcile control-marker differences and the earlier historical audit's “no mismatch” statement. | Korean and English have the same control-marker identity/order. Japanese omits `*2` around “you”; Chinese lacks the opening `LINE_LEFT` and places `*1` before `*3`, unlike English/Japanese/Korean. Physical line-break counts match. The historical range note claims no control-token mismatch over 51550-51849, which conflicts with this direct comparison and should be rechecked; no source or locale file was changed. The English test string itself contains typos (“The do not”, “hiqh”). | High |
| 51806 | Child of the Dust / Cycle / Deep Slumber | Confirm established Korean rendering and capitalization for these lore terms. | Korean retains all three named concepts with English in parentheses. Japanese renders Cycle and Deep Slumber with quoted ceremonial terms; Chinese uses “大轮回” and “沉睡之人.” | Medium |
| 51809 | Cape Solace | Reconcile the place name against the established corpus form. | English and Japanese identify Cape Solace; Korean preserves the name bilingually. Chinese renders a phrase meaning “comfort cloak,” a clear supporting-source divergence, not a reason to alter Korean. | High |
| 51821 | “After all you've done” / `네가 그렇게 해 놓고도` | Clarify whether this is an accusation about prior actions or a rebuke despite the player's help. | Korean tracks the English accusation. Japanese instead says “even though you helped me,” and Chinese is also ambiguous. Use English as the semantic anchor but verify scene context. | Medium |
| 51824 | `Confident` / `자신감` | Confirm whether the label is an adjective/personality trait or a stat/category noun. | English is an adjective; Korean uses the noun `자신감`. UI context is needed to decide whether this is natural or a category label. | Medium |
| 51825 | Chaos-weapon salvage tutorial | Preserve both localized `{*1}` labels, the `{1}` button placeholder, and the blank-line layout; note the source typo. | Korean localizes both visible marker labels and retains their order, the button placeholder, and two physical line breaks. English has the typo “hiqh quality”; Korean correctly conveys high quality. Chinese leaves the two visible marker labels in English. | High |
| 51830 | `더 잘 활용했을 거야` for “would make more of it” | Confirm the referent of “it” and whether “make more of it” means use it to greater effect. | Korean and Japanese both interpret the fragment as making better use of an implied item; the English row alone does not identify that referent. | Medium |
| 51839 | “the royal prince of the Dverga” / `드베르가의 왕자` | Confirm the intended title and canonical Dverga/Kaleva forms. | Korean preserves the prince and Dverga relationship but not the source's “royal” modifier. Japanese also uses simply “Prince,” while Chinese uses “heir apparent.” | Medium |
| 51840 | `Praetorians` / `프레토리안 근위대` | Confirm whether this refers to a named military order, guards, or a generic rank. | English uses the plural Latin title; Japanese translates it as legionaries and Chinese as imperial guards. Korean transliterates the title and adds “guards,” so the institution/role needs context. | Medium |
| 51842 | `네가 내 생각을 이해해 주길 바랐어` for “see things my way” | Check whether the intended meaning is agreement, not merely understanding. | English idiom usually asks the listener to adopt the speaker's view. Korean says the speaker hoped to be understood; Japanese and Chinese likewise lean toward seeing/understanding the speaker's perspective. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Recurring terms and bilingual-name consistency remain open,
including Lyria, Scholia Arcana, Freeman, Cape Solace, Bitter Cove, Tuatha,
Ljosalfar, Alfar, Hessen Bay, Enconeg Holn, Ettinmere, Kollossae, Archsage,
Indarian, Dverga, Kaleva, Praetorians, Travelers, Favian Tyrn, Dareios, and
Faer Gorta. Existing Korean forms were preserved.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 51550-51849 flags the debug
  string at 51803 and says no source line-break or control-token identity/
  order mismatches were found. This batch confirms line-break parity but
  found marker differences in the Japanese and Chinese references at 51803;
  the historical assertion needs a targeted recheck. Korean matches the
  English marker sequence.
- The same historical entry groups 51825 with localized marker-label
  examples. Korean's visible labels are localized; Chinese retains English
  label text. Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 51801-51850 once
  and in identical ascending order.
- Physical line-break counts match throughout this range. At 51803 the
  Korean marker identity/order matches English; Japanese omits `*2`, while
  Chinese omits the opening `LINE_LEFT` and swaps the `*1`/`*3` order.
  No hidden format/control characters were detected.
- ID 51825 preserves the `{*1}` marker order, `{1}` placeholder, and
  blank-line-separated layout. No quantities are present in this range.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 51801-51850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 51851.
