# Preliminary Language Scan: `default` IDs 13000-13049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13000-13049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13000 | `Longswords` / `+13 Physical Damage` / `+30% Damage` | Confirm whether the two lines are cumulative weapon bonuses and keep the weapon/stat labels consistent. | Korean preserves both Longsword bonuses, the +13 physical value, the 30% value, and the line break. Official Korean stat terminology remains unverified. Historical question remains open. | Medium |
| 13003 | `{*1stolen}` / `{*1fence}` / `{LINE_SPACE}` | Verify the official status/UI terms for stolen items and fence while retaining the three localized wrappers and spacing marker in order. | Korean identifies the item as stolen and the fence as a buyer of stolen goods; all three wrappers and `{LINE_SPACE}` remain in sequence. Historical question remains open. | Medium |
| 13007 | prior method of entering Alabastra / Dren's defenses | Preserve the reference to the previously used method without inventing what it was; verify the intended relation between that method and ending the defenses. | English, Japanese, and Chinese all leave the earlier method implicit. Korean retains that ellipsis and the finality of ending Dren's defenses. Historical question remains open. | Medium |
| 13010 | `Mercantile` → `상업 기술` | Confirm the official Korean name for this skill and use it consistently in both skill descriptions in this range. | Korean describes buying for less and selling for more. The English capitalizes Mercantile as a skill name; Chinese and Japanese convey the commerce skill without settling its Korean title. Historical question remains open. | Medium |
| 13011 | punishment / `Least of all you` | Clarify the compressed logic and preserve the reassuring or lightly pointed address to the listener. | Korean says the wise people have had no need to test the punishment, especially the listener. English and Chinese retain the same logic; Japanese frames it as avoiding the penalty. Historical question remains open. | Medium |
| 13013 | Apotyre's decline / `Keeps digging away` | Preserve the dismissive miner wordplay and determine whether “digging” is literal work, stubborn persistence, or both. | Korean retains the literal digging image after describing the old miner's belief that willpower can restore Apotyre. Japanese also makes the miner's digging explicit. Historical question remains open. | Medium |
| 13015 | `gallery` → `전시관` | Identify whether this is an art gallery, a named location, or another kind of hall. | Korean uses an exhibition-space reading, consistent with Japanese's art-museum wording; Chinese says gallery. Scene context is still needed to determine whether it is a proper place name. Historical question remains open. | Medium |
| 13021 | Burning Damage / Mark of Flame | Confirm the official Korean names for the damage type and ability while preserving the separate 80% and 40% bonuses. | Korean keeps the two distinct bonuses and their values. The proper-name treatment of Mark of Flame remains a terminology decision. Historical question remains open. | Medium |
| 13025 | `Moves` → `기술` | Identify the menu context to determine whether this means combat moves, actions, or another UI category. | The isolated English label is context-poor; Chinese's `招式` supports a move/technique reading, while Japanese transliterates “move.” Historical question remains open. | Medium |
| 13031 | Castellan / Ancient Vault / Heart of Sibun / Oathblade | Verify the formal ranks, location/artifact names, and consistency of the Oathblade title. | Korean calls Grian Shane `성주`, the Ancient Vault `고대 금고`, and Oathblade Gwyn Anwy `맹세칼`; the journal sequence and theft relation are retained. Historical question remains open. | High |
| 13037 | `master weaponsmith` Skald Atlas → `대장장이 스칼드 아틀라스` | Check a possible dropped rank/specialty: retain that Atlas is a master weaponsmith, not merely a blacksmith. | English explicitly says “master weaponsmith”; current Korean says only `대장장이`. Japanese calls her a master weaponsmith, while Chinese says weapons master. This is a concrete omission candidate, not an approved correction. | High |
| 13039 | `destroys it` / recovery of item value | Determine whether the game mechanic is salvage, dismantling, or destroying an item, and align the Korean verb with the actual action. | Korean says `파기`, which preserves destruction but may not name the precise Mercantile mechanic. Japanese also says disposal; Chinese says destruction. Historical question remains open. | Medium |
| 13043 | Watch / prison / `all but the worst criminals` | Determine whether Watch names an organization or its building, and confirm the intended exception for the worst criminals. | Korean places the prison in the Watch headquarters and says everyone except the worst offenders serves time there. The isolated English is unusual but supports that reading. Historical question remains open. | Medium |
| 13048 | `Katar Mastery` → `카타르 숙련` | Confirm the established Korean weapon name and UI convention for this mastery label. | Korean transliterates Katar and retains the mastery category. Japanese also transliterates it; Chinese uses a descriptive weapon name. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 13000, 13003, 13007, 13010-13011,
  13013, 13015, 13021, 13025, 13031, 13039, 13043, and 13048 against the
  active Korean and all three source locales. They remain open.
- Added the current-pass omission candidate at ID 13037 after comparing the
  English `master weaponsmith` and Japanese reference with the active Korean.
- ID 13003 retains its three localized emphasis wrappers and `{LINE_SPACE}`;
  the two-line stat description at ID 13000 retains its line break.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token signatures match; no structural or marker-order exception was
  found.
- Numeric gameplay values at IDs 13000 and 13021 remain 13, 30%, 80%, and 40%;
  ID 13003 retains `{LINE_SPACE}` and the localized marker sequence.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline; no
  active CSV was edited.

## Batch Status

IDs 13000-13049 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13050-13099.
