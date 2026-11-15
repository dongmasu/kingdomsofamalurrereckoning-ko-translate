# Lua Script Extraction and Re-Encoding

- Date: 2026-11-15.
- Scope: extract recognized Lua-family payloads from every regular file in
  `references/data/unpacked/`, validate unchanged reconstruction, and check
  whether script literals provide direct localization evidence.
- Status: structural extraction and exact no-edit re-encoding passed for this
  corpus snapshot. This did not decompile or execute the full script corpus.

## Tools and Preservation

The reusable tools are:

- `tools/lua_resource_codec.py`: shared parsers, extraction, verification,
  and re-encoding logic.
- `tools/extract_lua_scripts.py`: extract and verify payloads.
- `tools/reencode_lua_scripts.py`: write reconstructed container copies to a
  separate output directory, or run read-only verification.
- `tools/index_lua_localization_literals.py`: index exact printable ASCII
  runs matching English `default` text.

The scanner reads source assets without modifying them. Extracted payloads
and their manifest are under the Git-ignored
`work/zh_cn/audit/lua-script-extracted/`. Re-encoded copies, if requested,
are written separately under the ignored audit output directory. Do not run
the re-encoder against a source directory or treat these outputs as game
assets ready for installation.

## Corpus Results

| Measure | Count |
| --- | ---: |
| Regular files scanned | 12,337 |
| Exact `1b 4c 75 61` signatures | 13,268 |
| Standalone BXML payloads | 5,362 |
| BXML payloads nested in `.batch` records | 4,240 |
| `.batch` Lua script records | 3,666 |
| Recognized payload occurrences | 13,268 |
| Containers containing recognized payloads | 606 |
| Unclassified signatures | 0 |

Each manifest occurrence includes its container path, payload offset and
length, payload hash, and kind. The counts distinguish standalone BXML,
BXML nested inside another batch record, and length-delimited Lua script
records in the `klua` batch. They are counts of framed payload occurrences,
not counts of functions, callbacks, or executed scripts.

## Validation

- `python3 tools/test_lua_resource_codec.py` passed 6 tests.
- `python3 tools/test_lua_localization_literals.py` passed 3 tests.
- `python3 -m unittest discover -s work/zh_cn/audit -p 'test_*resource_containers.py'`
  passed 11 tests.
- `python3 -m unittest discover -s work/zh_cn/audit -p 'test_probe_ffq35_lua.py'`
  passed 6 tests.
- `python3 tools/extract_lua_scripts.py --check` passed: 13,268 occurrences,
  606 containers, byte-identical no-edit reconstruction, and zero
  unclassified signatures.
- `python3 tools/reencode_lua_scripts.py work/zh_cn/audit/lua-script-extracted --check`
  passed with the same round-trip result.
- `python3 tools/index_lua_localization_literals.py --check` passed for the
  maintained exact-literal index.
- The review-ledger `source_fingerprint` field was refreshed for the 16
  changed Lua-reviewed IDs and each now matches the current four-language
  rows.
- `python3 work/zh_cn/audit/analyze_resource_containers.py --check` passed for
  all six maintained resource indexes.
- `python3 work/zh_cn/audit/probe_ffq35_lua.py --check` passed for the pinned
  sample; neither result extends bytecode interpretation beyond that sample.

The no-edit test proves that the recognized payloads can be placed back into
their source containers without changing any of the 606 container bytes.
It does not validate arbitrary edited bytecode, game runtime behavior, or
compatibility with other game builds. Original extracted assets were not
edited.

The full review-ledger check still stops at `default:14712`, whose existing
user-edited Korean text has a stale fingerprint. That row was deliberately
preserved; its fingerprint was not changed to force the global check to pass.

## Translation Evidence and Scoped Updates

The maintained literal index records exact printable-string matches against
English `default` source text. At the configured 25-character minimum it
contains 48 rows: 40 from `credits_win` and eight from other scripts. A
read-only minimum-length-1 scan found 7,632 exact matches. All 16 IDs listed
below have an exact literal match in `credits_win`, which supports treating
them as role/production labels but does not show whether the script executes
or displays them. A literal match does not establish a dialogue key,
speaker, scene, or playback order. No localization-key byte sequence was
found in the payload scan.

Lua-assisted review updated these exact `default` labels in the active
Korean CSV: `8786`, `9064`, `9581`, `9639`, `9893`, `9993`, `10172`,
`10426`, `17594`, `18413`, `18518`, `18616`, `18666`, `27496`, `47123`,
and `64017`. This is a scoped label batch, not authorization for global
replacement or a conclusion that every candidate script string is
player-visible.

### Four-Language Revalidation of the 16 Credit Labels

Each listed ID was compared across the same-ID English, Japanese, Chinese,
and active Korean `default` rows in
`src/csv/{en_us,ja_jp,zh_cn}/locatexts_<locale>.koalocatext_default.csv`
and `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv`. Japanese is
identical to English for all 16 labels; it was still checked, but supplies no
separate localized wording or voice/register evidence for these credit
titles. The Chinese entries below were used as supporting evidence, not as
authority over English meaning.

