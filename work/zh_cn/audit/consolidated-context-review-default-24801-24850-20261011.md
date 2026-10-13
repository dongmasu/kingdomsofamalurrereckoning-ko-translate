# Consolidated Context Review: `default` IDs 24801-24850

- Date: 2026-10-11.
- Re-reviewed prior uncertain findings against English meaning, Japanese
  voice/register and draft, Chinese supporting evidence, active Korean,
  linked corpus uses, and earlier audit decisions.
- Resolved seven uncertain IDs: one accepted correction and six `not an
  issue`. ID 24806 retains a specific idiom/context hold.

## Decisions D-19013-D-19018

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19013 | 24812-24813 | not an issue | `로르카레인` and `라시르` retain Lorca-Rane and Rathir as readable Korean forms; the contrast between first-glance marvels and later flaws remains intact. Locale transliterations vary, but no supported correction is established for these rows. |
| D-19014 | 24822 | not an issue | Repeated Fontmaster/Nomeron contexts (including IDs 25656 and 51753) identify responsibility for managing the Font's flow; `샘의 관리자` conveys the role without adding an unsupported office/UI function. |
| D-19015 | 24825 | not an issue | The companion is a Cliff Barghest, and related Jora entries use `절벽 바게스트`; Preordained and Crownhold's royal guard are identifiable attackers. Injury, healing, and protection objective are preserved. |
| D-19016 | 24838 | not an issue | `운명 지배` is a concise skill-label rendering of `Destiny Dominated`, consistent with the Japanese and Chinese meanings. No local semantic error is established; any official skill-name normalization remains a broader glossary task. |
| D-19017 | 24841 | accepted | English explicitly identifies Bolgan Masters as special mages with powerful mind control. Parallel Bolgan Master entries use `볼간 대가`/`볼간 대가들` (for example IDs 27777 and 61687); `사제` incorrectly narrows the role. |
| D-19018 | 24848 | not an issue | Related text identifies Telogrus as the cult's recipient of offerings (including ID 19717). The speaker still presents the identification as a question; `누구에게지? 텔로그루스?` is natural for a personified deity and preserves that uncertainty. |

## Hold Retained

- 24806: English `initiate the strong` and `see red` permit more than one
  reading. Japanese keeps the red image broad, while Chinese interprets it
  as the Red gang. Korean's `강자를 받아들이고` and blood-red threat are
  plausible without importing the Chinese faction reading, but the exact
  initiation and idiom are not settled by this context. Keep unchanged.

## Edit

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24841 | `볼간 사제들의` / `볼간 사제 셋` | `볼간 대가들의` / `볼간 대가 셋` | Match the named mind-control mages and the established corpus form for Bolgan Masters. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 24801-24850 exactly once and in identical order.
- No line-break or runtime-marker content was introduced or changed by the
  approved edit. The prior batch check confirms matching paragraph breaks
  and exact runtime-marker order, including ID 24832.
- A byte comparison against the pre-edit backup proves the only difference
  is the approved `Texto` value at ID 24841. UTF-8 BOM, 72,011 CRLF endings,
  and 73 pre-existing bare LF endings remain unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24801-24850-D19013/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
- Post-edit SHA-256:
  `14260e68e2a32f339ba665e737db7c0b7dc0cbddfc3873f3b3a049b43978a1fd`.
- Totals: 2,131 accepted / 23,871 `not an issue` / 12,522 uncertain
  (38,524 counted keys). Resume D-19019 at ID 24851. Sequential IDs
  24851-65134 remain (40,284), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
