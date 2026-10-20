# D-21908: Kalinotte Etrene Full-Name Label

Date: 2026-10-20

## Finding

The standalone title at `default:19005` is `Scholar Kalinotte Etrene`.
English, Japanese `学者カリノッテ・エトリーン`, and Chinese
`学者卡利诺特·艾特伦内` support the same scholar and complete name.
Korean was `학자 칼리노트 에트렌`, while the exact full name at
`default:52480` already uses `칼리노트 에트렌(Kalinotte Etrene)`.
The component labels at `default:24918` and `default:62429` likewise use
`에트렌(Etrene)` and `칼리노트(Kalinotte)`.

Correct only `default:19005` to
`학자 칼리노트 에트렌(Kalinotte Etrene)`. This aligns the source-local
full-name annotation with the existing exact full-name label. No global
alias or glossary/occurrence-index entity was added.

## Candidates Excluded

- `Jersey` (`default:18869`) remains under D-5960's unresolved context hold.
  The isolated label does not establish whether it denotes a place or garment;
  no Korean change was warranted.

## Focused Verification

The byte-preserving editor and independent verifier were run for this single
cell only. No full-format or residual audit, package build, or in-game
validation was run. The release artifact was not changed.

Manifest: `translation-correction-D21908.tsv`.
Backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21908/locatexts_zh_cn.koalocatext_default.csv`.
Default SHA-256:
`3ec84a35afab3392eb25abbab22411d91db82d5512cbd0d551ab925986fa123b` →
`0460bda6c88965fe2fdc5d9c2afe1486d318b393f86e5a1ac0dce2869eb1dc08`.
Both editor and independent verifier passed for one cell across 65,135
ordered rows; BOM, line endings, row order, non-target bytes, and inverse
reconstruction were preserved.
