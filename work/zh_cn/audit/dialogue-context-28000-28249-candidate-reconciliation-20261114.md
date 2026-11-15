# Candidate Reconciliation: IDs `28000`-`28249`

- Date: 2026-11-14.
- Rechecked all 18 correction candidates against same-ID English, Japanese,
  Chinese, and active Korean rows, plus linked quest and terminology reports.
- Thirteen supported corrections were already present. `28066` received a
  name-spelling correction; three candidates were retained. `28142` had
  already been reconciled as a linked candidate and is not counted twice.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `28032` | Retained. `길손이군` is a natural rendering of `Someone off the road` in this casual greeting; the advice about selling peasant clothes remains clear. |
| `28048` | Confirmed current. `강력한 새 공격을 사용할 수 있게 됩니다` correctly expresses that mastering the staff unlocks new attacks; it does not imply disabling attacks. |
| `28055`, `28144` | Confirmed current. `Keep Library` is `요새 도서관`, supported by the Japanese and Chinese and consistent with other uses of this location. This is contextual, not a global replacement for `Keep`. |
| `28057` | Confirmed current. `데다(Deda)` is paired, while the advice about Catrin and Nanne Hanri remains intact. |
| `28066` | Corrected. The Savant rank was already `사반트(Savant)`. This is the only default occurrence of the short name `Aethan`; every other English-table use names Aethan Engar, whose established Korean form is `에이선 엥가르`. Japanese `イーサン` and Chinese `艾森` corroborate the same character. Changed only `에이던(Aethan)` to `에이선(Aethan)`; no surname or speaker identity was added. |
| `28070` | Confirmed current. `노획한 요툰(Jottun)의 마법 갑옷` describes armor taken as spoils, rather than implying that the Jottun was captured. |
| `28093` | Retained. `마법진` matches Japanese `魔法陣` for the circle being asked about; no more specific identity is established. |
| `28097` | Confirmed current. `우리는 함께 ... 에샤라로 인도되었다` preserves the passive plural event and does not incorrectly make Taibreah the person who brought the group there. |
| `28107` | Retained. `연금술 조제법` accurately renders the dangerous alchemical formula and its potential consequences. |
| `28120` | Confirmed current. `점멸(Blink) 능력에 독 효과가 더해집니다` says poison is added to Blink, supported by Japanese `毒の効果が追加される`. |
| `28135` | Confirmed current. `에메랄드 여인(Emerald Lady)` preserves the epithet and its English pairing. |
| `28142` | Previously reconciled; not counted again. The linked `SQ108 / Praetorian Paige` candidate was reviewed with `18902` in the `18750`-`18999` batch. The current `계획은 빈틈없이 맞아떨어졌다` is natural and source-supported. |
| `28144` | Confirmed current. The unreadable-book objective, translation request, and `요새 도서관` location are all preserved. |
| `28151` | Confirmed current. The complete label is `컵의 여왕 메어(Maire, Queen of Cups)`, matching the active form across the 19 identical source rows. |
| `28172` | Confirmed current. The prose distinguishes a mortal embodiment of the followers' ideal from a literal “version”; it says Niria inspired great works rather than claiming she created them. The five-paragraph structure is preserved. |
| `28178` | Confirmed current. `벨렌의 성약단(Belen's Testament)` identifies the established faction in this context, consistent with Japanese `ベイレン結社`; this does not standardize every ordinary use of `testament`. |
| `28236` | Confirmed current. The singular English label `Sativa Fiber` is paired as `사티바 섬유(Sativa Fiber)`, not pluralized. |
| `28248` | Confirmed current. `마스터슨 장군(General Masterson)의 무덤` pairs the complete grave label. |

The 13 previously applied corrections are `28048`, `28055`, `28057`,
`28070`, `28097`, `28120`, `28135`, `28144`, `28151`, `28172`, `28178`,
`28236`, and `28248`.

## Verification

- All 18 candidate IDs were reconciled; `28142` is the only ID excluded from
  the new count because it was explicitly reconciled in an earlier linked
  candidate batch. Seventeen IDs are newly counted.
- All four language tables contain one row for each candidate. Embedded
  line-break counts and runtime/markup signatures match across languages.
  The multi-paragraph entry at `28172` retains its paragraph structure.
- The only new translation edit was `default:28066`, applied by exact ID with
  `tools/replace_text_preserve_eol.py`. Only its `source_fingerprint` was
  refreshed in the review ledger.
- The complete review ledger validates against all 65,135 four-language
  rows. The CSV-preservation tests and context-index tests passed.
- No source CSV or extracted game asset was changed; no commit was made.

Cumulative candidate reconciliation is 1,635 / 4,015 (40.70%), with 2,380
not yet reconciled.
