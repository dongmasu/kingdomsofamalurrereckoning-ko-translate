# Candidate Reconciliation: IDs `45000`-`45249`

- Date: 2026-11-15.
- Rechecked all 26 current candidates against English, Japanese, Chinese,
  the active Korean CSV, and linked terminology uses. English anchors
  meaning; Japanese is the primary reference for voice and register; Chinese
  is supporting evidence.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `45004`, `45016`, `45027`, `45049`, `45057`, `45070`, `45101`, `45102`, `45143`, `45166`, `45169`, `45182`, `45195`, `45205`, `45207`, `45230`, `45239`, `45244` | Rechecked the current translations against the sources and prior findings. The supported name pairings, meaning, terminology, and sentence forms are already present or otherwise supported; retained. `45102`'s Bioreaus pairing is present, while the separate experiment-context question remains held. |
| `45019` | Replaced `복수의 재현` with `보복의 재연(Reprisal, Reprised)`, preserving the retaliatory sense and repeated-action wordplay in the title. |
| `45030` | Kept the urgent request but made the threatened consequence more natural: `고기 좀 빨리 가져다줘. 안 그러면 저들이 내 뼈를 뜯어 먹게 생겼어!` |
| `45032` | Clarified that the writer suspects a terrible truth and must verify that suspicion before recording it: `끔찍한 진실이 아닐까 의심되지만, 글로 남기기 전에 제 의심이 맞는지 확인해야 합니다.` |
| `45054` | Paired both names separately: `크톤게니(Cthongeny): 아베루스(Aberrus)`. This does not settle what the compact label means or establish a global Korean spelling for `Cthongeny`. |
| `45148` | Recast the item effect naturally without implying that the wearer actively uses an ability: `이 반지에 박힌 석영은 번개 효과가 작용할 때 착용자에게 이점을 준다.` |
| `45160` | Paired the three complete group names and their affiliations while preserving the original claim about allied peoples. |
| `45168` | Aligned the complete ingredient name with `default:31978` and `default:46537`: `펜라크 잎(Fennwrac Leaf)`. |
| `45175` | Separated the established place and district names: `라시르(Rathir)의 상층 도시(Upper City)`. |

## Linked and Held Findings

- A corpus-wide `default` search found 18 `Silkfarmer` references. The
  profession consistently uses `비단 채집꾼` (with normal number inflection),
  and `45239` already matches. No default text change was needed for this
  term. Four separate `base` labels (`153`, `597`, `1227`, `2573`) still use
  `비단 농부`; they were not changed in this default-only reconciliation.
- `45168` matches the complete ingredient label at `31978` and `46537`.
- The eight evidence-limited holds remain open: `45010` (credit label),
  `45012` (possible internal trigger text), `45055` (Destiny reference),
  `45102` (meaning of inducing the subject), `45120` (weapon-category
  scope), `45131` (address/register without speaker mapping), `45171` (title
  status), and `45243` (Border Permit title status).
- The separate historical uncertainty around the category and canonical
  Korean form of `Cthongeny` remains unresolved. The scoped `45054` pairing
  does not justify changing its other occurrences.
- The complete passage at `45230` was rechecked. Its `마지막 숨결(Last
  Breath)을` particle and remaining sentences already convey the English
  source; no further rewrite was supported.
- No speaker or dialogue order was inferred from asset associations.

## Changes and Verification

- Korean rows `45019`, `45030`, `45032`, `45054`, `45148`, `45160`, `45168`,
  and `45175` changed using `tools/replace_text_preserve_eol.py`.
- Refreshed only those eight rows' four-language ledger fingerprints.
- Reconciled all 26 range candidates. Progress is `3,090 / 4,029` (76.69%),
  with 939 remaining.
- The complete ledger fingerprint check, index and both catalog
  reproducibility checks, 20 CSV-preservation and dialogue-context tests,
  CSV record/order/BOM/newline checks, and CRLF-aware diff check passed.
- The active CSV remains at 65,135 ordered records with a UTF-8 BOM,
  71,839 CRLF, 242 LF-only, and no bare-CR line endings.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
