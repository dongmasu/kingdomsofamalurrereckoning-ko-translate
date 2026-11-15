# Sequential `default` Revalidation: IDs `13000`-`13249`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Seventy-four existing ledger records were retained after their
  four-language fingerprints were verified. The other 176 IDs were compared
  and added.
- Seven newly recorded IDs have correction candidates. Ten retain
  evidence-limited findings; no candidate and hold overlap.
- Of the 176 new records, 120 have indexed quest-asset links and 56 do not.
  Three IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `13000` | Format / stat label | The English gives `+13 Physical Damage with Longswords`; Korean `+장검 물리 피해 13` places the plus before the whole label and leaves the value without its sign. Prefer a clear stat form such as `장검 물리 피해 +13`, preserving the two-line description and the separate `+30%` bonus. | High |
| `13031` | Title / format | `Castellan Grian Shane` is translated as `그리안 셰인(Grian Shane) 성주`, so the rank is present in Korean but absent from the English pairing; the following `Oathblade Gwyn Anwy` includes its rank in the pairing. Include `Castellan` with Grian Shane in the parenthetical without changing the journal account. | Medium |
| `13041` | Title / format | The English is `Maire, Queen of Cups`, while Korean is `컵의 여왕 메어(Maire)`. The same exact English occurs at 19 IDs and all 19 currently share the same Korean wording. The title/person relation was established in the grouped Maire review; consider pairing the full source title, e.g. `컵의 여왕 메어(Maire, Queen of Cups)`, consistently across that exact-English group if approved. | Medium |
| `13072` | UI terminology | The visible `{*1[Passive]}` label is rendered as `[지속 효과]`, while the same source label at `13201` is `[패시브]`; the Korean manual and the accepted UI-label decisions at `3205` and `13201` support `패시브`. Align only the displayed label and retain the wrapper and line break. | Medium-high |
| `13120` | Meaning | English says the followers “never speak upon entering service.” Korean adds `이곳에서`, locating the start of their service at this place, which the row does not state. Remove that location while retaining that they remain silent after beginning to serve. | Medium |
| `13140` | Meaning | English says `my sister Lila` without specifying older or younger. Japanese says older sister, while Chinese says younger sister; Korean `언니` chooses the Japanese-only age distinction. Recast the sentence to preserve the sister relationship without assigning relative age. | High |
| `13208` | Naturalness | `난 그 돈을 받을 시간이 있어` is a stiff literal rendering of the merchant's quip about having time to take the buyer's money. Recast it as a natural, teasing offer to accept the sale, without changing the conditional that the player must have money. | Medium-high |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `13108` | Meaning / description | `A brutally honest, deliberately crude weapon` may be figurative praise for bluntness or a description of the weapon's intentionally crude design. The references characterize it differently; retain the current reading pending item context. |
| `13188` | Referent / title | `The Court` and `the Maid` depend on House of Ballads context; the Japanese and Chinese renderings identify the institution and title differently. Do not substitute a specific institution or epithet from this line alone. |
| `13191` | Title / referent | `The Widow Comes` may be a title, a named figure's arrival, or a generic widow; the isolated label does not identify its UI role. |
| `13194` | Terminology | `Fae Cairns` does not establish whether the cairns are graves, monuments, or a named collectible/location type. Retain the current term pending contextual evidence. |
| `13207` | Item terminology | The item-name fragment does not establish the equipment type meant by `Bindings` or the function of `Frosted`; the other locales do not resolve it. |
| `13230` | Referent | `That moniker` has no antecedent in this row. The Korean preserves the general reference; do not replace it with a guessed title. |
| `13235` | Poem / syntax | The relation between Tala-Rane, the two heirs' shares, and the later destruction is compressed and differs across the references. Korean retains the poem's three-line structure and broad sequence. |
| `13238` | Gameplay value / source conflict | English, Chinese, and Korean give 60% for 20 seconds; Japanese gives 45% for 16 seconds. Keep the English-led Korean values, but record the source discrepancy rather than silently normalizing it. |
| `13240` | Title / referent | `Loremaster of Ballads` may be a formal House of Ballads office or a more general title; the isolated line does not settle the Korean title construction. |
| `13243` | Meaning / terminology | `Fae bewitchments` can refer broadly to Fae enchantments or more narrowly to bewitching effects. Japanese and Chinese do not establish that Korean's `현혹 마법` is the canonical category. |

Previously recorded findings were retained without recounting: `13015`
remains a Gallery terminology candidate, `13148` retains its naturalness
candidate for `down on his luck`, and `13176` remains uncertain because the
referent of `they` is not established. IDs `13062`, `13103`, `13114`, `13190`,
and `13196` were already closed as `not-issue` in their linked asset reviews;
their four-language fingerprints and dispositions remain unchanged.

Four preliminary candidates were checked against the current active rows and
are not reopened: `13037` now includes the weaponsmith's mastery, `13106`
now says the gods have abundant time, `13189` now says Lord Payne has spoken
rather than calling it a command, and `13220` now renders ordinary life
without narrowing it to mortal life.

## Duplicate and Structural Checks

- Forty-three exact-English duplicate groups touch the 176 new IDs, covering
  598 rows across the corpus. Korean text matches in every group, including
  the 19-row `Maire, Queen of Cups` group.
- Runtime placeholders, named variables, layout tokens, and wrapper
  identities/order match across English, Japanese, Chinese, and Korean.
  Localized display text inside wrappers differs as expected.
- Logical line-break counts match across all four languages for all 176 new
  IDs.
- Nine Korean strings contain 28 existing embedded CRLF breaks: `13000` (1),
  `13072` (1), `13155` (6), `13160` (5), `13201` (1), `13226` (3),
  `13235` (2), `13237` (8), and `13238` (1). Their existing bytes were
  preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
