# D-21912: Phinne Name-Form Consistency

Date: 2026-10-20

## Finding

Three rows refer to the same character and debate objective:

| Key | English | Japanese | Chinese | Previous Korean |
| --- | --- | --- | --- | --- |
| default:22594 | Phinne | フィンネ | 菲尼 | 피네(Phinne) |
| default:33549 | Debate Phinne | フィンネと討論する | 与菲尼争论 | 피네와 논쟁하기 |
| default:52313 | Phinne | フィンネ | 菲尼 | 핀(Phinne) |

The established Korean character spelling is `핀네`, used in the aligned
dialogue/objective rows at default:802, default:31515, and default:47324.
Correct the three inconsistent source-local displays to `핀네(Phinne)`,
`핀네(Phinne)와 논쟁하기`, and `핀네(Phinne)`, respectively. The objective's
debate meaning is unchanged. No person identity, alias, glossary entry, or
occurrence-index entry is added.

## Candidates Excluded

- `Ding` at default:22598 remains the unresolved D-7090 hold; no new evidence
  distinguishes a sound cue from a name.
- `Daeges` at default:22713 and `Cadyr` at default:22773 retain their prior
  source-local decisions; they are not recounted.
- `Sorrogweth Fungus` at default:22614 already preserves the established
  Korean name and fungus meaning. The later spelling correction at
  default:52861 does not establish a missing-name or content error here.
- `Criet` at default:22650 already preserves its exact source spelling.
  `Philomena Goodchild` is correctly paired in the objective and narrative;
  the narrative's `Mithros` disposition is already terminal.
- `Primal Brazier` at default:22787 retains the source meaning in Korean and
  aligned Japanese/Chinese; no content error is demonstrated.

## Focused Verification

Only the three listed `Texto` cells were edited. The byte-preserving editor
and independent manifest verifier were run for these targets only. No full
format/residual audit, inventory rebuild, package build, or in-game test was
run. No glossary, occurrence index, or release artifact changed.

Manifest: `translation-correction-D21912.tsv`.

The editor and independent verifier passed for three cells across 65,135
ordered rows; BOM, line endings, row order, non-target bytes, and inverse
reconstruction were preserved. Default SHA-256:
`0460bda6c88965fe2fdc5d9c2afe1486d318b393f86e5a1ac0dce2869eb1dc08` →
`bc1a07c71966a530608d6f89e78cc434c91c1527e6b4e8cdc87b1d0d1b779517`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21912/locatexts_zh_cn.koalocatext_default.csv`.
