# Disposition and Edit Batch: `default` IDs 14000-14049

- Decision date: 2026-10-09.
- Scope: all preliminary findings and carried historical questions in the
  range, including ID 14034.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Fourteen findings received dispositions: one accepted, one `not an issue`,
  and twelve uncertain.
- One accepted correction was applied at ID 14039. Uncertain entries remain
  unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 14000 remains uncertain: the isolated `Archsage Voice` label could be a
  voice/audio setting or a named character voice.
- ID 14002 remains uncertain: the name Venris and whether the carried
  reconnaissance is a report or intelligence require context.
- ID 14003 remains uncertain: `Fahrlangi` is not identified as a people,
  faction, place, or sword style in the isolated label.
- ID 14011 remains uncertain: `Relic` could denote an artifact or another
  remnant/location sense without inventory context.
- ID 14016 remains uncertain: Vigor appears to be a named Arena opponent, but
  its exact identity and the competitive register need broader context.
- ID 14022 remains uncertain: the compressed lore passage leaves `Opposition`,
  the pronouns, and several lore terms unresolved.
- ID 14023 remains uncertain: Japanese specifies spider silk, while English
  and Chinese do not establish that narrower material reading.
- ID 14024 remains uncertain: the references infer a glass display/container,
  but do not establish its exact form.
- ID 14028 remains uncertain: the proper names and whether Shadowthorn is a
  Fae hollow, refuge, or cave need context.
- ID 14029 is `not an issue`: `용맹의 군주들` matches the predominant active
  corpus form and the English description of the Arena team. The single
  `용맹의 군주단` at ID 13596 is not enough evidence for global
  normalization; that earlier joining-title question remains unresolved.
- ID 14032 remains uncertain: Mithros' canonical spelling needs alignment;
  the ironic ending is retained.
- ID 14034 remains uncertain: the self-correction and future generations are
  preserved, but Kollossae's canonical form and the sense of “saved my people
  from ourselves” need contextual terminology review.
- ID 14039 is accepted: replace `수학 첫해에 들어온` with
  `학업 첫해에 접어든`. English, Japanese, and Chinese all refer to the
  initiates' first year of study, not a year studying mathematics.
- ID 14044 remains uncertain: `crystal weir` and the related place names lack
  a confirmed geological/architectural referent and canonical Korean forms.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 14039 | `이 시험은 보통 수학 첫해에 들어온 입문자에게 주어집니다.` | `이 시험은 보통 학업 첫해에 접어든 입문자에게 주어집니다.` | D-4171 |

## Verification

- The four locale files contain IDs 14000-14049 once each and in identical
  ascending order. ID 14022 has six embedded line breaks, ID 14033 has two,
  and ID 14039 has four in each locale.
- Brace, dollar, and hash-token signatures match; no marker-order exception
  was identified. The approved wording change does not alter line breaks or
  markup.
- Only the approved Korean `Texto` cell at ID 14039 changed in this batch.
- Before this batch: 555 accepted, 1,330 `not an issue`, and 2,273 uncertain.
  After this batch: 556 accepted, 1,331 `not an issue`, and 2,285 uncertain
  (4,172 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edit is
  `878fcb8196701fc5389b1097cc1acc26ff6b2fb3d189e640f32a9e23987771d0`.
- Patch application had changed the edited record's line ending. Restoring
  the original CRLF and reversing the approved text substitution in memory
  reproduces the preceding recorded hash exactly:
  `4fb8ede7a7a4ba20c7a160d781ee68baefd3261687fe0cb14d1a7549de80a337`.
- No other bytes in the CSV changed in this batch.
- The generic CSV parser is not used because the working corpus contains
  malformed multiline/quoting forms. Range key/order and structural checks
  were compared with the preliminary report.
- Resume at ID 14050; 51,085 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
