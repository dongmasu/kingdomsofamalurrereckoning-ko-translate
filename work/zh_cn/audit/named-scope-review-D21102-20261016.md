# D-21102: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21102 (2026-10-16).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>29, "not-an-issue"=>21}.
Groups: {"person:livia-fenan"=>17, "person:capstan-odvar"=>10, "person:colbanus"=>3, "person:cora-banick"=>10, "person:holden-lafayette"=>6, "person:elwa-brond"=>4}. Last reviewed key: default:36704: / person:cora-banick.
Next batch: D-21103; first unreviewed indexed key: person:capstan-odvar / default:37801:.
Indexed matches: 32573; accepted=21469, excluded=2203, needs-context=42, not-an-issue=8839, uncertain=20.
Remaining unreviewed indexed matches: 42, in 42 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `aafafe22c00282aba039eab721444f5a614d502b1d1b337d33c4a719061ddaaa`.
- default: `179a454bf5e593ca0d3a64e00beff240211e815610ae5fe9d783e904061a33b1`.
Last batch pre-edit backups and byte validation:
- base: 1 cells; pre `57e808d03b735a6c08469e0fedbad8f2ad01e2ea7122044e922a6185c8244b9c`; post `aafafe22c00282aba039eab721444f5a614d502b1d1b337d33c4a719061ddaaa`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21102/locatexts_zh_cn.koalocatext_base.csv`.
- default: 28 cells; pre `7c11f5392798e90e30620e58dd487dd19a2dca17dcc1c08598a64a90c46dde2a`; post `179a454bf5e593ca0d3a64e00beff240211e815610ae5fe9d783e904061a33b1`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21102/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 1 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 aafafe22c00282aba039eab721444f5a614d502b1d1b337d33c4a719061ddaaa
default: PASS 28 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 179a454bf5e593ca0d3a64e00beff240211e815610ae5fe9d783e904061a33b1
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `57e808d03b735a6c08469e0fedbad8f2ad01e2ea7122044e922a6185c8244b9c`; post `aafafe22c00282aba039eab721444f5a614d502b1d1b337d33c4a719061ddaaa`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21102/locatexts_zh_cn.koalocatext_base.csv`.
- default: 28 cells; pre `7c11f5392798e90e30620e58dd487dd19a2dca17dcc1c08598a64a90c46dde2a`; post `179a454bf5e593ca0d3a64e00beff240211e815610ae5fe9d783e904061a33b1`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21102/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `b91fe3c4fa2c5dbcf970b7a014a08a014ce4db58175b52c096db40488f0323b3`.
Occurrence index: 32573 rows; SHA-256 `ccd1bfe7a9ee0085ddb064e669cd0dc9fbb91342f06762f1c03075af1cde6480`.
Proper-name glossary: 850 entries; SHA-256 `08c5f7cd13c1b371a78590f8b42eae93c4a169832e1daf05d14eef006803fb30`.
Report: `work/zh_cn/audit/named-scope-review-D21102-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21102-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21102.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Focused Name Evidence

This discovery package continues in D-21103: 92 distinct source-aligned row
keys, seven new people, and 54 accepted cell changes in total. Both batches
were independently compared against English, Japanese, and Chinese.

- Colbanus: use `콜바누스(Colbanus)` consistently. Three source labels name
  the same person; Japanese `コルバナス` and Chinese `柯尔巴努斯` support
  identity, while the Korean majority establishes the editorial standard.
  This is not a claim that the English recording was examined.
- Livia Fenan: use `리비아 페난(Livia Fenan)` and source-local `리비아(Livia)`
  or `페난(Fenan)`. Japanese `リヴィア・フェナン` and Chinese `利维亚·费南`
  corroborate the selected spelling. The preliminary preparer used 페넌;
  independent linguistic review corrected that proposal before any CSV edit.
  Keep complete `Pledgeshield Fenan` and `Pledgeshield Livia Fenan` labels
  atomic. The base locker and default 4983 are changed only in this new
  person's name span; other previously reviewed entities remain untouched.
- Cora Banick: use `코라 배닉(Cora Banick)`, with source-local short labels.
  Default 15183 changes only the name. D-4626's historical contract context
  is not rejudged. The ledger's old description of default 35124 as Cora's
  journal is not supported by its actual source, which concerns Keska;
  default 35124 was excluded from this discovery and left unchanged.
- Holden LaFayette: preserve `홀든 라파예트(Holden LaFayette)`, short Holden
  and LaFayette, and all prior team/dialogue findings.
- Elwa Brond, Fiona Terane, and Capstan Odvar retain their established full
  Korean names with English pairs. Do not create global aliases for Elwa,
  Fiona, Brond, or Odvar. Elwa's second mention in default 33910 is paired
  only within that explicitly identified sentence. Capstan is supported as
  the Motus security chief; the separate Ambassador Odvar is not merged.

The official manual's PDF pp. 7-8 supplies faction-quest, Warsworn, and
dialogue context, not authoritative spellings for these seven NPCs. Prior
entity/key dispositions are preserved; these counts are not a global
translation tally.
