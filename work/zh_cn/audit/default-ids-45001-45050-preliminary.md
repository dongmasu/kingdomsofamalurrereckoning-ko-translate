# Preliminary Language Scan: `default` IDs 45001-45050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45001-45050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45002 | Mitharu / Fae's “long cycle of kinship with chaos” / `미사루` | Confirm the canonical deity spelling and the lore meaning of the Fae's long kinship/cycle with Chaos; do not replace the source concept with an inferred alliance. | Korean retains Mitharu leading the group to end the Fae/Chaos connection. Japanese omits Chaos and mentions only a long cycle; Chinese renders it as a long chaotic cycle. The historical log flags the underlying concept. | High |
| 45004 | Soulbind / `소울바인드` | Confirm whether Soulbind is a named effect/status and preserve Ticneri as the agent and the “gift to remember him by” tone. | Korean retains the effect name and gift explanation. Japanese says Ticneri died and left a memorable gift; Chinese also changes the event, so English is the semantic anchor. | Medium |
| 45007 | `[Placeholder, currently unused]` | Keep this unused placeholder literal and unchanged. | Korean, English, Japanese, and Chinese all retain the exact placeholder. | High |
| 45010 | Games Label Senior Vice President / `게임 레이블 담당 수석 부사장` | Preserve as a possible metadata/job label pending confirmation that it is player-facing text. | The English title is unusual and may be internal organizational text. Korean translates it literally; Chinese does likewise, while Japanese leaves it in English. Historical notes flag it as likely metadata. | High |
| 45012 | `Trigger Kobolds 2` | Preserve verbatim pending confirmation whether this is a debug/test string. | Korean, English, and Chinese keep the exact label; Japanese localizes it. Historical notes flag it as likely trigger metadata. | High |
| 45019 | Reprisal, Reprised / `복수의 재현` | Retain the alliterative/repeated-action title and verify whether the Korean preserves the deliberate wordplay. | Korean conveys reprisal being repeated/reprised but loses the similar-sounding English pair. Japanese/Chinese also use different title structures. | Medium |
| 45022 | Casual difficulty / `캐주얼 난이도` | Keep the English/Chinese Casual difficulty meaning and do not inherit Japanese's “Easy” setting unless runtime taxonomy confirms equivalence. | Korean and Chinese say Casual; Japanese says Easy, which is a distinct difficulty label in English. | High |
| 45027 | “Went and broke his little leg” / `가서 제 다리를 부러뜨렸대` | Clarify the omitted actor and whose leg was broken; retain Lunala's exclamation and the complaint about the bigger picture. | Korean preserves the broken-leg complaint but `제 다리` can ambiguously read as the speaker's own leg. The English also omits the subject, so scene context is needed. | Medium |
| 45031 | Rift / `균열` | Confirm whether capitalized Rift is a named location/anomaly and standardize the game term. | Korean uses a generic “rift”; the English capitalizes the term and Japanese/Chinese also use generic localized terms. | Medium |
| 45033 | Running with Scalpels / `메스를 들고 달리기` | Check whether this is a deliberate title/pun and preserve its literal scalpels image. | Korean follows the literal wording; Japanese does likewise, while Chinese says “transporting scalpels.” The source-keyed log leaves the pun/title status open. | Medium |
| 45034 | Hospitalis Quarters / `진료 구역` | Confirm the formal location name and standardize it with other occurrences. | Korean gives a generic medical district; English capitalizes the proper name. The same name remains open elsewhere in the audit. | Medium |
| 45040 | Relentless Assault / `무자비한 강습` | Confirm the canonical ability name while preserving the duration, armor effect, and mana cost. | Korean translates the ability name and retains 25 seconds, the “no longer reduces armor” effect, 50 Mana, and the source line break. | Medium |
| 45042 | `FAIL LINE 2` | Preserve the literal internal-looking label pending confirmation whether it is intended runtime text. | Korean, English, and Japanese retain the exact label; Chinese renders it as “failed dialogue 2.” Historical notes classify it as likely test content. | High |
| 45045 | Templars' views / `성전기사들의 생각이 모두 같은 건 아니야` | Preserve the English claim that Templars disagree about civilization's direction; treat Japanese as a source divergence. | Korean and Chinese follow English. Japanese says Templars do not care at all about the path, materially changing the claim. | High |
| 45048 | corpse joke / `네... 어... 시체를 관찰하며 기록` | Keep the hesitant self-correction and the matter-of-fact corpse reference without losing the joke. | Korean preserves the ellipsis, hesitation, and notes-on-the-corpse reveal; English and Chinese support this reading, while Japanese slightly recasts the wording. | Low |

IDs 45001, 45003, 45005-45006, 45008-45009, 45011, 45013-45018,
45020-45021, 45023-45026, 45028-45030, 45032, 45035-45039, 45041,
45043-45044, 45046-45047, 45049-45050 generally retain the English meaning
on this first reading. Names, setting terms, and UI labels remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 45000-45049 were checked for
  Colm Bardan, Mitharu, Fae/Chaos kinship, Ticneri/Soulbind, the unused
  placeholder, Games Label Senior Vice President, Trigger Kobolds 2, Don
  Byrnes, Klurikon, Reprisal/Reprised, Casual difficulty, Lunala's tears,
  Savant Engar, Running with Scalpels, Dvergan map/Scuttle Beach, Relentless
  Assault, `FAIL LINE 2`, Oathblade, Templars, the corpse joke, and Durant
  Alghus.
- The historical log flags Soulbind's status, the Chaos/kinship concept, the
  two metadata-like strings, the placeholder, Running with Scalpels, and
  `FAIL LINE 2`. It also records that ID 45040 retains 25 seconds, 50 Mana,
  and its one source line break.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45001-45050 once
  and in identical ascending order.
- ID 45040 has one embedded line break in every locale. Its 25-second
  duration and 50-Mana cost match across locales.
- No runtime marker, numeric-value discrepancy, or hidden formatting
  character was found. Japanese uses the digit `1` at 45043 for “one alone”;
  Korean/English express the same singular meaning in words.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45001-45050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 45051.
