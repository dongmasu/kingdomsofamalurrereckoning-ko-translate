# D-21916: Petraun and Frea Almar Name Review

Date: 2026-10-20

## Findings

- `Petraun` at `default:23148` is paired with its exact English name.
  Japanese `ペトラウン` and Chinese `派特劳恩` support Korean
  `페트라운(Petraun)`. No conflicting Korean occurrence or clear spelling
  error was found.
- `Frea Almar` appears in the death notice at `default:17946`, the Alfar Army
  record at `default:23153`, and the cousin notification at `default:30363`.
  Korean consistently uses `프레아 알마르`; Japanese `フレア・アルマー` and
  Chinese `弗雷亚·阿尔玛` support the same form. D-9846's broader canonical
  name hold remains unresolved; this consistency check does not establish a
  better Korean form or supersede that hold.

## Existing Candidates Excluded

- `Mitharu` at `default:22934` already has its accepted form
  `미사루(Mitharu)`.
- `Ventrinio` at `default:23043` is already aligned under D-20610.
- `Gavroche` (`default:23067`) and `Creth` (`default:23071`) have existing
  row-level dispositions.
- `Docent Del Gadra` (`default:23131`) and `Vonne Gortan`
  (`default:23145`) are already covered by D-21546 and D-20440/D-20565.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
editor, format/residual audit, inventory rebuild, package build, or in-game
test was needed.
