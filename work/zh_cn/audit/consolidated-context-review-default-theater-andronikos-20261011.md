# Consolidated Context Review: Theater of Andronikos

- Date: 2026-10-11.
- Scope: previously uncertain standalone labels at `default` IDs 25579,
  27217, 29959, and 31112.
- Method: compare all five locale files by ID, then check repeated venue
  usage and prior accepted decisions. English controls meaning; Japanese
  informs voice/register; Chinese is supporting evidence.
- Result: D-18241 reclassifies four existing uncertain keys as
  `not an issue`. No CSV cells changed.

## D-18241: Standalone Venue Labels

| ID | English | Japanese | Chinese | Active Korean |
| ---: | --- | --- | --- | --- |
| 25579 | `Theater of Andronikos` | `アンドロニコスの劇場` | `安德罗尼克斯剧院` | `안드로니코스 극장` |
| 27217 | `Theater of Andronikos` | `アンドロニコスの劇場` | `安德罗尼克斯剧院` | `안드로니코스 극장(Theater of Andronikos)` |
| 29959 | `Theater of Andronikos` | `アンドロニコスの劇場` | `安德罗尼克斯剧院` | `안드로니코스 극장` |
| 31112 | `Theater of Andronikos` | `アンドロニコスの劇場` | `安德罗尼克斯剧院` | `안드로니코스 극장` |

The four English rows are the same standalone named venue. Japanese and
Chinese independently identify it as Andronikos's theater; all four Korean
cells preserve both the person's name and the theater category. The optional
English parenthetical at 27217 is retained as-is and does not establish a
global bilingual-display rule.

Repeated full-text context calls the theater an excellent establishment
(ID 21370) and describes it as the site of spiritual plays (ID 20166).
Accepted D-6269 and D-6611 already find the same Korean venue rendering
adequate in those contexts. The uncertainty at ID 50964 about the
corpus-wide canonical spelling is not resolved here; this decision only
finds no row-level meaning defect in these four aligned labels.

## Integrity and Checkpoint

- No `Texto` cell changed; active default SHA-256 remains
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- No backup was required because the active CSV was not edited.
- D-18241 reclassifies four existing uncertain keys without recounting other
  entries.
- Cross-resource totals through D-18241: 1,920 accepted, 23,074
  `not an issue`, and 13,528 uncertain (38,522 total); next D-18242.
- These are working dispositions, not independent final linguistic
  approval. Canonical name/display policy remains open elsewhere.
