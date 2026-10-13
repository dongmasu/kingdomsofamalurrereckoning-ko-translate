# Consolidated Context Review: Repeated Greetings and Farewells

- Date: 2026-10-12.
- Decision: D-19467.
- Scope: 24 exact, repeated English greeting/farewell labels still marked
  uncertain in the latest register state.

## Findings

| Source label | IDs | Disposition | Rationale |
| --- | --- | --- | --- |
| `Goodbye.` | 29335, 30460, 30541, 30557, 31013, 31431, 31688 | not an issue | English `Goodbye`, Japanese `ではまた`, Chinese `再见`, and Korean `잘 가.` all express a farewell. |
| `Farewell.` | 30453, 30478, 31039, 31390, 31470, 31842 | not an issue | English `Farewell`, Japanese `それではまた`, Chinese `再见`, and Korean `잘 가.` preserve the farewell meaning. |
| `Hello.` | 28749, 28766, 28913, 29089, 30285, 30678 | not an issue | English `Hello`, casual Japanese `やあ`, Chinese `你好`, and Korean `안녕.` all function as greetings; the plain Korean is consistent with Japanese's casual register. |
| `Greetings.` | 29691, 29783, 30458, 32022 | not an issue | The source locales use greetings or welcoming expressions; Korean `안녕하세요`, `안녕하십니까`, `반가워`, and `어서 오게` retain that function with differing speaker voices. English does not prescribe one honorific level. |
| `Goodbye.` | 30193 | uncertain at D-19467; resolved by D-19479 | The Korean was the isolated adverb `안녕히.`. D-19479 reused the accepted exact-label precedent `잘 가.` after English/Japanese/Chinese confirmed the farewell. |

Twenty-three uncertainties were resolved as `not an issue` in D-19467; ID
30193 was resolved later by D-19479. No Korean CSV cells changed in D-19467.

## Verification

- Compared each key by `ID_Linha` across English, Japanese source and
  preserved draft, Chinese, and active Korean.
- All 24 source keys were open before review. The seven cleared `Goodbye.`
  rows use `잘 가.`; ID 30193 is the sole held variant.
- No runtime markers or embedded line breaks occur in these strings.
- Active default SHA-256 at D-19467 was
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Totals after D-19467: **2,349 accepted / 25,080 not an issue /
  11,095 uncertain** (38,524). Resume at **D-19468**.
- Subsequent disposition: D-19479 corrected ID 30193 to `잘 가.`; see
  `consolidated-context-review-default-goodbye-30193-20261012.md`.
