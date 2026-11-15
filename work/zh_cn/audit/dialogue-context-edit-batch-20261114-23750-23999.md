# Dialogue Context Translation Edit Batch: IDs `23750`-`23999`

- Date: 2026-11-14.
- Rechecked all 20 candidate findings in the range against current English,
  Japanese, Chinese, and Korean. English established meaning, Japanese guided
  voice/register and layout, and Chinese supported the comparison.
- Applied 17 supported corrections. `23790` already used the established
  `서품서(Ordination Tome)` form; the poem candidates at `23758` and `23800`
  did not warrant a layout change.
- Applied one linked exact-English title correction at `31168`. No speaker
  attribution or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `23826`, `31168` | Paired both identical `Leaky Faucets` labels with their full English title. |
| `23833` | Recast the reminder clause naturally and used the established `성약단(The Testament)` short form. |
| `23851` | Rendered the Hierophant's inability to see the addressee as inability to foresee them, supported by Japanese. |
| `23854` | Replaced the literal “beaten” wording with a natural description of a battered, nearly illegible journal. |
| `23855` | Corrected the Fae-location `hollow` from a physical depression to the Gloamthicket cave, supported by the Japanese and the quest's own location context. |
| `23898` | Replaced the inconsistent `지식의 돌` with the established `로어스톤(Lorestones)`. |
| `23906` | Clarified that 30 Ice Damage is immediate and 4 Freezing Damage is dealt over two seconds; preserved the values, cost, and line break. |
| `23907` | Localized `[DO NOT USE]` as `[사용 금지]`, preserving the bracketed warning format. |
| `23910` | Paired the complete item name and deliberately retained the source spelling `Clairty`. |
| `23921` | Added the English pairing to the `Giant Rat` creature label. |
| `23930` | Localized all three jump-action payloads as `점프`, preserving their wrapper order and the button placeholder. |
| `23932` | Replaced the misleading admiration of Denric's “기개” with the intended plan to explore like him. |
| `23938` | Paired the complete character/title label `The Gardener`. |
| `23942` | Clarified that the wearer fights in Thyrdon's name, not in their own name. |
| `23957` | Restored the complete reaction/question sequence, including “What is this...”, and retained the repeated astonishment. |
| `23986` | Changed the misleading `머리 장식` to the simple hat described by the sources. |
| `23993` | Localized `slot` and `abilities`, and clarified that abilities are assigned to buttons; preserved both button placeholders and `{LINE_SPACE}`. |

The Korean poem at `23758` matches the exact duplicate at `54026`. Contrary
to the earlier range report's count, the current source and translations each
have seven logical line breaks; no edit was needed. At `23800`, Korean's ten
breaks match English; Japanese has 17 and Chinese 14 because of translation
layout. The existing Korean verse was retained rather than reconstructing
stanzas without evidence.

## Verification

- Only the 18 edited IDs' `source_fingerprint` values (`17` range IDs and
  linked ID `31168`) were refreshed; all other ledger bytes and fields were
  preserved.
- The ledger validates all 65,135 IDs against the four current language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered data rows, 71,845
  CRLFs, and 244 LF-only record endings.
- The wrappers at `23930` remain three `점프` payloads in source order;
  `23993` retains the `슬롯`, `능력`, `슬롯` payload sequence and
  `{LINE_SPACE}`.
- The 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `24000`-`24249`.
