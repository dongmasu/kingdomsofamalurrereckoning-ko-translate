# Sequential `default` Revalidation: IDs `500`-`749`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `500`-`749`; add only IDs that had no current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 196 new IDs were reviewed and recorded. Existing ledger records in this
  range were kept intact and not counted again.
- One correction candidate and three evidence-limited holds were identified.
- The pass checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and line breaks/runtime markers. UI, objective,
  item, book, and other non-dialogue text was judged according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidate

This is an ID-scoped proposal, not an approved edit:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `642` | Naturalness | `민감한 상품` is an awkward Korean rendering in this merchant UI message. Consider `구매 전에는 일부 상품을 미리 살펴볼 수 없습니다!`; verify whether the source's “sensitive goods” is intended as a joke before finalizing. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `517` | Speech level | Japanese `じゃあね` is casual, while Korean `잘 가라, 필멸자여` is markedly elevated. The key has no supported speaker attribution; hold rather than infer a voice change. |
| `570` | Meaning | `Flame Locus` is rendered as `화염 집중 지대`; Japanese calls it a flame mark and Chinese a flame trace. The exact game effect is not established by these strings, so hold the term. |
| `602` | Speech level | Japanese `何か用か？` is direct and plain, while Korean `도와드릴까요?` is service-polite. A service interaction could justify the Korean, but the key-level scene and speaker are unknown; hold. |

## Source and Structural Checks

- Exact-English duplicate groups in this range (`588`/`611` and `677`/`731`)
  have identical Korean translations.
- English, Japanese, Chinese, and Korean line-break counts match throughout
  the range. Runtime-variable order and display-wrapper placement/count are
  preserved; localized text inside wrappers naturally differs by language.
- IDs with existing ledger records were not rewritten or assigned duplicate
  records.

## Newly Recorded IDs

The 196 new ledger rows are:

`501`, `502`, `503`, `504`, `505`, `507`, `508`, `509`, `510`, `511`, `512`,
`513`, `514`, `516`, `517`, `519`, `520`, `522`, `523`, `524`, `525`, `526`,
`527`, `528`, `529`, `530`, `531`, `532`, `533`, `534`, `535`, `536`, `538`,
`539`, `540`, `541`, `542`, `543`, `544`, `545`, `546`, `548`, `550`, `551`,
`552`, `553`, `554`, `555`, `557`, `558`, `560`, `562`, `563`, `564`, `565`,
`566`, `567`, `568`, `569`, `570`, `572`, `573`, `574`, `575`, `576`, `578`,
`579`, `580`, `581`, `584`, `585`, `586`, `590`, `591`, `592`, `593`, `594`,
`595`, `596`, `598`, `600`, `601`, `602`, `603`, `604`, `605`, `606`, `607`,
`608`, `609`, `610`, `611`, `612`, `613`, `615`, `616`, `617`, `618`, `619`,
`620`, `621`, `623`, `627`, `628`, `629`, `631`, `633`, `634`, `635`, `636`,
`638`, `639`, `640`, `642`, `643`, `644`, `646`, `647`, `649`, `650`, `651`,
`652`, `653`, `654`, `656`, `657`, `660`, `662`, `663`, `664`, `665`, `666`,
`668`, `669`, `670`, `671`, `672`, `674`, `675`, `676`, `677`, `678`, `679`,
`680`, `683`, `685`, `686`, `687`, `688`, `689`, `690`, `691`, `692`, `694`,
`695`, `696`, `697`, `698`, `699`, `700`, `702`, `704`, `706`, `707`, `708`,
`709`, `710`, `713`, `714`, `716`, `717`, `718`, `720`, `721`, `722`, `723`,
`724`, `725`, `726`, `727`, `728`, `729`, `730`, `731`, `732`, `733`, `737`,
`738`, `739`, `742`, `743`, `744`, `745`, `746`, `748`, `749`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
