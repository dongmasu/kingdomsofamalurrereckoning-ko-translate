# Preliminary Language Scan: `default` IDs 51751-51800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 51751-51800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 51753 | `샘(Font)` / `샘의 관리자(Fontmaster Nomeron)` | Confirm the project's Korean display terms for the Font and Fontmaster. | The English capitalizes Font and names its appointed administrator. Japanese calls it the `イーサの泉` and the administrator a spring manager; Chinese uses `圣泉`/`圣泉大师`. Korean preserves traceable English in parentheses, but the Korean head terms may need lore/UI consistency review. | Medium |
| 51755 | Localized labels inside `{*1...}` markers | Retain the dagger/rogue labels while preserving marker IDs and order. | English, Japanese, Chinese, and Korean all retain the two `{*1}` marker identities and order; only their visible localized labels differ. | High |
| 51760 | `구경은 그만하고 돈이나 좀 벌어 보는 건 어때?` | Consider whether the sightseeing/stowing wordplay can be retained naturally. | English repeats “sights” in “Taking in the sights” / “stowing the sights”; Korean preserves the teasing shift from sightseeing to earning money but not the repeated-word joke. Japanese also paraphrases the joke. | Medium |
| 51765 | `운명이 어떻게 뒤집힐지 몰라` for “Times are getting chancy” | Check whether this should refer more directly to uncertain/risky times rather than fate turning. | The next sentence's dicer reference supports a risk/luck wordplay. Korean makes the line thematically apt but shifts “chancy” toward fate; Chinese is awkward and Japanese instead says uncertainty is increasing. | Medium |
| 51771 | Sir Sagrell / Thresh / Gorguath ballad | Recheck the poem's compressed syntax and who/what is slain, without resolving the source's ambiguity by invention. | Korean preserves the source's 3 stanzas, 14 internal line breaks, named entities, repeated two beasts/two struggles, and closing joke. The opening “did Sir Sagrell slay” has no explicit object in English, and Korean likewise leaves the object implicit; Japanese and Chinese paraphrase it differently. | Medium |
| 51783 | `마법이 걸려 있어` / “착용자” | Confirm the implied enchanted item, likely boots, and consider naming it in Korean if context supports that. | English begins with “They are enchanted” without a noun in this row. Japanese and Chinese explicitly identify boots, while Korean leaves the object generic even though it later says “wearer.” | Medium |
| 51785 | `광산 붐` | Confirm that the town's boom is specifically a mining boom. | English says only “the boom”; Japanese identifies it as a mining boom, which supports the Korean specification. This remains a cross-locale interpretation to check against surrounding context. | Medium |
| 51787 | Kollossae guard duty / Secandra's order | Confirm the assignment nuance in “Secandra has charged all the guard.” | Korean preserves the duty to protect the Kollossae from any threat and that Secandra gave the order to the guards. The English wording is compressed; Japanese and Chinese likewise describe the guards being ordered to protect them. | Medium |
| 51798 | Bleeding-damage ability description | Preserve the two effect values and blank-line-separated layout. | Korean retains +20 Bleeding Damage and +50% Bleeding Damage, with the description and both stat lines separated by the same two line breaks as all three references. | High |

Other reviewed rows generally preserve the English meaning on this first
reading. Recurring terminology and bilingual-name consistency remain open,
including Angharad, Font/Fontmaster, Scholia Arcana, Archsage, Fae, Cape
Solace, Gallows End, Whitestone, Primos, Wreath of Absolution, Arkes, Thresh,
Gorguath, Villa, Tuatha, Kollossae, Secandra, Evenroot, Idylla, Ysa, and
the Pepper twins. Existing Korean forms were preserved.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 51550-51849. It flags
  canonical names and roles throughout this range, and specifically notes
  the technical/debug wording at ID 51803. No row in this batch changes or
  resolves that historical question.
- Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 51751-51800 once
  and in identical ascending order.
- Line-break counts, runtime-token identities/order, and hidden-format
  checks match throughout the range. ID 51755 preserves both localized
  marker IDs in order; ID 51771 preserves the poem's stanza layout; ID 51798
  preserves +20 and +50% values and its blank-line-separated stat layout.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 51751-51800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 51801.
