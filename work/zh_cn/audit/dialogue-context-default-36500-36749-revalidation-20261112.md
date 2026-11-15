# Sequential `default` Revalidation: IDs `36500`-`36749`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; the
  four resources have the same ordered ID set.
- Rechecked 64 existing ledger entries and reviewed the other 186 in-range
  IDs. Findings are review proposals, not approved translation edits.
- No translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `36504` | Meaning / naturalness | The epitaph's `May her charge be remembered` is a wish that her attack be remembered, not an instruction to the reader. Korean `그녀의 돌격을 기억하라` changes it to an imperative. Consider `그녀의 돌격이 기억되기를` while preserving the following statement that her death was not in vain. | High |
| `36525` | Name / format | Pell Grandy is paired with English, but the same sentence leaves Wil Donnall as `윌 도널`. Add `(Wil Donnall)` without changing the casual supply instruction. | High |
| `36532` | Meaning / naturalness | `Baser emotions` refers to lower or more instinctive impulses; Korean `저급한 감정` can sound like a judgment that the emotions are vulgar. Japanese uses a foundational/primitive sense. Consider `본능적인 감정` or another wording suited to the speaker's warning. | Medium |
| `36549` | Name / format | `Great House - Abergawein` names the house, but Korean `대가문 - 아베르가웨인` omits the English. `Abergawein Residence` at `13598` already pairs the family name. Pair the source name here while retaining the label layout. | High |
| `36563` | Name / format | Retain the existing candidate: the objective names `Adept Ignas`, but `숙련자 이그나스` has no English pairing, unlike related references. Consider `숙련자 이그나스(Adept Ignas)` in the objective. | High |
| `36581` | Name / format | The named enemy type `Viper Swordmaster` appears only as `바이퍼 검술사`, unlike comparable enemy labels such as `Ettin Brute` at `36597`, which is paired. Consider `바이퍼 검술사(Viper Swordmaster)`. | Medium-high |
| `36618` | Meaning / naturalness | English says the Fae occupy a `delicate position`; Japanese and Chinese also describe a nuanced or delicate situation. Korean `위태롭다` instead asserts a precarious or endangered position. Consider `미묘한 처지` or an equivalent that preserves the original ambiguity. | Medium-high |
| `36620` | Name / spelling | Retain the existing candidate: the English source spells the deity `Lupoku`, while the Korean parenthetical has `Lopoku`. Correct the source spelling to `(Lupoku)`; the Korean transliteration may remain pending a separate name decision. | High |
| `36627` | Title / format | The monument label `Monument: Second Burning` is rendered `기념비: 두 번째 대화재` without the complete English label. Pair the title while preserving the compact UI-label form. | Medium-high |
| `36628` | Name / format | This record uses the named company `Brad and Cergren Traders`. The same exact English heading occurs at `11917`, `15183`, and `58806`; the Korean forms vary, and only `11917` includes the English. Align the group to the established `브래드 앤 서그렌 상회(Brad and Cergren Traders)`. | High |
| `36643` | Name / format | The label `Maiwen's parents` contains a named character but Korean `메이웬의 부모` omits the source form. Other references identify her as `Maiwen Wyvyrn-Gifre`. Consider `메이웬(Maiwen)의 부모` for this shorter source label. | Medium-high |
| `36646` | Naturalness | `Warsworn form two spearheads on the field` describes two attacking vanguards. Korean `전장에 두 개의 창끝 대형을 이룬다` is a literal and unclear formation description; Japanese and Chinese describe splitting into two groups / vanguard units. Consider `두 개의 선봉 부대로 나뉘어 전장에 나선다`. | Medium-high |
| `36669` | Meaning / name | English and Japanese say `bard of the Gastyr court`, but Korean calls this the `가스티르 가문(House Gastyr)` court bard. This changes the named institution and adds a house not stated in the line. Consider `가스티르 궁정(Gastyr court)의 음유시인`. | High |
| `36716` | Meaning | The source says the severed bond would have given the speaker power to save everyone, and that the addressee took that power away. Korean says only that the power could have saved everyone and was taken away, omitting that it would have been given to the speaker. Restore that causal clause without changing the threat. | High |
| `36728` | Naturalness | The standalone source is `Salutations`; Japanese uses a formal greeting. Korean `아, 안녕하세요` adds an unsupported hesitation that makes the greeting sound uncertain. Consider `안녕하세요` or another concise greeting appropriate to the speaker. | Medium |
| `36738` | Meaning | English `Too much magic` and Japanese/Chinese describe an excessive amount of magic. Korean `마법도 지나치게 강해` changes quantity into strength. Consider `마법도 너무 많아` while retaining the speaker's discomfort. | High |
| `36742` | Meaning / reference | Retain the existing candidate: `brethren` means fellow Alfar combatants here, supported by Japanese `同胞`. Korean `형제들` may imply male siblings; consider the previously proposed `동족들`. | High |
| `36748`, `39122` | Title / format | `Sprite Infestation` is an exact-English duplicate title at both IDs, and both Korean rows use `스프라이트 창궐` without the source title. Pair the complete title consistently at both IDs. | High |

The two exact-English title groups were checked in full. `Brad and Cergren
Traders` occurs at `11917`, `15183`, `36628`, and `58806`; the Korean heading
at `11917` is the consistent paired form proposed above. `Sprite Infestation`
occurs at `36748` and `39122`; the Korean strings already match, and only the
missing source-title pairing is proposed.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `36642` | Speech level | Retain the existing hold. Korean offers a service politely while Japanese is plain. The multi-NPC asset does not map this key to a speaker or establish the customer-service relationship; do not normalize its register based on asset proximity. |
| `36700` | Name / format | `The Forest of War` is title-cased, but the isolated key does not establish whether it is a named location requiring an English pairing or a generic heading. Keep `전쟁의 숲` provisionally; do not infer the UI context. |

## Repeated Sources And Structure

- Sixty-seven exact-English duplicate groups (1,384 corpus rows) touch this
  range. Korean strings match within every full-string group.
- Seven entries contain embedded line breaks: `36588` (8), `36590` (4),
  `36628` (14), `36635` (2), `36647` (3), `36651` (2), and `36724` (1).
  Counts match across all four languages, for 34 breaks per locale.
- Normalized runtime-token and markup signatures match except for localized
  wrapper placement at `36625`: Korean agrees with English and Chinese, while
  Japanese places a localized display wrapper on the other side of a
  `{LINE_SPACE}` marker. No token loss or malformed Korean structure was
  found; this source-layout difference is not treated as a translation error.
- Asset membership remains grouping evidence only. No speaker, addressee,
  branch, or playback order is inferred from asset association or ID order.
- The range has 18 candidate IDs, two evidence-limited holds, and 230 IDs
  without a new finding. Three candidates and one hold were already in the
  ledger; existing dispositions were retained. The cross-range duplicate
  follow-ups add references for `11917`, `15183`, `39122`, and `58806`.
- The 186 newly recorded in-range IDs plus new cross-range reference `58806`
  bring the ledger to 44,215 of 65,135 unique `default` IDs (67.88%), leaving
  20,920. Sequential coverage reaches `36749`; next is `36750`-`36999`.
- The 530-asset and 65,135-ID catalogs reproduce exactly; all 44,215
  four-language ledger fingerprints validate; all nine index tests and the
  audit-scoped diff check pass. Translation CSVs remain unchanged.
