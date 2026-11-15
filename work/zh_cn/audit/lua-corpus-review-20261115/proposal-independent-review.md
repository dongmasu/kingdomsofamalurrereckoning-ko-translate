# Independent Review Of Task6 Proposals

- Review date: 2026-11-15.
- Scope: correction proposals only in the three assigned key-review files; no
  unrelated retain rows were reviewed.
- This is a read-only linguistic review. Dispositions neither promote Lua
  evidence nor authorize translation CSV edits.

## Proposal Snapshot And Delta

The first proposal scan found five corrections: `base:891`, `base:3272`,
`default:19597`, `default:23006`, and `default:25934`. The refreshed scan
found four: `base:891`, `base:3272`, `default:19597`, and `default:25934`.
No new correction key had appeared at that refresh. The final post-write scan
found three: `base:891`, `default:19597`, and `default:25934`; no additions
appeared. Both `base:3272` and `default:23006` changed from proposed
correction to `retain` in their current files. `default:23006` remains
included below because it was a proposal at the first scan. The current
`base:3272` retain asserts that D-21506 covers the same exact key, but its
reference is variant `11` while the packet variant is blank; this independent
review does not endorse that retain and keeps the finding unresolved. These
snapshots predated completion of the full 2,656-key review; final dispositions
are recorded below.

Proposal-row locators at the first scan were:

- `base:891`: `key-review-decisions-0001-0018.jsonl#L155`
- `base:3272`: `key-review-decisions-0001-0018.jsonl#L220`
- `default:19597`: `review-decisions-0019-0036.jsonl#L61`
- `default:23006`: `review-decisions-0019-0036.jsonl#L187`
- `default:25934`: `review-decisions-0019-0036.jsonl#L304`

## Linguistic Review

| Key | Proposal at first scan | Independent disposition | Rationale and exact evidence |
| --- | --- | --- | --- |
| `base:891` | `로어스톤` | **Accept as provisional** | The packet has EN `Lorestone`, JA `ロアストーン`, ZH `智慧石`, KO `전승석`. This is the common object/category, not a uniquely named stone; the proposal’s “named lore object” wording is too strong, but the term correction is supported by D-133’s scoped `Lorestone = 로어스톤` decision. D-21766 records `base:891:11` as `not-an-issue` for proper-name identity and explicitly leaves `전승석`/`지식석` consistency to translation review; that variant-specific disposition is not treated as an exact ruling on this packet key (`variant=""`) or as a rejection of the terminology correction. Refs: `review-packet-0004.jsonl#L5`; `review-context-inventory.jsonl#L552-L572`; `decision-register-20261009.md#L13644`; `proper-name-short-label-dispositions-D21766.tsv#L2`. |
| `base:3272` | `월즈(The Wolds)` | **Unresolved** | EN `The Wolds`, JA `ウォルズ`, ZH `沃尔兹`, and KO `월즈 (The Wolds)` support the place and the proposed spacing. However, this packet key has `variant=""`, while D-21506’s prior occurrence and correction tooling identify `base:3272:11`. The available evidence does not establish that this prior variant row is the same key as the current packet row. Do not transfer the variant-11 ruling until that mapping is proven. The current worker row now says `retain` and calls D-21506 the same exact key; that claim is not supported by the packet’s key. Refs: `review-packet-0005.jsonl#L20`; `review-context-inventory.jsonl#L1017`; `proper-name-glossary.tsv#L1811`; `named-scope-review-D21506-20261017.md#L51-L60`; `review-wolds-black-atoll-D21506.rb#L58-L70`; current worker row `key-review-decisions-0001-0018.jsonl#L220`. |
| `default:19597` | `사투르닌(Saturnyn)과 맞서기` | **Accept as provisional** | EN `Confront Saturnyn`, JA `サタンニンと対決する`, and ZH `和萨图恩宁对峙` all describe confrontation. KO `대면하기` can mean meeting face-to-face but is less explicit about opposition; `맞서기` better preserves the confrontational force. Retain the existing Korean name pairing. The catalog leaves speaker assignment unknown, so this finding makes no speaker, voice, or sequence claim. Refs: `review-packet-0020.jsonl#L11`; `review-context-inventory.jsonl#L16978`; `dialogue-context-id-catalog.tsv#L19599`; `proper-name-glossary.tsv#L784`. |
| `default:23006` | `박학다식한 사람(Polymath)` | **Reject; retain** | The current packet is EN `Polymath`, JA `ポリマス`, ZH `博学者`, KO `만능가(Polymath)`. D-18528 explicitly found no row-level error and must not be overridden by a dictionary gloss. Its recorded Korean wording was the earlier `박학다식한 사람`; the later 2026-10-28 Fate-name follow-up standardized `만능가(Polymath)` and kept `Jack of All Trades` distinct. The proposed text would undo that later approved terminology choice without new key-linked evidence. The proposal was withdrawn from the refreshed correction set and now appears as `retain`. Refs: `review-packet-0022.jsonl#L37`; `review-context-inventory.jsonl#L33844`; `consolidated-context-review-default-23001-23050-20261011.md#L14`; `decision-register-20261009.md#L34151`; `release-20261028-followup.md#L16-L20`; current row `review-decisions-0019-0036.jsonl#L187`. |
| `default:25934` | `보조 프로듀서(Assistant Producer)` | **Accept as provisional; prior ruling conflict remains** | EN and JA both say `Assistant Producer`, ZH says `助理制作人`, and KO is `제작 보조`. The proposal preserves the producer role more specifically than the current wording, which can be read as production-assistant work. D-8483 previously retained `제작 보조`; this independent review does not silently supersede that exact-key ruling. An adjudicator must resolve the conflict before any edit. The Lua record is a parsed constant in `credits_win`, but has no established localization/display link. Refs: `review-packet-0025.jsonl#L4`; `review-context-inventory.jsonl#L36290`; `disposition-batch-default-25901-25950-20261010.md#L21`; `disposition-batch-default-26201-26250-20261010.md#L9-L10`; `decision-register-20261009.md#L22361`. |

