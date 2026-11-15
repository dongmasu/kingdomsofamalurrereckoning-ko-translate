# Candidate Reconciliation: IDs `35000`-`35249`

- Date: 2026-11-14.
- Rechecked all 20 current `overall=candidate` IDs against English,
  Japanese, Chinese, active Korean, and the prior edit and terminology
  records.
- `35070` was already revalidated as part of the exact-English 20-row
  `Irion, King of Cups` group, so it is not counted again. The other 19
  candidates are newly counted.
- Three IDs were changed in this pass: `35030`, `35038`, and `35107`.
  `35107` now pairs the source tier names, but the exact Korean tier terms
  remain unresolved.

## Candidate Decisions

| ID(s) | Decision and evidence |
| ---: | --- |
| `35006` | Confirmed `순찰 임무를 시작하기 전에`; English, Japanese, and Chinese refer to going on patrol, not reporting to an assignment. |
| `35030` | Refined `찢어진 쪽지`/`찢어진 책장` to `찢어진 페이지`, matching English `page`, Japanese `ページ`, and Chinese `页`. |
| `35038` | Refined the repeated Fateweaver wording to `페이트위버(Fateweaver)마다 운명의 짜임을 보는 방식이 달라서, 사용하는 카드도 제각각이야.` This keeps the plain voice and distinguishes the metaphorical `weave` from the Fateweaving practice. |
| `35043` | Confirmed the standalone title `주문 시전 모루(The Cast Anvil)`. |
| `35070` | Previously reconciled with the complete 20-row exact-English title group. The current `컵의 왕 이리온(Irion, King of Cups)` is identical across all 20 Korean rows. |
| `35077` | Confirmed `블러디(Bloody)` as the character's name, not an adjective. |
| `35103` | Confirmed the full title pairing `무심한 항로(A Careless Passage)`; the specific sense of `Passage` remains held. |
| `35107` | Added source labels for `샤드(Shard)`, `흐린 샤드(Cloudy Shards)`, `은은히 빛나는 샤드(Lambent Shards)`, and `순수 샤드(Pristine Shards)`. The three Korean grade terms remain provisional because the standalone item references use differing terms. |
| `35128` | Confirmed the established region `나로스의 이빨(Teeth of Naros)`. |
| `35147` | Confirmed `캐스터의 분노(Castor's Wrath)`; it uses the established Castor spelling and pairs the full title. |
| `35162` | Confirmed the three-paragraph Seasteel entry: `hoarded` is rendered as `비축`, `never speak` as `입에 올리지 않는다`, and `Foundry Guild` is paired. Paragraph breaks remain intact. |
| `35164` | Confirmed the plain player choice `살게.` against the plain Japanese and preserved the price token. |
| `35190` | Confirmed `레마란 일병의 무덤(Grave of Private Lemalan)`. |
| `35197` | Confirmed `발라드의 집 종자(Ballads Squire)` as the complete role label. |
| `35210` | Confirmed the full title and name `마녀 기사 아니라(Witchknight Anira)`. |
| `35212` | Confirmed the complete type label `긍지의 마법봉 기사(Pride Wand Knight)`. |
| `35216` | Confirmed the species label `보가트 성게(Boggart Urchins)` and its distinction from the Boggart creature. |
| `35218` | Confirmed the divine name pairing `권능(Authority)께서`. |
| `35219` | Confirmed the complete quest title `정해진 만남(A Preordained Encounter)`. |
| `35245` | Confirmed `블러디(Bloody)` and `우두아스(Uduath)`; the source's uncertainty about the tale remains. |

## Holds And Duplicate Checks

- The unresolved senses of `A Careless Passage` (`35103`) and the canonical
  Korean Shard grades (`35107`) remain held; the source pairings do not settle
  them.
- The 20 exact-English `Irion, King of Cups` rows all have identical Korean
  text with the complete English source label. No further bulk edit was
  needed.
- The reviewed duplicate groups preserve supported ID-specific Korean where
  Japanese differs, including `Hello?` at `35013`, `38536`, `56591`, and
  `56942`.
- Embedded line breaks and runtime-token/markup signatures were preserved.
  No speaker or playback order was inferred.

## Verification

- Newly counted candidates: 19. Cumulative candidate reconciliation is
  2,174 / 4,015 (54.17%), with 1,841 not yet adjudicated.
- Only `35030`, `35038`, and `35107` were edited in this pass. Only those
  `source_fingerprint` fields were refreshed; ledger statuses and row order
  remain unchanged.
- All 65,135 ledger fingerprints validate. Index and all three catalog
  reproduction checks pass.
- CSV-preservation tests: 11 passed. Dialogue-context index tests: 9 passed.
- The active CSV retains its UTF-8 BOM and 65,135 ordered records. Newline
  inventory: 71,838 CRLF, 244 LF-only, and no bare CR. CRLF-aware
  `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`35000`-`35249`](dialogue-context-default-35000-35249-revalidation-20261112.md),
the prior application batch at
[`33500`-`35999`](dialogue-context-edit-batch-20261114-33500-35999.md),
and the earlier linked review of
[`Irion, King of Cups`](dialogue-context-09500-09749-candidate-reconciliation-20261114.md).
