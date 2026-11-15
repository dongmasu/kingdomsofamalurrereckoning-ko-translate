# Sequential `default` Revalidation: IDs `3500`-`3749`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `3500`-`3749`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 188 new IDs were reviewed and recorded. The other 62 IDs in this interval
  already had ledger records and were left unchanged.
- Six correction candidates and nine evidence-limited holds were identified.
  Candidates are proposals, not approval to edit the translation CSV.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `3522` | Terminology | Capitalized `Oracles` refers to a group receiving institutional respect, but Korean uses the broad `예언자들`. The established glossary distinguishes `Oracle` from `Prophet`; consider `신탁자들` to preserve that distinction. | High |
| `3553` | Naturalness / meaning | `신들에 관해 말하게 하지 마` is stiff and can sound like a literal passive command. The English idiom and Japanese support a direct warning not to start the subject; consider `신들 얘기는 꺼내지도 마`, while retaining the threat and `기도는 됐어, 친구` tone. | High |
| `3576` | Naturalness | `나 같은 직책에 있는 사람은 처리할 일이 많아` is understandable but stilted for `one of my station has many obligations`. Consider a more conversational equivalent of “someone in my position has many duties,” such as `나 같은 지위에 있는 사람은 처리할 일이 많아서 말이야`. | Medium |
| `3587` | Meaning / naturalness | The dark joke about the speaker's name and the circumstances of his birth is unclear in Korean, which calls the name `근사` and leaves the likely grim wordplay implicit. Japanese explicitly explains the name's ominous sense; consider making the irony and the mother's death read together, without silently correcting the English source typo `circumvents`. | Medium |
| `3653` | Terminology | `longlegs` is rendered `긴다리`, while the same in-world epithet at ID `53146` is `장다리(Longlegs)`. Consider aligning this taunt to the established form. | High |
| `3695` | Terminology / title | `Maid's true Champion` is rendered `진정한 용사`, while related uses call the role `챔피언` or `수호자`. This is explicitly an earned title, and another instance of the exact phrase at ID `40723` also differs. Consider using the established title form `챔피언` consistently for this role. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `3535` | Meaning / place name | `Vengeance` is capitalized, but the line does not establish whether it is an arena, event, venue, faction, or another destination. Korean preserves the name in parentheses; keep the Korean rendering provisional. |
| `3540` | Meaning / source contradiction | The English says Khamazandu's Crown was destroyed and also that it was forced back into its ancient prison. Japanese and Chinese do not resolve what was returned. Preserve the source contradiction rather than guessing its referent. |
| `3546` | Meaning / fragment | The line omits the subject of “Once common in Fae ‘prayer’” in all four sources. Keep the fragment as written until its preceding context identifies the object or practice. |
| `3592` | Format | Korean has 13 embedded line breaks, matching English; Japanese has nine and Chinese ten. The report's letter-like content is preserved, but the available references do not establish whether Korean should follow English segmentation or the more consolidated Japanese layout. Hold the layout decision. |
| `3639` | Terminology | Lowercase `henge` may be a generic stone structure or a setting-specific structure. Japanese transliterates it and Chinese describes a stone-circle structure; Korean uses `헨지(henge)`. Keep the term pending a corpus-level decision. |
| `3654` | Meaning / place name | Japanese identifies St. Odwig's as a monastery, while English says only `St. Odwig's`. This name is rendered `수도원` here but `선교원` in other `Mission` strings. Keep the location type pending reconciliation of the related entries. |
| `3706` | Meaning / source discrepancy | English `he's gone` and Japanese indicate the Healer is missing, while Chinese says he died. Korean's `사라졌어` follows the missing-person reading; retain it provisionally. |
| `3716` | Meaning / item terminology | `Flawless Mitharan Sage Grip` is an isolated equipment label. The sources do not establish the exact item-part sense of `Grip` or the modifier role of `Sage`; keep `현자의 손잡이` provisional. |
| `3721` | Meaning / terminology | `Binding` may mean bookbinding, magical binding, or sealing. Japanese and Chinese differ, and the isolated line does not resolve the service. Keep `결속` provisional. |

## Duplicate and Structural Checks

- Forty-seven exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (1,002 rows total). Every
  group has identical Korean text.
- Runtime/layout tokens are present with no loss. At ID `3666`, Japanese
  reverses `{1}` and `{2}` to fit its localized order; Korean matches English
  and Chinese. This is a language-specific ordering difference, not a Korean
  token omission.
- At ID `3592`, the line-break counts differ as described in the hold above.
  No other newly reviewed ID has a line-break or token-identity mismatch.
- The 62 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links remain evidence about containing files only; no
  per-key speaker or dialogue order was inferred.
- Earlier candidates already resolved in the active CSV were not reopened:
  the `{*1[Active]}` label at `3502` is localized, `3575` has clean spacing,
  `3628` expresses eluding people's notice naturally, and `3662` uses the
  natural `치욕을 당하는 꼴`.
- Previously reviewed IDs `3599` and `3726` were left unchanged.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
