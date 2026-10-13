# Preliminary Language Scan: `default` IDs 9300-9349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9300-9349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9301 | `harpy of a wife` → `잔소리 심한 마누라` | Preserve the insulting metaphor and comic exasperation; determine whether a coined “harpy” insult is needed or whether the idiomatic Korean is preferable. | Japanese uses a nagging-wife description, Chinese retains literal harpy, and Korean localizes the insult as a nagging wife. This matches the earlier open question at ID 8371. | Medium |
| 9304 | `Knave of Pride` → `오만의 시종` | Confirm whether `Knave` is a card rank/title, House servant, or faction member; keep the English title traceable until context resolves it. | Japanese reads “servant of House of Pride,” Chinese transliterates Knave, and Korean follows the servant reading. The isolated label remains ambiguous. | Medium |
| 9305 | Two amulets / Enton Aster's grave / Aster Inheritance | Preserve that the two amulets are merged at the father's grave and that the resulting key leads to the inheritance; verify names and quest sequence. | English and Korean say to merge the amulets at the grave. Chinese instead says to put them into the grave, so English/Japanese support the active Korean action. | Medium |
| 9307 | `Gnarsh's brood` / “what was written” | Verify Gnarsh's name and whether `brood` means offspring, kin, or a creature group; retain the fate-changing claim without specifying the written source. | Japanese describes the clan ending and a written story, while Chinese generalizes to Gnarsh's kind and what was predetermined. Korean uses `자손` and `기록된 이야기`; the referents remain open. | Medium |
| 9309 | `Sworn to War` → `전쟁에 맹세를` | Determine whether this is a Warsworn motto/oath or an incomplete sign-off; align it with the faction's established oath wording. | English is a standalone fragment. Japanese and Chinese also render it as an oath phrase, while the Korean wording remains fragmentary. | Medium |
| 9311 | Alyn Shir / Dellach / Agarth | Align the recurring proper-name spellings and preserve the narrator's uncertainty: she seems allied, but Agarth distrusts her. | Korean retains the apparent ally/distrust contrast. Its names are provisional transliterations; this matches the historical question. | Medium |
| 9314 | Ambassador Jeanne Jorielle / `You're expected` | Confirm Jeanne's canonical Korean name and preserve that the ambassador represents Adessa's gnomes and has been expecting the player. | The English leaves the expected subject implicit; Korean's polite `기다리고 계셨습니다` is contextually plausible, while other locales vary on the name. | Medium |
| 9319 | `Gallows End` → `교수대의 끝` | Treat as a place name and align it with the corpus's many literal and transliterated forms; do not normalize globally in this preliminary pass. | The English and Japanese identify Gallows End as a location; the active Korean uses a literal translation inconsistent with forms such as `갤로스 엔드`. | High |
| 9320 | `Hierophant` → `대주교` | Align the religious title with other occurrences rendered as `대사제`, `히에로판트`, or `대주교`. | The source names a formal religious figure; Japanese uses a guide, Chinese a high priest, and Korean a bishop title. Historical notes identify the recurring title question. | Medium |
| 9323 | Smoke Bomb: 7 damage / 2-second stun / 6-second stealth / 40 Mana | Confirm whether 7 is physical damage; preserve the two durations, cost, and three-line UI layout. | Korean retains all numbers and effects but omits “Physical” from English/Japanese; Chinese also says damage without an explicit type. | Medium |
| 9325 | `This mission gives my life meaning` → `이 임무가 내 삶에 의미` | Determine whether `mission` refers to a religious mission/house or a task; preserve the contrast with wine, women, and other attempted substitutes. | Japanese interprets the mission as a monastery, Chinese as a mission establishment, and Korean as a generic task. The religious setting may make this a named institution/context. | Medium |
| 9328 | `Without the crudok to lead them...` → `크루독이 이끌던 무리가 사라졌으니` | Avoid asserting that the whole group disappeared; preserve only that, without the Crudok leading them, the brownies will no longer terrorize the Sidhe. | English and Japanese say the leader is gone; Korean adds that the group he led disappeared, a stronger claim not present in the source. | High |
| 9330 | `health and power` → `체력과 힘` | Verify whether `power` is a named game resource/stat rather than ordinary strength, and use the established UI term. | English and Japanese distinguish health and power; Chinese says health and energy. Korean's `힘` may read as physical strength. | Medium |
| 9336 | `the deathblow is still his`; capitalized `Sorrows` → `결정적인 일격` / `소로우즈` | Preserve the source's unusual agency claim and verify whether `Sorrows` names creatures/powers; align its Korean form with earlier Sorrows references. | Korean clarifies the deathblow as the decisive strike, while Japanese/Chinese also interpret it as the killing blow. The capitalized entity remains opaque and is rendered inconsistently elsewhere. | Medium |
| 9338 | Quest target tutorial / `{*2...}`, `{*4...}`, `{LINE_LEFT}` | Preserve the full marker sequence and distinguish the next objective from the quest-giver's location; review against the English tutorial rather than the conflicting Japanese wording. | Korean retains `{*2Quest Targets}`, both `{*4...}` icons, and `{LINE_LEFT}` in the source sequence. It describes the target as the next objective's location, consistent with English. | High |
| 9341 | `Tuatha` → `투아타` | Align this ethnonym with recurring `투아사` forms unless a deliberate distinction is established. | The source name is unchanged, while Korean alternates between `투아타` and `투아사` in related entries. | Medium |
| 9342 | Mystic Hammer prophecy / Eamonn / Helios / Vraekor / Erathi / Sagecrafting | Verify the proper names and terminology for the hammer's four materials/processes; preserve all instructions, quoted structure, and the paragraph sequence. | Korean retains the four-step forging account and the named fire, stone, gem, and haft makers. Several names differ across references; `Sagecrafting` follows the project's `마법물품 제작` term. | Medium |
| 9349 | `One of the required parties have died` | Preserve the intended contract failure while treating the English number-agreement error as source text, not a Korean structural issue. | English has a plural verb with a singular party; Korean correctly says one required party died and the contract cannot be completed. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9301, 9304, 9307, 9309, 9311,
  9320, 9336-9338, and 9342 against the active rows.
- Added active-row findings for IDs 9305, 9314, 9319, 9323, 9325, 9328,
  9330, 9341, and 9349.
- The 9338 tutorial follows English's distinction between quest targets and
  quest-giver information; Japanese wording conflates them. Markers are
  preserved, and no automatic correction was made.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales,
  including the multi-paragraph Mystic Hammer account at ID 9342.
- Runtime-marker IDs/order match after disregarding translated display
  labels. ID 9338 retains `{*2...}`, `{LINE_LEFT}`, and both `{*4...}`
  markers in the same sequence.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9300-9349 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
