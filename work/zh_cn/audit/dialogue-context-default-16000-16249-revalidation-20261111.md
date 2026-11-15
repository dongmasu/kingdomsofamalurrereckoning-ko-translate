# Sequential `default` Revalidation: IDs `16000`-`16249`

- Date: 2026-11-11.
- Scope: compare all 250 active Korean rows with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Fifty-seven existing ledger records had current four-language fingerprints;
  193 previously unrecorded IDs were reviewed and added.
- Five existing correction candidates were rechecked and retained. Seven
  evidence-limited findings were recorded. No translation CSV, source
  resource, extracted game asset, or localization binary was changed.

## Correction Candidates

These are review proposals, not authorization to edit the active translation
CSV. The five findings were already recorded in asset-level reports and were
not duplicated in the ledger.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `16000` | Meaning | The `M0_SQ06` context discusses silver as a material. English `some silver`, Japanese `銀`, and Chinese `白银` do not specify coins; Korean `은화` narrows the meaning. Consider `은을 좀 팔고 싶어.` | High |
| `16010` | Naturalness / rhetoric | The deliberate parallel `stone and flesh, sword and faith` is awkwardly literal as `바위이자 살덩이`. Consider `우리는 돌이자 살이며, 검이자 신앙이다.` | Medium |
| `16052` | Meaning / terminology | English `Scholia Arcana initiates` and both Japanese and Chinese describe initiates. Korean `수련생` differs from the established `입문자` usage for this group. Consider changing only that term to `입문자`. | High |
| `16106` | Meaning / terminology | This is the House of Valor arena; the current `경기장` differs from the established `투기장`. English `forced them into a match` also warrants explicit coercion. Consider `챔피언이 사나운 트롤(Troll)들과 강제로 맞붙게 했어!` | High |
| `16171` | Name / term pairing | The standalone capitalized title `the Chosen` is rendered `선택받은 자들`, while the same asset pairs the term with English elsewhere. Consider `선택받은 자들(Chosen)`. This is a bilingual-label consistency proposal; the English-led meaning remains unchanged. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `16001` | Meaning | The isolated title `Behind the Veil` does not establish whether `Veil` is a named entity or a metaphor. Retain the literal Korean provisionally. |
| `16104` | Meaning / UI context | `MiniMerchant` may be a player-facing label or a concatenated internal key; the available row does not establish its display context. |
| `16110` | Meaning / title | `Knave of Coins` may be a formal title/rank or an epithet. Japanese and Chinese readings diverge, and this label alone does not resolve it. |
| `16114` | Meaning / title | The role or referent of `Primos` is not established by this petition sentence; Japanese transliterates it while Chinese reads it as leaders. |
| `16116` | Meaning / UI context | `KandrianCoveSwimEntrance` is a concatenated location label. The row does not establish whether it is a player-facing name or an internal key. |
| `16134` | Meaning | The blood's `layout` is used to infer recent passage and likely death, but the scene evidence and exact physical arrangement are unavailable. Retain `흩어진 모양` provisionally. |
| `16135` | Meaning / place type | English says `Alley`, Japanese says tavern, and Chinese says valley. The row cannot resolve the source-language conflict; Korean follows English provisionally. |

## Rechecked Prior Findings

- Existing candidates at `16000`, `16010`, `16052`, `16106`, and `16171`
  retain their current fingerprints and source-supported dispositions.
- The already-corrected wording at `16018`, `16037`, `16083`, and `16190`
  remains supported by the current four-language rows. The specific neck-
  twisting reading at `16064` is also supported by the available references.
- ID `16207` remains `not-issue` under prior decision D-5093; the preliminary
  concern about “perfect love nest” did not justify reopening it.
- Earlier English-led closures remain in force, including D-19692, D-19653,
  D-19705, D-19706, and D-19707. They were not reopened solely because an
  older preliminary note listed a question.
- ID `16145` remains `not-issue` under the more recent SQ60 asset review; its
  possible place-type ambiguity was not sufficient to reopen that disposition.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the four language tables.
- Fifty-one exact-English duplicate groups touch this range, covering 360
  corpus rows. Korean wording matches within every group.
- Logical line-break counts and normalized runtime/layout-marker signatures
  match across all four languages.
- Eight Korean strings contain 18 existing embedded CRLF breaks:
  `16018` (3), `16053` (1), `16097` (3), `16122` (1), `16187` (2),
  `16192` (3), `16205` (2), and `16241` (3). These breaks were preserved.
- Of the 193 new IDs, 118 have indexed asset links and 75 do not; five link
  to multiple assets. These associations do not establish per-key speakers,
  handlers, branches, or playback order.

The ledger now contains 29,034 of 65,135 IDs (44.58%), leaving 36,101
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
