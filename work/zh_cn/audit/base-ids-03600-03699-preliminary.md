# Preliminary Language Scan: `base` IDs 3600-3699

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3600-3699.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for disputed names and terminology and reconciled
  historical `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3602 | [PARENT] 화염 부적 | Determine whether `[PARENT]` is internal asset metadata that should remain visible. | English/Japanese and most sibling locales preserve the marker, while Chinese localizes it as a kinship term. The Korean follows the majority but the player-facing purpose is unresolved. | Medium |
| 3608 | 징 박힌 가죽 뒤축 | Confirm whether `Heel` is footwear or a crafting component. | English/Japanese retain `Heel`; Chinese, French, Italian, and Russian describe footwear. Korean `뒤축` risks naming only the shoe's rear part. This repeats the corpus-wide `Heel` ambiguity. | Medium |
| 3612 | 혼미의 보석 | Verify the intended effect and retain the source spelling issue in the audit. | English has the apparent typo `Stupefication`; Japanese suggests anesthesia, Chinese incapacitation, and other locales range from astonishment to stupor. Korean `혼미` is plausible but the gameplay effect is not confirmed. | Medium |
| 3614 | 화이트 팜(White Palm)단 두건 | Confirm whether `White Palm` is a named faction and use its established Korean display form. | Japanese explicitly calls it a group hood; other locales vary between “White Hand/Palm” translations and literal names. Korean marks it as a group, consistent with Japanese, but the canonical faction form is unresolved. | Medium |
| 3618 | 방랑하는 샘의 물 | Determine whether this names water from a place or a potion/drink. | English uses `Draught`, Japanese and Russian explicitly say water, and Chinese says spring water; German/Spanish/French/Italian preserve a potion/drink reading. Korean follows the Japanese/Chinese evidence without resolving the item category. | Medium |
| 3623 | 잿빛 서리 막대 | Confirm the physical form and Korean crafting term for `Dowel`. | English/Japanese transliterate the component; Chinese says a frost tenon, while European locales describe a peg, rod, or dowel. Korean `막대` is broad and may obscure its component shape. | Medium |
| 3635 | 약제사의 비할 데 없는 반지들 | Confirm whether `Rings` is plural or one named item. | English and most sibling locales are plural; Japanese leaves English untranslated, while Chinese/Italian use singular. Korean preserves the English plural pending inventory context. | Medium |
| 3644 | 버렌(Burren) 만 | Resolve whether `Burren Cove` is a bay/cove or a cave. | English, Chinese, Spanish, and Italian indicate a cove/bay; Japanese and Russian say cave, and German is also cave-like. Korean chooses the cove reading but retains the unresolved source/reference conflict. | High |
| 3665 | 성스러운 문서 | Determine whether `Tract` is a religious text, land/region, or another named object. | English permits multiple senses; Japanese reads a sacred covenant, Chinese a sacred tract/area, and most other locales a treatise/text. Korean selects a document reading without in-game context. | Medium |
| 3670 | 하급 추적자의 물약 | Confirm the potion's function and rank. | English describes a tracker potion, Chinese suggests a tracking/attraction effect, and Japanese instead calls it a small explorer's map. Korean follows the English object and `Minor` tier; the game mechanic remains unclear. | High |
| 3671 | 상급 혼돈 다재다능 | Confirm the `Greater` tier and the intended skill/effect sense of `Versatility`. | English/Chinese indicate a greater rank, while Japanese and Russian use a medium tier. Locales also vary between versatility, agility, and a Chaos potion; the Korean wording follows English but is abstract. | Medium |
| 3673 | DLC2 개발용 원초 지팡이 | Determine whether the explicit developer label should be translated or kept as recognizable internal text. | English, Japanese, German, Italian, and Russian retain `DLC2 DEV`; Korean expands `DEV` to “개발용,” while Spanish also localizes the label. This is a content/display decision, not a row-local correction. | Medium |
| 3677 | 운명의 줄기 | Resolve whether `Stem` is a plant part, source/root, or lore-specific name. | English is ambiguous; Japanese transliterates it, while Chinese and European locales generally use “stem/stalk.” Korean translates literally but the intended object is unknown. | Medium |
| 3679 | 미사루(Mitharu)의 성상 | Confirm whether `Icon` is a religious icon or an image/portrait. | English may denote a sacred icon; Japanese leaves English untranslated, Chinese says portrait, and sibling locales split between icon and image. Korean's `성상` commits to the religious-object sense. | Medium |
| 3684 | 오스가르 크라스트(Osgar Krast)의 칼 | Confirm whether the item is a blade, dagger, or sword. | English says `Blade`, Japanese specifies dagger, Chinese/Spanish say sword, and other locales use generic blade. Korean's generic `칼` avoids overcommitting but item type remains open. | Medium |
| 3691 | 시어스토크(Searstalk) | Decide whether this is a named ingredient or a translatable plant compound. | English/Japanese preserve a name-like form; Chinese, Spanish, Italian, and Russian interpret it as a fire/burning plant. Korean preserves traceability but not the plant meaning. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 3602, 3605, 3608, 3612, 3614,
  3618, 3623, 3629, 3632, 3635, 3640, 3644, 3652, 3654, 3658, 3661,
  3663-3665, 3670-3673, 3677, 3679, 3684, 3687, 3691, and 3696. The relevant
  asset-label, name, component, category, source-spelling, and rank questions
  remain open and are retained above or in the historical inventory.
- Same-numbered historical `default` findings were kept separate from these
  `base` item/location rows.

## Other Checks

- ID 3640 `Scion's Amulet` uses `후계자`, while other active uses of `Scion`
  include the transliterated `사이온` and `계승자`; keep this as a corpus-wide
  role/name consistency issue.
- ID 3693's `시련의 전당` follows English `Halls`; Japanese describes a
  shrine, so the location type remains a lower-confidence question.
- The remaining inspected labels retain their principal English meaning.
  No row keys, ordering, or multiplicity were changed.

## Batch Status

IDs 3600-3699 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
