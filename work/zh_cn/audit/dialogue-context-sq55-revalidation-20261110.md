# SQ55 / Aergase Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 154 `default` IDs linked to `597592.quest_bxml` (`SQ55`).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. Every row was checked in all four locales.
- The active Korean CSV received only the scoped corrections listed below.
  Extracted game assets and `src/` remain unchanged.

## Grouping Evidence

The asset contains `QUEST_ID SQ55`, the asset-level NPC symbol
`NPC_DET_SEE_Aergase`, and 57 serialized `dialog_line_*` handlers. Its keys
cover the Narca curse, the Crossing, Caer Elatha, the Keepers, Pura, Maxen,
Halcyor, Florion, objectives, journal text, and UI labels.

The NPC symbol and handler count do not map individual keys to a speaker,
callback, branch, or playback position. ID `63854` explicitly identifies its
first-person speaker as Maxen; other speaker assignments and dialogue order
remain unknown. Do not infer that Aergase speaks every row or that callback
serialization order is playback order.

## Applied Corrections

The following 15 IDs were edited with the guarded CSV replacement tool and
rechecked against English, Japanese, and Chinese:

| ID(s) | Correction |
| --- | --- |
| `1675`, `44536` | Added the established English pairing for `Long Winter`. |
| `3247` | Rendered `Narca affliction` as the established `나르카(Narca)의 저주`, supported by the Japanese `curse` wording and parallel quest lines. |
| `3773`, `7030`, `38317`, `61549` | Standardized shorthand references to the same faction as `엔가드 교단(Circle of Engard)`. The full faction name appears elsewhere in this asset. |
| `7332` | Replaced `겨울 궁정` with `겨울 페이`, so `Winter cousin` is not mistaken for a relative of a court. English and Chinese say “cousin”; Japanese says “friend,” so the exact relationship remains uncertain. |
| `9959`, `33369`, `38417` | Added `Amulet of the Sun` to the established `태양의 부적` name. |
| `11992` | Expanded `Bloom` to the quest-specific `펠파이어 꽃(Fellfire Bloom)`. |
| `26306` | Corrected `Fae hollow` from `공허` to `동굴` and aligned `Keeper's Rite` with `수호자의 의식(Keeper's Rite)`. |
| `51297`, `56904` | Standardized `Font of the Crossing` as `크로싱(The Crossing)의 샘(Font of the Crossing)`; clarified the latter line's `Narca affliction` as `나르카(Narca)의 병증`. |

## Holds

| ID | Dimension | Evidence and disposition |
| --- | --- | --- |
| `7332` | Meaning | The Winter Fae term is corrected, but English/Chinese identify a cousin while Japanese says friend. Preserve the English/Chinese reading without claiming the relationship is certain. |
| `32816` | Meaning / terminology | English capitalizes `Hollow`, while Japanese says cave and Chinese says an open area. The current `할로우` may be a named location; retain it pending clearer context. |
| `49195` | Meaning / naturalness | English `necessary corruption`, Japanese “necessary destruction,” and Chinese “necessary depravity” do not settle the intended nuance. Retain `필요한 타락` pending stronger context. |

No other row showed a clearly supported translation, register, honorific, or
format defect in this pass. Speech-level consistency was not inferred across
the asset because the individual speakers are not mapped to the keys.

## Consistency and Format Checks

Ten exact-English duplicate groups occur in the asset; Korean matches within
every group:

| IDs | English |
| --- | --- |
| `46`, `8219` | `I have need of the Crossing.` |
| `5863`, `23142` | `I will not allow it. Florion, in all his wisdom, does not see what I see.` |
| `8247`, `10525` | `What do I need to do, again?` |
| `11674`, `16101` | `We Keepers routinely delve into the depths of Caer Elatha to make minute adjustments to the Crossing, ensuring its power remains under control.` |
| `18535`, `21246`, `23378` | `Halcyor` |
| `20472`, `23858`, `29729`, `31336`, `48313` | `The Crossing` |
| `26422`, `30236` | `Find the Crossing, and Halcyor will undoubtedly be nearby.` |
| `44063`, `46881`, `48491` | `Maxen` |
| `51721`, `53512` | `Pura` |
| `58658`, `62470` | `Where is Halcyor?` |

All 154 rows were checked for meaning, Korean naturalness, register where
supported, names and terminology, exact-English duplicates, runtime markers,
markup, and line breaks. No row contains an embedded line break, runtime
marker, or markup.

The complete sorted ID set is:

`46`, `1047`, `1494`, `1675`, `2259`, `2455`, `2860`, `2920`, `3247`,
`3773`, `4090`, `4181`, `4375`, `4776`, `5863`, `6492`, `6695`, `7030`,
`7269`, `7332`, `7379`, `7382`, `8219`, `8247`, `8818`, `9628`, `9660`,
`9677`, `9959`, `10109`, `10525`, `10547`, `11017`, `11072`, `11304`,
`11674`, `11918`, `11992`, `12527`, `13112`, `14225`, `14509`, `15021`,
`16092`, `16101`, `16677`, `17135`, `18114`, `18303`, `18535`, `18556`,
`19536`, `20393`, `20472`, `20952`, `21246`, `23142`, `23216`, `23367`,
`23378`, `23696`, `23858`, `25482`, `26010`, `26117`, `26164`, `26306`,
`26422`, `27886`, `27923`, `28690`, `29051`, `29320`, `29545`, `29729`,
`30168`, `30236`, `30333`, `31336`, `31853`, `32816`, `32948`, `32954`,
`33301`, `33369`, `33453`, `33857`, `34296`, `34383`, `35228`, `35530`,
`37179`, `37371`, `37722`, `38317`, `38417`, `38494`, `38827`, `39615`,
`40170`, `40475`, `41334`, `41824`, `42838`, `43385`, `43737`, `43897`,
`44063`, `44536`, `44767`, `45173`, `45739`, `46271`, `46279`, `46843`,
`46881`, `47335`, `47600`, `47779`, `47818`, `48313`, `48491`, `49195`,
`49595`, `49614`, `50093`, `50454`, `51297`, `51721`, `52124`, `52232`,
`52357`, `52782`, `53512`, `55358`, `55393`, `55530`, `55828`, `56528`,
`56787`, `56904`, `57785`, `58658`, `60903`, `61109`, `61341`, `61549`,
`61725`, `62155`, `62470`, `63056`, `63854`, `63951`, `64948`.

The review ledger records all 154 IDs and their four-language fingerprints.
No individual callback, branch, or playback position was inferred.