| ID | English / Japanese | Chinese | Korean | Revalidation |
| ---: | --- | --- | --- | --- |
| `8786` | `Compliance QA Testers` | `合规QA测试者` | `규정 준수 QA 테스터` | Meaning retained. |
| `9064` | `Additional Music` | `额外音乐` | `추가 음악` | Meaning retained. |
| `9581` | `Business Development Manager` | `业务发展经理` | `사업 개발 관리자` | Role meaning retained. |
| `9639` | `Other Voices` | `其他声音` | `기타 성우` | Korean identifies the people credited; supported by the credit-label context. |
| `9893` | `Sr. Director North America QA` | `资深北美QA总监` | `북미 QA 선임 이사` | Seniority, region, and QA role retained. |
| `9993` | `Localization Production` | `本地化制作` | `현지화 제작` | Meaning retained. |
| `10172` | `Quality Assurance Testers` | `质量保证测试员` | `품질 보증 테스터` | Meaning retained. |
| `10426` | `Developer Relations` | `开发者关系` | `DevRel` | Keep the established industry role label; see the scoped decision below. |
| `17594` | `Sr. Tools & Web Lead` | `资深工具和网络主管` | `도구 및 웹 선임 책임자` | Seniority, areas, and lead role retained. |
| `18413` | `Security Analyst` | `证券分析师` | `보안 분석가` | Keep the English security meaning; Chinese uses the distinct financial term “securities analyst.” |
| `18518` | `Senior Interactive Designer` | `高级互动设计师` | `선임 인터랙티브 디자이너` | Meaning retained. |
| `18616` | `Lead Quality Assurance Tester` | `首席测试人员` | `수석 품질 보증 테스터` | QA detail follows English; `수석` is consistent with the Chinese lead rendering and the parallel `Lead QA Tester` at `57677`. |
| `18666` | `Sr. QA Manager` | `资深QA经理` | `QA 선임 관리자` | Seniority and QA management role retained. |
| `27496` | `VP Functionality QA` | `功能性质量管理副总监` | `기능 QA 담당 부사장` | Keep `부사장` for `VP`; other game-credit `Vice President` titles use the same Korean title. |
| `47123` | `Senior Database Administrator` | `高级数据库管理员` | `선임 데이터베이스 관리자` | Meaning retained. |
| `64017` | `Online Services Testers` | `网络服务测试员` | `온라인 서비스 테스터` | Meaning retained. |

The comparison found no further Korean CSV corrections for this batch. In
particular, the Chinese wording at `18413` is not a reason to change the
Korean: `Security Analyst` and the Japanese source both retain “security,”
while `证券` specifically denotes securities. This is recorded as an
exact-key source discrepancy in the translation exceptions. The credit
context supports interpreting `Other Voices` as voice performers at
`9639`, but does not prove runtime display. The `VP` rendering at `27496`
also agrees with Korean entries such as `20182` (`Vice President, Marketing`
→ `마케팅 부사장`) and `38442` (`Vice President, Business Development`
→ `사업 개발 부사장`).

All 16 existing review-ledger `source_fingerprint` values validate against
the current English, Japanese, Chinese, and Korean rows. No fingerprint or
translation row was changed during this revalidation.

At `default:10426`, the source label is `Developer Relations`. The Korean
decision is `DevRel`, the established industry role label, rather than the
literal `개발자 관계`. English and Japanese retain `Developer Relations`;
the earlier uncertainty about whether to translate this label is superseded
only for this key. Korean industry usage of `Developer Relations (DevRel)` is
also documented by [Toss Tech](https://toss.im/career/article/53401).

At `default:27496`, the source is `VP Functionality QA`. The initial
`기능 QA 부사장` was revised after user review to `기능 QA 담당 부사장`:
`VP` expands to `Vice President`, and `담당` clarifies the title's relation
to the QA function. The credit-script literal provides role context, but
does not establish runtime display; the prior visibility uncertainty remains
open. The same `부사장` rendering is used for other English `Vice President`
credit titles, including IDs `20182` and `38442`. See the
[VP definition](https://dictionary.cambridge.org/dictionary/english/vp).

Other printable string candidates were not translated solely because of a
script hit. Internal identifiers, brand or organization names, keyboard
labels, incomplete fragments, and strings without a sufficiently clear
meaning remain unchanged or unresolved. Keep dialogue attribution and
runtime visibility unknown unless separate evidence establishes them.

## Reproduction

```sh
python3 tools/extract_lua_scripts.py
python3 tools/extract_lua_scripts.py --check
python3 tools/reencode_lua_scripts.py work/zh_cn/audit/lua-script-extracted
python3 tools/reencode_lua_scripts.py work/zh_cn/audit/lua-script-extracted --check
python3 tools/index_lua_localization_literals.py
python3 tools/index_lua_localization_literals.py --check
```

The extraction and index commands regenerate ignored payload outputs and
maintained indexes respectively. `--check` modes are read-only.
