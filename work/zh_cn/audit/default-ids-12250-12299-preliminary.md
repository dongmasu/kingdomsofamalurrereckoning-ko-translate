# Preliminary Language Scan: `default` IDs 12250-12299

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12250-12299.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12252 | `St. Eadric's Mission` → `성 에이드릭 선교원` | Determine whether Mission names a church/monastery or an assigned religious task; align it with the parallel St. Odwig location at ID 12235. | Korean uses `선교원`; Japanese says monastery and Chinese says preaching station. The paired place-name context supports an institution, but its exact type is unresolved. | Medium |
| 12253 | High King Mathon / winter-personification verse | Verify the king's name/title and preserve the seasonal personification and the claim that death ends autumn's slow decay. | Korean retains the five-line imagery and relation among winter, purification, and autumn's decay. Japanese/Chinese differ on phrasing and the first name's transcription. Historical notes already flag this passage. | Medium |
| 12257 | `Widow take us` → `과부여, 맙소사` | Determine whether this is an oath invoking a named Fae figure, an exclamation, or a direct address. | Korean treats `Widow` as a vocative and follows with “good heavens”; Japanese uses an insulting “Widow,” while Chinese reads it as the widow capturing/leading them. Historical notes already flag it. | Medium |
| 12265 | `Warden of Light` → `빛의 수호자` | Determine whether this is a formal title, character, or performance introduction and align it with other Warden uses. | Korean preserves the “keeps the dark at bay” apposition; English capitalizes the title, and Japanese uses “Guardian of Light.” Historical notes already flag the title. | Medium |
| 12273 | `-{1}% {2}` | Preserve English/Chinese/Korean marker order and review the Japanese-only variable-order difference before any runtime interpretation. | English, Chinese, and Korean place `{1}` before `{2}`; Japanese reverses them as `{2}-{1}%`. This is a localized numeric-format/placeholder-order exception, not a Korean deviation from English. | High |
| 12277 | `The next Scion` → `다음 계승자(Scion)` | Confirm whether Scion is a hereditary title/role and retain the source's masculine pronoun where Korean context requires it. | Korean preserves the succession/title reading and the Akara blessing. English uses `he`; Japanese/Chinese also use masculine wording. Historical notes already flag it. | Medium |
| 12278 | Inventory / Longsword / Weapons localized markers | Preserve the five localized-label markers, `{LINE_SPACE}`, their order, and the equip-location instruction. | All four locales have the same marker-class/order sequence: Inventory, Longsword, Weapons, line-space, Weapons. Localized label contents differ by design; Korean follows the English instruction. No structural exception was found. | High |
| 12280 | `The Requiem` → `레퀴엠호` | Confirm whether Requiem is a ship or another named object before standardizing the name. | Korean adds the ship suffix; the “sing like a seabird” context supports a vessel possibility, but the isolated source does not identify it explicitly. Historical notes already flag the referent. | Medium |
| 12288 | Maid of Windemere poem / hidden dagger / winter birds | Review the speaker, pronouns, line-to-line causality, and split `each- / Other` source word while retaining every verse line. | Korean retains the poem's source lineation and sequence. The English itself is fragmented and ambiguous; Japanese and Chinese also rework its images. Historical notes already flag the passage. | Medium |
| 12293 | Aster's birthright / paired amulets | Clarify what “birthright” denotes and how sharing one amulet/pair reveals the treasure key; retain the inscription's conditional logic. | Korean renders birthright as `정당한 유산` and keeps the one-versus-pair contrast. The object/referent of Aster and the inscription's mechanism remain unclear. Historical notes already flag it. | Medium |
| 12299 | `the last of us` → `우리 중 마지막으로 남은 자` | Determine whether the speaker means the last surviving person of a people, group, or family. | Korean keeps the “last among us” reading, but the line alone does not identify the group. Historical notes already flag it. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12253, 12257, 12265, 12277, 12280,
  12288, 12293, and 12299 against the active Korean and all three source
  locales. They remain open.
- ID 12273's Japanese-only `{1}`/`{2}` order is a newly recorded localized
  structural exception. Korean matches English and Chinese.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- CSV-record line-break counts match throughout this range.
- ID 12273 has a Japanese-only numeric-placeholder order difference.
  Localized marker class/order at ID 12278 matches in all four locales.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12250-12299 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12300-12349.
