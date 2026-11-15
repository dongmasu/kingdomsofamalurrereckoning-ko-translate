# Sequential `default` Revalidation: IDs `42750`-`42999`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 60 existing ledger records and added 190 newly reviewed IDs.
- Recorded 26 current correction candidates and seven evidence-limited
  holds; 217 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `42755` | Name format | The weapon class `Faeblades` is rendered `페이블레이드` without its English name. Pair it as `페이블레이드(Faeblades)`; retain the chosen Korean weapon term. | High |
| `42779` | Title format | `Templar` is a capitalized order/title in `Templar diplomacy`, but Korean has only `템플러`. Pair the role as `템플러(Templar)의 외교`. | Medium-high |
| `42791` | Naturalness | `쓸모가 있을 가능성이 보여서 너에게 다가왔을 뿐이니` is stiff and calques “show the potential of use.” Japanese confirms that the speaker approached because the addressee might be useful. Consider `쓸모가 있어 보여서 너에게 다가왔을 뿐이야. 그래도 네 가치는 증명해야 해.` | Medium-high |
| `42812` | Objective format | `Visit the City Watch` is rendered as the noun fragment `도시 경비대(City Watch) 방문`. Align it with the established action-label form: `도시 경비대(City Watch) 방문하기`. | High |
| `42825` | Name format | Retain the previous candidate: `Sedeas` is unpaired alongside paired Aodh and Skycrown. Add `세데아스(Sedeas)`; this remains a row-local annotation, not a global alias. | High |
| `42834` | Title format | The standalone title `Archsage` appears as `대현자` without English. Pair it as `대현자(Archsage)` while retaining the sentence. | High |
| `42838` | Objective format | `Defeat Halcyor` is rendered `할시오르(Halcyor) 처치`. Use the established action form `할시오르(Halcyor) 처치하기`. | High |
| `42841` | Naturalness | `아말러의 비전술 학계` is an awkward rendering of the arcane communities of Amalur. Japanese describes researchers of the occult; consider `아말러(Amalur)의 신비술 연구자들 사이에서` or an equivalent natural phrase. | Medium-high |
| `42851` | Item-name format | The named `Minor Alchemist's Art Potion` has no English pairing. Pair the complete item name, for example `하급 연금술사의 기술 물약(Minor Alchemist's Art Potion)`, without changing the journal sentence. | High |
| `42853` | Name format | The standalone country name `Czech Republic` is rendered `체코 공화국` without English. Pair it as `체코 공화국(Czech Republic)`. | High |
| `42870` | Title format | Retain the `Archsage` pairing candidate in direct address: pair `대현자(Archsage)` while preserving the respectful `-님` and the sentence's honorific register. | High |
| `42883` | Title format | The standalone title `Hymn of Remembrance` is rendered `기억의 찬가` without English. Pair it as `기억의 찬가(Hymn of Remembrance)`. | Medium-high |
| `42886` | Name format | The standalone country name `Albania` is rendered `알바니아` without English. Pair it as `알바니아(Albania)`. | High |
| `42899` | Objective / name format | `Defeat the Maid of Windemere` lacks the established action ending and uses an incomplete English title. Prefer `윈더미어의 시녀(The Maid) 처치하기`, consistent with the established name `The Maid`. | High |
| `42902` | Name format | The long instruction leaves the named creature `Will O'Wisps` and people `Attan` and `Hercold` unpaired. Pair each named occurrence as `윌 오 위스프(Will O'Wisps)`, `아탄(Attan)`, and `허콜드(Hercold)`; preserve the paragraph and its command sequence. | High |
| `42907` | Full-title format | `Templar Octienne` is rendered `템플러 옥티엔(Octienne)`, pairing only the personal name. Pair the complete title and name as `템플러 옥티엔(Templar Octienne)`. | High |
| `42909` | Name consistency / English pairing | Retain the prior candidate: the same `Ticneri` varies elsewhere between `틱네리` and `티크네리`, and this occurrence lacks English. Pair the established local form as `티크네리(Ticneri)`; do not infer a speaker from the asset. | High |
| `42915` | Faction format | Capitalized `the Legion` is rendered only as `군단`. Pair the faction reference as `군단(Legion)` without changing the sentence. | High |
| `42941` | Objective / naturalness | Retain and refine the prior objective candidate. The source says the Jottun are in the camp, not that they belong to it, and the label lacks `-하기`. Prefer `마지막 야영지에서 요툰(Jottun) 처치하기`. | High |
| `42942` | Speech level | `인정하겠네` shifts to `있어`, `없어`, and `모양이야` within one utterance. Japanese is plain conversational speech. Unify the Korean register, for example `인정해야겠어. 학교는 어려운 시기를 보내고 있지. 토론에 열정을 품은 사람은 거의 없어. 다들 풀이 죽어 지내는 모양이야.` | Medium-high |
| `42950` | Place-name format | The standalone place name `Mecan's Maw` is rendered `메칸의 아가리` without English. Pair it as `메칸의 아가리(Mecan's Maw)`; the creature-like wording itself remains provisional to the established name. | High |
| `42953` | Name format | The curse names `Gastyr`, but Korean `개스터` lacks English. Pair it as `개스터(Gastyr)` while retaining the force of `Gastyr be damned`. | High |
| `42961` | Naturalness | `난 신경 쓰지 마` is awkwardly phrased as a topic followed by an imperative. Japanese says not to concern oneself with the speaker; consider `나한테 신경 쓰지 마.` | Medium |
| `42969` | Meaning / terminology | `the Authority's order` is translated `권위회의 명`, which reads as an unrelated council and conflicts with the established divine term `권능(Authority)`. Consider `권능(Authority)의 질서에 따라`. A similar inscription at `63194` also has `권위회의`; this review proposes only the scoped `42969` correction and does not apply a global replacement. | High |
| `42994` | Name format | The people-name `Forstid` appears only as `포스티드인`. Pair it as `포스티드인(Forstid)` while retaining the reassurance. | High |
| `42997` | Objective format | `Travel to Crow Peak` is rendered `크로우 피크(Crow Peak)로 이동`. Align with the established action-label form: `크로우 피크(Crow Peak)로 이동하기`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `42773` | Text type / title | `School of Hard Knocks` is capitalized in English, but Japanese and Chinese read as a figurative expression and there is no indexed asset to establish whether this is a title. Keep `고난으로 얻는 교훈` provisionally; do not add an assumed title pairing. |
| `42808` | Referent / name | English says only `the Well` and Japanese says `泉`; Korean expands this to `영혼의 샘(Well of Souls)`. The wording may refer to the named Well of Souls, but this row alone does not establish that. Retain pending direct context. |
| `42877` | Text type / title | `Ancient Wisdom` may be a title or a generic phrase. With no linked asset or other text-type evidence, retain `고대의 지혜` rather than assuming a title annotation. |
| `42889` | Speech level / address | Retain the earlier hold: Korean combines `전하` with plain endings, but Japanese also addresses the king in plain speech. The asset does not map this line to an individual speaker; do not normalize the register without scene evidence. |
| `42921` | Meaning / source fragment | English `By the Tome` may be an oath, while Korean `그 책에 따르면` reads as “according to the book”; Japanese instead expresses disbelief and Chinese is literal/ambiguous. The fragment does not settle the intended force. Hold rather than choosing an oath or evidential reading. |
| `42925` | Terminology | `Century Plants` is translated `백년초`, which can denote a specific cactus in Korean, while Japanese says `百年草` and Chinese uses `世纪树`. The row does not establish whether this is a game-specific plant name or a descriptive label; retain provisionally. |
| `42967` | Meaning / antecedent | English `I know I do` is elliptical; Japanese says `私はそう思うわ`, while Chinese suggests the speaker is curious. Without the preceding conversational turn, Korean `그럴 거라고 나도 생각해` cannot be confirmed or safely replaced. |

