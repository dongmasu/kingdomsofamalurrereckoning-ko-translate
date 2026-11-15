# Sequential `default` Revalidation: IDs `3250`-`3499`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `3250`-`3499`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 196 new IDs were reviewed and recorded. The other 54 IDs in this interval
  already had ledger records and were left unchanged.
- Seven correction candidates and seven evidence-limited holds were
  identified. Candidates are proposals, not approval to edit the translation
  CSV.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `3269` | Meaning / format | The display label `destiny` remains English inside both localized display markers, while the surrounding sentence is Korean and the related Destiny UI uses `운명`. Consider translating both marker contents as `운명`, preserving `{*1...}` and `{LINE_SPACE}`. | High |
| `3303` | Meaning / naturalness | English `fearsome` and Chinese `可怕` convey an intimidating quality; Korean `위엄 있으면서도` emphasizes dignity, following Japanese `威厳`. Consider wording such as `위압감 있고 아름다운` to retain the source nuance. | Medium |
| `3312` | Terminology / meaning | The team-ownership wording is already correctly `네 팀`. However, `gladiator pit` is `검투장`, while the same phrase at ID `296` is `검투사 대기장`; this line specifically says the team is waiting there. Consider aligning the location to `검투사 대기장` or another established waiting-area term. | High |
| `3330` | Format | English, Japanese, and Chinese each have four embedded line breaks; Korean has three, merging one passage break. Review the Korean layout against the five-line source structure and restore the missing break without altering the text. | High |
| `3351` | Meaning / naturalness | The line asks what the quoted term `Fatesworn` means, but Korean translates the term as `운명에 맹세한 자들` before asking. Japanese retains its phonetic name. Consider asking about `Fatesworn` itself, such as `‘Fatesworn’이 무슨 뜻이지?`, while retaining the established rendering elsewhere. | Medium-high |
| `3414` | Naturalness | `유익 효과 범주` is an awkward label for the category of beneficial buffs. Consider a more idiomatic form such as `이로운 효과 범주`, preserving the explanation that follows. | Medium |
| `3447` | Naturalness | `독에 중독되어 죽어 가는` is understandable but cumbersome. Consider a smoother equivalent such as `독에 당해 죽어 가는`, without changing the separate `Fae of Sorrows` name. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `3268` | Meaning / terminology | `Chausses` is a specific, uncommon leg garment; the poem describes a chain garment, but the four sources do not establish a precise Korean equipment term. Keep `각반` unchanged pending stronger item evidence; do not conflate it with the separately approved `Leggings = 레깅스`. |
| `3288` | Meaning | English leaves the antecedents of `his house` and `it` unclear. Japanese and Chinese also differ on whether the referent is Dren's household or a physical/named house. Keep the current family reading provisional. |
| `3314` | Meaning / terminology | `Flawless Mitharan Restoring Grip` appears to be an item or crafting label, but the sources do not establish what `Grip` or `Restoring` denotes in this compound. Keep the current wording pending item-category evidence. |
| `3364` | Meaning / entity | `Sorrows` is rendered as a force in Japanese and Korean, but as beings/spirits in Chinese; English does not fully settle whether these are entities, a force, or both. Keep `비탄의 힘(Sorrows)` provisional. |
| `3388`, `3498` | Meaning / place name | `St. Odwig's Mission` and `St. Eadric's Mission` are rendered as `선교원`, while Japanese identifies each as a monastery and Chinese differs between a mission and a mission station. Keep both location types provisional. |
| `3397` | Meaning / place or organization | `Aron Excavations` may name an excavation/mining site or an organization; Japanese supports a site and Chinese a mining company. Keep `채굴사` pending context that establishes the referent. |

## Duplicate and Structural Checks

- Fifty exact-English duplicate groups touching the newly reviewed IDs were
  checked across the full `default` corpus (1,000 rows total). Every group has
  identical Korean text.
- Line-break counts and runtime/layout-token identities and order matched
  across English, Japanese, Chinese, and Korean for all 196 newly recorded
  IDs except `3330`, where Korean has one fewer line break. Localized text
  inside display markers was normalized for this check.
- The 54 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links remain evidence about containing files only; no
  per-key speaker or dialogue order was inferred.
- The older candidate concerning the embassy as `chambers` at ID `3489` was
  not carried forward: the current Korean says `거처`, which expresses the
  residence sense.
- The former `your team` concern at ID `3312` was not carried forward: the
  current Korean says `네 팀`; only the waiting-area term remains a candidate.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
