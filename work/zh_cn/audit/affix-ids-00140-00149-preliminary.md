# Preliminary Language Scan: `affix` IDs 140-149

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 140-149 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 140 | `Silver` | 은 | Confirm the natural adjective form when composed with the following item name. | All references treat this as a silver material/quality adjective. Korean `은` is understandable as a modifier but may read unnaturally before the item; check the full composed label before choosing a form such as `은제`. | Low |
| 142 | `of Bounty` | 포상의 | Resolve whether `Bounty` means reward, loot, or generosity in this equipment suffix. | English is polysemous; German and Spanish lean toward booty/loot, French/Italian/Russian toward generosity, and Chinese toward bounty/reward. Korean “reward” is plausible but not settled without the item effect/context. | Low |
| 144 | `of Lightning Hindrance` | 번개 방해의 | Check whether this names lightning hindrance, resistance, or insulation. | English, German, Spanish, and French are literal/obstacle-like; Italian and Russian use resistance/insulation, while Chinese is compressed. The Korean is close to English but awkward and possibly misses a defensive-stat sense. | Low |
| 147 | `of the Hale` | 강건한 | Check the fragment's attachment to the preceding item name. | The references treat `Hale` as health/robustness, while Korean uses a bare adjective with no visible possessive relation. The best Korean may depend on whether the UI concatenates this before or after the item name. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 140-149 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant evidence was checked in all available locales.
- IDs 141 (`Glowing`), 143 (`of Fire Attenuation`), 145 (`Tyrant's`), 146
  (`Erosive`), 148 (`Charged`), and 149 (`of Flaying`) had no additional
  high-confidence concern in this pass.

## Batch Status

All 60 target variant rows for IDs 140-149 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
