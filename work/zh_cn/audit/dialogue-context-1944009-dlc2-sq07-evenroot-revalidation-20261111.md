# `DLC2_SQ07` / Evenroot Caretaker Asset Revalidation

- Date: 2026-11-11.
- Scope: all 47 `default` IDs linked to `1944009.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Three correction candidates and four evidence-limited holds are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has 47 distinct localization keys and 15 serialized
`dialog_line_*` handlers, but no explicit `QUEST_ID` or `NPC_` symbol. Its
conditional quest and handler identifiers carry the `DLC2_SQ07` prefix, and
its content concerns Hermokrates, the Evenroot, its caretaker and heir, and
Njordir's Font. The handler prefix supports a quest-level link to `DLC2_SQ07`;
it does not map any localization key to a particular handler, speaker,
branch, addressee, or playback position. Individual speaker attribution and
dialogue order remain unknown.

All 47 rows were compared across English, Japanese, Chinese, and active
Korean. Formatting, line breaks, runtime placeholders, and markup were
checked. The review does not infer an individual speaker from the conditional
quest prefix.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4383` | Terminology | Lowercase `tender` means the Evenroot's caretaker, but Korean uses `돌보는 이의 후계자`; the same asset uses `관리인` for this generic role at `50247`. Reserve the established `돌보는 이(Tender)` form for the distinct capitalized House of Sorrows rank, and consider `관리인의 후계자` here. | Medium-high |
| `9606` | Terminology / naturalness | `water from the font` is rendered `원천의 물`, while the same source identifies this water source as Njordir's Font and the other rows consistently use `샘`. Japanese says 泉 and Chinese identifies the spring. Prefer `샘물`, e.g. `암포라라는 그릇을 찾아 샘물을 담아`. | Medium-high |
| `58717` | Speech level / naturalness | A single line shifts from formal `신들이여 감사합니다` to conversational `진이 빠졌어요` / `아니었죠`. Japanese uses plain style throughout. Recast the whole utterance in one register, with plain style best supported by the Japanese, without attributing it to a named speaker. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `2371` | Speech level | `I will perform the ritual` is rendered deferentially as `거행하겠습니다`, while Japanese uses plain style and Chinese does not encode the same honorific distinction. The key is not mapped to a particular speaker or choice callback; retain pending stronger scene evidence. |
| `11526`, `26614` | Meaning | `the will of the tender of the Evenroot` is rendered as `유언`. Japanese describes inheriting the deceased caretaker's `遺志`, while Chinese uses a wish/desire. English `will` can support a testament or a person's wishes. Keep the current wording pending context that distinguishes these readings. |
| `45414` | Meaning / title | The title `Will and Waters` is rendered `의지와 물`; Japanese gives `遺言と水`, while Chinese uses `意志与水`. The quest context connects the title to a deceased caretaker's wishes but does not settle whether the English uses `will` as testament or intention. Retain provisionally. |

## Complete Reviewed ID Set

The exact 47-ID membership is represented by the asset links in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and the
corresponding fingerprinted rows in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The regenerated ID catalog links each reviewed ID to this report. These
machine-readable records are authoritative for the complete set.
