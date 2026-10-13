# Disposition Batch: `default` IDs 56601-56650

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English,
  Japanese voice/register, Chinese supporting evidence, the preliminary
  scan, source-keyed historical notes, prior decisions, line breaks, runtime
  markers, and values. These working dispositions are not independent final
  linguistic approval.
- Two accepted corrections, 42 `not an issue` IDs, and six uncertain
  findings. English resolves the clear meaning issues at 56607 and 56626;
  source/lore terminology questions remain open at the six uncertain IDs.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56607 | `에테네(Ethene)의 의도가 여기 있다는 걸 아직도 모르겠나? 네 목적과 그녀의 목적을 아직도 모르는 건가?` | `이 일에서 에테네(Ethene)의 의도를 아직도 알아차리지 못했나? 네 목적과 그녀의 목적도 아직 모르겠나?` | English asks whether the listener sees Ethene's intent in the situation; the previous locative wording could say her intent is physically “here.” Japanese and Chinese support an intent/purpose reading. |
| 56626 | `돈으로 갚을게.($SQ151.bribe_value$ 골드)` | `돈을 줄 수 있어. ($SQ151.bribe_value$ 골드)` | English, Japanese, and Chinese offer payment. `갚을게` implies repaying an existing debt; the correction offers money and preserves the bribe-value variable. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56613 | Uncertain | `Midden` may be a named place or group, and the ritual/contextual force of `sullied` is not established by this isolated line. Keep the current wording pending lore context. |
| 56638 | Uncertain | Capitalized `Scion` may be the formal office/title rather than a generic successor; prior decisions leave this distinction and the Korean form unresolved. |
| 56640 | Uncertain | `Trellis` is capitalized as a location in English, while Japanese interprets it as an assembly hall and Chinese as a trellis. The referent is unsettled. |
| 56642 | Uncertain | The magical circle/prison and the exact sense of the priestess' breaking words need context. The current line retains the circle, prison, and words-only condition; no unsupported mechanism is added. |
| 56648 | Uncertain | `Travelers Rank` may be a formal group/status label. The current generic `여행자 등급` is plausible, but the corpus-wide Travelers name and rank convention are not settled. |
| 56649 | Uncertain | The item description's meaning is retained, but the canonical Korean spelling/display form of Aloffa Rime-Kiss remains unverified. |

## Not an Issue

The remaining 42 IDs are 56601-56606, 56608-56612, 56614-56625,
56627-56637, 56639, 56641, 56643-56647, and 56650. They preserve the
evident meaning, voice, structure, and values.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56601-56650
  once in ascending order. Each default file has 65,135 records with
  identical full key order.
- Line-break counts match throughout the batch. At 56605, English, Chinese,
  and Korean describe going down into a pit; Japanese instead says waiting
  area. Korean follows English/Chinese and retains the partner-selection
  instruction.
- At 56618, `{1}`, `{*1reckoning mode}`, and `{*1fate meter}` are retained.
  Korean follows English marker order; Japanese and Chinese place the
  Fate-meter marker first to fit their sentence structure.
- At 56621, Korean follows the English/Chinese rebuke and jail/prisoner
  threat; Japanese has a different source reading. The annotation and
  localized warning at 56630 are retained.
- Reconciled the source-keyed historical range `56550-56649`; its prompts
  include Ethene's intent, Midden/sullied, the crossbow metaphor, Trellis,
  the priestess' circle, and Aloffa Rime-Kiss. These prompts are not
  independent confirmation. ID 56650 opens the next historical range and is
  reviewed once here as the final row in this batch.
- No cross-locale numeric-value discrepancy was identified.
- Only the approved `Texto` cells at 56607 and 56626 changed. The active CSV
  retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and
  39 pre-existing bare-LF endings. Post-edit SHA-256:
  `f80c024f19146d908fedda90a671a23b6a0687e6bfed8711707f03d741742415`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56601/locatexts_zh_cn.koalocatext_default.before-56601-retry.csv`
  (SHA-256 `3fa42c7ff19c4d46a170905301d11ba82ca7a0a5032aa0a72300f95ea183a152`).

Decisions D-17057 through D-17058 record the two accepted corrections;
D-17059 through D-17064 record the six uncertain findings; D-17065 records
the remaining 42 `not an issue` IDs. Direct register totals: 1,661 accepted,
11,714 `not an issue`, and 10,543 uncertain (23,918 total); next D-17066.

Resume at `default` ID 56651; 8,484 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56651-56700-preliminary.md`](default-ids-56651-56700-preliminary.md).
