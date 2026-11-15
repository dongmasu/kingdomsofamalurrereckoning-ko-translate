# Translation Follow-up: IDs `64177` and `64213`

- Date: 2026-11-15.
- Rechecked the active Korean against same-ID English, Japanese, and Chinese.
- This follow-up records one previously applied correction and one new
  correction. It does not change dialogue attribution, playback order, or
  review-ledger dispositions.

## Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64177` | Revalidated; retain | English instructs the player to dodge or block enemy attacks. Japanese uses the polite instructional ending `しましょう`, while Chinese presents the same two control actions. The current Korean connects `회피하거나` to the final polite instruction `막아내세요`, which is grammatically consistent. The earlier change from `방어하세요` to `막아내세요` is retained; no new text change was needed here. |
| `64213` | Corrected | English identifies Tine Delfric as both Ancient of War and Castellan of the place. Japanese confirms the general-and-castellan title structure. Existing Korean at `21021` and `61274` establishes `전쟁의 고대자(Ancient of War)`, not `전쟁의 고대인`. The sentence was recast for natural Korean while preserving the history, role, vaulted-ceiling, and title information. |

## Applied Change

- `64213` before: `기억해 둬. 자랑거리는 둥근 천장만이 아니야. 이곳의 역사와 역할, 그리고 이곳의 성주이자 전쟁의 고대인인 타인 델프릭(Tine Delfric)도 있지.`
- `64213` after: `기억해 둬. 이곳의 자랑거리는 둥근 천장만이 아니야. 역사와 역할은 물론, 성주이자 전쟁의 고대자(Ancient of War)인 타인 델프릭(Tine Delfric)도 빼놓을 수 없지.`

Only the active Korean `Texto` field for `64213` was changed in this
follow-up. Its four-language ledger fingerprint was refreshed. The previously
updated `64177` fingerprint was checked and remains valid. No ledger row,
classification, source CSV, or extracted asset was changed.

## Verification

- The CSV-preservation tests passed: 11 tests.
- The dialogue-context index tests passed: nine tests.
- The review ledger validated all 65,135 IDs and their four-language
  fingerprints.
- The index, asset catalog, and all-ID catalog reproduced successfully.
- The active Korean CSV retained its UTF-8 BOM and 65,135 ordered IDs, with
  71,839 CRLF separators, 242 LF-only separators, and zero bare CR characters.
- The CRLF-aware `git diff --check` passed.
- No commit was made.
