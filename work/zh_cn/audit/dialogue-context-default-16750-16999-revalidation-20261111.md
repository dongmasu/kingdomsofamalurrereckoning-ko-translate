# Sequential `default` Revalidation: IDs `16750`-`16999`

- Date: 2026-11-11.
- Scope: compare all 250 active Korean rows with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty existing ledger fingerprints matched the current four-language rows;
  190 previously unrecorded IDs were reviewed and added.
- Seven new correction candidates and six evidence-limited holds are
  recorded. Existing candidates at `16921`, `16943`, and `16988`, and
  uncertain findings at `16957` and `16995`, were retained. No translation
  CSV, source resource, extracted game asset, or localization binary was
  changed during this range review.

## New Correction Candidates

These are review proposals, not authorization to edit the active translation
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `16758` | Name / format | English capitalizes `the Carver` as a title in the creation poem. The Korean uses generic `조각가`, while project terminology uses `조각가(The Carver)`. Add the English pairing and preserve the four-line layout. | High |
| `16858` | Naturalness | `귀를 괴롭히는 속삭임` is an awkward literal rendering of `haunting whispers`; Japanese describes whispers that disturb the mind and Chinese says they linger. Consider `환영과 귓가를 맴도는 속삭임에서는 벗어날 수가 없어.` | Medium-high |
| `16864` | Meaning | `canon` is translated as `교단의 정통성`, adding an institutional-doctrine reading not established by English. Japanese refers to a collection of lore and Chinese to the shared story. Replace that phrase with a context-neutral `전승` rendering, such as `어떻게 감히 우리 전승을 자기 것이라고 주장해!` | Medium |
| `16870` | Naturalness / meaning | `대현자의 반지인 천 조각 띠` makes the ring and cloth band identical. English and Chinese distinguish a cloth band from the Archsage's ring; Japanese confirms the ring. Consider `대현자의 반지가 든 천 조각을 내 손에 쥐여 주며`. | Medium-high |
| `16927` | Name / format | This is the same `Red "the Dead" Idward` epithet found at `34250`, where Korean uses `레드 ‘데드’ 이드워드`. Align the epithet and full-name pairing with that occurrence rather than `붉은 '망자' 이드워드`. | High |
| `16989` | Terminology | `Sagecraft altar` is rendered `세공술 제단`, unlike the established `마법물품 제작 제단` in the manual and other active rows, including `50880` and `58769`. Use the established term and preserve the two blank-line breaks. | High |
| `16999` | Name / format | `The Lords` is the Lords of Valor team in the arena context; Japanese gives the full team name and the corpus consistently uses `용맹의 군주들(Lords of Valor)`. Pair the full name instead of `(Lords)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `16798` | Meaning / terminology | `Rigger` is rendered as an equipment manager in Korean, an assembler in Chinese, and transliterated in Japanese. The isolated objective does not establish the specific role; retain the current wording pending context. |
| `16885` | Meaning | `Recovery` can mean Hugues's physical recovery or return to the order. Chinese supports the medical reading, while Japanese explicitly says reinstatement; English and the asset evidence do not resolve the difference. |
| `16959` | Speech level | Korean uses 하오체 (`알겠소`, `만나 주오`), while Japanese uses formal address. No per-key speaker or addressee is established, so do not classify this register as an error from asset association alone. |
| `16960` | Meaning | `by the Hierophant's gaze` may be an oath or an emphatic comment about distance. Japanese omits the phrase and Chinese reads it as being outside the Hierophant's view; retain the current wording without choosing a definite idiom. |
| `16978` | Meaning / naturalness | `I've got a lot riding on you` can express a wager, high expectations, or substantial stakes. Japanese specifies money wagered and Chinese says high expectations; the English alone does not settle the intended nuance. |
| `16993` | Meaning | English `charges` can mean accusations or fees. Japanese supports the Korean `고발 내용`, while Chinese reads it as a price; keep the Korean provisionally and record the source ambiguity rather than forcing uniformity. |

## Existing Findings Rechecked

- `16921`, `16943`, and `16988` retain their existing correction-candidate
  dispositions; the linked asset reports remain the evidence references.
- `16957` and `16995` retain their existing evidence-limited dispositions.
- `16767` is not an issue: the English source spells the title `Lupoku`,
  while the active glossary and official Korean manual support `Lopoku` /
  `로포쿠`.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the English, Japanese,
  Chinese, and active Korean tables.
- Fifty exact-English duplicate groups touch this range, covering 771 rows.
  One group has different Korean wording: `16898`, `18884`, `60779`, and
  `62563`. Japanese distinguishes `よし` from `またな` / `またね`, supporting
  the ID-specific Korean wording; the translations were not force-normalized.
- Runtime and layout-token identities/order match across all four languages.
  At `16758`, Japanese has two embedded line breaks while English, Chinese,
  and Korean have three; Korean follows English and Chinese.
- Ten Korean strings contain 42 existing embedded CRLF breaks:
  `16755` (2), `16758` (3), `16764` (10), `16870` (1), `16877` (9),
  `16922` (2), `16923` (5), `16976` (5), `16989` (2), and `16991` (3).
  These breaks were preserved.
- Of the 190 new IDs, 138 have indexed quest-asset links and 52 do not;
  three of the linked IDs point to multiple assets. Asset links and NPC
  symbols do not establish per-key speakers, branches, addressees, or
  playback order.

The ledger now contains 29,588 of 65,135 IDs (45.43%), leaving 35,547
unreviewed. The next sequential range is `17000`-`17249`. Four-language
fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
