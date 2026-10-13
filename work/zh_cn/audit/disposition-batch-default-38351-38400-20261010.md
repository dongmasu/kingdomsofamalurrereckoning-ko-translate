# Disposition Batch: `default` IDs 38351-38400

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, one `not an issue`, and nine uncertain.
- CSV changes: IDs 38372, 38373, and 38388 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38352 | `of Ice Attenuation` / `얼음 약화의` | Uncertain: this is a clipped equipment modifier without its preceding item name, so its full Korean syntax cannot be established. |
| 38353 | House of Sorrows / `슬픔의 가문` | Uncertain: the named faction is represented, but existing audits show conflicting Korean forms and no approved canonical name. |
| 38356 | `Keep up.` / `서둘러.` | Uncertain: English and Japanese can mean “don't fall behind,” while Korean says “hurry”; the short line lacks movement context. |
| 38367 | laboratory secrets / “They must be controlled.” | Uncertain: the English antecedent is ambiguous among secrets, gnomes, and the laboratory operation; Korean leaves it implicit. |
| 38369 | Mark of Flame / `화염의 징표` | Uncertain: +40% Burning Damage and +20% Mark of Flame damage are preserved, but the ability's canonical Korean name remains open. |
| 38372 | Testament / `유언장` | Accepted: change to `테스타먼트(The Testament)가 무슨 일을 꾸미는지`. The capitalized source is the named Testament entity, not a will/document; Japanese and Chinese describe its schemes/organization, and ID 38081 (D-12375) establishes this proper-name rendering. This does not resolve the separate Testament/Belen identity conflict. |
| 38373 | Zungar name / `그 이름의 그늘` | Accepted: change the metaphor to `그 이름의 칼날에서 벗어날 수 없었어`. English explicitly refers to the dagger's edge, Chinese retains its blade edge, and Japanese likewise keeps the cutting-tip image before adding its own relationship interpretation. Preserve the name-without-it conclusion. |
| 38382 | Crows / `까마귀` | Uncertain: capitalization and the team-combat rule suggest a named group, but its canonical Korean term remains unresolved. |
| 38383 | repeated `{3}` chance marker / `{1}` mana marker | Not an issue: both `{3}` occurrences and `{1}` remain in English order; Japanese alone reorders markers. The English source itself repeats the chance wording, so no Korean-only correction is supported. |
| 38386 | Cthongeny / `크통게니` | Uncertain: this clipped label is transliterated in Japanese but interpreted as “Greater Titan” in Chinese; its category and canonical form remain unknown. |
| 38388 | Balor coerced by the Tuatha / `구슬린` | Accepted: change to `투아사가 자기들 편에서 싸우도록 강요한`. English says `coerce`, Chinese explicitly says force, and Japanese describes controlling/manipulating Balor; `구슬린` weakens the coercion. |
| 38393 | `his calling` / `그가 택한 길` | Uncertain: Korean retains support for Hystis but reduces “calling” to a chosen path; Japanese and Chinese differ on necessity versus mission/vocation. |
| 38397 | Initiate / `수련생` | Uncertain: this standalone capitalized label may be a formal rank or a generic novice; organizational/UI context is absent. |
| Other rows in IDs 38351-38400 | Dialogue, names, values, objectives, items, and labels | Not an issue: the preliminary comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- Decision D-12375 at ID 38081 establishes `테스타먼트(The Testament)` for
  the English proper name while leaving the Testament/Belen identity question
  open. The correction here reuses only that name form.
- Existing notes leave House of Sorrows, Mark of Flame, Crows, Cthongeny, and
  Initiate terms open. No global terminology normalization is authorized.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38351-38400 once and in
  identical order across all four locales, with matching line-break counts.
- Runtime-marker identities and counts match. Japanese alone reorders
  `{1}` and `{3}` at ID 38383; Korean preserves English order. The +40% and
  +20% values at ID 38369 are unchanged.
- Ruby's standard CSV parser cannot parse the active Korean file as a whole:
  with the semicolon delimiter and liberal parsing enabled, it stops at
  physical line 11029 with `CSV::MalformedCSVError` (“Unquoted fields do not
  allow new line”). No whole-file parse or round-trip is claimed. The three
  changed rows were verified directly as single physical records.
- Before this batch, the active CSV SHA-256 was
  `c89b1a77fe34767ab2366daa1334945e920c5650eb4138255b9c01ff0ffa5136`.
  After the three approved text-cell edits it is
  `de125f40a1bbe1ae4e3b89a2b02edfa2ed285a846a7523da28b417809c937426`.
- UTF-8 BOM, 72,046 CRLF endings, 39 bare-LF endings, and zero bare-CR
  endings are preserved. No immutable source file was edited.

## Checkpoint

Disposition is complete through ID 38400. Resume at ID 38401; 26,734
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38401-38450-preliminary.md`. The next unused decision ID is
D-12445.
