# Asset Revalidation: `2603901.quest_bxml` (`ao_sq_re_005` / Maisie's Luck)

- Date: 2026-11-11.
- Scope: all 53 `default` IDs linked to this asset. Fifty-two were new to the
  ledger; shared UI ID `60633` had already been reviewed and already listed
  this asset among its 44 links.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Eight correction candidates and one evidence-limited hold are recorded. No
  translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML contains the literal `QUEST_ID` value `ao_sq_re_005` and checks
`is_quest_active` / `get_stage`. It has no `NPC_...` symbol or
`dialog_line_*` handler. The quest-language rows concern Maisie Calhoun and
her ring, "Maisie's Luck." This supports a quest/topic association, but an
exact 8-byte key match alone does not prove that every linked ID belongs to
this quest or map an ID to a speaker, turn, or playback order. The asset
catalog currently misses this lowercase `QUEST_ID` because its extractor only
accepts uppercase quest values; the direct BXML evidence is retained here
without changing the generator. Speaker attribution remains unassigned and
dialogue order unknown.

## Correction Candidates and Hold

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `40034` | Meaning / name consistency | This row spells the ring name `메이시의 행운`, while the other occurrences in this quest use `메이지의 행운`. Standardize the established spelling and retain the named ring form, e.g. `메이지의 행운(Maisie's Luck)`. | High |
| `60384` | Naturalness | `You have that look about you. A glow.` is rendered `네게서 뭔가 빛이 나는 것 같았거든`, which reads as literal light coming from the player. Revisit the colloquial image/appearance wording while keeping the speaker's surprised tone. | Medium |
| `6411` | Objective style / name consistency | `Find the owner of "Maisie's Luck."` is phrased as the imperative `주인을 찾아라`, while the related objectives at `3065` and `12963` use concise `-기` forms. Consider `“메이지의 행운(Maisie's Luck)”의 주인 찾기`. | High |
| `14666`, `25298`, `31374`, `35631`, `49170` | Named-item formatting | These rows refer to the named ring `Maisie's Luck` without the English pairing used in nearby rows such as `3065`, `8137`, `11602`, `12963`, `15868`, and `22152`. Add the pairing consistently where the name is explicitly stated. At `49170`, the Korean `테` correctly refers to the ring's band; this candidate concerns only the omitted title pairing. | Medium-high |
| `51821` | Meaning (hold) | English `After all you've done` can refer to the player's prior actions; Japanese explicitly says `助けてくれたのに` ("even though you helped me"), and Chinese remains ambiguous. The Korean follows the Japanese reading (`날 그렇게 도와주고도 말이야`). Keep on hold until the quest-stage context resolves which reading is intended. | Unresolved |

## Repeated Text and Structure

The exact-English duplicate at IDs `4445` / `41425` (`I couldn't find it.`)
has matching Korean (`찾지 못했어.`). No other exact-English duplicate
groups occur in this set. The four-language line-break counts, runtime-token
sequences, and detected markup signatures match for every ID. No embedded
line breaks, runtime placeholders, or markup occur in these rows.

## Complete ID Set

`2613`, `3065`, `4069`, `4445`, `5115`, `5760`, `5926`, `6411`, `8137`,
`9359`, `11602`, `12963`, `13413`, `14666`, `15868`, `16621`, `17350`,
`22152`, `24221`, `25298`, `26640`, `29121`, `30413`, `31374`, `34965`,
`35343`, `35631`, `36509`, `37401`, `37541`, `38161`, `38623`, `39951`,
`40034`, `41425`, `41980`, `42619`, `43131`, `43579`, `43880`, `46042`,
`47183`, `49170`, `49712`, `51821`, `54215`, `55095`, `56802`, `58376`,
`60384`, `60633`, `61259`, and `63391`.

The 52 new four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
ID `60633` retains its existing shared-UI ledger record. These review findings
are not approval to edit the translation.
