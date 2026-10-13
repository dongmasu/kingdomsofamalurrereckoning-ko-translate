# Consolidated Context Review: Kerchief and Idylla Debate

- Date: 2026-10-11.
- Scope: `default` IDs 65005 and 65100, linked to D-18156 and D-18159.
- Compared English, Japanese source and Japanese-derived Korean, Chinese,
  active Korean, and repeated corpus context by ID.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Decision D-18251

### ID 65005: `kerchief`

English gives a worn kerchief made from the special cloth alchemists use to
handle reagents. Japanese calls it a scarf, Chinese and the Japanese-derived
Korean draft call it a handkerchief, and active Korean uses `손수건`. Related
English item rows 52094 and 59244 also identify the same kerchief, while
62199 explicitly uses `handkerchief`; their active Korean descriptions use
`손수건`. Row 3099 presents a locale variation (`kerchief` / Japanese scarf /
Chinese headscarf), so the exact garment style is not established, but the
current Korean does not assert a specific shape and remains a reasonable
cloth-item rendering in this context.

Reclassify ID 65005 from uncertain to `not an issue`. No evidence supports
changing this cell or forcing a corpus-wide garment term in this row.

### ID 65100: Onesimos and Thais

English, Japanese, Chinese, the Japanese-derived Korean draft, and active
Korean agree that Onesimos leads Idylla's school of philosophy, asks the
player to debate his scholars, and names Thais as the first opponent. The
player is instructed to find Thais and accept his challenge. Repeated
objectives at IDs 9982, 12206, 54073, and 61202 identify Thais and Onesimos
in the same debate sequence. The current `오네시모스`, `타이스`, and
`콜로세인` preserve those identities; the Kollossae person form was already
corrected under D-18158.

Reclassify ID 65100's remaining uncertainty from D-18159 as `not an issue`.
The locale-specific transliteration variants do not alter the identified
characters or quest objective. No CSV correction is supported.

## Verification

- Both IDs were compared across English, Japanese source, Japanese-derived
  Korean, Chinese source, and active Korean.
- Repeated debate and item-description rows were checked by exact IDs.
- No runtime marker, embedded line break, numeric value, or structural
  exception was found in either row.
- No active Korean CSV cell changed; no backup was needed.
- Active default SHA-256 remains
  `bd80c7003f0fb1785206d94c61b703e1d47c7529d399664e647c0821e28a84a5`.
- Cross-resource totals through D-18251: 1,927 accepted, 23,085 `not an
  issue`, and 13,510 uncertain (38,522 unique keys). The next decision is
  D-18252.
- These are working dispositions, not independent final linguistic approval.
