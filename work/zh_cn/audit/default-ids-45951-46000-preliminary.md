# Preliminary Language Scan: `default` IDs 45951-46000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45951-46000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45951 | `Belmaid's Ingenuity` / `벨메이드의 기지` | Determine whether this is a formal item name and standardize Belmaid's spelling and “ingenuity” terminology. | English capitalizes the title; Japanese reads it as a stratagem and Chinese as cleverness. The standalone row does not identify its item/category. | Medium |
| 45953 | Greatsword bonuses | Preserve +14 Physical Damage and +25% Greatsword Damage and standardize Greatsword terminology. | Korean retains both effects and the source line break; Japanese/Chinese vary in label order. | High |
| 45958 | `my love` / `여보`; eel-and-oyster stew | Check the intimacy/register of the address and whether the food invitation remains a question. | Korean preserves both the cliff walk and shared stew as questions; the romantic address depends on scene context. | Medium |
| 45959 | “You cannot save us. Save yourself.” / `우린 구할 수 없어. 너라도 살아.` | Preserve who is unable to be saved and the direct instruction to save oneself. | English/Chinese say the addressee cannot save the group; Korean's subject can be read as “we cannot save [you],” then shifts to “you should at least live.” | High |
| 45960 | DLC tribute variable and gold icon | Preserve the raw variable and icon token exactly; no Korean localization should be inserted into these placeholders. | All four locales contain identical `$DLC1_Diplomacy.tribute_amount_large$ #NAMED_ICON_GOLD#`. | High |
| 45964 | House of Valor; Summer Court; Fae gladiators | Standardize the two factions and preserve the historical condition that the Summer Court still reigned. | Korean retains the Court's former rule over the House and identifies the ornament as worn by Fae gladiators; the noun for the ornament remains generic. | Medium |
| 45965 | `sister` / `여동생` | Do not infer the sister's relative age unless surrounding context supports the younger-sister reading. | English only says “sister”; Korean specifies younger sister, following Japanese, while Chinese remains age-neutral. | High |
| 45966 | Denric / “maddened to hell” / `완전히 미쳐` | Confirm Denric's canonical name and retain the strong “maddened” severity without inventing the cause. | Korean preserves the only recorded successful journey, missionary identity, half-dead return, and severe madness. | Medium |
| 45968 | `The mission?` / `그 임무 말이야?` | Resolve the English/Chinese “mission” versus Japanese “monastery” source divergence; retain uncertainty rather than silently choosing an institution. | Korean follows English/Chinese with “mission/task”; Japanese identifies a monastery. Context is insufficient to establish which source is correct. | High |
| 45974 | clipped `Or news of your death.` / `아니면 네가 죽었다는 소식이겠지` | Preserve the sentence fragment and its link to the preceding alternative; do not add a standalone antecedent. | All locales provide a fragment beginning “or”; Korean retains the alternative but naturally supplies a complete Korean clause. | Medium |
| 45979 | Brownies ambushing people in the Sidhe / `시드의 사람들이 ...` | Determine whether Sidhe is the location of the ambush or a people/group being attacked; standardize Sidhe and Brownies. | English says people are ambushed “in the Sidhe”; Korean can instead mean the Sidhe's people are attacked. Japanese/Chinese also permit differing readings. | High |
| 45984 | gnome warren/Faelands vault / `패란즈` | Confirm the canonical term for Faelands and preserve the gnomes' hidden vault inside the crater. | Korean retains the secret underground site, its exceptional security, and the planned robbery; its Faelands transliteration is provisional. | Medium |
| 45992 | Furies; dusk-black armor; old-brass face mask | Confirm whether Furies are named gods/faction and preserve which part is black and which object is made of brass. | Korean states that Furies are plural gods of vengeance and retains the armor's color and mask details; armor, mask, visage, and material relations need terminology/context review. | Medium |
| 45994 | `Cycle, the First: The Pirate` / `첫 번째 순환: 해적` | Resolve the English “Cycle, the First” versus Japanese “Third Discovery” source/title discrepancy. | Korean follows English and Chinese; Japanese supplies a different ordinal and heading. No evidence here establishes which title is canonical. | High |
| 45996 | Cipher drained / `사이퍼의 힘이 고갈` | Confirm the Cipher term and preserve that draining it prevents forcibly unsealing the target. | Korean preserves Anokatos's prior use of the Cipher and the inability to force the seal afterward; the artifact/source relation remains lore-dependent. | Medium |
| 45998 | Skald's forge, Alchemy Lab, Chaos Potions/pets | Standardize names and the alchemy/Chaos terminology while retaining both accomplishments. | Korean preserves the lab upgrade, new potion ability, and defeat of Skald's pets; item/faction names remain provisional. | Medium |

IDs 45952, 45954-45957, 45961-45963, 45967, 45969-45973,
45975-45978, 45980-45983, 45985-45991, 45993, 45995, 45997, and 45999-
46000 generally retain the English meaning on this first reading. Names,
register, and lore terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45950-46049. It
  flags Belmaid, Apotyre, Kite Shield, House of Valor, Denric, Ljosalfar,
  mission, Alfar Warship, Tuatha, Beckoned, Brownies/Sidhe, Templar Doness
  Vere, Faelands/warren, Gnostra/Allestar Tower, Furies/Kollossae, Cycle,
  Cipher/Anokatos, Gravehal, Skald, and additional names/terms.
- The historical notes specifically call for the Belmaid and Gravehal
  item-name checks, the romantic address/food at 45958, sibling relation at
  45965, the mission conflict at 45968, clipped fragment at 45974, Fae/
  faction terminology, and the Cycle/Fury/Cipher readings.
- The English source typo at 45945 (`Hugues behalf`) is noted without
  reproducing it in Korean; that row's meaning remains clear.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45951-46000 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 45953 retains its
  two lines and +14/+25% values.
- ID 45960's tribute variable and `#NAMED_ICON_GOLD#` match byte-for-byte
  across all four locales.
- No other runtime-marker, numeric-value, special-whitespace, or
  hidden-formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45951-46000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 46001.
