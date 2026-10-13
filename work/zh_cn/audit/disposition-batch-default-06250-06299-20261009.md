# Disposition and Edit Batch: `default` IDs 6250-6299

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6250-6299.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twelve findings were dispositioned: one accepted, seven `not an issue`, and
  four uncertain. One accepted `Texto` cell was changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 6252 | `Duenna` | Defer whether the isolated word is a role or proper name. | D-1676: uncertain. |
| 6256 | `Lower` | Keep the low-setting label `낮음`. | D-1677: not an issue. |
| 6263 | `your worship` / `Archsage` | Keep the stammer and respectful address as `대현자님`. | D-1678: not an issue. |
| 6264 | `Travelers` | Defer the faction's canonical Korean name and bilingual style. | D-1679: uncertain. |
| 6269 | Meet Cydan in Bristlethorn | Keep the meeting instruction without adding a cave. | D-1680: not an issue. |
| 6272 | `SeekingBlade` | Keep the source-linked name without inferring an item category. | D-1681: not an issue. |
| 6275 | `What have you done to your house?` | Restore the question about what the addressee did to the house, not how it was built. | D-1682: accepted. |
| 6277 | Almain captive / `so we keep him` | Keep the statement that researchers retain him for study. | D-1683: not an issue. |
| 6287 | `these tunnels` | Defer singular-versus-plural treatment because Japanese and Korean use a collective singular. | D-1684: uncertain. |
| 6289 | `Siegebreaker` | Keep the named source reference and its inspirational role. | D-1685: not an issue. |
| 6296 | `the Isles` | Defer the canonical regional form; active Korean varies between `섬들` and `제도`. | D-1686: uncertain. |
| 6298 | `{1} cannot be remapped.` | Keep the localized UI meaning and variable marker. | D-1687: not an issue. |

## Applied Correction

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6275 | `자기 집을 어떻게 만든 거야?` | `네 집을 어떻게 한 거야?` | D-1682: correct the construction-method reading and retain the source's open “what have you done to it?” meaning. |

## Historical Audit Reconciliation

- Rechecked applicable source-keyed questions at IDs 6252, 6256, 6263-6264,
  6269, 6272, 6275, 6277, 6287, 6289, 6296, and 6298.
- The Japanese form at 6252 supports an attendant-role reading, but the
  isolated English label and Chinese transliteration do not establish whether
  it is a name or role.
- At 6263, the Korean honorific `대현자님` carries the deference expressed by
  the English vocative while avoiding a redundant second title.
- The singular tunnel network at 6287 remains plausible in Korean and
  Japanese despite plural English/Chinese. The proper-name form for the
  Isles at 6296 remains a corpus-wide terminology question.
- Historical candidate wording is evidence and does not authorize any
  correction beyond the accepted edit at 6275.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` IDs
  in identical order; IDs 6250-6299 are present in matching order.
- The accepted edit at ID 6275 changes no runtime marker, explicit line
  break, or numeric value. The `{1}` marker at ID 6298 is unchanged.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF/CR bytes.
- Only the approved `Texto` cell at ID 6275 changed in this batch.
- Active Korean `default` CSV SHA-256:
  `7f8301a9ec415434d158bbcc139bf3776909aeba7f8f130ce9d817f5ed781db9`
- Cumulative dispositions: 304 accepted, 476 `not an issue`, and 907
  uncertain. Resume at `default` ID 6300; 58,835 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology, combined-name consistency, and integrated voice
review remain open.
