# Preliminary Language Scan: `default` IDs 53151-53200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 53151-53200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 53154 | `{3}% 확률로 +{1} {2} {4}` | Preserve all four placeholders and values; treat localized placeholder ordering separately from marker-identity mismatches. | English, Chinese, and Korean order the markers `{3}`, `{1}`, `{2}`, `{4}`. Japanese uses `{3}`, `{2}`, `{1}`, `{4}`, plausibly to fit its word order. No placeholder is missing or duplicated. | High |
| 53156 | `에테네께서 네 앞길을 이끄시길` | Preserve the prayer/blessing and standardize the goddess name and honorific register. | Korean expresses Ethene guiding the addressee's actions as a wish; Japanese/Chinese also use a guidance/blessing reading. | Medium |
| 53157, 53195 | drinking joke / `마실수록 더 잘 넘어간다` | Preserve the speaker's comic enthusiasm for drinking and the repeated “another” response without resolving its missing referent. | Korean retains the crying-at-the-sight joke, immediate drinking, and the claim that more drinking makes it go down more easily. The repeated line at 53195 is consistent. | Medium |
| 53159 | `코볼트를 모두 몰아냈다` for tunnels “cleared of kobolds” | Check whether `cleared` means killed/defeated or physically drove them away; retain Hreid's follow-to-treasure request. | Korean says the kobolds were driven out. Japanese says they were exterminated; Chinese says the tunnels were cleared. The quest text does not explicitly state their fate. | Medium |
| 53161 | `클루리콘의 거대한 거인들이 아직 묘목만 하던 시절` | Clarify whether the “great giants” are giant trees/forest beings or humanoid giants before retaining “saplings.” | Korean follows the English wording literally, which can read as humanoid giants being seedlings. Japanese interprets the referent as a grove of giant trees; Chinese also retains the ambiguous giants/saplings image. | High |
| 53167 | `마법물품 제작 제단` for `Sagecraft Altar` | Confirm that `Sagecraft` follows the established crafting term and that the altar is a workbench/station. | Korean uses the active project's `마법물품 제작` term. Japanese calls it a gemcrafting table and Chinese an enchanting altar; the item's function remains context-dependent. | Medium |
| 53175 | seven-yearly-war statistics | Preserve the full nine-line layout and every count; verify Pledgeshield/Hireling labels and any apparent arithmetic only with wider context. | Korean retains 248-to-249 summers and all values: Hirelings recruited 412, Pledgeshield promotions 83, war-ready 75, sent to Klurikon 74, initial 846, final 802, and 119 casualties. All four locales have nine physical line breaks. | High |
| 53177 | `웅장한 회랑` for `grand gallery` | Align with ID 53065: determine whether this is an art/exhibition gallery or a grand hall rather than a corridor. | Korean repeats `회랑`; Japanese and Chinese read gallery/museum. It preserves the second-floor location and the imagined treasures. | High |
| 53181 | scavs / Gwynedds' garden and harvest | Confirm the creature name/species and retain that killing the nest restores the family's ability to harvest. | Korean keeps the deadly scav brood, Storm Point, both owners, garden, and conditional harvest outcome. | Medium |
| 53189 | curse changes `정신과 역할` | Clarify whether `role` means social function/behavior or another role while preserving that the same curse affects Alard and these brethren. | Korean retains both mind and role as affected. English is broad; Japanese says behavior and Chinese says role, so the exact sense needs context. | Medium |
| 53194 | `완벽한 미타란 치유 장식` for `Flawless Mitharan Mending Trim` | Check whether `Mending` means repair rather than healing and identify the equipment-component sense of `Trim`; standardize Mitharan. | Korean preserves quality, material/name, and component but `치유` may imply healing. Chinese says repair trim; related Mitharan item audits leave component terms unresolved. | Medium |
| 53197 | `겨우 살아가고 있지만` for `We get by` | Preserve that the community manages with Akara's blessing/providence without adding a stronger claim of barely surviving unless intended. | Korean's “barely getting by” is stronger than English's neutral “get by.” Japanese says “somehow manage”; Chinese also has a “make do” reading. | Medium |
| 53198 | `+5% 치명타 확률` | Preserve the exact critical-hit chance modifier. | All four locales specify +5%; Korean retains both the plus sign and percentage. | High |
| 53200 | Offering / Scion / Souldeep; three petitions | Standardize the ritual/title/place terms and preserve the three separate purposes of the meditation. | Korean retains the pre-Offering meditation in Souldeep and the courage/guidance/strength sequence. `후계자` is a plausible rendering of Scion, but the term is used inconsistently elsewhere; Offering may be a named rite. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain open for consistency, including Erran
Gastyr, Klurikon, Eamonn's Isle, Hreid, Mel Senshir, Detyre, Ethene,
Sagecraft, Dionaeach, Crownhold, Pledgeshield, Bristletongue, the Font,
Storm Point, the Gwynedds, Seafoam, Mad Dog, Mitharan, Souldeep, Offering,
and Scion.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry titled `default` IDs
  53150-53249. It flags the fate passage at 53150 (the preceding boundary
  row), drinking joke (53157/53195), Eamonn's Isle (53158), Erran Gastyr
  (53161), Sagecraft Altar (53167), second-floor gallery (53177), scavs
  (53181), curse/role (53189), Barten (53190), and Offering/Scion/Souldeep
  (53200); these questions were compared with the actual active rows.
- The historical entry says the `{3}/{1}/{2}/{4}` order at 53154 is
  preserved. The active Japanese row instead orders the same four markers
  `{3}/{2}/{1}/{4}`; English, Chinese, and Korean use `{3}/{1}/{2}/{4}`.
  This is recorded as a Japanese localized-order exception, not as a Korean
  placeholder loss. No changes were made to the historical file or CSVs.
- The nine-break statistical report at 53175 retains all seven numeric
  values. The +5% critical-hit chance at 53198 is also preserved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 53151-53200 once
  and in identical ascending order.
- Physical line-break counts match throughout the range. Runtime-token
  identities match; the only sequence difference is Japanese marker order
  at 53154. No hidden format/control characters were detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 53151-53200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 53201.
