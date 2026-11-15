# Asset Revalidation: `611613.quest_bxml` (`SQ66` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 97 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese supplies secondary meaning evidence.
- Twenty-six correction-candidate IDs; five also have unresolved findings.
- No translation CSV or extracted asset was changed. Findings require the
  separate approval/editor step.

## Context Evidence and Limits

The asset has 52 distinct serialized `dialog_line_*` handlers with the
`SQ66` prefix, but no explicit `QUEST_ID` or matching NPC symbol. Its text
concerns General Fynn's lost squad, Castle Ansilla, Ticneri, and Soulbind.
This groups the topic, not individual speakers, branches, addressees, or
playback order. Speakers remain unassigned except `24356`, where English
`My name is Fynn, General Fynn` and Japanese `私はフィン` directly identify
Fynn. That self-identification does not establish the speaker of nearby IDs.
Dialogue order remains unknown throughout.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1133`, `2546`, `7885`, `9622`, `9701`, `10945`, `31278`, `31395`, `32115`, `42445`, `42909`, `45004`, `46979`, `55380`, `59551` | Name consistency / English pairing | The same English `Ticneri` varies between `틱네리` and `티크네리`, often without a parenthetical. Japanese consistently has `ティクネリ`; existing character labels `36234`/`50947` use `틱네리(Ticneri)`. Propose that form within this bounded quest group, with full pairing at least once per affected row. This is a proposed local alignment, not a newly approved global glossary entry. At `2546`, also replace place-like `에는 어떻게 가지?` with `한테는 어떻게 가지?`; at `9701`, use `틱네리(Ticneri)에게 가자.` | High |
| `18873`, `21589`, `39623`, `58687` | Name consistency / English pairing | English consistently has `Gautliffe`, Japanese `ゴートリフ`; Korean varies between `고틀리프` and `고트리프` and lacks pairing in three rows. Propose consistent `고틀리프(Gautliffe)`, preserving the separate unresolved rank question below. Do not silently use the name fix to choose `일병` or `이병`. | Medium-high |
| `17451`, `21589`, `32057`, `50445` | Terminology / referent continuity | The same castle entry route, English `refuse pipe` and Japanese `廃棄用パイプ`, varies between `오물 배수관`, `오물 배출관`, `폐기물 배출관`, and `쓰레기 배출관`. Reuse `오물 배출관` for these explicit mentions. Retain ordinary short `파이프` references; this is not a global pipe/drain replacement. | Medium-high |
| `14325`, `52078` | Naturalness / text type | English and Japanese are quest-journal records. Korean `이용하려 해`, `죽여야 해`, `들어갈 수 있어` and `찾았어`, `마셔야 해` read as spoken explanations. Recast in journal prose, retaining the lever location at `14325` and the escalating time pressure at `52078`. For example, end `52078` with `망설일수록 내게 남은 시간은 줄어든다.` | High |
| `18873` | Naturalness | English `I still hope... but I have no illusions about what you'll find` means hope tempered by realistic expectations. Korean `자네가 무엇을 발견할지 모르는 건 아니네` is opaque. Consider `아직 희망은 품고 있지만... 끔찍한 소식을 들을 각오도 하고 있네.` Preserve the request to find the soldier and the existing `하게체`; do not assign every Fynn-topic line that register. | Medium-high |
| `23402` | Naturalness | English `Bottoms up` and Japanese `飲み干せ` urge drinking the cure. Korean `원샷해` introduces modern bar slang into an urgent cure instruction. Consider `어서 그 빌어먹을 걸 마셔. 끝까지 들이켜, 이 바보야!` Retain the source's rough encouragement rather than removing it. | Medium-high |
| `24356` | Naturalness | This explicit self-introduction and account of the unit use written-sounding `장군이다 ... 진격했고 ... 길을 열었다`. Japanese is plain military speech, not polite `です/ます`. Consider conversational `난 틸레라(Tilera)의 군대에 속한 핀(Fynn) 장군이야` and `길을 열었지`, preserving Ariad, Klurikon, and the unit's role. Do not switch to formal honorific self-presentation. | Medium |
| `32115` | Meaning | English calls Soulbind `his latest creation`; Japanese does not supply a claim that it was the final creation. Korean `그자가 마지막으로 만들어 낸 저주다` converts most recent into final. Use `그자가 가장 최근에 만들어 낸 저주다`, separate from the last spell cast while dying. | High |
| `45004` | Meaning / naturalness | English `touched you with the Soulbind` describes the curse taking effect; Japanese makes the curse explicit. Korean `영혼 결속(Soulbind)으로 널 건드렸나 봐` is vague. Consider `틱네리(Ticneri)가 네게 영혼 결속(Soulbind)의 저주를 걸었나 봐.` Retain the ironic parting-gift remark. | Medium-high |

