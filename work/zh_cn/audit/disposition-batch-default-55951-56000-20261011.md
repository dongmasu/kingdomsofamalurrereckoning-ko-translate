# Disposition Batch: `default` IDs 55951-56000

- Date: 2026-10-11. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- Zero accepted corrections, 30 `not an issue` IDs, and 20 uncertain IDs.

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55952 | Uncertain | Primos' sanctum, the long-unused stairs, and warning are retained; canonical office/place terminology needs lore context. |
| 55953 | Uncertain | Epigraph and six-stanza poem preserve all 55 newline characters; Fate/stone imagery and several subjects/referents remain cryptic across locales. |
| 55957 | Uncertain | `SpellAmmoFast` is translated consistently across locales, but it may be a player-facing label or an internal/debug string. |
| 55960 | Uncertain | Magical dementia, Edgar Aron, Calovar's stone, Motus Mining, Crudok, and Aurenda's light are retained; the source's “from the crudok to the theft” construction is awkward. |
| 55963 | Uncertain | `Warsworn Rank` is rendered as a rank; Japanese says title and Chinese says rank, leaving formal status/canonical form open. |
| 55966 | Uncertain | The imperfect gem is described as flawed; Japanese supports damaged while Chinese suggests uncut, and English does not specify the defect. |
| 55970 | Uncertain | The isolated `Resting the Bones` may be a title or descriptive burial objective; locale wording differs. |
| 55972 | Uncertain | Paling Wand, abandoned waste, and the effort needed to farm it are retained; the item's name/sense differs across locale references. |
| 55975 | Uncertain | The malformed fragment `The Baronett happened` is rendered as an event; the source does not establish the intended name/event relation. |
| 55976 | Uncertain | The torches, gaze, guards' bag of winds, and timing instruction are retained; English does not identify the gaze's owner, though Japanese says statue. |
| 55977 | Uncertain | Prayer, Fateweaving, and Orison remain three distinct options; Orison's category and Korean term are unsettled. |
| 55978 | Uncertain | The intimate address, collective plan, final job, and stakes are retained; locale treatments of `dove` differ. |
| 55981 | Uncertain | Pledgeshield and Warsworn are retained; Japanese's second-class-mercenary reading conflicts with the English/Chinese title/rank readings. |
| 55985 | Uncertain | The UI question and both named items are retained; whether the Arrivus Engine is a tool or disassembly device needs context. |
| 55986 | Uncertain | The deaths, prison-abyss, missing Archsage, and consultation objective are retained; canonical people, institution, and office forms remain open. |
| 55990 | Uncertain | The object's age and possible pre-Dverga chronology are preserved; the group-name form/status is unresolved. |
| 55993 | Uncertain | Gorrenet and the high-mage role are retained; the formal title and canonical Korean name form differ across locales. |
| 55994 | Uncertain | Private meeting, western events, Rathir, and Main Hall are retained; the official Scholia Arcana Grounds site terminology needs context. |
| 55995 | Uncertain | More-than-a-season effort, first working Cairn, and temporary safety of the songs are retained; Cairn function and “songs of Summer” status remain open. |
| 56000 | Uncertain | Anela's revenge motive, Virki, Culn settlers, and raider confrontation are retained; canonical place/person spellings need alignment. |

## Not an Issue

The other 30 IDs retain the apparent English meaning and structure. ID 55951
keeps flat `+15 Health Stolen per Hit`, supported by English and Chinese;
only Japanese adds `%`, which is not adopted without English support.
ID 55956's “subjects” are experimental subjects in the source context and
both Japanese and Chinese support that reading. ID 55961 keeps the five
deserted recruit crews distinct from five recovered Bogstaunch bottles.
ID 55965 retains skepticism about the Fae method and conditional interest;
55979 conveys the intended freedom statement without copying the English
grammar error. At 55991 the localized `{*1...}` display label retains marker
index 1 and order; Korean follows the English/Chinese durable-nature meaning,
while Japanese describes attacks differently.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55951-56000 once
  in identical ascending order; each default CSV contains 65,135 records.
- ID 55953 retains 55 newline characters in every locale. ID 55991 retains
  the marker index/order before the description; its display label is
  intentionally localized. Other newline counts and recognized runtime
  marker identities match throughout the batch.
- The numeric exception at 55951 is recorded above; the source-supported
  flat value is preserved rather than treating the Japanese percent sign as
  authoritative.
- Rechecked the source-keyed historical range `55950-56049`, including the
  Maid/crystal discrepancy at its opening boundary, Primos' sanctum,
  Anathon/Stone Shadows, experimental subjects, SpellAmmoFast, Edgar Aron,
  recruit crews/Bogstaunch, Warsworn terms, Paling Wand, Baronett, bag of
  winds, Orison, Pledgeshield, Arrivus Engine, Scholia Arcana, Dverga,
  Grand Faemage, Cairn/Summer songs, and Anela/Virki. Historical prompts
  remain separate from accepted corrections.
- The pre-batch CSV matches the byte-identical backup at SHA-256
  `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`.
  No CSV cell changed; the post-batch hash is identical. Backup:
  `/private/tmp/ko-translate-backups/20261011/before-resume-55951/locatexts_zh_cn.koalocatext_default.csv`.

Decisions D-16886 through D-16905 record the 20 uncertain findings;
D-16906 records the remaining 30 `not an issue` IDs. Direct register totals:
1,634 accepted, 11,203 `not an issue`, and 10,424 uncertain (23,261 total);
next D-16907.

Resume at `default` ID 56001; 9,134 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56001-56050-preliminary.md`](default-ids-56001-56050-preliminary.md).
