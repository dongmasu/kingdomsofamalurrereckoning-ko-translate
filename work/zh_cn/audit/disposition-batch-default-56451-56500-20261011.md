# Disposition Batch: `default` IDs 56451-56500

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English,
  Japanese voice/register, Chinese supporting evidence, the preliminary
  scan, source-keyed historical notes, prior decisions, line breaks, runtime
  markers, and values. These working dispositions are not independent final
  linguistic approval.
- One accepted correction, 42 `not an issue` IDs, and seven uncertain
  findings.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56485 | `챔피언, 네가 꺾어야 할 상대인가 보군.` | `챔피언, 네가 바로 모두가 꺾어야 할 상대인가 보군.` | English `the fighter to beat`, Japanese `倒すならあんただな`, and Chinese's explicit “next I have to defeat you” identify the Champion as the opponent others must beat. The previous Korean instead made the Champion the one who must defeat someone. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56453 | Uncertain | English and Chinese say they are out in large numbers; Japanese says they have sharply decreased. Korean follows English/Chinese, but the source-language contradiction needs context. |
| 56467 | Uncertain | The isolated English label `Fall` can mean autumn or falling; Korean/Chinese choose falling while Japanese chooses autumn. |
| 56468 | Uncertain | `eldest standing` could mean oldest living member or another senior status. Locale readings differ, and the fragment lacks context. |
| 56475 | Uncertain | `Warsworn Key` is rendered descriptively, unlike the corpus's common `워스워른(Warsworn)` form; the canonical faction-name policy should decide whether to normalize it. |
| 56480 | Uncertain | The Silent Choir's relation to Anokatos and the referent/location implied by `where it was first carved` vary across locale renderings; retain pending lore context. |
| 56487 | Uncertain | Korean conveys disrespect toward Imelda's memory but softens the source's vulgar image. Japanese also softens it while Chinese retains a desecration sense; register intent is unresolved. |
| 56491 | Uncertain | `그이는` may imply spouse-like intimacy, but the speaker relationship is absent from this line. |

## Not an Issue

The remaining 42 IDs are 56451-56452, 56454-56466, 56469-56474,
56476-56479, 56481-56484, 56486, 56488-56490, and 56492-56500. They
preserve the evident first-read meaning, voice, and structure for this pass.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56451-56500
  once in ascending order with identical full default key order. Internal
  line-break counts match for all 50 rows; no runtime-marker discrepancy was
  found.
- The 100% Evasion value at ID 56465 is preserved. ID 56453's Japanese
  meaning reversal and the historical prompts for Fall, Shieldring,
  Warsworn, the Silent Choir, Imelda's memory, and Tarrick were checked
  directly; unresolved context remains uncertain rather than being guessed.
- Pre-edit active CSV SHA-256:
  `54558f9e0ff43277084861328d8d69bfc931d53f76f9c3032fbc564cacd9ad44`.
  Post-edit active CSV SHA-256:
  `6bcc9c3d1d1c1f37300e3a7bb7f40dd2aaa2a36a5e11333a76063777369289a2`.
  Only the accepted `Texto` cell at ID 56485 changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56451/locatexts_zh_cn.koalocatext_default.csv`.

Decision D-17030 authorizes the accepted correction; D-17031 through D-17037
record the seven uncertain findings; D-17038 records the remaining 42
`not an issue` IDs. Direct register totals: 1,658 accepted, 11,588
`not an issue`, and 10,522 uncertain (23,768 total); next D-17039.

Resume at `default` ID 56501; 8,634 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56501-56550-preliminary.md`](default-ids-56501-56550-preliminary.md).
