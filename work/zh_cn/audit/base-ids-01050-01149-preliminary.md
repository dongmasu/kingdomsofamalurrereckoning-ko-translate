# Preliminary Language Scan: `base` IDs 1050-1149

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 1050-1149.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Checked applicable project terms in the official Korean manual glossary.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1091 | 스코리아(Scoria) 가문의 반지 | Check whether `Scoria` and `Skoria` are deliberate source variants or a typo; compare with `base` ID 340 (`Skoria Mine`). | The English spelling differs by one letter across related rows; do not silently normalize a proper name. | Low |
| 1122 | 료살파르(Ljosalfar) 목걸이 | Use the official-manual form `료스알브` for `Ljosalfar`, pending any documented in-game exception. | The project glossary explicitly gives `Ljosalfar = 료스알브`; current `료살파르` conflicts with that authority. | High |
| 1132 | 후손의 기도서 | Reconcile `Scion` as an office/title versus a generic descendant. | Japanese transliterates Scion and Chinese uses a title-like form; Korean chooses the generic `후손`, unlike numerous active rows where it is a named title. | Medium |
| 1145 | 콜로세(Kollossae) 제단 | Normalize the Korean form of `Kollossae` with `default` ID 191 (`콜로새`). | Same people/name has inconsistent Korean transliteration; Japanese and Chinese also offer differing phonetic forms. | Medium |

## Other Checks

- IDs 1066 and 714 use the project glossary's `Ward = 워드`.
- ID 1027's `Gallow's Bloom` source spelling is recorded in the preceding batch alongside `Gallows Bloom`.
- ID 1122 is a direct official-manual conflict; do not treat it as a subjective transliteration preference.

## Batch Status

IDs 1050-1149 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
