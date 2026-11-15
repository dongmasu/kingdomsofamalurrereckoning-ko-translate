# Sequential `default` Revalidation: IDs `55000`-`55249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 63 pre-existing ledger fingerprints and preserved those
  records. Appended the other 187 IDs in ascending order.
- Recorded three new correction candidates on new ledger rows, rechecked six
  existing candidates, and documented a new evidence-limited hold at existing
  ID `55023` without changing its append-only ledger row. The prior hold at
  `55029` remains.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `55044` | Consistency / register | This exactly repeats `Lower, then? And the card is ‒ an ace. You win!` at `31562`, but the Korean differs. The Japanese lines differ in register, while English and Chinese are identical. Following the user's rule that identical English receives identical Korean, align this row with `31562`: `그럼 낮은 쪽? 카드가... 에이스네. 네가 이겼어!` | Medium |
| `55156` | Address / naturalness | `Turn back, stranger.` is translated with the archaic, elevated vocative `낯선 이여`, while Japanese `よそ者め` is dismissive. Consider `돌아가, 이방인.` | Medium-high |
| `55217` | Honorific / address | This is one of 20 exact-English occurrences of `Your Grace`. All other Korean occurrences use `각하`; Japanese uses `閣下` and Chinese `大人` here as elsewhere. Only this row uses `전하`, which incorrectly implies royal rank. Consider `저... 각하...` | High |

## Rechecked Existing Findings

The existing correction proposals at `55108`, `55119`, `55124`, `55202`,
`55233`, and `55235` remain supported by the current four-language rows and
their linked reports. Their ledger records are preserved unchanged:

- `55108`: The English and Japanese are quest-journal prose, but Korean ends
  as spoken reflection (`영영 알 수 없겠군`). Use concise journal narration.
- `55119`: Keep the confirmed faction name `벨렌의 성약단(Belen's Testament)`
  and the death-cult description, but make their appositional relation clear;
  the current `죽음의 교단 벨렌의 성약단` is awkward.
- `55124`: Replace the awkward `트래블러(Travelers)들에 들어갈 자격` with a
  natural membership phrase such as `트래블러(Travelers)에 가입할 자격`.
- `55202`: Move the subject particle before the English parenthetical:
  `학자 네렌(Scholar Nerenne)이`.
- `55233`: Pair the complete source epithet and name as
  `사냥꾼 알로프(Aloff the Hunter)`, not `사냥꾼 알로프(Aloff)`.
- `55235`: Recast the cumbersome recovery sentence while preserving that the
  villagers' direct responsibility lasts as long as the injured creature
  remains there.

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `55023` | Meaning / source conflict | English and Chinese say `Hall of the Firstsworn`, while Japanese says `ファーストスウォーンの祠` (shrine). Korean follows English and Chinese. Retain the current translation pending stronger source or game-context evidence; do not change the existing ledger row. |
| `55029` | Meaning / agency | English leaves the agent of `putting their people to the sword` implicit; Japanese says the last person died, while Chinese describes the last wave of slaves leaving. Asset membership does not resolve the referent or agency. Retain the existing hold. |

## Rechecked Prior Questions

- `55022` uses the established `샘(The Font)` form.
- Japanese `使い魔` supports `사역마` for `Familiar` at `55046`.
- `55049` uses `마님`, avoiding an unsupported explicit claim that `my lady`
  means “wife”; Japanese and Chinese support the respectful title.
- The glossary identifies `Plagueshield` as the named medicinal supply and
  keeps it distinct from the `Pledgeshield` rank (`55054`).
- Confirmed glossary forms support `Livrarium` (`55078`), `Clyeth Arne` and
  `Dolve Arne` (`55083`), `Hierophant` and `Travelers` (`55090`), `Arcadium`
  (`55091`), and the settlement `Revival` (`55095`). No correction is needed
  for those names in these rows.
- The previously noted `55060` poem retains its stanza separation, all eight
  verse lines, and source-aligned line-break positions. No supported
  translation correction was established from the four locales.

## Source Notes and Structure

- Sixty exact-English duplicate groups across the corpus touch this range,
  covering 1,010 target rows. Korean wording matches in every group except
  `31562` / `55044`, which is recorded above. The two Japanese lines differ
  in register; this is documented as evidence, not used to infer a specific
  speaker.
- Five rows contain embedded line breaks: `55060` (8), `55080` (1),
  `55103` (5), `55197` (5), and `55208` (9). Each language has 28 embedded
  line breaks in total, with counts aligned per row.
- Runtime/display markers at `55021`, `55132`, `55147`, `55184`, and `55232`
  match in identity and order across all four languages. Numeric modifiers
  at `55080`, `55093`, and `55214` retain their values and positions.
- Of 250 IDs, 196 have indexed asset associations, represented by 198 links
  across 133 assets; 54 have no indexed asset. Of the 187 newly recorded
  IDs, 133 are linked through 135 links across 75 assets, and 54 are
  unlinked. Asset associations do not establish per-key speakers or playback
  order.

## Range Result

- After adding 187 IDs, the ledger covers 57,848 of 65,135 unique `default`
  IDs (88.81%), leaving 7,287. Sequential coverage reaches `55249`; the next
  range is `55250`-`55499`.
- The three new candidates are on newly appended rows. Six prior candidates
  were rechecked without rewriting their records. The new finding at existing
  ID `55023` is recorded here only; its ledger row remains byte-preserved.
- Regenerated catalogs report 45,921 reviewed IDs with indexed asset links
  and 11,927 without them. This is distinct from the current range's 196
  linked and 54 unlinked IDs.
- Existing ledger rows remain append-only. Findings require separate
  approval before any translation CSV edit; no translation CSV was changed.
