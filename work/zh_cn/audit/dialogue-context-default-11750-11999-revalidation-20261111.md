# Sequential `default` Revalidation: IDs `11750`-`11999`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Seventy-eight existing ledger records were retained after their
  four-language fingerprints were verified. The other 172 IDs were compared
  and added.
- Five newly recorded IDs have correction candidates. Four retain
  evidence-limited findings.
- Of the 172 new IDs, 118 have indexed quest-asset links and 54 do not.
  Three IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `11778` | Meaning | The Korean says the listener will sign the papers, but the English only introduces the papers; Japanese and Chinese say they are application papers / papers for joining. Consider wording it as an introduction to the application papers without adding a signature action. | Medium-high |
| `11864` | Meaning / naturalness | `this` is rendered as the general `이 일`. IDs `11757` and `11763` in the same asset discuss casting and completing a performance's cast; Chinese also explicitly reads this as a play. Consider identifying the referent as the performance, e.g. `이 공연에도 전투에 임하듯 임하면...`. The asset association supports topic context only, not a per-line callback or speaker mapping. | Medium |
| `11907` | Terminology / meaning | English has the isolated label `Curseeker`, but Japanese means “one seeking a cure,” Chinese says “patient,” and the related `Cureseeker` ballad/title appears elsewhere (including IDs `498`, `4476`, `6306`, `20992`, `29117`, `31370`, `52851`, `55060`, `55679`, `57550`, and `58814`). Those uses are rendered `치유를 구하는 자(Cureseeker)`. Consider standardizing this label as `치유를 구하는 자(Cureseeker)`; the English spelling at this ID appears inconsistent with the established title. | High |
| `11934` | Naturalness | `Increases Quake Cost: 16 mana` is rendered with redundant `마나 소모량 증가: 마나 16`. Consider the compact and clear `퀘이크(Quake) 마나 소모량 +16` while preserving the two-line ability description. | High |
| `11948` | Meaning / naturalness | English says Anker told the narrator where to find the Paragon Barghests. Korean `그들은 ... 찾을 수 있다고 했다` makes the Barghests sound like the ones who said it. Consider making Anker the subject of the report, e.g. `그는 여름의 요람(Cradle of Summer)에서 파라곤 바게스트(Paragon Barghest)를 찾을 수 있다고 했다.` | High |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `11771` | Speech level / speaker | `Hail, adventurer` is rendered with the marked `반갑소, 모험가여`, while Japanese is a casual greeting and Chinese is neutral. The asset index does not identify an individual speaker. Keep the voice decision on hold until the speaker/context is supported. |
| `11781` | Meaning / referent | `the remains of Aron's Excavations` is unclear: Japanese describes the remaining mine/site, while Chinese reads it as remaining supplies. Retain the current wording rather than choosing a specific property or supply interpretation. |
| `11913` | Meaning / address | `dog-face` may be an insult or a colloquial address for a soldier; Japanese omits it and Chinese renders it as “private.” The Korean `멍청아` should not be changed without resolving the intended address. |
| `11932` | Item terminology | `Mitharan Illuminator's Handle` does not establish from this isolated item name whether `Illuminator` names a person, object, or set. Japanese and Chinese do not settle the construction; retain provisionally. |

At `11821`, English, Japanese, and Korean have five logical line breaks,
while Chinese has four. Korean matches English and Japanese, so this is
recorded as a source-locale layout discrepancy, not a Korean correction.
No individual speaker or playback order was assigned.

## Duplicate and Structural Checks

- Thirty-four exact-English duplicate groups touch the 172 new IDs,
  comprising 734 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout tokens, display-wrapper
  identifiers, and brace balance match across all four languages for all 172
  new IDs.
- Logical line-break counts match English and Japanese throughout the new
  IDs; the sole cross-language count difference is Chinese at `11821`.
- Ten Korean strings contain 48 existing embedded CRLF breaks:
  `11756` (4), `11789` (8), `11821` (5), `11833` (6), `11895` (1),
  `11906` (4), `11917` (4), `11934` (1), `11971` (4), and `11999` (11).
  Their existing bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
