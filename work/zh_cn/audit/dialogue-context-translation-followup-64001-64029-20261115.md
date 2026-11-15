# Translation Follow-up: IDs `64001`-`64029`

- Date: 2026-11-15.
- Rechecked nine sequential-review holds against the active Korean and the
  same-ID English, Japanese, and Chinese sources.
- One unsupported implication was removed. The other rows were retained or
  left held where the source does not settle the question.

## Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64001` | Retain | English's unusual “Face my supposition!” is a call to hear the speaker's reasoning; Japanese and Chinese support the current conversational `내 추론을 들어 봐!`. |
| `64003` | Retain | English says the camp has only room enough for one; Japanese explicitly says one person's space. `한 사람만 머물 수 있어` preserves that reading. |
| `64004` | Retain | The English identifies Shepard as the Warsworn commander after Ballegar. The Korean preserves the sequence and pairs both personal names. No speaker or additional title was inferred. |
| `64015` | Retain | The English source intentionally ends mid-sentence with a dash, while Japanese completes the thought. Korean follows the English fragment and preserves its dash. |
| `64017` | Hold | English and Japanese leave `Online Services Testers` untranslated, while Chinese translates it. Without UI or runtime context, whether it is internal test text or player-facing wording remains unclear; the current text is unchanged. |
| `64018` | Corrected | English `sailor's yarn` and the Japanese and Chinese sources support a sailor's story but do not require calling it a boast or tall tale. Removed the unsupported `허풍 섞인`; retained the plain conversational style. |
| `64021` | Retain | English `lost`, Japanese `もういない`, and Chinese `迷路` differ on whether the daughter is absent or lost. `사라졌지만` preserves the ambiguity instead of inventing her fate. |
| `64023` | Retain | The English key-like label, Japanese `4番目の入口`, and Chinese “fourth room entrance” support the current `네 번째 방 입구`; no additional UI context was inferred. |
| `64029` | Retain | English and Chinese can suggest that Jokull judged the player correctly; Japanese says he has favored or backed the player. `처음부터 널 믿어 왔나 봐` preserves the shared positive-support sense without selecting a more specific reading. |

## Applied Change

- `64018` before: `뱃사람들의 허풍 섞인 이야기를 듣는 게 좋아.`
- `64018` after: `뱃사람들의 이야기를 듣는 게 좋아.`

Only the active Korean `Texto` field for `64018` changed. Its four-language
ledger fingerprint was refreshed. No speaker attribution, dialogue order, or
ledger disposition was changed.

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
