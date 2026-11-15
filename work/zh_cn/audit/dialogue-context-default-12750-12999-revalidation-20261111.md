# Sequential `default` Revalidation: IDs `12750`-`12999`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-four existing ledger records were retained after their four-language
  fingerprints were verified. Two earlier `not-issue` records were
  re-evaluated and raised to correction candidates. The other 184 IDs were
  compared and added.
- Six IDs have correction candidates: four in the newly added rows and two
  reopened from earlier `not-issue` records. Four newly added IDs retain
  evidence-limited findings; no candidate and hold overlap.
- Of the 184 new records, 134 have indexed quest-asset links and 50 do not.
  Two IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `12766` | Format | The quest-journal entry names Grim Onwig, but the Korean has `그림 온위그` without the English pairing used elsewhere, including the standalone name at `12994`. Add `(Grim Onwig)` at this occurrence while preserving the full journal entry. | High |
| `12887` | Speech level | The Korean invitation shifts into marked 하게체 with `술 한 잔 들게` / `...하고`; Japanese is plain conversational and Chinese is a friendly invitation. Recast the address and instruction in natural conversational Korean without assigning a specific speaker from the asset link. | Medium |
| `12890` | Meaning | English qualifies the cultists as `somewhat self-destructive`, but Korean states categorically `자멸적인 광신도들`. Preserve the degree, for example with `다소 자멸적인 광신도들`, while retaining their worship of fire's arcane aspects. | Medium-high |
| `12934` | Naturalness | `All of my sins are finally catching up with me` is an idiom. Korean `내가 지은 죄가 드디어 전부 나를 따라잡고 있어` is an overly literal personification; render the impending consequences naturally, such as `내가 지은 죄의 대가를 마침내 치르게 됐어`. | High |
| `12956` | Naturalness | `They've infected every part of these swamps` is rendered `이 늪지 곳곳에 퍼져 들었어`, an unnatural Korean verb combination. Recast as `오랜 세월 이 늪지 곳곳에 퍼졌어` or equivalent while retaining the spread-through-the-swamps meaning. | High |
| `12964` | Meaning | English says the player may be the group's only `option`; Korean changes this to `유일한 희망`. Japanese supports having to rely on the player. Prefer `네가 우리에게 남은 유일한 선택지일지도 몰라` or equivalent without changing the uncertainty. | Medium-high |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `12779` | Title / number | English `The Humbled` can be plural, while Japanese `謙虚なる者` and Chinese `谦卑者` read as singular. The isolated title does not settle whether it names one person or a group; retain the current title wording pending context. |
| `12838` | Meaning / source syntax | English `the origins of the Grand Bursar's` is grammatically incomplete or elliptical. Japanese reads it as the institution's origin, while Chinese reads it as a family's origin. Korean `대회계원의 기원` does not resolve the referent; do not guess. |
| `12863` | Meaning / context | English and Chinese can be read as a possessive threat (`You're mine!`), while Japanese `もらったわ` means closer to `I've got you`. Korean `넌 내 먹잇감이야` selects a predatory reading. The isolated line does not establish the combat or capture context. |
| `12984` | Meaning / tone | English `A dark place` can describe literal darkness or an ominous/evil place; Japanese uses `邪悪`, while Chinese also leaves it dark. Retain the broad current wording rather than choosing a more specific sense. |

Previously recorded findings were retained rather than recounted: `12765`
remains uncertain; `12836` retains its naturalness candidate; `12893` retains
its Great House / `대가문` candidate; and `12917` retains its existing
terminology candidate. Two earlier `not-issue` records were reopened on
row-specific evidence: `12766` had not paired Grim Onwig's name in its
journal entry, and `12890` omitted the qualifier `somewhat`. The established
`dove` address at `12905` remains `친구`, and the accepted
`마녀 기사 아니라(Anira)` form at `12983` was not reopened.

## Duplicate and Structural Checks

- Fifty-two exact-English duplicate groups touch the 184 new IDs, comprising
  670 rows across the corpus. Korean text matches in every group.
- Runtime/layout-token identities, wrapper classes, and ordering match across
  all four languages. Display text inside wrappers is localized as expected
  at `12870` and `12906`.
- Logical line-break counts match across all four languages for all 184 new
  IDs.
- Five Korean strings contain 23 existing embedded line breaks: `12791` (1),
  `12812` (2), `12898` (11), `12918` (2), and `12953` (7). Their existing
  bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
