# Candidate Reconciliation: IDs `4000`-`4249`

- Date: 2026-11-14.
- Rechecked all six current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, active Korean, and linked review records.
- Two in-range translations were corrected; four candidates were retained as
  already resolved or unsupported by the established terminology decision.
- The exact duplicate at `62969` was corrected with `4135`; it will count when
  its numeric range is reconciled.
- No speaker or playback order was inferred from asset association.

## Applied Corrections

At `4135`, the English, Japanese, and Chinese sources match `62969` exactly.
The prior context review supports rendering the familiar `dove` address as
`친구`; both rows now use the same conversational wording:
`다음은 숨겨진 길로 이루어진 미로, 어둠의 미로야. 친구, 네가 직접 길을
찾아 빠져나가야 해.`

At `4177`, the source's metaphorical thread of time leads the speaker to the
listener. The line now reads
`시간의 실을 따라 여기까지 왔어요... 이제야 알겠네요... 그 실은 결국
당신에게로 이어졌군요.`
This keeps the source's three-part pause and the polite register indicated by
Japanese while avoiding the awkward phrasing that made the thread literally
“bring” the speaker to the listener.

## Retained

- `4007` already pairs the named role as `처형인(Headsman)`; no individual
  speaker is inferred.
- `4013` already contains the source-supported correction
  `경고했는데 듣지 않았어!` from the earlier `4000`-`4999` edit batch.
- `4060` keeps `로포쿠(Lopoku)`. The official Korean manual and established
  project terminology support `Lopoku`; the English `Lupoku` is a documented
  source variant and is not a reason to change the Korean name.
- `4085` already uses the established rank `사반트(Savant)`.

## Verification

- All six in-range candidates have dispositions in the accompanying manifest.
- Korean `Texto` fields changed only at `4135`, `4177`, and the linked exact
  duplicate `62969`; only those three ledger fingerprints were refreshed.
- Rows `4135` and `62969` now match, including their exact English, Japanese,
  and Chinese source strings.
- The ledger, context index/catalog, CSV-preservation tests, context-index
  tests, and CRLF-aware diff check passed.
- Sequential candidate reconciliation now covers 237 of 4,015 candidates
  (5.90%); 3,778 remain unreconciled.
- No commit was made.
