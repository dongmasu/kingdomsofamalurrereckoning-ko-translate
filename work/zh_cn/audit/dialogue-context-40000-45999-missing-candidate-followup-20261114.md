# Missing Candidate Follow-up: IDs `40000`-`45999`

- Date: 2026-11-14.
- Compared the 16 ledger candidate IDs omitted from the final application
  manifests against the current English, Japanese, Chinese, and Korean rows,
  earlier source findings, and relevant duplicate or terminology groups.
- Dispositions: three edits, 11 retained, and two evidence-limited holds.
- The source fingerprint was refreshed only for the three edited IDs.

## Applied Corrections

| ID | Correction | Evidence |
| ---: | --- | --- |
| `41926` | Changed `(Orison)` to `(The Orison)`. | English explicitly names the sacred rite `The Orison`; the active corpus pairs this title as `오리슨(The Orison)`. The earlier range note that treated the shorter pairing as sufficient is superseded by this direct title check. |
| `42063` | Changed `우린 막지 않았어요` to `우린 막을 생각이 없었어요`. | English `We weren't going to stop them`, Japanese `別に止めようともしませんでした`, and Chinese `没准备阻止他们` all express lack of intent or attempt, not merely an outcome. This corrects the earlier range note that had released the candidate. |
| `43026` | Replaced the generic `우물` reference with `영혼의 샘(Well of Souls)` and recast the follow-up clause naturally. | English capitalizes `the Well`; Japanese says `泉`; within the same `SQ152` context, IDs `20054` and `53057` explicitly identify it as the `Well of Souls`. This is a scoped referent correction, not a global change to `well`. |

## Retained Findings

| ID | Reason |
| ---: | --- |
| `42559` | Its Korean sentence already matches exact-English duplicate `44457` and the parallel Japanese/Chinese wording. |
| `42683` | The active Korean is `작은 자여`, which preserves `Little one` without deciding that the addressee is a child. The speaker is not established. An earlier range note describing the active row as `꼬마야` does not match the current CSV. |
| `43167` | `광산 업그레이드 완료` matches the parallel `Office Upgraded` label at `22980` (`사무실 업그레이드 완료`). |
| `43289` | `재료` fits the alchemical ingredients in context and is supported by Japanese `素材`; the parallel reagent wording is already aligned. |
| `43548` | `깊은 잠(Deep Slumber)` is already paired and preserves the named Slumber reference. |
| `43632` | The current text already pairs `칼로르 경(Lord Callor)` and `여름의 요람(Cradle of Summer)`; no supported correction remains. |
| `43918` | The current defiant wording is acceptable against English and Japanese. The broader choice among Korean renderings of `Templar` remains a separate unresolved terminology issue and is not changed here. |
| `44457` | The Korean already matches exact-English duplicate `42559`. |
| `44961` | `연도문` is the selected term for the collectible litany books and agrees with Japanese `連祷書`. |
| `45085` | `연도문` is already consistent with the selected term; no text change is needed. |
| `45361` | `틸레라(Tilera)가 쓰러졌을 때` is natural, preserves the English `fell` wording, and includes the relevant English pairings. |

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `42176` | `dreg` is insulting, but its intensity and the intended Korean address are not settled by the line. Keep the current wording rather than overstate the insult or infer a speaker relationship. |
| `44458` | Japanese is conversational while English is neutral and Chinese is courteous. Asset-level association does not identify this line's speaker or scene stage, so the register difference remains unresolved. |

## Verification

- All 16 IDs now have an explicit follow-up disposition.
- The three approved edits used `tools/replace_text_preserve_eol.py`.
- Only `41926`, `42063`, and `43026` source-fingerprint fields were refreshed.
- No embedded line breaks, runtime tokens, or markup occur in the edited rows.
- Full ledger, CSV structure, tests, and line-ending validation are recorded in
  the cumulative application status after this follow-up.
