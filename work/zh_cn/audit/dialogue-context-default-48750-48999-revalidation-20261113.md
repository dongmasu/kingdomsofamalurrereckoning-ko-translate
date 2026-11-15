# Sequential `default` Revalidation: IDs `48750`-`48999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 65 previously recorded four-language fingerprints; all match.
  Added the other 185 IDs to the review ledger.
- Recorded 17 current correction candidates and eight evidence-limited holds;
  225 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `48762` | Naturalness / speech level | The Korean shifts from `투여하겠다` to conversational `제거할 거야` within one line. Japanese is consistently plain. Consider `즉시 루카(Luca)에게 이걸 투여하겠어. 시어스토크(Searstalk)라면 독을 금세 없앨 거야.` | Medium-high |
| `48783` | Name consistency / format | The earlier cross-asset review found `Myrrine` rendered as both `미린` and `미린느`; Japanese uses `マーリネ` consistently. Reuse `미린느(Myrrine)` here, preserving this row's exact English spelling. | High |
| `48816` | Term format | The material-list entry `Crownhold Gold` is rendered `크라운홀드(Crownhold) 금화`, which pairs only the place name. Consider pairing the complete named material as `크라운홀드 금화(Crownhold Gold)` and preserve its quantity and list layout. | High |
| `48830` | Meaning / terminology | Current English is a warning that the sprites draw power from the well they guard; Korean uses `우물`. The `SQ01` context identifies this as the same magical Well consistently rendered `샘` elsewhere. Consider `샘` here. The earlier `SQ01` report's quoted proposal describes a different find-objective and does not match this current row; do not carry that wording forward. | High |
| `48832` | Terminology / consistency | The same antagonist, `the Headsman`, varies across the reviewed quest entries. This row uses `형리`; the cross-asset proposal is to use `처형인(Headsman)` consistently, pending the term group's separate decision. | Medium-high |
| `48833` | Naturalness / speech level | The line starts with honorific `유명 인사시네`, addresses the player as `자네`, then shifts to `알고 있었어?`. Japanese is conversational. Consider a consistent casual line such as `유명 인사네! 네 인형도 만든대. 알고 있었어? 애들 장난감 말이야.` | Medium-high |
| `48836` | Terminology / format | `Dvergan Lorestones` is rendered `드베르간(Dvergan)의 지식석`, while the established term is `로어스톤(Lorestone)` and another occurrence at `64103` uses `드베르간(Dvergan)의 로어스톤`. Consider `드베르간(Dvergan)의 로어스톤(Lorestone) 찾기`. | High |
| `48871` | Name format | The standalone named label `Gaea's Reserve` is only `가이아(Gaea)의 은신처`. Consider pairing the complete location label, e.g. `가이아의 은신처(Gaea's Reserve)`. | Medium-high |
| `48876` | Name / title format | The source names `Savant Aethan Engar`, but the Korean parenthetical omits the title `Savant`. Other occurrences use `사반트 에이선 엥가르(Savant Aethan Engar)`. Use that complete form here. | High |
| `48880` | Naturalness / speech level | The current row matches the earlier finding: `무례하게 굴려던 건 아닙니다` is awkward, and `예민해졌군요` shifts from the preceding `-습니다` register. Consider `케스터 바클레이(Kester Barclay)입니다. 무례하게 굴 생각은 아니었습니다. 죄송합니다. 이번 위기 때문에 조금 예민해졌습니다.` | High |
| `48893` | Name format | The standalone label `Frama's Husband` is `프라마의 남편` without the source-name pairing. Consider `프라마(Frama)의 남편`. This adds no identification with either Frama Aedic or Frama Foswig. | Medium-high |
| `48961` | Name consistency / format | The Korean uses `개스티어 성`, while related entry `46380` identifies the place as `Castle Gastyr` and uses `가스티르 성(Castle Gastyr)`. Align this journal entry to the established place form without changing the event. | High |
| `48977` | Name format | `Attwaters` identifies the Attwater family, but Korean has only `애트워터 가족`. Consider `애트워터 가족(Attwaters)`. Other `Attwater twins` occurrences are already separately recorded for review. | Medium-high |
| `48987` | Term format | `Chaos Hearts` is the named item group and appears elsewhere as `혼돈의 심장` without the source pairing. Consider `혼돈의 심장(Chaos Heart)들을` here, preserving the plural meaning and the separate `Chaos Magic` reference. | Medium-high |
| `48994` | Shared-source consistency | The clause `If gold is an issue, we Dokkalfar can pay well.` exactly matches ID `18242` in English, Japanese, and Chinese, but Korean varies (`골드`/`돈`, `지불하다`/`치르다`). Reuse the natural Korean at `18242`: `돈이 문제라면 우리 도크알파르(Dokkalfar)가 후하게 치르지.` The preceding clause differs in English (`You` versus `We`) and should remain ID-specific. | High |
| `48995` | Name format | The standalone label `Kenda Jane's Corpse` omits the English form of the named person. Consider `켄다 제인(Kenda Jane)의 시체`. | Medium-high |
| `48996` | Name / title order | The source says `Captain Brattigan`, while Korean has `브래티건(Brattigan) 선장`. The established complete form is `브래티건 선장(Captain Brattigan)` (e.g. IDs `5581` and `6215`); align this occurrence. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `48720`, `48763` | Name / referent | English uses `Sacred Passage`, while Japanese sets off `聖なる通路` as a named expression and Chinese uses a generic sacred passage. The rows may refer to the same place, but do not establish whether it is a proper name. Retain `신성한 통로` without forcing a title gloss. |
| `48766` | Address / naturalness | The casual line ends with the archaic vocative `트루스원이여`. Japanese is casual, but the asset-level evidence does not identify the speaker or whether the elevated address is deliberate. Defer a register change. |
| `48853` | Meaning / title | `Ratofer's Pawns` may mean people used as pawns or refer to pawning belongings. Japanese `質入れ` and Chinese `士兵` diverge, and the sale-quest context does not resolve the wordplay. Retain the title provisionally. |
| `48918` | Meaning / referent | Capitalized `Well` and its alignment may refer to a named magical structure or a generic well. Japanese says `泉`; Chinese uses `井`. Do not equate it with the separately established `Font` or force a named-site reading. |
| `48947` | Speech level | `아직도 그러시나?` uses an honorific marker, followed by plain `난 안 넘어가` and `올리겠어`. Japanese is plain, but the first phrase may be deliberately sarcastic; the asset does not map this key to a speaker or scene. Defer normalization. |
| `48991` | Title format | `Guardian of Arms` is an explicitly proclaimed title, but other occurrences (`14736`, `27776`, `56329`) are also translated without the English title. Confirm whether to pair this title consistently across those rows before changing this occurrence alone. |
| `48998` | Meaning / text type | The standalone `One Drop` is `한 방울` in Korean and Japanese, while Chinese uses `举手之劳` (“a small favor”). The `SQ93` association does not establish whether this is a title or a phrase; retain it pending clearer context. |

