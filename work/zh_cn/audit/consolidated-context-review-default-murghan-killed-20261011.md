# Consolidated Context Review: `Murghan killed`

- Date: 2026-10-11
- Scope: previously uncertain `default` IDs 13711 and 15438, reviewed together
  across English, Japanese, Japanese-derived Korean, Chinese, active Korean,
  neighboring IDs, and prior Murghan terminology decisions.
- Result: D-18211 narrows both uncertainties but retains their `uncertain`
  disposition. No Korean CSV cells changed and no keys were recounted.

## Evidence

Both IDs have the same exact localized strings:

| English | Japanese source | Japanese-derived Korean | Chinese source | Active Korean |
| --- | --- | --- | --- | --- |
| `Murghan killed` | `殺したマーガン` | `머건 처치` | `鱼怪已击杀` | `머건 처치` |

The English fragment does not name an agent. Japanese and Chinese express
Murghan as the killed target, and Korean `머건 처치` preserves that target
and the killing event without adding an agent. The phrase therefore does not
support the earlier concern that Korean invents who killed the Murghan. The
concise Korean noun phrase is compatible with a kill-status label, but these
rows alone do not establish whether the runtime presents a counter, completion
label, heading, or another UI form.

The neighboring IDs do not resolve that presentation context: ID 13711 is
between `Ettinmere` and a long Cecil Tearscotter journal entry; ID 15438 is
between dialogue and a threat about the wood. Those record neighbors are not
evidence that the labels share either scene. Related translations vary
between a creature-like `Murghan` term and generic fish monsters, while prior
decisions D-293, D-315, D-427, D-592, and D-1259 leave Murghan's taxonomy and
canonical Korean spelling open. Consequently, the target/event relation is
resolved, but the Korean creature-name form remains uncertain.

## Verification

- IDs 13711 and 15438 were checked by `ID_Linha` in all five files. Each key
  occurs once in each file and both IDs carry the exact strings shown above.
- The two labels contain no runtime markers or embedded line breaks.
- No active Korean CSV was edited. Its SHA-256 remains
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- Cross-resource totals remain 1,910 accepted, 22,969 `not an issue`, and
  13,643 uncertain (38,522 unique dispositions). D-18211 links to the two
  existing uncertainty records and does not count them again; next decision:
  D-18212.

These are working dispositions, not independent final linguistic approval.
