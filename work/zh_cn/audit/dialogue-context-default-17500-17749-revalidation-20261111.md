# Sequential `default` Revalidation: IDs `17500`-`17749`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared by ID with English, Japanese,
  and Chinese for meaning, naturalness, terminology, register, and format.
- Sixty-five existing ledger fingerprints matched; 185 previously unrecorded
  IDs were reviewed and added.
- Two new correction candidates and six evidence-limited holds are recorded.
  Six existing candidates were rechecked and retained.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## New Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `17597` | Meaning / nuance | English `subtlety`, Japanese `巧妙さ`, and Chinese `微妙` do not support the strongly negative `교활함` (“cunning”). Consider `미묘함` or `교묘함` while preserving the range of darker aspects of nature. | Medium |
| `17745` | Meaning / reference | English repeatedly identifies Selinia with `she/her`; Korean first says `그가 서두르는 이유` and later says `그녀는`. Use `그녀가` or recast the clause without a pronoun. | High |

## Evidence-Limited Holds

These are not confirmed translation errors. Available source text does not
settle the relevant distinction.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `17542` | Meaning / nuance | `unmanned Warsworn` is interpreted differently in English, Japanese, and Chinese. The Korean reading “Warsworn who went out without troops” is plausible but not established. |
| `17547` | Meaning / terminology | `Amman's hollow of Syl` does not establish whether Syl is a place name or a descriptor, or the precise relation between the hollow and Amman's lair. |
| `17556` | Terminology | Capitalized `Undying` may name a group; Japanese and Chinese suggest undead, while Korean `불멸자` suggests immortals. The row does not settle the category. |
| `17577` | Meaning / reference | `our fate holds` and the referent of `it shall stand a thousand more` remain unclear. `운명이 우리 편이고` may add a favorable-fate reading, but context is insufficient to replace it confidently. |
| `17626` | Terminology | `St. Hadwyn's Perpetual Mission` is rendered `영구 선교원`; Japanese calls it a monastery and Chinese a preaching institution. The exact institution type is unresolved. |
| `17723` | Speech level | Korean uses polite endings while Japanese is informal. No direct per-line speaker or scene evidence settles whether this is a voice mismatch or a contextually distinct utterance. |

## Rechecked Existing Findings

- `17522`: retain the meaning/naturalness candidate. The following quest
  journal identifies “they” as Wyl's missing keys; Korean `그들이` can read
  as people. Prefer naming the keys or omitting the pronoun.
- `17598`: retain the Leechwood terminology candidate. Related entries use
  `리치우드(Leechwood)`, while this row says `거머리나무`.
- `17650`: retain the shared-source naturalness candidate with `3178`. The
  shared two-sentence passage should match; the following clauses have
  different subjects and should remain distinct.
- `17657`: retain the naturalness candidate. `명장들 중 한 명 이상` is
  redundantly plural; consider `명장 중 한 명 이상`.
- `17685`: retain the faction-name terminology/pairing candidate for
  `Belen's Testament` / `the Testament`.
- `17749`: retain the name-consistency candidate for `Horace`; the related
  duplicate at `22719` is text-identical, while the spelling differs from
  other active occurrences.

## Cleared Preliminary Questions

- `17511`: current `할로우랜드(Hollowlands)` and `모투스 광업(Motus Mining)`
  match established active usage; the preliminary spelling concern is cleared.
- `17515`: the active text is `비탄의 힘(Sorrows)`, supported by Japanese
  `嘆きの力` and Chinese `悲伤之力`; the earlier “House” interpretation does
  not apply.
- `17558`: `체력 5를 흡수할 확률 +3%` preserves both the amount and chance;
  no actionable ambiguity remains.
- `17563`: Korean section order and layout markers match English and
  Japanese. Chinese alone contains an extra `{LINE_LEFT}` before the Shards
  heading; this is recorded as a source difference, not a Korean defect.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in English, Japanese, Chinese,
  and active Korean.
- Sixty exact-English duplicate groups touch this range (859 corpus rows);
  all 60 groups have identical Korean text. This includes the repeated
  labels and dialogue lines in the range.
- Logical line-break counts total 48 in each language across the range, in
  six strings. The long narrative at `17542` has 32 breaks in each language.
- At `17563`, the Chinese-only extra layout marker is documented above.
  Localized payloads and wrapper positions at `17563` and `17662` were
  checked without treating translated labels as structural mismatches.
- Of the 185 new ledger IDs, 126 have indexed quest-asset links and 59 do
  not. Asset links do not establish an individual speaker or playback order;
  unsupported attributions remain unassigned/unknown.

The ledger now contains 30,139 of 65,135 IDs (46.27%), leaving 34,996
unreviewed. The next sequential range is `17750`-`17999`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
