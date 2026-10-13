# Preliminary Language Scan: `base` IDs 3300-3399

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3300-3399.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled earlier `base` findings only, keeping same-numbered `default`
  notes separate.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3307 | 장인급 위상 보행 | Reconcile the English `Master` tier with the localized Japanese tier and the project-wide rendering of `Phasewalk`. | English and Chinese say `Master`; Japanese uses a large-tier label. The active Korean follows English for the rank, but the correct game tier and preferred skill wording still need confirmation. | Medium |
| 3309 | 아주라이트 뒤축 | Confirm whether `Heel` is a crafting component or a piece of footwear. | English and Japanese say `Heel`, while Chinese suggests shoes. This repeats the same unresolved component-versus-footwear issue at `base` IDs 718 and 742. | Medium |
| 3319 | 저거너트 각반 | Confirm the project's preferred Korean term for the specialized leg armor `Chausses`. | The English, Japanese, and Chinese identify leg armor, and `각반` is plausible; the same equipment term recurs with inconsistent Korean item labels elsewhere. | Medium |
| 3325 | 고서머 엔드(Gossamer End) | Confirm whether `Gossamer End` is a proper place/item name and align its display convention. | English and Japanese preserve the name, while Chinese translates it as “silken end.” Korean transliterates it, but the referent and canonical Korean form are not established. | Medium |
| 3344 | 사티바 길(Sativa Road)의 부적 | Resolve whether `Sativa Road` is a place name or a descriptive/material phrase. | Japanese treats it as a location; Chinese reads it as a linen road. Korean retains the place-name interpretation without in-game confirmation. | Medium |
| 3352 | 북부의 워드 | Determine whether `Ward` is the game's protective-magic term or a named place/ward. | English, Japanese, and Chinese differ between a northern protection/ward and a generic northern defense. Korean transliterates `Ward`, which may be opaque without the established gameplay term. | Medium |
| 3363-3364 | 슬롯이 있는 개발용 검 / 상자 - 테스트 - 높은 상호작용 | Confirm whether these developer/test asset labels should be visible/localized in player-facing item lists. | The English labels explicitly identify development/test content; Japanese and Chinese do likewise. Korean translates them, but whether to expose these assets is a build/content decision, not a row-local language correction. | Medium |
| 3365 | 금빛 수호자 | Determine whether `Gold Guard` names armor, a defensive effect, or a person/group. | English uses the ambiguous term `Guard`; Japanese preserves the English, while Chinese suggests a golden guardian. Korean selects a person/guardian reading without item context. | Medium |
| 3385 | 주술 직조 천 | Align `Hexweave` with the related affix at ID 377 and determine whether it is a material name or a translatable compound. | Japanese transliterates `Hexweave`; Chinese says curse-woven cloth, while the active Korean affix transliterates the same stem as `헥스위브`. The two Korean treatments are inconsistent. | Medium |
| 3396 | 대재무관들 | Confirm whether `Grand Bursars` names officials or an institution and retain the plural. | English is plural; Japanese and Chinese describe a financial office/officials. Korean `대재무관들` preserves the plural but may imply a formal rank not established elsewhere. | Low |

## Historical Audit Reconciliation

- Rechecked the historical `base` questions for IDs 3307, 3309, 3319, 3324,
  3325, 3328, 3344, 3347, 3352, 3354, 3355, 3358, 3361, 3363/3364, 3365,
  3367, 3373, 3376, 3383, 3385, 3389, 3391, 3392, 3396, 3397, and 3398.
  They remain open; applicable tier, component, place/name, test-label,
  `Hexweave`, and `Vraekor` questions are retained in this report or the
  historical inventory.
- The historical audit also has a separate `default` section for IDs
  3300-3399. Its same-numbered dialogue findings were not treated as `base`
  findings.

## Other Checks

- IDs 3312-3313, 3383, and related crafting rows use `Fulcrum` as
  `지렛목`; the component's exact function remains open.
- ID 3355 `Ordination Rites` is rendered `서임 의식`; compare it with
  religious `ordination` uses before adopting one term globally.
- IDs 3389 and 3391 follow the English `Master`/`Greater` ranks; Japanese
  instead uses large/medium potion or effect tiers.
- The remaining inspected rows preserve their principal item, location, and
  name meanings. No structure or target keys were changed.

## Batch Status

IDs 3300-3399 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