## Rechecked Findings

- All 60 existing ledger fingerprints in the range match the current
  four-language rows. The earlier candidates at `42825`, `42909`, and
  `42941` are retained and re-adjudicated above; the earlier hold at `42889`
  remains. ID `42808`, previously recorded as not an issue, is a current
  evidence-limited hold after comparison of the isolated `Well` reference;
  its historical ledger row remains unchanged. Existing ledger rows are
  unchanged under the append-only rule.
- One exact-English duplicate group (two range rows) occurs at `42862` and
  `42920` (`Hello.`); the Korean translations match. No translation was
  unified merely because English is identical.
- Six multiline rows contain 20 Korean line breaks. Five rows have matching
  break counts across all four languages. At `42957`, English has four
  breaks while Japanese, Chinese, and Korean have five; Korean matches the
  Japanese-derived layout, so the discrepancy is recorded without changing
  the poem's lineation.
- Runtime-variable and markup signatures match across all four languages.
- Of 250 IDs, 193 have indexed asset associations; 133 of the 190 newly
  recorded IDs are linked. Asset membership does not establish an individual
  speaker, branch, addressee, or playback order. Unsupported attribution and
  order remain unknown.

## Range Result

- The range has 26 current correction-candidate IDs and seven
  evidence-limited holds; the other 217 IDs have no supported finding.
- The ledger covers 48,839 of 65,135 unique `default` IDs (74.98%), leaving
  16,296. Reviewed IDs with indexed asset links total 39,517; 9,322 have no
  indexed asset link. Sequential coverage reaches `42999`; next is
  `43000`-`43249`.
- Four-language fingerprints, regenerated catalogs, nine related index
  tests, and the line-ending-aware diff check must pass before this batch is
  considered recorded. Translation CSVs remain unchanged.
