# D-21901: Arcane Carrack Classification

Date: 2026-10-20

## Finding

The standalone `Arcane Carrack` labels at `default:8608`,
`default:10287`, and `default:22801` have Korean renderings `비전의 대형
범선`, `비전 카락선`, and `비전 카락선`, respectively. English, Japanese
(`魔法のキャラック船`), and Chinese (`奥术大帆船`) identify a magical
carrack/large sailing vessel.

New contextual evidence at `default:47542` lists `Arcane Carrack I`
alongside other ship classes (`Alfar Warship`, `Red Legion Sloop`,
`Gnomish Trireme`) and explicitly describes it as a mage ship. This supports
reading the phrase as a vessel class, not a unique named ship. Both Korean
renderings convey an arcane sailing vessel; the two `비전 카락선` instances
are more specific, but the broader `비전의 대형 범선` is not shown to be a
content error by the available locale evidence.

Retain all three labels and do not register `Arcane Carrack` as a unique
vessel entity. This new context resolves the category ambiguity recorded at
D-2420 (`default:8608`) and D-2944 (`default:10287`) only; it does not
establish an authoritative canonical Korean ship-class spelling. D-7157's
`not an issue` disposition at `default:22801` remains unchanged.

## Outcome

Read-only, content-focused review. No CSV, glossary, occurrence index, or
release artifact changed. No format/residual audit, package build, or
in-game validation was run.
