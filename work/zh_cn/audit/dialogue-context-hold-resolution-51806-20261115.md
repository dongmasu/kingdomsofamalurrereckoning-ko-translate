# Evidence-Limited Hold Resolution: ID `51806`

- Date: 2026-11-15.
- Scope: resolve the conflicting Korean rendering of `Child of the Dust` at
  `default:51806`; recheck the three other holds from the
  `46000`-`51999` follow-up.
- English anchors meaning, Japanese is the primary reference for style and
  form, and Chinese is supporting evidence.

## `51806` Resolution

The exact English row begins `A Child of the Dust wishes to help the Cycle?`.
Japanese describes a being born from dust (`塵より生まれし者`), and Chinese
uses `尘埃之子`. The active Korean row before this follow-up was
`먼지의 자식(Child of Dust)이 ...`, which conflicted with the already
accepted, ID-specific D-20111 decision for `51806`:
`먼지의 아이(Child of the Dust)`.

Restore that accepted wording and the complete source epithet:

```text
먼지의 아이(Child of the Dust)가 순환(Cycle)을 돕겠다니? 전례가 없군... 그래도 깊은 잠(Deep Slumber)에 든 우리를 진심으로 돕고 싶다면 환영하네.
```

Only the epithet and its English pairing changed. The rest of the sentence,
including the named `Cycle` and `Deep Slumber`, remains unchanged. This
resolves the specific previously accepted decision, not the broader
`Child(ren) of Dust` / `Dustling` terminology family; no global normalization
or speaker attribution was inferred.

## Other Holds Rechecked

| ID | Current Korean | Decision |
| ---: | --- | --- |
| `46403` | `신탁자들(Oracles)` | Retain and hold. Same-ID Japanese `預言者` and Chinese `神谕者` support people who prophesy. A related spoken use meaning prophecies is not directly mapped to this standalone label. |
| `47508` | `수집품` | Retain and hold. English/Chinese `Collections` support collected objects, while Japanese `献金` and the `SQ147` donation context support contributions. The key's exact UI use is not established by the asset association. |
| `48231` | `전령` | Retain and hold. English `The Messenger` could be a named title or generic role; same-ID Japanese `メッセンジャー` and Chinese `信使` do not resolve its proper-name status. |

No unsupported change was made to those three rows.

## Verification

- Changed only `default:51806` through
  `tools/replace_text_preserve_eol.py`.
- Refreshed only ID `51806`'s `source_fingerprint` in the append-only review
  ledger.
- No other translation row, source CSV, extracted asset, or binary changed.
- No commit was made.
