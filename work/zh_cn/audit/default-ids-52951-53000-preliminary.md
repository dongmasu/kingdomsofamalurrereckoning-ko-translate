# Preliminary Language Scan: `default` IDs 52951-53000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 52951-53000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 52951 | `해결할 자격을 ... 갖춘` for `uniquely equipped to solve` | Preserve exceptional suitability for this problem without narrowing it to formal qualification or literal equipment. | Korean says the addressee alone has the qualifications to solve it. English and Chinese emphasize being uniquely equipped/capable, while Japanese can suggest someone with sufficient equipment. | Medium |
| 52952 | `의식(Orison)` / `봉헌` for `Orison` / `Giving` | Confirm whether Orison is a named rite and whether Giving is its final ritual task; standardize both terms. | Korean keeps Orison in English and translates Giving as a dedication/offering. Japanese treats Giving as a named rite; Chinese reads Orison as prayer. | Medium |
| 52954 | `진귀한 사슴고기` for `uncommon venison` | Check whether `uncommon` is the game's item-rarity tier and align its Korean UI term. | Korean preserves venison and its uncommon/rare quality, but uses `진귀한`; the canonical rarity wording should be checked against item UI conventions. | Medium |
| 52956 | `페이트위버` / `운명의 전환` | Standardize the Fateweaver group and `Twists of Fate` terminology; retain the reset service, escalating gold cost, permanent Fate Energy bonus, and tarot-card representation. | Korean preserves these mechanics and paragraph structure. English/Japanese/Chinese use differing localized names; Korean translates the second heading but transliterates the first. Runtime marker identities/order are preserved while visible labels are localized. | Medium |
| 52958 | `횡설수설하는 페이` for `blathering Fae` | Preserve the speaker's complaint about incessantly noisy Fae without adding a stronger claim of incoherence unless intended. | Korean reads as babbling/nonsensical speech. Japanese and Chinese emphasize loud/noisy chatter; English supports incessant talk. | Medium |
| 52959 | `캔웬 대장(Captain Canwen)` | Standardize the captain's name/title and retain the speaker's intent to stay and help. | Korean preserves the decision to fight alongside Canwen and the urgent need for assistance. Japanese/Chinese use a military captain title. | Medium |
| 52964 | `목재 재료 6개` / `금속 재료 3개` | Preserve both construction-material categories, quantities, and line separation. | All four locales list six wood materials and three metal materials on separate lines; Korean retains both counts and the break. | High |
| 52965 | `페이의 저주가 네 운명을 더럽히고` | Retain that Fae curses have tainted the character's destiny and distort the memorial's magic, causing further affliction. | Korean preserves the causal chain and both effects; capitalization and the precise lore sense of `Fae Curses` remain open. | Medium |
| 52967 | `마을 감시관` for `village Warden` | Carry forward the unresolved formal office/title meaning of `Warden` and standardize the Korean form. | Korean preserves the warning not to swindle the Warden and the speaker's judgment. The role has repeatedly varied across historical rows between a guard, official, and prison warden. | Medium |
| 52972 | `우리 순환` for `our cycle` | Confirm whether the Fae “cycle” means a life/death cycle, reincarnation, or another lore concept. | Korean retains the speaker's experience of the Fae cycle and the Fae's new awareness of mortality; the isolated line does not resolve the lore meaning. | Medium |
| 52974 | `리바이벌(Revival)` | Verify whether Revival is a named location and retain the speaker's surprise at the quick return. | Korean preserves the return and timing; the capitalized place name is retained bilingually. | Medium |
| 52976 | `지팡이` for standalone `Staff` | Confirm whether this is a weapon category/UI label and use the established staff terminology. | All four locales render a staff/pole weapon; Korean uses the generic `지팡이`. The isolated label provides no item subtype context. | Low |
| 52979 | `필수 참가자 중 하나` for `one of the required parties` | Preserve the quest-failure condition while checking whether a required party/member, rather than an individual participant, has died. | English has a subject/verb number mismatch (`One ... have died`). Korean resolves this as one required participant; Japanese and Chinese read it as one of the involved parties. | Medium |
| 52984 | `실패 행` for `FAILURE LINE` | Determine whether this all-caps text is internal/debug content or a player-facing label before settling its localization. | English and Japanese retain the English string, Chinese localizes it, and Korean translates it. The row alone does not establish its audience or function; similar historical strings have been treated as possible test labels. | Medium |
| 52988 | `내 가게를 다시 세워야` for `rebuild my stores` | Check whether `stores` means the speaker's shop/business or inventory/stock. | Korean follows the shop/business reading, supported by Japanese and Chinese. The English plural can also mean supplies, though the town-rebuilding context favors the business reading. | Medium |
| 52991 | `불길한 기운` for `ill aura` | Preserve the troubling aura while leaving open whether `ill` means ominous or physically sickly. | Korean uses an ominous reading; Japanese says sick aura and Chinese says evil aura. The source remains ambiguous without the surrounding creature context. | Medium |
| 52995 | `지역 100곳 발견` | Preserve the exact achievement count and discovered-location condition. | All four locales retain 100 locations; Korean preserves the value. | High |
| 52998 | `국경 통행 명부` for `border manifest` | Confirm whether this is a refugee/entry register or another border-shipping/administrative manifest; retain the discrepancy clue. | Korean reads it as a border-crossing register and preserves that the figures do not add up. Chinese explicitly says an entry list; English leaves the manifest's contents implicit. | Medium |
| 52999 | Court of Summer's lack of support / overthrow of Titarion | Preserve the political grievance and the plan to force the remaining Fae to fight. | Korean retains the lack of wartime support, planned overthrow, and forced recruitment. The relationship among “your people,” the Court, and the remaining Fae remains context-dependent. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain open for consistency, including Fateweavers,
Twists of Fate, Orison, Klurikon, Alabastra, Dead Kel, Fae, Warden,
McGowan, Travelers, Besin, Revival, Red Legion, Ynadon, Beckoned, Jottun,
Telogrus, Sister Zelda, Court of Summer, and Titarion.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry titled `default` IDs
  52950-53049. Its `Orison`/`Giving` question at 52952 and
  Fateweavers/`Twists of Fate` question at 52956 match the active source
  rows.
- Several other issue-to-ID references in that entry do not match the active
  source text. For example, its `Sorrogweth` at 52961 belongs to active ID
  52861, while active 52961 is the Alabastra line; its House of Pride and
  festivities/tenor references at 52964-52965 correspond to active IDs
  52864-52865, while active IDs 52964-52965 are material quantities and a
  Fae-curse description. Its Reddle, door-holder, and Tenders references at
  52979, 52985, and 52991 correspond to active IDs 52879, 52885, and 52891.
- The same historical entry places Sorrows, Blades/Seal, shrine/spring,
  Mitharan dwellings, Klurikon resistance, and abducted-youth questions at
  IDs 53024, 53026, 53029/53034, 53031, 53035, and 53039; the matching
  active source rows are 52924, 52926, 52929/52934, 52931, 52935, and
  52939. Its border-manifest reference at 53028 matches active ID 52998.
  These appear to be stale/misaligned references; the historical file was
  not changed, and this batch is documented against the actual CSV keys.
- Runtime/control marker identities and order at 52956 are retained.
  Material counts 6/3 at 52964 and the 100-location count at 52995 are
  preserved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 52951-53000 once
  and in identical ascending order.
- Physical line-break counts and detected runtime/control-token identities
  match throughout the range. No hidden format/control characters were
  detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 52951-53000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 53001.
