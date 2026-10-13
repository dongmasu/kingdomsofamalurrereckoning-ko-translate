# Preliminary Language Scan: `default` IDs 56951-57000

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56951-57000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56955 | Helius / Servants of Darkness | Confirm the talisman's bearer/blessing relation and established Korean forms for the sun god and darkness servants. | English says the talisman bears Helius's blessings for those who bear it in his name against the Servants of Darkness; the syntax is compressed. Korean interprets this as followers bearing Helius's name and preserves the daytime context. | Medium |
| 56962 | Sativa Fibers / Star Thistle / Ysa's Breath | Verify established ingredient names and preserve all recipe counts. | All sources list quantities 2, 2, and 1. Japanese calls Sativa leaves and Chinese calls them flax fiber; Korean uses `사티바 섬유`. Korean retains the five-line recipe layout. | Medium |
| 56963 | Mitharan Restoring Bindings / `미사란 회복 결속` | Confirm whether `Bindings` is an equipment component and align Mitharan spelling. | The English is an item-name fragment; Japanese transliterates the entire phrase and Chinese translates the bind/binding component. Korean's literal `회복 결속` may not identify the item type clearly. | Medium |
| 56965 | abandoned-house basement/device sequence | Reconstruct the malformed English without adding unsupported details, and verify who made the necromancy devices. | English is missing a noun/subject in “Inside the basement of the abandoned discovered...”. Japanese and Chinese clarify that a device and key were found in the abandoned house's basement; Korean follows that reading and leaves the inventor gender-neutral. | Medium |
| 56968 | Warsworn Galley / `전쟁맹세단의 조리실` | Verify whether `Galley` is the named ship/vessel rather than a kitchen or ship's cooking room. | Japanese explicitly says a galley ship and Chinese says a warship, while Korean's `조리실` means kitchen/galley. This is a high-confidence likely item-name sense mismatch; leave the corpus term decision open. | High |
| 56970 | monster-speed records / `기록해 뒀어` | Preserve that the speaker collected records of who defeats specific monsters fastest and can test the player against them. | English/Japanese describe comparing the player's performance to existing records; Chinese explicitly mentions trying to break them. Korean retains the timing-record challenge but does not state “fastest” as directly. | Medium |
| 56974 | Ametair / Buru's Boots / Arduath | Preserve the inference that the boots are likely still with Ametair in Arduath, not in the unlocked chest. | All sources agree the chest is empty and the letter points to Ametair in the Fae Hollow Arduath. Korean maintains the sequence and the inferred boot location. Proper names remain open. | Low |
| 56977 | Wolds poem / `대순환` | Preserve all five lines and align the named Wolds/Great Cycle terminology after corpus-wide review. | The poem describes Fae decline, mortal cultivation, the Wolds' origin, the Cycle, and aging land/people. Korean retains all five source lines and the contrast; the historical audit flags Wolds and Great Cycle terms. | Medium |
| 56980 | dispelling magical wards / `마법 결계 해제` | Confirm the exact game mechanic/official term for `magical wards`; English, Chinese, and Korean agree on reduced dispelling difficulty. | Japanese also says dispelling difficulty decreases, though it does not specify wards. No direction-of-effect conflict is present in this row; this remains a terminology/mechanics check. | Medium |
| 56984 | health decrease / `체력이 소량 감소합니다` | Resolve the source-locale effect conflict against the English primary meaning before any disposition. | English, Chinese, and Korean say health decreases; Japanese says a small amount of health is restored, the opposite effect. Korean follows English, but the in-game effect remains a separate verification question. | High |
| 56986 | notices delivered / pay / war | Preserve the completed delivery check, payment, dismissal, and reason the speaker cannot linger. | English, Japanese, Chinese, and Korean agree on the sequence. Korean's “we must wage a war” is a natural rendering of “we've got a war to run.” | Low |
| 56988 | captured essence / charm | Preserve that the essence was captured accidentally while drawing life energy from the ether and then bound into the charm. | All sources retain the accidental capture and binding. Korean's `정수` and `묶어 두다` preserve the core meaning; the identity/pronoun of “her” is contextual. | Medium |
| 56990 | Gale Crossing / route / `He'd want to stop there` | Confirm the referent of `he` and preserve the route from beyond the walls to the village for resupply. | All sources retain Gale Crossing and the mountain resupply stop. Korean preserves the route and the masculine subject; the person is not identified in this isolated row. | Medium |
| 56991 | Counsel / `평의회` | Determine whether `Counsel` is an organization, advisor, or advice, and keep the rendering consistent with ID 56775. | English capitalizes `Counsel`; Japanese interprets it as an advisor and Chinese as a strategist. Korean chooses `평의회` (“council”), which may identify an institution not established by context. | High |
| 56995 | Ynadon / justice / `이아다논의 정의` | Confirm the deity's canonical name and whether the phrase is a blessing, invocation, or wish for justice. | English asks Ynadon to grant justice; Japanese gives a blessing and Chinese also says Ynadon grants justice. Korean turns it into “may Ynadon's justice be with you,” a plausible benediction. | Medium |
| 56997 | Kollossae comparison / `콜로사이` | Preserve both the compliment about fighting and the contrast about thinking. | All sources say the addressee fights like a Kollossae but does not think like one. Korean retains the contrast and addresses the Beckoned. | Low |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Names and terms remain provisional, including
Khleran, Helius, Lapidus, Sativa, Star Thistle, Ysa's Breath, Mitharan,
Warsworn, Ametair, Arduath, Wolds, Gale Crossing, Counsel, Ynadon,
Kollossae, and Beckoned.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56950-57049`.
  Relevant prompts in this active range include Helius/Servants of
  Darkness (56955), recipe reagents (56962), Mitharan Bindings (56963),
  the broken basement source (56965), Warsworn Galley (56968), monster
  records (56970), Ametair/Arduath (56974), the Wolds poem (56977),
  dispelling difficulty and health decrease (56980, 56984), notices and
  war wording (56986-56987), the captured essence (56988), Gale Crossing
  (56990), Counsel (56991), Ynadon (56995), and the Kollossae comparison
  (56997). These remain prompts, not accepted corrections.
- IDs 56951-57000 fall entirely within `56950-57049`; each active row is
  reviewed once.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56951-57000 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch, including the five-line
  Wolds poem and the alchemy recipe.
- Recipe counts at 56962 remain 2/2/1. No other cross-locale
  numeric-value discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56951-57000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 57001.

## Subsequent Disposition Reconciliation

The later disposition pass recorded in
[`disposition-batch-default-56951-57000-20261011.md`](disposition-batch-default-56951-57000-20261011.md)
accepted one correction at 56973, marked 37 IDs `not an issue`, and retained
11 uncertain findings. The preliminary 56968 row is stale: the active Korean
CSV already contains `전쟁맹세단의 갤리선`, as accepted earlier by D-011;
it was not re-edited or counted again. The preliminary scan did not flag
56973; its correction follows prior accepted Familiar-upgrade terminology.
