# Candidate Reconciliation: IDs `61250`-`61499`

- Date: 2026-11-15.
- Rechecked seven new and six earlier candidates against active Korean and
  English, Japanese, and Chinese sources.
- Three rows were corrected: `61463`, `61479`, and `61489`. The other ten
  candidates already had supported wording.
- Rechecked the existing `61393` hold and retained it; added no new
  unresolved candidate.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61287` | Retained | `우리 젊은이들이 집으로 돌아오길` correctly renders `boys and girls` as young people in the wartime context. |
| `61394` | Retained | The complete `혼돈 무기(Chaos Weapons)` pairing is already inside the existing `{*1...}` display marker. |
| `61424` | Retained | `그와는 어디서 알게 됐냐면…` preserves the unfinished thought without inventing how long they have known each other. |
| `61447` | Retained | The vow already renders `venture` as `이번 일`, not a commercial business. |
| `61463` | Corrected | Clarified that these are friends of the family: `라시르(Rathir)에 있는 가족의 친구들`. |
| `61478` | Retained | `갑옷을 손보는 일` naturally describes armor maintenance rather than literally tightening it. |
| `61489` | Corrected | Recast the stiff well-wish as `이번 전승(The Telling)도 잘되길 바라.` |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61254` | Retained | `요점만 말해, 영감.` is direct plain speech, matching the Japanese imperative and Chinese address. |
| `61266` | Retained | `누알라 이그나스(Nuala Ignas)` follows the Japanese and established corpus spelling; the English `Ignus` in this row is inconsistent with the other source references. |
| `61325` | Retained | `my brothers` means fellow soldiers here; `전우들` is supported by the military context and related wording. |
| `61419` | Retained | The active text identifies and defeats the living Banshaen creatures; it does not treat them as objects. |
| `61429` | Retained | `페이 동굴(Fae Hollow)` pairs the full location name without a redundant standalone `Fae` pairing. |
| `61479` | Corrected | Fixed the subject/meaning reversal: `오레인(Oreyn)이 사실 영양이 아니라는 말을 마르가(Marga)에게 전했다.` |

## Holds and Repeated Sources

- `61393` remains held because the source locales differ on inability versus
  unwillingness.
- `61467` remains held because `the Wall` may be a setting-specific
  destination; the sources do not establish that it means prison.
- The differing Korean registers for the exact-English `Die, mortal!` rows
  `54719` and `61482` remain, supported by the distinct Japanese registers.
- No speaker attribution or dialogue order was inferred from asset links.

## Applied Changes

Updated IDs `61463`, `61479`, and `61489` with
`tools/replace_text_preserve_eol.py`. Only these IDs' `source_fingerprint`
fields were refreshed. All other ledger fields and dispositions were kept.

## Result and Verification

- Seven new candidates were reconciled: two corrected and five already
  supported. Six earlier candidates were rechecked separately.
- Cumulative reconciliation is `3,417 / 4,026` (`84.87%`), with `609`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
