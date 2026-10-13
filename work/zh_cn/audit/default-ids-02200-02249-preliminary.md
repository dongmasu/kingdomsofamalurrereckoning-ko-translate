# Preliminary Language Scan: `default` IDs 2200-2249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2200-2249.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked lore meaning, names,
  dialogue voice, and multiline structure.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2202 | 윈더미어의 시녀, 그녀의 시련. | Preserve the poem's short lines and threat, but review whether `Maid` is the named/lore-specific figure rather than an ordinary maid, and whether the Korean keeps the compact, rhyming ballad voice. | English capitalizes `Maid` and repeats the figure in the stanza; Japanese renders her as a fierce heroine/evil maiden, while Chinese says maiden. The Korean keeps the line breaks and central events but `시녀` may imply a domestic servant, and the Korean verse does not reproduce the source's rhyme. This repeats the historical question. | Medium |
| 2224 | 바얄라 티린(Bayala Tirin)은 ... 도시를 세웠다. | Correct the opening's agency only after a read-only finding is accepted: the source says Bayala Tirin saw her city built, not that she built it herself. Also verify the final line's double meaning and preserve all paragraphs. | English says “Bayala Tirin saw her city built”; Japanese likewise describes the city being built under her protection, while the active Korean makes Bayala the builder. The remainder preserves the account's broad chronology and five-paragraph structure. At the close, “Lyria, who gives all their fate, and takes all away” is intentionally compressed; avoid narrowing what Lyria takes away without context. | High |
| 2237 | 완벽한 미타란(Mitharan) 서리 손잡이 | Resolve the established Korean form of `Mitharan` and whether `Frosted` describes a surface finish, material, or magical property; keep the quality/material/component order consistent with related crafting names. | English identifies a flawless Mitharan frosted handle. Japanese and Chinese render the Mitharu/Mitharan element differently, and the active corpus already has multiple Korean spellings for Mitharan-related terms. The compound remains understandable but its name and modifier relationship are not settled. This repeats the historical question. | Medium |
| 2239 | 흑마법사/마녀 비무장 상위 항목 | Check whether this is an internal taxonomy/parent-node label and whether it is player-facing before smoothing the literal wording. | English, Japanese, and Chinese all include the technical `Parent` category term. Korean's `상위 항목` is a plausible data-hierarchy rendering, but the string may be debug or classification text rather than dialogue. | Low |
| 2242 | 낯선 이다. 낯선 이가 왔어! | Preserve the alarmed repetition while checking whether the present-tense announcement should remain present rather than past/resultative. | English says “A stranger comes!” and Japanese also uses a present arrival announcement. Korean's `왔어` changes this to “has come/came,” a small aspect shift in a shouted warning. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2202, 2224, and 2237
  against the active Korean and source locales. The Maid's title/poem voice,
  the Rathir-origin account, and the Mitharan crafting-name compound remain
  open; the agency shift at 2224 is a high-confidence candidate finding.
- Same-numbered historical `base` findings were kept separate from these
  poem, lore, and dialogue rows.

## Other Checks

- ID 2218-2219 keeps one consistent polite NPC register; the English leaves
  politeness less explicit, while Japanese also uses a courteous address.
- IDs 2224's line breaks and paragraph boundaries are preserved. No runtime
  tokens or numeric values were changed in the inspected range.
- The remaining inspected labels and dialogue had no additional
  high-confidence meaning shift in this pass.

## Batch Status

IDs 2200-2249 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
