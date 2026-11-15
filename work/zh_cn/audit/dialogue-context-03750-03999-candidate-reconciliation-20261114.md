# Candidate Reconciliation: IDs `3750`-`3999`

- Date: 2026-11-14.
- Rechecked all 11 current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, active Korean, and their linked review reports.
- Three in-range corrections were applied; eight already-correct findings
  were retained.
- The `Stowaway` name was checked across the related quest title, creature
  description, and objective. Related rows `28829` and `37189` were corrected;
  `25333` already had the complete creature and name pairings.
- No speaker or playback order was inferred.

## Applied Corrections

At `3886`, the particle error `한 사람가` was corrected to `한 사람이`.
The English and Japanese both say that one member of the Gwynedd couple died.

At `3926`, the Korean shifted into polite speech (`안녕하세요`, `당신도
좋아하세요?`) while the English, Japanese, and Chinese are casual. The line
now uses consistent plain speech:
`아, 안녕. 난 걷는 걸 좋아해. 너도 걷는 거 좋아해? 여기 공기가 참 상쾌하네. 하루 종일 들이마셔도 좋겠어.`
This is a row-local register correction; it does not identify the speaker.

At `3971`, the quest title `Stowaway` now appears as
`밀항자(Stowaway)`.

## Related Corrections

The exact same standalone title appears at `28829`; it now uses the identical
`밀항자(Stowaway)` translation.

At `37189`, the objective `Find and kill the Stowaway` now reads
`밀항자(Stowaway)를 찾아 처치하기`, pairing the named creature and using the
established action form. This ID is outside the current sequential interval;
it will count toward reconciliation when its numeric range is reviewed.

The narrative at `25333` already pairs both `Silverback Troll` and
`Stowaway`; related `Stowaway Troll` labels at `6716`, `37845`, and `40185`
also already use their complete English pairings.

## Retained

- `3768` already states naturally that Crilgarin and Grim tried to depose the
  Hierophant and paid the price.
- `3770` already localizes `[Upgrade]` while preserving its wrapper and
  description line break.
- `3782` already uses the established short faction form
  `성약단(The Testament)`.
- `3842` correctly identifies Mitharans as people and preserves the rarity
  meaning.
- `3867` already translates `emerge together` as `함께 모습을 드러낸다` and
  preserves the poem's line structure.
- `3902` already uses the supported day-wish `좋은 하루 보내세요`.
- `3938` already uses the established component term `지렛목`.
- `3996` already uses the established skill name `대장기술` and preserves
  the reagent list.

## Verification

- All 11 in-range candidates have a disposition in the accompanying
  manifest: three corrected and eight retained.
- Only Korean `Texto` fields for `3886`, `3926`, `3971`, `28829`, and
  `37189` changed; only those five `source_fingerprint` values were refreshed.
- Exact-source title rows `3971` and `28829` now match across all four
  languages. The CSV retained its UTF-8 BOM and line-ending inventory
  (71,838 CRLF, 244 LF-only, zero bare CR).
- The 65,135-ID ledger, index/catalog checks, both regression suites
  (11 CSV-preservation and nine context-index tests), and CRLF-aware diff
  check passed.
- Sequential candidate reconciliation now covers 231 of 4,015 current
  candidates (5.75%); 3,784 remain unreconciled. Evidence-limited holds remain
  open.
- No commit was made.
