# Proper-Name Resume Review: D-20834-D-20841

Date: 2026-10-15

## Verified Scope

This is a historical record of this continuation phase, not the current
global checkpoint. The current blocks in the four handoff documents take
precedence for active hashes, the latest batch, and the next D number.

| Batches | New full-name entities | Reviewed row keys | Edited cells | Retained |
| --- | ---: | ---: | ---: | ---: |
| D-20834-D-20836 | 10 | 115 | 76 default | 39 |
| D-20837-D-20838 | 13 | 93 | 1 base, 28 default | 64 |
| D-20839-D-20841 | 10 | 108 | 2 base, 79 default | 27 |
| Total | 33 | 316 | 186 | 130 |

All three resources were searched through the 73,430-row aligned inventory.
These entities have no applicable affix matches. Full-name registrations
are distinct from earlier component-name registrations; earlier keys and
historical global tallies were not recounted. No prior uncertainty was
reopened.

## Linguistic Review

English establishes each name and its local identity; the manifests retain
the exact Japanese and Chinese evidence. Full-name identity is established
by standalone labels and related dialogue, objectives, letters, epitaphs,
or memorial lists, not capitalization alone.

- Askel Thorin: `아스켈 토린`, `애스켈 소린` become `아스켈 소린(Askel Thorin)`, including the unchanged conditional ending `이라면`.
- Augra Tenet: `아우그라 테넷` becomes `오그라 테넷(Augra Tenet)`; source-backed Docent labels retain the complete title label.
- Benwick Athelm: `아셀름`, `아설름`, `아델름`, and `애덤` become the established `벤윅 애설름(Benwick Athelm)`.
- Cillian Keen: `킬리언`, `실리안` become `실리언 킨(Cillian Keen)`. Same-row short names remain `실리언(Cillian)`, not an invented full English name.
- Colm Alba becomes `콜름 알바(Colm Alba)`; Colm Bardan remains a separate registered person.
- Adeline Kirk, Aegar Dulfred/Madrith, Aewin Eghad/Rathgar, Audern Reis, Audra Firan, and Aura Hanri are reconciled against their labels and source contexts.
- Hillared Gastyr, Clyeth Arne, Apule Vire, Atheof Cergren, Cach Cranwyn, Eathe Dunbert, Camden Wulflac, Bridgette Malloi, Enconeg Holn, and Maire Ganan receive consistent full labels.
- The eight Cach expedition narratives retain their line breaks, surrounding narrative, and source-specific protagonist references. Repeated short Cach mentions are paired separately.
- Dolve Arne remains a place, not a substitute for Clyeth Arne. Family collectives, other people, and contradictory Eathe biographical claims are not rewritten by this name-only pass.

The official manual reference and extracted text were consulted for setting
and terminology context: PDF p. 1 for peoples and the Faelands, pp. 4/8 for
crafting, and p. 7 for factions and quest structure. The manual is not a
personal-name roster; its silence is neither a naming authority nor a
reason to retain a hold.

A separate read-only verifier reviewed all three discovery manifests and
their definitions before application. The editor applied only accepted
rows; the independent byte verifier checked each batch afterward.

## Draft-Generator Regression

The legacy `FULL_NAMES` branch matched a Korean full name but did not always
consume an already-present complete English label. This would append
`(Camden Wulflac)` twice at default IDs 10434, 41963, and 50208.
The error was found in the D-20839 proposal before any affected CSV edit.

`edit_full_name` now consumes an immediately following exact full-name
label. Regression fixtures cover Camden, Sephedra Wyll, Hrindi Zungar,
Janick Sisters, and legacy surname-only labels: two tests, seven assertions
passed. The three Camden rows became exact no-ops in the final manifest.
The active three-resource scan found no adjacent identical English labels.

## Validation

- The resume CSV hashes exactly matched the D-20833 handoff.
- Reverse verification D-20830-D-20841 passed: 263 default and four base edit events reconstruct the recorded pre-D-20830 hashes.
- BOM, exact mixed newline sequence, ordered keys/variants, row counts, target values, all non-target bytes, and inverse reconstruction against pre-edit backups passed for each edited batch.
- All 18 audit test suites passed, including the new full-label regression.
- At D-20841, validation passed for 611 entities and 22,304 active-aligned entity/row matches. No unreviewed indexed matches remained; the pre-existing 17 uncertain matches in 15 row keys were unchanged.
- Source/index residual comparison found zero missing keys and the five documented contextual Anwon extras. The sole uncovered bilingual-label hit is the already-reviewed Crudok idiom at default 3851, not an omitted monster label.
- Source CSVs were read-only. No PAK, PAK-derived resource, build, release, or publication operation was performed.

Overall proper-name discovery remains incomplete. The heuristic mixed-label
candidate file is a review aid, not a verified count of remaining names or
translation defects.
