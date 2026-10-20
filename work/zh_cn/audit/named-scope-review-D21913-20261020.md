# D-21913: Cassyne Name-Form Consistency

Date: 2026-10-20

## Finding

The standalone name at `default:22870` is `Cassyne`. Korean was
`캐신(Cassyne)`. The same English name appears in the contextual sentence at
`default:3303`; Korean already uses `캐사인(Cassyne)`, Japanese uses
`キャサイン`, and Chinese uses `卡辛`. The exact repeated source name and
the established Korean rendering support `캐사인(Cassyne)`.

Correct only `default:22870` to `캐사인(Cassyne)`. No dialogue meaning,
entity identity, glossary entry, or occurrence-index entry is changed.

## Candidates Checked Without Changes

- `The Silent Highwayman` at `default:22792` is the heading immediately
  before a verse. English, Japanese `静かなる追いはぎ`, Chinese `沉默的强盗`,
  and Korean `고요한 노상강도` all preserve the title's meaning; no character
  name or clear name-related error is established.
- `Viper Daggermaster` at `default:22817` is rendered compositionally as
  `독사 단검의 달인`. Japanese and Chinese preserve the same title components;
  no established personal-name form or clear content error supports a change.
- `Wivi Rasmussen` at `default:22851` is rendered
  `위비 라스무센(Wivi Rasmussen)`, consistent with Japanese
  `ウィヴィ・ラスムセン` and Chinese `维维·拉斯穆森`. The same Korean full
  name also appears at `default:20863` and `default:51987`.

## Focused Verification

Manifest: `translation-correction-D21913.tsv`.

The byte-preserving editor and independent verifier passed for this single
target across 65,135 ordered rows. BOM, line endings, row order, non-target
bytes, and inverse reconstruction were preserved. No full format/residual
audit, inventory rebuild, package build, or in-game test was run.

Default SHA-256:
`bc1a07c71966a530608d6f89e78cc434c91c1527e6b4e8cdc87b1d0d1b779517` →
`440f2dc04ca2249dce2cf4dc72cee369a0e18440b590de639e39ba68f986601b`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21913/locatexts_zh_cn.koalocatext_default.csv`.
