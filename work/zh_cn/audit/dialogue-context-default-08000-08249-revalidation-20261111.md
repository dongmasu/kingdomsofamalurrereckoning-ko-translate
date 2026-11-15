# Sequential `default` Revalidation: IDs `8000`-`8249`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `8000`-`8249`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. The 71 existing records had current four-language
  fingerprints and their prior dispositions were retained. The other 179
  IDs were reviewed and recorded.
- Eight new IDs have correction candidates. Three new IDs have
  evidence-limited findings.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8022` | Meaning / naturalness | `Go, already!` is an impatient command to hurry, supported by Japanese `早く行け` and Chinese `快走吧`. `이제 그만 가!` can sound like “stop and go away”; consider `어서 가!`. | High |
| `8105` | Naturalness | `그 계절들은 이제 한참 전에 지나갔다` is an awkwardly literal rendering of “those seasons are long past.” Japanese and Chinese recast it as a past era; consider `하지만 그 시절도 이미 오래전에 지났다`, retaining the reflective tone. | High |
| `8135` | Terminology / consistency | The same `Victor's Brew` is rendered `빅터의 술`, `빅터의 맥주`, and `빅터의 양조주` across IDs `8135`, `21338`, `32511`, `46789`, and `57870`. The established item label at `57870` is `빅터의 양조주(Victor's Brew)`; consider using it consistently after reviewing the full sentences. | High |
| `8177` | Terminology / consistency | `Lord of the Chase` is `추적의 군주` here and at `46307`, but `추격의 군주` at `15999`. Japanese `狩猟の王` and Chinese `追猎之主` support a hunting-related title; review the three uses together and choose one Korean form, such as `사냥의 군주(Lord of the Chase)`. | Medium |
| `8190` | Format | The source is `Maire, Queen of Cups`, while Korean pairs only the name in `컵의 여왕 메어(Maire)`. The same Korean form occurs at 19 source IDs; the sequential review at `7079` also noted the missing title pairing. Earlier grouped decision D-19444 cleared the title's meaning and referent and treated pronunciation variants as non-blocking; this narrower candidate concerns only whether to pair the English title in parentheses. | Medium |
| `8191` | Naturalness / terminology | `the Weave` is rendered `그물` in `삶에 엮인 그물의 손길`, which reads as a net rather than the fate-weaving image used elsewhere (`운명의 실`, `운명의 직조`). Review this instance with the related Weave passages and use a natural, consistent fate-related expression without imposing a corpus-wide term prematurely. | Medium |
| `8214` | Naturalness | `그녀의 죽음에 복수했지만` is an awkward Korean collocation. English, Japanese, and Chinese all say the speaker avenged her death; consider `그녀의 원수를 갚았지만 마음은 나아지지 않았어`, preserving the following admission that the loss hurts more. | High |
| `8235` | Format / localization | The name `Andrew` remains in English in Korean, while Chinese transliterates it and the project normally pairs localized names with English. Consider `앤드루(Andrew)` if this is intended as a displayed Korean name. | Medium |

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `8018` | English says `an auroch`, while the Korean parenthetical uses `aurochs`; Japanese transliterates the animal and Chinese uses a generic ox term. The animal meaning is clear, but the source spelling and preferred Korean/English label cannot be settled from this row alone. |
| `8029` | English `Meet for the duel` and Chinese suggest meeting for a duel, while Japanese `決闘に立ち会う` suggests attending or witnessing one. `결투를 위해 만나기` does not resolve the difference; retain it pending objective/context evidence. |
| `8236` | The English source is malformed (`I will him in my way`). Japanese and Chinese do not fully settle the missing verb, so the plausible Korean `내 방식대로 그를 상대할 거야` remains provisional. |

## Checks Retained or Cleared

- The earlier terminology clues at `8114` and `8134` were checked. `Court of
  Enchantments` is consistently `마법의 궁정` across its 64 English-source
  matches. `Evening.` uses the natural general Korean greeting `안녕하세요`;
  no forced time-of-day wording is proposed.
- `8146` retains the manual-based Korean deity name `로포쿠(Lopoku)`. The
  English source's `Lupoku` spelling variant is documented elsewhere and is
  not a reason to alter the established Korean name.
- `8162` retains `각하` for `your grace`, following the existing reviewed
  project convention; no unsupported royal rank is added.
- Sixty-five exact-English duplicate groups touch this range (1,547 rows
  across the corpus); all have matching Korean text.
- Logical line-break counts and runtime/layout-token identities match across
  the four languages for all 250 IDs. Placeholder position varies by language
  at `8077` and `8127`; all arguments are retained. Six Korean strings have
  21 existing CRLF embedded breaks: `8036` (10), `8044` (2), `8121` (1),
  `8133` (2), `8171` (2), and `8187` (4). They were preserved.
- Of the 179 new IDs, 127 have indexed quest-asset links and 52 have none.
  Asset membership does not establish an individual speaker, handler
  mapping, branch, or dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
