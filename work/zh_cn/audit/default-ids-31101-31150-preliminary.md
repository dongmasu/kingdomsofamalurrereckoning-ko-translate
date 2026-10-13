# Preliminary Language Scan: `default` IDs 31101-31150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31101-31150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31104, 31126 | `트렐리스` for `Trellis` | Confirm whether Trellis is a named district/place and standardize its display form. | English capitalizes it as a location; Japanese treats it descriptively as a gathering place and Chinese literally as a trellis. Korean consistently transliterates it in these rows. | Medium |
| 31110 | `몸을 돌보는 데 쓰시길` for `Use it in good health` | Check whether the line is a conventional well-wish rather than an instruction to spend the reward on healthcare. | English wishes the recipient well while using the reward. Korean can imply that the reward should be spent on personal care/health; Japanese says to use it for safety, while Chinese stays closer to the source wording. | Medium |
| 31113 | Tutorial headings inside `{*1...}` / `{*2...}` markers | Keep marker identity/order and localized heading text; confirm established Korean terms for `Wards`, `Lorestones`, and `Trainers`. | The Korean preserves all section sequence and marker wrappers. `Wards` becomes `수호 마법`; the remaining category names are rendered as `전승석` and `훈련 교관`, consistent with the draft's terminology but still subject to corpus-wide term review. | Medium |
| 31114 | `일시 정지` for `PAUSE` | Determine whether this is a player-facing localized action label or a literal keyboard key name that should remain `PAUSE`. | English and Japanese retain uppercase `PAUSE`; Chinese describes the Pause/Break key. Korean localizes it as a pause action. The row alone does not establish whether it is a key binding or menu label. | Medium |
| 31115 | `우리를 해치려는 ... 비난` for `seek to poison us ... be reviled` | Preserve the more specific “poison” image and the force of `reviled`, or confirm that context supports the broader Korean wording. | English and Chinese refer specifically to poisoning and strong condemnation; Korean generalizes this to harming and being criticized. Japanese also uses “poison” but softens the condemnation. The reference to St. Odwig's brothers remains historically unresolved as clergy versus an order. | Medium |
| 31120 | `울프 고드프리의 일기. 그의 집에 남겨져 있었다.` for `Found left behind in her house` | Resolve the source's gender/reference mismatch without silently changing `her` to a male owner. | The first sentence identifies Wulf Godfrey as Skald's apprentice, then the English says the diary was left in `her house`. Korean says `그의 집`; Chinese retains “her house,” while Japanese attributes it specifically to Skald. Historical notes already flag the mismatch. | High |
| 31121 | Eight-line poem, including `숲의 샘에 깃든 처녀` for `the maiden of the forest spring` | Preserve all eight lines and review the paired images and the compressed forest/spring phrase in context. | The line count and pairwise comparisons are retained. Korean's “maiden dwelling in the forest spring” is a plausible poetic reading, but English does not explicitly say she resides there. | Medium |
| 31125 | `말돌` for `speakstone` | Confirm the established Korean item/interaction name and keep it consistent with other Speakstone references. | English names the object as a speakstone; Korean uses a localized compound rather than transliteration. The line is an imperative UI/object interaction. | Medium |
| 31138 | `실패 대사` for `FAIL LINE` | Check whether this is a developer/debug label that should remain visibly distinct from player-facing “failure dialogue.” | English and Japanese retain the uppercase label; Chinese translates it as failed dialogue and Korean follows that localized interpretation. The row gives no display-context proof. | Low |
| 31140 | `장로님` for `the Eldest` | Confirm whether capitalized `Eldest` is a named role/title and align it with other occurrences. | English capitalizes the role; Korean uses the honorific generic “elder.” Chinese uses “the elder,” while Japanese keeps the quoted title-like form. | Medium |
| 31141 | `병원 구역` for `Hospitalis Quarters` | Confirm the canonical Korean form of this named facility/location rather than treating it as a generic hospital district. | English capitalizes `Hospitalis Quarters`; the same sentence identifies it as the building housing humans and Alfar. Japanese and Chinese translate it descriptively, while the draft uses a Korean facility phrase. | Medium |
| 31145 | `날 끝까지 책임져 줄 거야` for `He'll see me through` | Check whether the idiom means continued support/help rather than taking responsibility for the speaker. | The source says Grim will see the speaker through; Japanese says he will look after him and Chinese says he will help him through. Korean's `책임져` can imply a stronger responsibility relationship. | Medium |

Rows 31101-31109, 31111-31112, 31116-31119, 31122-31131,
31132-31137, 31139, 31142-31144, and 31146-31150 generally retain the
English meaning on this first reading. Their names, register, fragments,
and lore terms remain for the integrated pass; no separate high-confidence
wording candidate was identified.

## Historical Audit Reconciliation

- The historical source-keyed entry for IDs 31100-31199 was checked against
  the current rows, including Trellis, Kollossae Skymasons, Theater of
  Andronikos, St. Odwig's brothers, Wulf/Skald, the poem, Alfar/Varani,
  and the barbed sea tortoise.
- The question about St. Odwig's “brothers” remains open: English is
  nonspecific, Japanese says followers, and Chinese says monks. The Korean
  uses `선교원의 형제들`, which should not be treated as a confirmed
  institutional identification.
- The Wulf/Skald pronoun mismatch at 31120 remains unresolved; no locale
  evidence justifies silently changing the English feminine possessive.
- Historical tutorial-marker checks were reconciled for 31113. The localized
  heading contents vary by locale, but wrapper identity and sequence remain
  intact in Korean.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31101-31150 once and in identical order.
- ID 31132 has an empty `Texto` field in all four locales; this is a shared
  blank row, not a Korean-only omission.
- Embedded line-break counts match across the four locales, including the
  eight-line poem at 31121.
- Runtime-marker identities/order match after accounting for localized
  contents inside `{*1...}` and `{*2...}` wrappers. Unicode format-character
  signatures also match.
- No numeric effect-value discrepancy was identified. The tutorial
  categories, item descriptions, and `Large increase to Mana` label retain
  their intended qualitative meaning on this pass.
- No CSV text or other source file was edited.

## Batch Status

IDs 31101-31150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31151.