The two supplemental Ticneri labels above were checked only for terminology;
they are not counted as newly reviewed IDs or overwritten in the ledger.

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `18873`, `21589`, `39623`, `58687` | Rank terminology | English `Private` and Japanese generic `兵卒` do not settle a Korean military-rank mapping. Korean has both `일병` and `이병`; no confirmed mapping was found in the glossary or related dispositions. Hold the exact rank, or seek approval for a generic `병사 고틀리프(Private Gautliffe)`, independently of the name candidate. |
| `59551` | Meaning / object | The existing disposition leaves the material of `carve off a piece of Ticneri` unspecified: Japanese says a fragment, Chinese explicitly says flesh. The linked dialogue identifies a Tuatha wizard but does not establish the intended trophy material or appearance. Keep Korean `일부` pending scene evidence; propose only the name annotation here. |

## Retained Decisions and Structural Checks

- Soulbind follows confirmed glossary `lore:soulbind`:
  `영혼 결속(Soulbind)` and the full compound
  `영혼 결속 저주(Soulbind Curse)`. No replacement with an unrelated
  fate-binding term is proposed.
- `18873`: masculine reference follows English `he` and Japanese `彼`;
  the Chinese feminine pronoun does not override those sources. This
  preserves the existing D-5961 disposition.
- `55380`: the refusal to retreat and ensuing deaths follow English.
  D-20182 already closed that meaning question; the new candidate is only
  the Ticneri spelling, not a reversal of that disposition.
- `50287`: English concerns ignoring dying people; Japanese instead
  concerns escaping death. Existing Korean follows English and is retained.
- `892` addresses a superior with polite Korean. Plain Japanese alone
  does not establish that this situational respect is erroneous.
- There are no exact-English duplicate groups within this asset.
- All 97 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not playback/display testing.

## Complete Asset ID Set

`892`, `1133`, `1992`, `2085`, `2290`, `2331`, `2546`, `2847`, `3410`,
`6180`, `6942`, `7262`, `7522`, `7885`, `9622`, `9701`, `10945`,
`14325`, `14837`, `15182`, `16069`, `17217`, `17364`, `17451`, `18053`,
`18446`, `18873`, `18931`, `19023`, `20027`, `21494`, `21589`, `21615`,
`21963`, `22240`, `23402`, `24312`, `24356`, `24480`, `24523`, `24891`,
`25005`, `25733`, `26446`, `29910`, `30544`, `31278`, `31395`, `32057`,
`32115`, `32150`, `33427`, `33647`, `33958`, `35710`, `35883`, `36067`,
`36084`, `36396`, `36745`, `37974`, `39623`, `41391`, `41453`, `42445`,
`42909`, `43681`, `45004`, `46061`, `46979`, `47421`, `47556`, `48337`,
`49194`, `50287`, `50445`, `50692`, `51654`, `52078`, `52884`, `53072`,
`53352`, `53900`, `54274`, `55380`, `55568`, `57795`, `57867`, `58687`,
`58689`, `59551`, `60498`, `61690`, `61740`, `63649`, `64339`, and
`64481`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
