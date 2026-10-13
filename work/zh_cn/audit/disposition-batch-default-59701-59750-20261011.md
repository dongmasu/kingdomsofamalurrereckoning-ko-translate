# Disposition Batch: `default` IDs 59701-59750

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, markers,
  numeric values, and recorded structure. These are working dispositions,
  not independent final linguistic approval.
- One accepted correction, 37 `not an issue` IDs, and 13 uncertain findings.
  ID 59703 has an accepted clause correction and a separate unresolved
  place-name question; the register therefore contains 51 finding
  dispositions covering 50 unique IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17864 | 59703 | `교수대 끝에는 신이 머문 적이 없지만, 그렇다고 그 이름으로 선행이 베풀어지지 않았다는 뜻은 아니야.` | `교수대 끝에 신이 있었던 적은 없지만, 그렇다고 그 이름으로 선행이 베풀어지지 않았다는 뜻은 아니야.` | English says there was never a god at Gallows End; Chinese agrees. `신이 머문 적이 없다` implies a god existed but did not dwell there. The correction restores the source's local absence while preserving the paradox and following clause. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17865 | 59703 | The clause correction is accepted, but the canonical Korean place-name form for Gallows End remains a separate terminology question. |
| D-17865 | 59705 | Snaketail's river/disease identity and the formal name/category of Motus Mining Interests need lore context; preserve the reported symptoms, timing, count, containment, and reputation concern. |
| D-17865 | 59708 | `King of the House` and “this medium” remain context-dependent; the House may specifically mean House of Sorrows. |
| D-17865 | 59709 | Capitalized Orison may be a named rite or generic prayer/ceremony; do not normalize without setting context. |
| D-17865 | 59719 | English leaves the object of “lifting mine” unresolved; Korean adds `무게`, which is plausible but not established by the source. |
| D-17865 | 59722 | The sermon argument and five-section structure are retained, but Authority, Mitharu's order, Hexes, and the religious register require terminology context. |
| D-17865 | 59723 | The causal sequence and private stronghold are preserved; Maid terminology and the exact title/name relationship remain provisional. |
| D-17865 | 59725 | Two sentries and safe passage are retained; the canonical named-place rendering of Shadow Pass is unresolved. |
| D-17865 | 59732 | Isolated UI label `Clear` may mean complete, remove, or purify; the exact game context is unavailable. |
| D-17865 | 59734 | The relationship and power-jealousy turn are preserved; the setting-specific office/title `Scion` remains unresolved. |
| D-17865 | 59735 | Faeblades and the discovery label are retained, but the item/quest-label structure and House of Sorrows name require glossary context. |
| D-17865 | 59745 | The lesson's observation/preparation/duality argument and line structure are retained; institutional and rank terms, including Scholia Arcana and Savant, remain provisional. |
| D-17865 | 59750 | The prison “dirt” and escape-artist quip are preserved; exact idiomatic force depends on scene context. |

## Not an Issue

Decision D-17866 records these 37 IDs: 59701-59702, 59704, 59706-59707,
59710-59718, 59720-59721, 59724, 59726-59731, 59733, 59736-59744, and
59746-59749. These rows preserve evident meaning, voice, marker/value
identity, and structure. At 59741, the large Diplomacy variable and gold
icon remain in order; at 59746, the dagger combo cap of five is retained.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain the 50 target IDs
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked source-keyed questions for the officer/soldier comparison,
  Gallows End, Snaketail/Motus Mining, Bisarane/House/medium, Orison,
  lifting technique, the PART VI sermon, Maid/Castle Windemere, Shadow
  Pass, Scion, Faeblades, the Diplomacy price, the Scholia Arcana lesson,
  and the escape-artist quip.
- Embedded-newline counts match; ID 59722 retains nine and ID 59745 retains
  eight embedded newlines across locales. At 59741 the price variable and
  gold icon retain their identity and order. The dagger combo cap remains 5.
- Pre-edit CSV SHA-256:
  `ab2e48c9068c3afe99c271bfb3fe90a61b5f4a8f68fd96df130067b85c870880`.
- Post-edit CSV SHA-256:
  `6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`.
  Byte comparison against the backup confirms only the ID 59703 `Texto`
  cell changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59701/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `ab2e48c9068c3afe99c271bfb3fe90a61b5f4a8f68fd96df130067b85c870880`).

D-17864 records one accepted correction, D-17865 records 13 uncertain
findings, and D-17866 records 37 `not an issue` IDs. Direct register
totals: 1,740 accepted, 13,415 `not an issue`, and 11,375 uncertain
(26,530 dispositions, including the separate linked finding at 59703);
next D-17867.

Resume at `default` ID 59751; 5,384 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