## Evidence Limits And Missing Proof

- All five packet rows at the first scan had all four locale texts present. Each
  remained `exact_source_literal_candidate`; the packets report zero direct
  key mappings and zero supported static localization call-site mappings.
  Therefore none proves that its Lua literal is displayed or linked to the
  reviewed localization key.
- `base:3272` needs an authoritative mapping between the packet’s blank
  variant and the cited variant `11` before the D-21506 decision can support
  this exact key.
- Earlier partial worker files lacked required fingerprints or evidence
  references on some proposals. The completed 2,656-key files were
  subsequently validated against all 54 packets; each final row has current
  fingerprints and packet-available evidence references.
- The `default:25934` credit context identifies a candidate string occurrence,
  not a localization key or runtime display. The `default:19597` context does
  not establish speaker or dialogue order.
- No source/target CSV, source asset, extracted payload, existing ledger, or
  canonical reference was changed. No evidence level was promoted.

## Final Complete Proposal Review

- Review date: 2026-11-15.
- Scope: every proposal in the validated final outputs for packets `0001`-`0054`.
- Result: four proposals are independently supported as provisional text
  suggestions. They remain unactioned because all Lua matches are still
  candidates, not proven localization or display links.

| Key | Proposed text | Independent disposition | Prior-decision check |
| --- | --- | --- | --- |
| `base:891` | `로어스톤` | Accept provisionally | D-21766 addressed entity registration and deferred the `전승석`/`로어스톤` lexical question; D-133 supports `로어스톤`. This is not an entity or Lua-link claim. |
| `default:38785` | `가이아(Gaea)의 의복` | Accept provisionally for text review only | D20392 and the current occurrence glossary previously accepted `가이아(Gaea)의 예복` while recording deity-name alignment. The current English `Raiment`, Japanese `服`, and Chinese `衣` support the broader clothing term; retain the prior decision as provenance and require approval before changing the accepted wording. |
| `default:53659` | `총괄 아트 디렉터` | Accept provisionally | English/Japanese `Executive Art Director` and Chinese `执行美术总监` specify executive direction, while Korean `수석 아트 디렉터` says senior art director. No exact-key prior ruling was found; no other credit exception is generalized. |
| `default:61109` | `교차점의 수호자들(Crossing Keepers)과 대화하기` | Accept provisionally | D-21166 explicitly accepted the exact-key organization-span correction from `교차석` to `교차점`; the current CSV again has `크로싱`. The proposal restores only that scoped term and preserves the objective. |

The final full-key reviews leave `base:3272`, `default:19597`, and
`default:25934` unresolved because the cited prior rulings do not safely
support changing their exact current keys. `default:23006` is retained under
the later D-18528 and Fate-name decision. The earlier independent table above
records what was recommended at its earlier snapshot; these final
dispositions supersede those recommendations for reconciliation.

## Paths Read

- `PROJECT-AI.md`
- `TRANSLATION-ROLE.md`
- `docs/superpowers/specs/2026-11-15-lua-corpus-translation-review-design.md`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-instructions.md`
- `work/zh_cn/audit/lua-corpus-review-20261115/key-review-decisions-0001-0018.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-decisions-0019-0036.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/key-review-decisions-0037-0054.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0001-0018.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0019-0036.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0037-0054.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0004.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0005.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0020.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0022.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0025.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0034.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0045.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0051.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/review-context-inventory.jsonl` (cited rows only)
- `work/zh_cn/audit/lua-corpus-review-20261115/reconciliation/adjudications.jsonl`
- `work/zh_cn/audit/lua-corpus-review-20261115/reconciliation/reconciliation-summary.json`
- `work/zh_cn/translation-reference/glossary/proper-name-glossary.tsv`
- `work/zh_cn/translation-reference/glossary/proper-name-occurrences.tsv`
- `work/zh_cn/translation-reference/classification/dialogue-context-id-catalog.tsv`
- `work/zh_cn/translation-reference/exceptions/translation-exceptions.md`
- `work/zh_cn/translation-reference/exceptions/decision-register-20261009.md`
- `work/zh_cn/audit/proper-name-deities-D20392.tsv`
- `work/zh_cn/audit/proper-name-edits-D21166.tsv`
- `work/zh_cn/audit/proper-name-short-label-dispositions-D21766.tsv`
- `work/zh_cn/audit/named-scope-review-D21506-20261017.md`
- `work/zh_cn/audit/proper-name-discovery-definitions-D21506.tsv`
- `work/zh_cn/audit/review-wolds-black-atoll-D21506.rb`
- `work/zh_cn/audit/disposition-batch-default-25901-25950-20261010.md`
- `work/zh_cn/audit/disposition-batch-default-26201-26250-20261010.md`
- `work/zh_cn/audit/consolidated-context-review-default-23001-23050-20261011.md`
- `work/zh_cn/audit/disposition-batch-default-23001-23050-20261010.md`
- `work/zh_cn/audit/release-20261028-followup.md`
