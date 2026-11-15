# Candidate Reconciliation: IDs `44250`-`44499`

- Date: 2026-11-15.
- Rechecked the 23 candidates in the sequential range report against English,
  Japanese, Chinese, the active Korean CSV, and earlier findings. English
  anchors meaning; Japanese is the primary reference for voice and register;
  Chinese is supporting evidence.
- `44258` was already reconciled as a linked title candidate in the
  `43500`-`43749` pass and is not counted again. The former candidate at
  `44457` is cleared by the sequential report and is not in the current
  candidate set.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `44258` | Previously reconciled: the play title now consistently uses `겸손해진 자들(The Humbled)` at its first title reference. No duplicate edit or count. |
| `44263`, `44294`, `44311`, `44334`, `44354`, `44368`, `44377`, `44398`, `44413`, `44423`, `44431`, `44434`, `44469`, `44477`, `44482`, `44491`, `44497` | The candidate's supported pairing, meaning, term, or naturalness correction is already present in the current Korean CSV. Retained without another edit. |
| `44347` | Replaced the mixed honorific/intimate line with `정말 아름다워, 내 사랑.` English `my dear`, Japanese direct informal address, and Chinese `亲爱的` support an intimate plain rendering; no individual speaker was inferred. |
| `44360` | Changed the polite offer to `뭐, 적어도 네가 할 수 있는 건 다 했어. 고맙다는 뜻으로 이 금화를 받아. 필요하면 내 서비스도 할인해 줄게.` English and Japanese use conversational speech, matching the parallel reward line at `37913`. |
| `44443` | The English-name pairing and natural dice idiom are already present. English and Chinese include “old,” while Japanese omits an age descriptor; retained the current wording without resolving that nuance or inferring who is speaking. |
| `44468` | Retained the natural polite question. English is speech-level neutral, Chinese is courteous, and the asset does not identify the speaker for the casual Japanese form. |
| `44495` | Replaced the unsupported 하오체 with plain speech: `우린 외부인의 간섭을 꺼려. 죽은 이들은 누운 자리에 고이 묻어 두는 게 우리 방식이야. 더는 말하지 않을게.` Japanese uses plain forms throughout; the sentence was revised without assigning a speaker. |

## Linked and Held Findings

- `44360` was compared with the parallel service-reward line `37913`; both
  Japanese lines use conversational speech, and the Korean now follows that
  register.
- The `Fennwrac` references at `12843`, `30807`, and `44368` use the
  established `펜라크(Fennwrac)` form. `44368` already has the correct term.
- `44398`'s meaning was previously held but is now supported by the four
  language rows; its current `샘의 관리자 노메론(Fontmaster Nomeron)` and
  `샘(The Font)` pairings are correct.
- `44477`'s `타인힐(Tinehil)` name pairing is correct; the separate
  `hollow` / cave / valley question remains unresolved.
- The evidence-limited holds at `44380`, `44458`, `44462`, and `44477` remain
  open. The cleared `44457` finding and the hold at `44398` are not counted
  as current candidates or unresolved holds.
- Asset associations do not establish a specific speaker, addressee
  relationship, or dialogue order.

## Changes and Verification

- Korean rows `44347`, `44360`, and `44495` changed using
  `tools/replace_text_preserve_eol.py`.
- Refreshed only the four-language source fingerprints for those three IDs;
  existing ledger records and their other fields were preserved.
- Candidate reconciliation is `3,003 / 4,028` (74.55%), with 1,025
  remaining. This pass reconciled 22 new unique candidates; `44258` was
  already counted in an earlier linked-candidate pass.
- Validation covers the active CSV's 65,135 ordered records, UTF-8 BOM, and
  preserved mixed line endings; full ledger fingerprints, index/catalog
  reproducibility, regression tests, and the CRLF-aware diff check are
  recorded in the accompanying manifest.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
