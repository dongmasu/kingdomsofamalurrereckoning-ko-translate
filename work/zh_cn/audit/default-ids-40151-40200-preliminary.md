# Preliminary Language Scan: `default` IDs 40151-40200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40151-40200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40151 | `발자국` for `tracks` | Avoid narrowing the scout's unidentified tracks to footprints unless the scene/context confirms that meaning. | English says tracks around the attack scene; Japanese says the paths/roads are unfamiliar and Chinese says traces. Korean specifies footprints, a plausible but narrower reading. | Medium |
| 40154 | `구덩이` for `the Pit` | Confirm whether Pit is a named arena/location rather than a generic pit, and retain the readiness condition. | English capitalizes Pit, Chinese gives a pit, and Japanese instead names a waiting area. The target location is unresolved from this line alone. | Medium |
| 40157 | `샘`; `엔셀` | Confirm whether the capitalized Well is the Well of Souls and standardize Encel; preserve that the speaker slows the Tuatha while Encel opens the gate. | Korean retains the defense/gate sequence. English capitalizes Well, and the three locale spellings/readings vary; earlier audits leave Well terminology open. | Medium |
| 40161, 40172 | `용맹의 가문`; `계절의 가문` for House of Valor/House of Seasons | Standardize the formal Fae Houses while preserving the smith's regret and the named House. | Korean renders both Houses with `가문`; active forms vary, and historical questions leave House of Valor and House of Seasons terminology open. | Medium |
| 40163, 40165, 40168, 40170 | `임명 회관`; `감시자`; `영구 선교원`; `수호자의 의식` | Verify the formal names/ranks for Hall of Appointments, Watcher, St. Odwig's Perpetual Mission, and Keeper's Rite. | English capitalization marks named institutions/roles/rites. Korean gives comprehensible literal/semantic forms; historical notes specifically flag these entries and the Mission's religious-site terminology. | Medium |
| 40167 | `{*1Charged Entropy}`, `{*1Maelstrom}` | Preserve both special-attack marker identities/order and Fate bonus; determine whether the visible English marker labels should remain untranslated. | Korean retains both source labels and the claim that the attacks award bonus Fate. Japanese/Chinese localize marker payloads, while the marker identities/order are preserved. | Medium |
| 40176, 40178-40179 | `사티바`; `달콤하고도 슬픈 일`; `구속의 원` | Confirm Sativa, Such Sweet Sorrow, and Circle of Holding as named ingredient/title/spell; retain that the spell describes a circular prison and includes release words. | Korean preserves the discount offer and the healing/curse-removal passage's key mechanics. Locale readings differ on Sativa and the title; the source has a grammar error (“spell include”), so the intended release-text relation remains open. | Medium |
| 40183 | Four-line Ysa/Talisman poem | Preserve the full sequence and source line layout while reviewing the arena, sea-loam, and mist imagery. | English and all three translations retain four lines. The poem's imagery and proper lore names vary by locale; no line restructuring is warranted by this scan. | Medium |
| 40185 | `밀항 트롤` for `Stowaway Troll` | Confirm whether the phrase names a particular troll/encounter or describes a troll stowaway. | English capitalizes the phrase; Korean treats it descriptively as a troll who stowed away. Japanese and Chinese also choose descriptive readings, but the referent remains unclear. | Medium |
| 40191 | Runtime markers `{3}{1}{2}{4}` | Preserve the English marker order in Korean and document the Japanese-only order exception; do not normalize the Japanese source. | English, Chinese, and Korean use `{3}{1}{2}{4}`; Japanese uses `{3}{2}{1}{4}`. All four retain the same marker identities. Korean matches English. | High |
| 40193, 40196, 40198-40199 | Blood Rite; Beckoned; Dodge; Sorrow's Benefit | Standardize the named rite/title/UI label/card or benefit names without changing the speaker's requested ritual, role, or dodge action. | Korean preserves the immediate functions but renders Blood Rite as `혈액 의식`, Beckoned as `불려온 자`, Dodge as `회피`, and Sorrow's Benefit as `슬픔의 은혜`; the project terms remain unresolved. | Medium |

IDs 40152-40153, 40155-40156, 40158-40160, 40162, 40164, 40166,
40169, 40171, 40173-40175, 40177, 40180-40182, 40184, 40186-40190,
40192, 40194-40195, 40197, and 40200 generally retain the English meaning
on this first reading. Names, UI labels, and lore remain subject to
integrated review.

## Historical Audit Reconciliation

- `work/zh_cn/audit/from-ja_jp/open-questions.md` has a source-keyed entry
  for IDs 40150-40249. It explicitly flags the scout/attack tracks, Pit,
  Encel and Well, Tirin's Rest charter, House of Valor, Hall of
  Appointments, Watcher, the two special-attack markers, St. Odwig's
  Mission, Keeper's Rite, House of Seasons, Sativa, Such Sweet Sorrow,
  Circle of Holding, the Ysa poem, Stowaway Troll, and related terms.
- These questions were checked against the active rows. No global
  terminology change is authorized.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40151-40200 once
  and in identical order.
- Embedded line-break counts match. Runtime-marker identities are retained;
  Japanese alone reverses `{1}` and `{2}` at ID 40191, while Korean matches
  English. Localized `{*1...}` payloads at ID 40167 are expected.
- January/`1월` and ten years/`10년` retain their values. No translation CSV
  or immutable source file was edited.

## Batch Status

IDs 40151-40200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40201.
