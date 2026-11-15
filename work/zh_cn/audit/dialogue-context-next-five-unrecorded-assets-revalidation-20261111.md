# Five Previously Unrecorded Asset Revalidations

- Date: 2026-11-11.
- Scope: all 385 unique `default` IDs linked to five previously unrecorded
  assets. All 385 were new to the review ledger.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Six correction candidates and three evidence-limited holds were recorded.
  No translation CSV or extracted game asset was changed.

## Asset Evidence and Limits

| Asset | Quest/topic evidence | NPC evidence | IDs |
| --- | --- | --- | ---: |
| `1944003.quest_bxml` | 30 handlers with a `DLC2_SQ04` prefix; no explicit `QUEST_ID` | none | 76 |
| `1646483.quest_bxml` | 31 handlers with an `FFQ83` prefix; no explicit `QUEST_ID` | `NPC_ADE_GNO_AudernReis`, `NPC_ADE_GNO_CleasNerenne` | 77 |
| `2023654.quest_bxml` | 24 handlers with a `DLC1_PH07a` prefix; no explicit `QUEST_ID` | `DLC1_NPC_GAL_GNO_PadrigDower`, `DLC1_NPC_GAL_LJO_ZefwynLan` | 77 |
| `590984.quest_bxml` | 30 handlers with an `SQ52` prefix; no explicit `QUEST_ID` | none | 77 |
| `589931.quest_bxml` | 45 handlers with an `MQ17` prefix; no explicit `QUEST_ID` | none | 78 |

The handler prefixes support candidate quest/topic grouping only. Exact-key
asset membership does not map a localization key to a handler, speaker,
branch, or playback position. Rows in multi-NPC assets remain unassigned
unless the text itself provides direct evidence. The complete ID-to-asset
associations and per-ID review records are in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `21829` | Naturalness | `옳은 일을 하고 싶다면... 분명 옳은 일은 있으니` repeats the same wording awkwardly. Consider `옳은 일을 하고 싶다면, 나중에 나를 찾아와. 옳은 일은 분명 있으니까.` | High |
| `55202` | Grammar / format | `학자 네렌(Scholar Nerenne)가` attaches the subject particle after the English parenthetical. Change only the particle placement, e.g. `학자 네렌(Scholar Nerenne)이 언어학에 관여했다는 건 알아.` | High |
| `63389` | Naturalness / consistency | `dog-face` is translated as `개얼굴아`; the same English insult at `13922` is `개대가리`. Consider aligning the wording. This is a lexical consistency observation, not proof of a shared speaker. | Medium-high |
| `38174` | English pairing | `Little Fate-Weaver` is rendered `꼬마 페이트위버` without an English pairing, while the same term at `5159` is paired as `페이트위버(Fateweaver)`. Consider `꼬마 페이트위버(Fate-Weaver)`. | High |
| `42450` | Terminology / format | The material list omits or inconsistently cases the English names: `비치스톤 세 묶음, 곰가죽 두 묶음, 바다강철(seasteel) 세 묶음`. The corresponding labels at `17470`, `63981`, and `57282` support consistent names and parentheticals. Consider `비치스톤(Beachstone) 세 묶음, 곰가죽(Bearhide) 두 묶음, 바다강철(Seasteel) 세 묶음.` | High |
| `63981` | English pairing | `Bundles of Bearhide` is translated `곰 가죽 꾸러미`, unlike the paired material labels for Beachstone and Seasteel in the same asset. Consider `곰가죽(Bearhide) 꾸러미` or align with the item's established label. | Medium-high |

## Evidence-Limited Holds

| ID | Question | Evidence and disposition |
| --- | --- | --- |
| `44576` | Location direction | English and Chinese say Zefwyn's camp is north of Cape Solace, while Japanese says west. Korean follows English. Preserve the current Korean pending source or in-game location evidence; do not silently choose a direction. |
| `61940` | Meaning | English says the Dverga kept crates in their “fastings”; Japanese and Chinese refer to passages, while Korean says `저장고`. The English term is unclear and may be a source typo. Retain pending stronger evidence. |
| `54647` | Encoded language | English `Ziv dv wlmv bvg?` is Atbash for “Are we done yet?”, and Korean gives that decoded meaning. Other encoded experiment lines are retained as code or rendered as pseudo-language in the other locales. Keep this row on hold until the intended language-test behavior is established. |

Other ciphered or constructed-language prompts in the language experiment
were retained rather than treated as ordinary prose. The sources do not
support normalizing those strings by guesswork.

## Repeated Sources and Structure

The batch contains 20 exact-English duplicate groups spanning 54 rows. Korean
translations match within every group; no exact-source Korean divergence was
found. The four-language line-break, runtime-token, and markup checks found
no mismatches across the 385 IDs.

The complete set of 385 IDs has current four-language fingerprints and
per-dimension dispositions in the review ledger. Findings are review
proposals, not approval to edit translations.
