# Terminology Follow-up: IDs `64033`-`64231`

- Date: 2026-11-15.
- Compared the active Korean with the same-ID English, Japanese, and Chinese
  rows and checked established Korean usage where relevant.
- Asset associations were not used to infer speakers or dialogue order.
- One translation was corrected; five other terminology findings were
  revalidated without changing their text. Existing ledger dispositions were
  preserved.

## Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64033` | Retain | Its English source exactly matches `9498` (`Aergase, Hunting Herald`), and both Korean rows use `사냥의 전령 에어가스(Aergase, Hunting Herald)`. |
| `64093` | Retain | Japanese explicitly identifies the Sorrows as a power (`嘆きの力`); the Korean `비탄의 힘(Sorrows)` distinguishes it from `비탄의 집(House of Sorrows)`. |
| `64107` | Retain | Japanese `介添人` identifies an attendant/second in the duel context; `결투 보조자(Second)` preserves the role and pairs the English term. |
| `64125` | Retain | English and Japanese identify the object as the power of the Sorrows. `비탄의 힘(Sorrows)` is consistent with `64093` and established related usage. |
| `64218` | Corrected | The source names two former members of the House of Sorrows called the Eldest, then distinguishes the location of the Sorrows-power they will help protect. The Korean was clarified to avoid making “former” modify the House and to pair the second `Sorrows` reference. |
| `64231` | Retain | English and Japanese both identify the dropped object as a Cairn, and Korean pairs it as `케언(Cairn)`. Chinese uses a different localized rendering; that difference does not justify changing the English-based Korean term. |

## Applied Change

- `64218` before: `비사라네(Bisarane)의 부탁으로 클루리콘(Klurikon) 남부에 가게 됐다. 다말록 던전에서 엘더스트(The Eldest)라 불리는 옛 비탄의 집(House of Sorrows) 일원 두 명을 찾아야 한다. 그들이 미든(The Midden)으로 돌아오도록 설득한다면, 비사라네(Bisarane)가 비탄의 힘의 위치를 알아내 투아사(Tuatha)로부터 비탄의 힘을 지키는 데 도움을 줄 것이다.`
- `64218` after: `비사라네(Bisarane)의 부탁으로 클루리콘(Klurikon) 남부에 가게 됐다. 다말록(Damalroc) 던전에서 엘더스트(The Eldest)라 불리는 비탄의 집(House of Sorrows)의 옛 구성원 두 명을 찾아야 한다. 그들이 미든(The Midden)으로 돌아오도록 설득하면, 두 사람은 비사라네(Bisarane)가 비탄의 힘(Sorrows)의 위치를 알아내고 그 힘을 투아사(Tuatha)로부터 지키는 데 도움을 줄 것이다.`

Only the active Korean `Texto` field for `64218` changed. Its four-language
ledger fingerprint was refreshed. No ledger disposition, source CSV, or
extracted asset was changed.

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