## Rechecked Findings and Structure

- Six existing correction candidates were rechecked and retained:
  `48783`, `48830`, `48832`, `48880`, `48961`, and `48994`. Four rows
  previously recorded as `not-issue` now have candidates:
  `48762`, `48876`, `48893`, and `48987`. Five previously `not-issue` rows
  now have evidence-limited holds: `48720`, `48763`, `48918`, `48947`, and
  `48998`; the existing hold at `48853` remains unresolved. All historical
  ledger rows were preserved unchanged.
- The current report corrects the stale quotation for `48830` in the earlier
  `SQ01` report: the current row is dialogue about the guarded magical well,
  not a find-objective. Only the `우물` / `샘` terminology issue is carried
  forward here.
- Five exact-English duplicate groups touch the range:
  `48755`/`48935` (`Quest Complete`),
  `48768`/`48834`/`48990` (`Goodbye.`),
  `48820`/`48885` (`Tuatha`),
  `48857`/`48936` (`Not right now.`), and
  `48949`/`48959` (`Quest Failed`). Korean matches within every group.
- Two entries contain line breaks: `48816` has four and `48840` has nine;
  the per-row counts match across all four languages, totaling 13 breaks
  per language.
- Runtime/display markers occur at `48881` and `48906`; marker identities
  and order match across all four languages.
- Of 250 IDs, 204 have indexed asset associations, represented by 208
  ID-asset links across 129 assets; 46 IDs have no indexed asset. Of the
  185 newly recorded IDs, 139 have indexed associations, represented by
  142 links across 75 assets; 46 have no indexed asset. Asset links do not
  establish per-key speakers or playback order.

## Range Result

- The range has 17 current correction-candidate IDs and eight
  evidence-limited holds; 225 IDs have no current finding.
- After appending 185 new IDs, the ledger covers 53,246 of 65,135 unique
  `default` IDs (81.75%), leaving 11,889. Sequential coverage reaches
  `48999`; next is `49000`-`49249`. The ledger records 42,640 IDs with
  indexed asset links and 10,606 without.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
- Catalog/index reproduction, all 53,246 ledger fingerprints, nine related
  tests, and the line-ending-aware diff check passed.
