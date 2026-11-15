# Sequential `default` Revalidation: IDs `14500`-`14749`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-eight existing ledger records in the range were fingerprint-checked;
  all match the current four-language sources. Their existing dispositions
  were retained.
- The other 182 IDs were reviewed and added to the ledger. Seven correction
  candidates and four evidence-limited holds were recorded.
- Of the new IDs, 128 have indexed quest-asset links and 54 do not; one links
  to multiple assets. Asset associations do not establish an individual
  speaker or playback order.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `14541` | English pairing | The source title is `Priestess Seranon`, but the current parenthetical contains only `Seranon`. Consider `여사제 세라논(Priestess Seranon)`, matching `14533`. The same title-shortening also appears at `37696` and `48306`; those IDs are outside this batch and remain for their own review. | High |
| `14576` | Meaning / terminology | Here `the Sorrows` means the magical power, not the `House of Sorrows`. Japanese says `嘆きの力`, and the active Korean already uses `비탄의 힘(Sorrows)` for this distinct concept at other IDs, including `3364`, `3831`, and `4472`. Consider `투아사(Tuatha)보다 먼저 비탄의 힘(Sorrows)을 찾으려면 서둘러야 해.` Preserve the following wait-at-Sinsear sentence. The linked FP05 asset contains multiple NPC symbols and does not identify this line's speaker. | High |
| `14594` | English pairing | The standalone source label is `Lady Still`, while the Korean is only `스틸 부인`. Consider `스틸 부인(Lady Still)`. | High |
| `14621` | Naturalness / register | `시간을 좀 가진 뒤에 다시 이야기하세` is stiff and marked compared with the familiar address and Japanese `また話をしよう`. Consider a conversational ending such as `비문을 조금 분석해 본 다음에 다시 이야기하자.` This is a row-level wording finding, not a claim about the speaker's identity across other IDs. | Medium-high |
| `14634` | Name pairing / consistency | `Garvin Dulac` is not paired with its English source name, and `뒤라크` differs from the spelling `둘락` used for the same English surname in `30958` (`Dulac Lasien`). Consider `가빈 둘락(Garvin Dulac)`. | High |
| `14727` | English pairing | The source label is `Narca Faebladesman`, but the current text pairs only `Narca` and leaves the role outside the parenthetical. Consider the complete label `나르카 페이블레이드 전사(Narca Faebladesman)`. | High |
| `14728` | Meaning / naturalness | The English idiom `a lifetime ago for you` is supported as “in a previous life” by Japanese `前世の話` and Chinese `上辈子`. `한평생 전` is awkward and misses that reading. Consider `하지만 네겐 전생의 이야기잖아. 그렇지?` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `14637` | Meaning / unit | English says the skill increases `by 3` without naming a unit; Japanese specifies three levels while Chinese says three points. The current unit-neutral `3 상승` avoids choosing between conflicting source details. Retain pending stronger evidence. |
| `14712` | Meaning / naturalness | The English list `inn, trader, locksmith, and sanctuary` treats a trade or person as a place with an open door; Japanese and Chinese preserve the same compressed list. The current `상점, 자물쇠장이, 성소의 문` is awkward, but the sources do not establish a less literal set of facilities. Retain pending context. |
| `14747` | Proper name / source conflict | `Undersea Fasting` is an established location reference elsewhere in the active Korean, but Japanese reads it as an undersea passage and Chinese varies between passage and a literal fasting reading. The English also names it as a ruin and tunnel location. Retain `언더시 패스팅(Undersea Fasting)` provisionally; this matches the earlier unresolved source question rather than resolving it by guesswork. |
| `14749` | Meaning / modifier | English can be read as the man sitting smugly with bulky arms; Japanese separates his self-satisfied manner from his thick arms. The Korean `자랑스럽게 드러낸 채` adds the specific action of displaying them, which is not established by the sources. Hold pending clearer context. The linked SQ62 asset does not map this key to a speaker or dialogue handler. |

## Source and Structural Checks

- Forty-eight exact-English duplicate groups touch the 182 new IDs, covering
  555 rows across the corpus. Korean text matches in every group.
- Runtime arguments, variable placeholders, localized wrappers, and layout
  tokens match by structure across all four locales.
- Logical line-break counts match across all four locales for all 182 new IDs.
  The Korean rows with embedded breaks are `14578` (three) and `14688` (one);
  their existing line breaks were not changed.
- ID `14523` explicitly self-identifies as Jennery Vauner. This is recorded
  as direct evidence. Other speaker attributions and playback order remain
  unknown unless separately supported by direct evidence.
- The Chinese source at `14672` has a doubled final punctuation mark; this
  does not affect the Korean translation.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
