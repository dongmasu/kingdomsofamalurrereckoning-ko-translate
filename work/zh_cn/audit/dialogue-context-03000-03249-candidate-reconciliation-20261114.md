# Candidate Reconciliation: IDs `3000`-`3249`

- Date: 2026-11-14.
- Rechecked all 23 current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, active Korean, and linked review reports.
- Three in-range corrections were applied; 20 candidates were retained because
  their supported wording was already present or the proposal was not
  sufficiently supported.
- Three related rows outside the interval were corrected: repeated epithet
  consistency at `56854`, and the omitted bug count at `36982` and `38893`.
- No speaker or playback order was inferred from asset association.

## Applied Corrections

At `3052`, the Japanese line is conversational, while the existing Korean
ending `믿기지 않는군` sounded stiff. It now reads `그렇게 빨리 회복한 걸
보니, 죽을 뻔했다는 게 믿기지 않을 정도야.`

At `3125`, the two questions about the Midden bodies and drawing out Meathgra
had mismatched endings (`-나?` and `-어?`). Both now use conversational plain
questions: `미든(The Midden)의 시체는 처리했어? 미스그라(Meathgra)는 유인해
냈어?`

At `3163`, the quest objective `Speak with Feride` now uses the established
action form `페리드(Feride)와 대화하기`.

## Related Corrections

The epithet `Grasper of the Spear of Light` also appears at `56854`. To match
the source-supported wording and pairing at `3075`, `빛의 창을 움켜쥔 자` is
now `빛의 창(Spear of Light)을 쥔 자`.

The exact label `Boggart (2 Bugs)` occurs at `36982` and `38893`. Japanese and
Chinese both preserve the two-bug count, so the prior disposition that treated
the count as unnecessary is superseded. Both labels now read
`보가트(Boggart) (벌레 2마리)`.

## Retained

- `3073`, `3077`, `3085`, and `3092` already contain the supported venue,
  greeting, activity-label, and disappearance wording.
- `3075` already pairs the source epithets and now agrees with the related
  `56854` wording.
- `3099` already matches `20880` as `손수건 하나 팔게`.
- `3123`, `3124`, `3157`, and `3177` already reflect the reviewed description,
  entry label, introduction, and book meaning.
- `3140` retains `계약` and `논의`: the English `agreement` and Japanese
  `契約` support this formal wording, and no clear meaning error was found.
- `3178` already matches the shared English passage at `17650`; the remaining
  clauses differ with their source subjects.
- `3187` uses generic `동굴` for lowercase `hollow`; capitalized `The Hollow`
  references are handled separately.
- `3201`, `3207`, `3216`, `3218`, `3223`, `3237`, and `3241` already contain
  the reviewed Caeled spelling, bound meaning, paired labels, consistent
  Boggart capitalization, yielded meaning, and humility.

## Verification

- All 23 in-range candidates have decisions in the manifest.
- Only Korean `Texto` fields for `3052`, `3125`, `3163`, `36982`, `38893`, and
  `56854` changed; only their six `source_fingerprint` values were refreshed.
- The CSV row count, ID order, BOM, existing line endings, and text structure
  were preserved. The full ledger, index/catalog checks, both regression
  suites, and CRLF-aware diff check passed.
- Sequential candidate reconciliation now covers 198 of 4,015 current
  candidates (4.93%); this remains partial coverage.
- No commit was made.
