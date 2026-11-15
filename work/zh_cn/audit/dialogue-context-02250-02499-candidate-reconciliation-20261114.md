# Candidate Reconciliation: IDs `2250`-`2499`

- Date: 2026-11-14.
- Rechecked all 12 current `overall=candidate` IDs in this interval against
  the active Korean CSV, English, Japanese, Chinese, and linked evidence.
- Six candidate findings received source-supported corrections; six were
  retained because the current translation already reflected the evidence.
- One related objective, `7588`, was aligned with the established `-기` form.
- No speaker or playback order was inferred from asset association.

## Applied Corrections

At `2270`, the familiar address `Dove` was rendered as `친구`, following the
existing contextual decision. English `get rid of the Hierophant` and the
linked quest references support removing the Hierophant from power, not
necessarily killing them; the line now says `권좌에서 끌어내리려면`.

At `2291`, Japanese `教団員のみ` confirms that `Members Only` refers to
members of a religious order, not a club or subscription. The label is now
`교단원 전용`.

At `2295`, the objective now uses the concise `-기` form:
`스칼드(Skald)에게서 혼돈 무기 핵(Chaos Weapon Core) 얻기`. The related
armor-set objective at `7588` was also recast as
`전설적인 드루이드 에이든 오코너(Aiden O'Conor)가 잃어버린 갑옷 세트의
모든 조각 찾기`. Related `18522` and `43481` already used the objective form.

At `2370`, English `cage`, Japanese `檻`, and Chinese `笼子` identify an
enclosure, not a prison building. The request now reads `제발 우리 문을 열어
줘!`, consistent with the supported wording at `51184`.

At `2463`, Japanese explicitly names the quest item as Kora Petal. The Korean
now preserves its identity as `코라 꽃잎(Kora Petal)`, consistent with
`30588`.

At `2493`, `가장 중요한 인재 중 하나` was replaced with the more natural
`손꼽히는 실력자`, retaining the English idea of a highly powerful asset and
the Japanese description of a valued member.

## Retained

- `2272` already pairs the complete title `The Words of Solen Reimgar as
  Chronicled by Parthalan`.
- `2303` already uses `워든스 브리지(Warden's Bridge)`, matching the other
  current occurrences with the same English name. `Warden Bridge` at `19738`
  is a distinct source form and remains separately paired.
- `2345` and all 19 exact-English duplicates already use the same complete
  Korean pairing, `컵의 왕(King of Cups) 이리온(Irion)`.
- `2365` already has the complete `풍차섬(Windmill Island)` pairing.
- `2372` already has five Korean lines, matching the five-line English,
  Japanese, and Chinese stanza; no line break was changed.
- `2429` already preserves the comparison in `산속의 프레야처럼(As Freya in
  the Mountains)`.

The related `Glass` references at `17289`, `28445`, `56303`, and `59057`,
the other `Warden's Bridge` references, and Kora Petal at `30588` were
cross-checked. Their current wording already reflects the supported forms.

## Verification

- All 12 current candidates in the range have a disposition in the
  machine-readable decision manifest.
- Six in-range IDs and one related ID were edited; only those seven
  fingerprints were refreshed.
- The full review ledger, CSV-preservation and context-index regression
  suites, context index/catalog reproducibility, CSV record/order/BOM/newline
  checks, and CRLF-aware diff check passed.
- Candidate reconciliation now covers 138 of 4,015 current candidates
  (3.44%). The remaining pool is still incomplete.
- No commit was made.
