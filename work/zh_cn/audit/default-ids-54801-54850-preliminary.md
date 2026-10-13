# Preliminary Language Scan: `default` IDs 54801-54850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54801-54850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54803 | `새로운 방향이, 이야기와 운명의 재작성(再作)이 필요해` | Review the Korean sentence for naturalness and preserve the claim that Amalur needs a new direction and rewritten stories/destinies. | The semantic components are present, but the topic/subject construction is awkward and the parenthetical Hanja repeats the meaning of `재작성`. English, Japanese, and Chinese all express the broader change clearly. | Medium |
| 54804 | `Sagecraft Trainer` / `마법물품 제작(Sagecraft) 훈련사` | Verify the official Korean term for Sagecraft and whether this is a skill trainer/title. | Korean explains the craft descriptively and retains the English name; Japanese and Chinese choose other craft/skill readings. The canonical skill term remains unsettled. | Medium |
| 54805 | `동쪽 해안` / destination directions | Preserve the English/Chinese eastward direction unless contextual evidence resolves the source disagreement. | English and Chinese say the rolling coastal hills are east; Japanese says west. Korean follows English and Chinese. This is a concrete source-language direction conflict. | High |
| 54808 | `슬픔의 집(House of Sorrows)이 부른다` for `The Sorrows call.` | Determine whether `The Sorrows` is the faction/House or a figurative reference to sorrow; standardize the named group. | Korean expands the phrase to House of Sorrows, consistent with recurring faction usage. English is shortened and capitalized; Japanese is figurative, while Chinese names the faction. | Medium |
| 54811 | Theater of Fates / Destiny Stone / Dellach | Confirm the formal site names and preserve that touching the Destiny Stone is intended to reveal the speaker's position in Fate. | Korean retains the objective and named stone/theater. Japanese instead calls the site a “Fate Altar”; Chinese supports a Theater of Fate. The proper location term remains provisional. | Medium |
| 54819 | `Fighter freed` / `투사 구출` | Determine whether this is a status label, completed objective, or quest action and standardize the short UI phrasing. | Korean supplies an action/result noun phrase, while the English is a terse status fragment. All locales retain the fighter/rescue concept. | Low |
| 54820 | Secandra / Arkes / Anokatos narrative | Preserve the five-paragraph causal sequence, the father/daughter relationship, the misplaced anger, the Henge magic being undone, and the final Shrine objective; verify established names and lore terms. | Korean retains the sequence and all five paragraph breaks (eight physical breaks in each locale). The relation and narrative are consistent with the English; canonical spellings remain glossary candidates. | High |
| 54829 | `그들이 너를 우리와 다른 존재로 대하는 순간` | Preserve the contrast between receiving aid for staying out of the way and being placed in a position to act on the group's behalf. | Korean retains the contrast. The English is syntactically unusual (`put you differently from us`), and the exact implication of being treated as different remains context-dependent. | Medium |
| 54830 | Magic/Melee/Ranged block values | Preserve the three lines and values: 8 Magic, 10 Melee, and 6 Ranged damage blocked. | All four locales have the same three-line structure and numeric values. Korean uses `차단`; the underlying block-stat terminology remains open. | High |
| 54837 | `$NQD_Village_Tirinsrest.m_inn_cost$` gold prompt | Preserve the runtime variable exactly and confirm whether “I'll take it” selects/accepts the inn room or another offer. | All locales retain the exact variable identity. Korean keeps the acceptance and gold label; the choice referent is not explicit in the isolated line. | Medium |
| 54841 | internal/external experiment data / Basilica Gnostra | Confirm the formal institution name and retain the processing, compilation, and forwarding sequence. | Korean preserves the sequence and proper-name form; exact institutional terminology remains a corpus-wide consistency question. | Medium |
| 54843 | `What cost the lot by sea?` / `배편으로 전부 보내면 비용이 얼마나` | Confirm the intended referent of `the lot` and whether the line asks for total sea-freight cost. | Korean interprets this as shipping all of the goods by sea. English is compressed/possibly nonstandard; Japanese reads as freight charges, while Chinese instead asks the cost for a group of people to travel by ship. | High |
| 54850 | `Memory` / `기억` | Determine whether this is a menu category, stat, or internal label and use the established UI term if player-facing. | The isolated label is translated literally; context is unavailable. This is the opening boundary of historical range `54850-54949` and is included here once. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Fateless One, Sagecraft,
Alfar, Sorrows, House of Sorrows, Dellach, Agarth, Theater of Fates,
Destiny Stone, Warsworn, Saturnyn, Secandra, Arkes, Primos, Anokatos,
Idylla, Nyxaros, Henge, Larz, Banshaen, Orison, Amphora, Tirin's Rest,
Basilica Gnostra, Earth Shrine, Red Marches, Maid of Windemere,
Shardfall, Crudok, Brownies, Detyre, and Memory.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54750-54849`.
  It calls out the Kollossae second-part label (54764) and the Secandra /
  Arkes / Anokatos narrative (54819-54820); current rows were compared
  directly across all four locale CSVs.
- ID 54850 begins the next historical range `54850-54949`; it is included
  once here as the boundary. The next active batch starts at ID 54851.
- Historical questions remain preliminary prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54801-54850 once
  and in identical ascending order.
- Physical line-break counts match throughout, including eight breaks in
  the five-paragraph narrative at ID 54820 and two breaks in the block-value
  list at ID 54830.
- `{1}` at ID 54837's runtime variable and numeric values at ID 54830 are
  preserved; no marker identity/order discrepancy was found.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

This document records a preliminary scan, not independent final approval.
Its findings were dispositioned in
[`disposition-batch-default-54801-54850-20261010.md`](disposition-batch-default-54801-54850-20261010.md):
one accepted correction, 37 `not an issue` IDs, and 12 uncertain IDs.
Continue at `default` ID 54851.
