# Dialogue Context Translation Edit Batch: IDs `30750`-`30999`

- Date: 2026-11-14.
- Rechecked all current correction candidates against English, Japanese,
  Chinese, and the active Korean text.
- Applied supported corrections and aligned directly related names,
  terminology, and exact-source duplicates. Uncertain findings remain held.
- No speaker or playback order was inferred from asset membership or ID order.

## Applied In-Range Corrections

| ID | Correction |
| ---: | --- |
| `30757` | Replaced the stiff `-하게` instruction with natural plain-conversational speech, retaining the invitation to indulge in acquiring possessions. |
| `30778` | Added the missing `Olaf` pairing. |
| `30790` | Added `The Flame` to the named Fate-card rendering while preserving the poem-like description. |
| `30807` | Standardized the reagent as `펜라크(Fennwrac)` and matched exact-source duplicate `44368`. |
| `30849` | Paired the complete title and name as `컵의 왕 이리온(Irion, King of Cups)`. |
| `30852` | Standardized the named location and organization wording; aligned exact-source duplicate `63854`. |
| `30895` | Rephrased the awkward description of a popular place as `이곳을 찾는 이가 많고`. |
| `30902` | Added `Knave of Pride` and replaced the abrupt 하오체 with consistent, natural polite dialogue; preserved the question about offering help. |
| `30922` | Changed the isolated polite endings to plain conversational speech consistent with the English and Japanese. |
| `30926` | Replaced `타격당` with the established `적중당` for the per-hit health-steal effect. |
| `30963` | Replaced `타격당` with the established `적중당` in the mana-steal label. |

## Related Consistency Corrections

| ID(s) | Correction |
| --- | --- |
| `571`, `1513` (`base`, variant `11`) | Aligned `Fennwrac Flower` to the established `펜라크(Fennwrac) 꽃`. |
| `31978`, `45168`, `46537`, `50431`, `53475` | Standardized remaining default-table `Fennwrac` forms; the inventory label at `46537` now pairs the full `Fennwrac Leaf` name. |
| `2455`, `47572`, `7379`, `63854` | Added the named place `크로싱(The Crossing)` and aligned the `Keepers of the Crossing` wording across the complete source group with `30852`. |
| `7581`, `22964`, `34133`, `35843` | Standardized the named role as `교만의 시종(Knave of Pride)`; at `7581`, also aligned the plural `Bolgan Masters` label. |
| `15942`, `47355`, `59691`, `18614` | Aligned per-hit health/mana absorption wording; `59691` and `18614` use `생명력`, corroborated by Japanese and Chinese. |

## Retained And Held

- `30806` already used the alchemy-appropriate `조제법`; `30936` already
  matched the parallel `Beasts killed ...` narration.
- `30849` already translated both the title and name but had split English
  labels; it now uses the complete title-and-name pairing. `30852` already
  paired the organization but omitted the named place's English label; its
  wording and the exact-source duplicates now include both.
- The narrative wording in `30936` already matches the parallel
  `Beasts killed ...` reports at `15581`, `42559`, and `44457`.
- Evidence-limited findings `30794`, `30843`, `30920`, and `30993` remain
  unchanged because the sources do not resolve their layout, markup, title,
  or speaker/register questions.

## Verification

- Refreshed only the 52 changed IDs' `source_fingerprint` fields; the ledger
  validates all 65,135 IDs, and the index and both catalogs reproduce.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,842 CRLF / 244 LF-only line-ending inventory. The base CSV retains its
  BOM, 4,844 rows, and CRLF record endings.
- The three exact-source duplicate pairs `30807`/`44368`, `2455`/`47572`,
  and `30852`/`63854` now match in Korean. All remaining `Fennwrac`
  occurrences in `base` and `default` use the established `펜라크` form.
- All 20 CSV-preservation and context-index tests pass, as does the
  CRLF-aware `git diff --check`.

The next candidate range is `31000`-`31249`.
