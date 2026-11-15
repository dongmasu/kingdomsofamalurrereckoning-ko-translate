# Sequential `default` Revalidation: IDs `53500`-`53749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 64 existing ledger fingerprints; all match. Existing rows
  were preserved, and the other 186 IDs were appended in ascending order.
- Recorded nine current correction candidates, including seven rechecked
  candidates already in the ledger and two newly identified candidates.
  Five additional readings remain evidence-limited holds.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Current Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `53519` | Naturalness | The Korean repeats the memory image in `추억으로 남겨 두고` and `추억 속에만 있어야 할 곳`. Consider a more compact sentence such as `이제 여기에 우리를 위한 건 아무것도 남지 않았어요. 이곳은 추억으로 남겨 두고 떠나요. 그게 있어야 할 자리니까요.` Preserve the source's idea that memory is where this place belongs. | Medium |
| `53537` | Terminology / naturalness | The four `Sacred Pools` are `신성한 연못` here, while the SQ93 review recorded competing forms and proposed `성스러운 연못(Sacred Pools)`. Recheck that term and make the Korean clause about opening the Water Lock natural without changing the four-pool requirement. | Medium |
| `53577` | Terminology consistency | `Master's Tallow` is `명장의 동물성 지방` here, while the same item is `장인의 동물성 지방` at `53664`; the SQ46 review recommends the latter as the shared form. Consider aligning this explicit item mention while retaining `(Master's Tallow)`. | High |
| `53586` | Meaning / naturalness | `You're playing right into my hands!` means the addressee is acting to the speaker's advantage. `제대로 내 손아귀에 들어왔군!` instead emphasizes being under the speaker's control. Consider `네가 내 뜻대로 움직여 주는군!` or another natural line that preserves the manipulation idiom. | Medium-high |
| `53592` | Terminology / spacing | `마녀기사` conflicts with the established spaced `마녀 기사` form used elsewhere for `Witch Knight`. Consider `마녀 기사 클레란(Khleran)을 처치했다.` | High |
| `53623` | Shared-source consistency | Its first two English sentences are identical to `5313`, and the Japanese and Chinese first two sentences also match, but the Korean wording differs. Consider aligning the shared portion in both IDs, for example: `거미 습격으로 캐너록(Canneroc)과 연락이 끊긴 멘리 토그(Menri Togh) 가족의 농장을 조사해 달라는 부탁을 받았다. 그곳에서 농장 일꾼 카터리 제이크(Cartery Jayck)가 토그 가족을 살해했다는 사실을 알게 됐다.` Keep the distinct endings at `5313` and `53623`. | High |
| `53634` | Meaning / naturalness | `As the night draws close` means as night approaches, not before it gets late. Consider `밤이 다가오면 신들을 기리며 잔치를 벌이고 술을 마셔.` | Medium-high |
| `53657` | Naturalness / speech level | `안녕, 낯선 이여.` sounds literary and archaic beside the plain English greeting and Japanese `こんにちは、見知らぬ人`. Consider a natural plain greeting such as `안녕, 낯선 사람.` No individual speaker is inferred. | Medium-high |
| `53673` | Speech level / naturalness | `잊지 않겠네` has a marked older-sounding `-네` ending beside the otherwise conversational sentence; Japanese uses a plain statement. Consider `네 친구 에문다스(Emundas)를 위해 감수한 위험을 잊지 않을게. 기억력도 좋고 주머니도 두둑하니까.` No individual speaker is inferred. | Medium |

Seven candidates above were already recorded at `53519`, `53537`, `53577`,
`53592`, `53623`, `53657`, and `53673`; their prior ledger rows and
fingerprints were not overwritten. The latest assessments are recorded here.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `53528` | Meaning / pronoun reference | `he` and the identity of the person moved to another lab remain unclear in the isolated text. The Korean follows a plausible reading; do not assign the pronoun to Octienne or another person without stronger evidence. |
| `53555` | Source anomaly / pronoun reference | The Japanese row contains Chinese-language text, and the English shifts among `we`, `us`, `I`, and `them`. Korean retains the five-line structure and the English-led account, but the referents cannot be resolved safely. |
| `53587` | Terminology | `Writ of Trade` is rendered variously as a trade agreement, warrant, or authorization in the locale references. The Korean `교역 허가서` is plausible; retain it pending clearer context. |
| `53590` | Meaning | `answer for his crimes` can mean being held accountable, made to confess, or questioned in this access-to-information context. The Korean `죄를 추궁하면` remains plausible, so no speculative correction is proposed. |
| `53749` | Meaning | `a dowry never taken` does not establish whether the dowry was unclaimed, unused, or never received. The Korean preserves the unmarried-bride relation; retain it pending context. |

## Rechecked Findings and Structure

- At `53501`, the English spelling `Thorir` differs from Japanese `Tore` and
  Chinese `Soriel`; Korean follows the English name and pairs it. This is a
  source-locale discrepancy, not a supported Korean correction.
- Japanese `53555` is Chinese text rather than Japanese. At `53603`, Japanese
  says treatment while English and Chinese say meditation; Korean follows
  English and Chinese. At `53718`, Chinese differs from the English/Japanese
  protection reading; Korean follows English and Japanese.
- Sixty-eight exact-English duplicate groups across the corpus touch this
  range, covering 69 target rows. Korean wording matches within every group.
  The shared first two sentences at `5313`/`53623` are not counted as a full
  exact-string duplicate because their English endings differ.
- Seven rows contain embedded line breaks: `53542` (1), `53555` (4),
  `53574` (2), `53671` (10), `53682` (10), `53710` (3), and `53736` (2).
  Break counts match across all four locales, for 32 breaks per locale.
  Korean embedded separators remain CRLF.
- At `53542` and `53686`, localized display-label contents differ as
  expected; the `{*1}` and `{*3}` marker identities and positions are
  preserved. At `53569` and `53744`, Japanese reverses variable order while
  English, Chinese, and Korean agree. At `53582`, Chinese alone differs in
  the `{LINE_SPACE}` / `{LINE_LEFT}` sequence after `#NAMED_ICON_CRIME#`;
  Korean matches English and Japanese.
- Of 250 IDs, 194 have indexed asset associations, represented by 195 links
  across 125 assets; 56 have no indexed asset. Of the 186 new IDs, 130 are
  linked. Asset links do not establish per-key speakers or playback order.

## Range Result

- The range has nine current correction-candidate IDs and five
  evidence-limited hold IDs.
- After adding 186 IDs, the ledger covers 56,719 of 65,135 unique `default`
  IDs; sequential coverage reaches `53749`, and the next range is
  `53750`-`53999`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
