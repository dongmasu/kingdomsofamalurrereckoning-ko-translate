# Sequential `default` Revalidation: IDs `51500`-`51749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 80 pre-existing four-language fingerprints; all match.
  Appended the other 170 IDs without changing existing ledger rows.
- Recorded 13 current correction candidates and two evidence-limited holds;
  235 IDs have no current finding. Findings are proposals, not approval to
  edit translation CSVs.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `51521` | Meaning / reference | `Dace's Sister` is rendered `데이스(Dace)의 누이`, which presupposes that Dace is male. English identifies a sister and Japanese/Chinese use 姉妹/姐妹 without establishing Dace's gender. Consider `데이스(Dace)의 자매`. | High |
| `51522` | Naturalness | `가끔 배신이 오가기도 하지만` can imply betrayal is exchanged between parties. English `the occasional treachery` and Japanese `裏切りの舞台` describe treachery occurring at sea. Consider `때로는 배신이 벌어지기도 하지만`. | Medium-high |
| `51527` | Naturalness / title | `One Man's Trash...` is rendered literally as `한 사람의 쓰레기...`, an awkward Korean title. Japanese uses a proverb-like fragment and the quest concerns resale. Consider `누군가에겐 쓰레기...`, preserving the ellipsis without supplying an unattested proverb ending. | Medium |
| `51595` | Naturalness | `검은 반드시 죽을 필요가 없다` is a stiff literal rendering of swords not sharing mortals' need to die. Consider a more natural phrasing such as `위대한 일을 위해 벼린 훌륭한 검이지. 하지만 필멸자와 달리 검은 꼭 죽어야 하는 건 아니야.` Keep the figurative contrast; speaker attribution remains unknown. | Medium-high |
| `51600` | Naturalness | `I need the gold, okay?` is reduced to the awkward fragment `나한테 금화가 필요하다고.` Japanese and Chinese retain both the need for gold and the emphatic tag. Consider `나한테 금화가 필요하단 말이야, 알겠어?` | High |
| `51605` | Meaning / naturalness | `navigating the liars and cheats` is rendered as finding one's way among them, which suggests physical navigation. Japanese describes getting past them. Consider `거짓말쟁이와 사기꾼들 사이를 잘 헤쳐 나가길 바라`, retaining the following warning about meeting one every ten paces. | High |
| `51611` | Meaning | `rewarding` means more lucrative here: Japanese `実入りのいい` and Chinese `报酬更加丰富` refer to better pay. Korean `더 보람 있는 일` instead means more fulfilling. Consider `더 보수가 좋은 일도 있겠지만... 기다릴게. 나중엔 네가 더 선뜻 받아들일지도 모르니까.` | High |
| `51665` | Terminology consistency | The capitalized place name `The Isles` is `제도(The Isles)` here, but `군도(The Isles)` at `51449`; `51487` also uses `제도(The Isles)`. Consider aligning this named-region occurrence with `군도(The Isles)`. This is scoped to the capitalized name, not every use of `isles`. | Medium |
| `51677` | English pairing / format | The source title is `Usher of the Gardens`, but the Korean parenthetical contains only `(Usher)`. If retaining the English pairing, include the full title: `정원의 안내자(Usher of the Gardens)`. The translation of `Usher` as a garden guide/title remains reasonable. | Medium |
| `51682` | Formatting / terminology | `Kill the Witch Knights` is rendered `마녀기사 처치하기`, while the established compound is spaced as `마녀 기사`. Consider `마녀 기사 처치하기`. | High |
| `51692` | Meaning / poetic wording | The closing phrase `storm-sent king on high` is rendered `폭풍이 내려보낸 지상의 왕`, reversing the elevated/heavenly sense. Japanese has `天上の王` and Chinese `至高王`. Consider `폭풍이 내려보낸 하늘의 왕` or another source-supported form; do not impose an unconfirmed formal title. | High |
| `51698` | Meaning / terminology | `Break the circle` is rendered `원을 깨뜨리기`. The Japanese leaves `circle` open, but Chinese says `法阵`; the linked SQ41 text identifies Adar's binding magic circle, and related entries use `마법진`. Consider `마법진을 깨뜨리기` in this quest context. | Medium-high |
| `51713` | Speech level / naturalness | The line shifts from conversational `좋은 선택이야` to archaic `선포하노라`; Japanese remains conversational through its proclamation. Consider keeping the whole line in the established conversational register, e.g. `좋은 선택이야. 이제 너를 신비술의 대가로 선포할게.` The title rendering itself is retained. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `51568` | Speech level | Korean uses `조심하게`, while Japanese uses a plain imperative. The asset association does not identify the speaker or relationship, so retain the register question as unresolved rather than assigning a voice or normalizing it from nearby lines. |
| `51702` | Title terminology | `Templar` is a personal rank whose Korean rendering and English-pairing convention remain unresolved in the prior Jorielle review. Keep `템플러 조리엘(Jorielle)` pending that separate terminology decision; do not apply the plural faction name rule to a personal rank. |

## Rechecked Findings and Structure

- Existing ledger entries were not overwritten. The earlier candidates at
  `51522`, `51527`, `51595`, `51682`, and `51698` remain supported by the
  current text. Earlier holds at `51568` and `51702` remain unresolved.
- The new findings at `51521`, `51600`, `51605`, and `51611` conflict with
  older `not-issue` ledger dispositions. Those historical rows remain
  unchanged under the append-only rule; this dated range report records the
  newer judgments for those IDs.
- The current review also identifies a title-pairing candidate at `51677`
  and a register candidate at `51713`; their older exact-key checks did not
  address these specific issues. The newer `51665` consistency candidate
  reflects the `51449`/`51487` comparison and supersedes neither historical
  ledger row.
- Fifty-three exact-English duplicate groups touch the range, covering 55
  target rows. Korean matches across the full duplicate groups except
  `51728`/`37760`. Their Japanese (`これは何事だ？` / `これは何事？`) and
  Chinese (`这是什么？` / `什么事？`) differ, supporting the Korean wording
  difference; retain both.
- Seven entries contain embedded line breaks: `51516` (one), `51550` (one),
  `51628` (two), `51685` (five), `51692` (seven), `51715` (four), and `51742`
  (one). All four languages have 21 embedded breaks; line-break counts match
  per ID.
- Placeholder identities and occurrence counts match. At `51610`, Korean
  orders `{3}` before `{2}` to fit “use {3} to defeat {2}”; Chinese does the
  same, while English and Japanese place `{2}` first. No token was dropped.
- Of 250 IDs, 204 have indexed asset associations, represented by 205
  ID-asset links across 143 assets; 46 have no indexed asset. Asset links
  do not establish per-key speakers or playback order.
- The complete 55,260-entry ledger passes four-language fingerprint and
  status validation. Catalog/index reproduction, nine related tests, and
  `git -c core.whitespace=cr-at-eol diff --check` pass.

## Range Result

- This range has 13 current correction-candidate IDs and two
  evidence-limited holds; 235 IDs have no current finding.
- After appending 170 IDs, the ledger covers 55,260 of 65,135 unique
  `default` IDs (84.84%), leaving 9,875. Sequential coverage reaches
  `51749`; next is `51750`-`51999`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
