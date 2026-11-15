# Sequential `default` Revalidation: IDs `3750`-`3999`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `3750`-`3999`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 170 new IDs were reviewed and recorded. The other 80 IDs in this interval
  already had ledger records and were left unchanged.
- Seven correction candidates and one evidence-limited hold were identified.
  Candidates are proposals, not approval to edit the translation CSV.
- Meaning, Korean naturalness, register where applicable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `3768` | Naturalness | The Korean ends with `대가를 치렀다는 말`, which reads as an awkward report fragment after `사실인가 봐`. English, Japanese, and Chinese state that Crilgarin and Grim tried to depose the Hierophant and paid the price. Consider `크릴가린(Crilgarin)은 돌아오지 않았어. 사람들이 하는 말이 사실인가 봐. 그녀와 그림(Grim)이 대사제(Hierophant)를 끌어내리려다 대가를 치렀대.` | High |
| `3770` | Format / localization | The `{*1[Upgrade]}` wrapper is preserved, but its display text remains English in Korean while Japanese and Chinese localize it. Other Korean ability-upgrade entries use localized labels. Consider `{*1[업그레이드]}` without changing the wrapper or the description. | High |
| `3842` | Meaning | `Mitharans` denotes people from Mitharu, not believers; `드물지` also reverses the source's “rare” meaning. Consider `나는 게일 크로싱(Gale Crossing)에서 태어나 자랐어. 크라운홀드(Crownhold) 성문 밖에서 사는 미타란(Mitharan) 사람은 드물어.` | High |
| `3867` | Meaning | `We emerge together` means emerging/appearing together, not advancing together. Chinese supports the emergence reading; Japanese instead says moving forward. Consider `우리는 함께 모습을 드러낸다.` while preserving the poem's four-line structure. | High |
| `3902` | Meaning / naturalness | `A fine day to you` is a day-wish, as supported by Japanese and Chinese, but Korean `안녕하세요` changes it to a generic hello. Compare the parallel day-wish at ID `3896`; consider `좋은 하루 보내세요.` | High |
| `3938` | Terminology | `Fulcrum` is an equipment component and the established Korean form is `지렛목`, not `지렛점`. Consider `완벽한 미타란(Mitharan) 약탈자의 지렛목.` | High |
| `3996` | Terminology / consistency | The sentence calls `Blacksmithing` `대장장이 기술`, while the established skill name is `대장기술` (for example, ID `64148`). Consider changing only that term to `대장기술`; the four ingredient names, quantities, and list structure are already consistent with related entries. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `3831` | Meaning / terminology | English `the Sorrows`, Japanese quoted `ソロー`, and Chinese `悲灵` point to a setting-specific referent, but this sentence alone does not establish whether it is a people, entity, or force. Korean `비탄의 힘` commits to “force.” Keep the current wording provisional until a source-supported referent is established; do not infer it from the asset link. |

## Duplicate and Structural Checks

- Thirty-nine exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (717 rows total). Every group
  has identical Korean text.
- Embedded line-break counts match across English, Japanese, Chinese, and
  Korean for all 170 new IDs.
- Runtime and formatting wrappers are retained. ID `3770` is the only
  localized-marker content difference: the wrapper is identical, while
  Japanese and Chinese translate the visible `Upgrade` label and Korean does
  not.
- The 80 pre-existing ledger records were not rewritten or duplicated.
  Asset associations do not establish a per-key speaker or playback order;
  unsupported attribution and order remain unknown.
- The updated Echostone convention is already present at ID `3788`; `Echo
  Stone` and `Echostone` are standardized as `에코스톤(Echostone)` under the
  later terminology decision. The source-based `Pilager` spelling at ID
  `3790` was retained rather than silently corrected.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
