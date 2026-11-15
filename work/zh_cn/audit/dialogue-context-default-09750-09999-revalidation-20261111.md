# Sequential `default` Revalidation: IDs `9750`-`9999`

- Date: 2026-11-11.
- Scope: current Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-four existing ledger records have current fingerprints and retain
  their prior dispositions. All 186 previously unrecorded IDs were compared
  and recorded.
- Thirteen new IDs have correction candidates. Nine IDs have
  evidence-limited findings; the two sets do not overlap.
- Of the 186 new IDs, 130 have indexed asset links and 56 do not. Asset
  membership does not establish a particular speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9763` | Meaning / naturalness | The poem's `a mystic requiem for the fading of Esharra's other children` becomes the ungrammatical `에샤라의 다른 자식들이 저물어 감을 위한`. Consider wording such as `에샤라(Esharra)의 다른 자식들이 저물어 가는 모습을 애도하는 신비로운 진혼곡`, preserving the five-line stanza, forest-body image, and natural-chaos imagery. | High |
| `9774` | Name pairing | The standalone event label `Sully's Rebellion` is rendered `설리의 반란` without its English title. Consider `설리의 반란(Sully's Rebellion)`. Other source rows identify Tynan Sully, but do not expand or globally alter this title from the event label alone. | High |
| `9828` | Name/title pairing | The source names `St. Eadric's Mission`. The confirmed glossary form is `성 이드릭 선교원(St. Eadric's Mission)`; the current `성 이드릭(St. Eadric) 선교원` annotates only the saint, not the complete site name. | High |
| `9839` | Formatting | The two recipe quantities are formatted inconsistently: `풍뎅이 소금(Scarab Salts) (1)` versus `하늘꽃(Sky Blossom)(1)`. Consider adding a space before the second quantity, `하늘꽃(Sky Blossom) (1)`, while retaining both reagent names, values, blank lines, and the existing three embedded CRLF breaks. | High |
| `9844` | Name pairing | `Erran Brant` is identified as a fallen member of the already-paired Alfar Army, but his personal name is unpaired. Consider `에런 브랜트(Erran Brant)` without changing the document's formal wording. | High |
| `9867` | Terminology / name pairing | This is the named dice game `Range Roll`, not a generic range roll. Other rows use `레인지 롤(Range Roll)`. Consider `레인지 롤(Range Roll)에서는 굴릴 숫자의 범위를 지정한다`, retaining the concise definition. | High |
| `9880` | Name pairing | The standalone named location `Kollosae Camp` is rendered `콜로사이 야영지` without the English source label. Consider `콜로사이 야영지(Kollosae Camp)`. | High |
| `9886` | Objective meaning / naturalness | `Deal with Nuer's Blasphemy` is rendered as `신성모독을 처리하라`; the aligned Japanese explicitly says to stop the blasphemy. Consider the established objective-style `누어(Nuer)의 신성모독을 막기`. IDs `9746` and `9886` have identical English and identical current Korean; `9746` already records the same concern, so do not diverge the duplicate translation. | High |
| `9905` | Name consistency / pairing | `Meeting with Aesa` is `아이사와의 만남`, while the same named person is `에이사 알파린(Aesa Alfarinn)` at `9847`. Consider `에이사(Aesa)와의 만남`, pairing only the source-short name and not expanding it to a surname. | High |
| `9936` | Name pairing | The dialogue addresses the named place Droser, but `드로서` is unpaired. Other rows use `드로서(Droser)`; add that source-local pairing without changing the warning or its list of calamities. | High |
| `9982` | Name pairing | The quest instruction names Thais but leaves `타이스` unpaired. The established form is `타이스(Thais)`; retain the direct instruction to report readiness for the debate. | High |
| `9988` | Meaning / naturalness | `Summer brethren` refers to the Summer Fae kin in the Japanese and Chinese references, while `내 여름 형제들` reads as literal human siblings. Consider `내 동족인 여름 페이(Summer Fae)는 자연의 성장과 발전을 보여 주지` and keep the following explanation of how easily they established the Summer Realms. Do not infer the speaker from an asset association. | Medium-high |
| `9989` | Name pairing | `Forbidden Stacks` is the named library location, but the line has only `금서고`. Consider `금서고(Forbidden Stacks)` while preserving the instruction to fight the guards and take their key. | High |

## Evidence-Limited Findings

| ID | Dimension | Reason |
| ---: | --- | --- |
| `9777` | Meaning / title | `Castellan` is rendered `성주`, matching the Japanese and Chinese wording, but the isolated line does not establish whether this office means a castle lord, governor, or custodian. Retain the current translation pending role context. |
| `9792` | Meaning | English says `The rest of us are scuttle in his eyes`, which appears malformed or context-dependent. Japanese also gives an unusual “buckets” reading, Chinese says “fools,” and Korean paraphrases them as insignificant. Do not guess what `scuttle` was intended to mean. |
| `9813` | Meaning / source imagery | The source calls Hecatyr both `the three-mother` (bear, wolf, and hen) and `the father of the portal`; the other languages preserve or reinterpret the unusual imagery. Keep the current source-led rendering rather than regularizing the myth. |
| `9837` | Meaning / entity type | `White Dove Supply` may be a named supply point, an organization, or supplies associated with a White Dove label. The isolated UI string and divergent locale renderings do not settle the referent. |
| `9846` | Localization status | `FAIL LINE 2` is unchanged in English, Japanese, and Korean but translated in Chinese. Its status as an intentional debug/test label or player-facing text is unknown. |
| `9876` | Meaning | `staff` could refer to attendants/personnel or a staff item. Japanese, Chinese, and Korean choose different readings; the isolated line does not resolve the referent. |
| `9893` | Localization status | `Sr. Director North America QA` remains English in English, Japanese, and Korean, while Chinese translates it. Without its display context, do not decide whether the English is intentional. |
| `9935` | Name status | Capitalized `the Isles` may be a named region or a generic archipelago. Korean `군도` is plausible, while Japanese marks the word as a label; this row alone does not resolve the distinction. |
| `9997` | Name / referent | `Freehold` may be a named settlement or a generic freehold/territory. The Korean `자유 영지` preserves the generic reading, but the isolated line is insufficient to establish a proper name. |

## Existing Dispositions

The 64 previously recorded IDs in this range were preserved. In particular,
`9757` remains a candidate from its earlier asset-context review: the Korean
`좌초된 게 틀림없지만 확신은 못 하겠어` contradicts itself, even though its
`스캐브(Scavs)` name form agrees with the confirmed glossary. The new
sequential pass does not overwrite that earlier finding.

## Duplicate and Structural Checks

- Fifty-six exact-English duplicate groups touch this range, comprising
  1,333 rows across the corpus. Their current Korean translations all match.
- Placeholder counts and order, layout-control tokens, and display-wrapper
  positions match except that Japanese reverses `{1}` / `{2}` at `9836`;
  Korean matches English and Chinese.
- Logical line-break counts differ at `9813` (Chinese has 13; English,
  Japanese, and Korean have 14) and `9898` (Japanese has 7; English, Chinese,
  and Korean have 6). Korean follows English and Chinese in both cases.
- Seven Korean strings contain 35 existing embedded CRLF breaks:
  `9763` (4), `9778` (5), `9813` (14), `9839` (3), `9898` (6), `9919` (2),
  and `9939` (1). All were preserved.
- Existing speaker and dialogue-order values were retained. No new
  speaker-at-key or playback-order claims were inferred from asset membership.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
