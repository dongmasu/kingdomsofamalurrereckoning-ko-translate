# Sequential `default` Revalidation: IDs `46500`-`46749`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 62 previously recorded four-language fingerprints; all match.
  Added the other 188 IDs to the review ledger.
- Nine current correction candidates and seven evidence-limited holds remain.
  `46732` has a new, separate name-form hold despite its older ledger
  disposition; 234 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `46516` | Terminology | The named `Altar of Regression` is rendered `퇴행의 제단` in related rows (`6943`, `42924`, `58925`), but `회귀의 희생 제단` here. Align the proper name to `퇴행의 제단`, retaining the sentence's sacrificial context. | High |
| `46537` | Name / terminology format | `Fennwrac Leaf` is `펜와락 잎`, while the established name form is `펜라크(Fennwrac)`. Consider `펜라크 잎(Fennwrac Leaf)`. | High |
| `46634` | Meaning / naturalness | `요즘은 미스로스(Mithros)에서 사냥이 잘돼` can mean that the speaker personally hunts successfully there. Preserve the point that the best hunting is in Mithros, e.g. `요즘 좋은 사냥감은 다 미스로스(Mithros)에 있어`. | Medium-high |
| `46678` | Terminology / name format | The named `Verdant Blades` is rendered `베르던트 블레이드`, unlike the established `푸른 칼날(Verdant Blades)` used in related rows. Align this occurrence and pair the source name; keep the separate `Seal of Ansilla` pairing. | High |
| `46685` | Objective format | `Test the potion` is the only SQ84 objective phrased as a bare noun (`물약 시험`); parallel objectives use `-하기`. Consider `물약 시험하기`. | High |
| `46686` | Terminology | In this Adar prison context, English `circle`, Japanese `魔法陣`, and related lines identify a binding magic circle. Korean `이 원의 경계` is inconsistent with `마법진`; consider `이 마법진의 경계`. | High |
| `46700` | Terminology / name format | This `Chamber of Trade` is `교역 회의소`, while the same English name at `40127` is `상공 회의소`. Align the Korean term and consider the full source pairing `상공 회의소(Chamber of Trade)`. The separate question of whether the chamber is a customs/tax office remains unresolved. | Medium-high |
| `46715` | Terminology / context consistency | The towers are the Tuatha watchtowers described at `2243` and `23439`; this line reduces them to `탑`. Consider `감시탑` for consistency, e.g. `네 뒤쪽 고개를 따라 감시탑들이 늘어서 있군.` | Medium-high |
| `46716` | Naturalness / register | `나그네여` is marked and archaic beside the direct, conversational request in English and Japanese. Remove or naturalize the vocative and phrase the plea in ordinary dialogue. | Medium-high |

The earlier `46633` meaning candidate is cleared in the current text: the
accepted `위험한` rendering now expresses `deadly` without adding the
unsupported “notorious” meaning. The old ledger does not contain that ID, so
no historical row was changed.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `46517` | Name consistency | The Aster references alternate between `아스터` and `애스터`; Japanese confirms the name but does not select a Korean form. Preserve the current wording until a corpus-wide decision. |
| `46595` | Meaning / speech level | `sanctuary` does not establish whether this is a church or another protected site. The Korean imperative was already corrected to instruct that a guard be posted, but the asset contains multiple NPCs and does not identify this key's speaker; retain the register question pending direct context. |
| `46711` | Proper name | `Waterhall` is a destination, but locale forms vary and do not establish the canonical Korean spelling. Retain `워터홀` pending a term decision. |
| `46726` | Meaning / title | The fragmentary item description does not settle the formal role `Varani Lawgiver` or the exact protective relation. English, Japanese, and Chinese differ in how they construe the title; do not infer a replacement. |
| `46731` | Proper name / context | `Pit` may be a named Arena location or a generic pit. The isolated prompt does not resolve its status. |
| `46732` | Proper name | The current `고르구아스(Gorguath)` identifies the place, but canonical Korean spelling remains unsettled. This is separate from the previously corrected particle in `고르구아스(Gorguath)에서`. |
| `46741` | Meaning | The standalone `Close Order` may mean a formation, an institution, or an instruction to close something. The locale translations conflict; retain `폐쇄 명령` pending context. |

## Rechecked Findings and Structure

- Sixty exact-English duplicate groups touch the range and cover 1,333 corpus
  rows. Korean is identical within every group; no translations were unified
  solely because English repeats.
- Seven entries contain line breaks: `46518`, `46527`, `46567`, `46578`,
  `46584`, `46637`, and `46682`. All four languages have matching per-row
  counts and 24 embedded breaks; the Korean separators are CRLF.
- ID `46737` retains all six style IDs and five layout markers. English and
  Korean order the first two style IDs as `*3`, `*1`, while Japanese and
  Chinese use `*1`, `*3`; preserve this existing locale-specific exception.
- Of 250 IDs, 200 have indexed asset associations, including 138 of the 188
  newly recorded IDs. Three IDs link to multiple assets. Asset links do not
  establish per-key speakers, addressees, branches, or playback order;
  unsupported attribution and order remain unknown.

## Range Result

- The range has nine supported correction-candidate IDs and seven
  evidence-limited holds; the other 234 IDs have no current finding.
- After appending 188 new IDs, the ledger covers 51,596 of 65,135 unique
  `default` IDs (79.22%), leaving 13,539. Sequential coverage reaches
  `46749`; next is `46750`-`46999`. Of reviewed IDs, 41,451 have indexed
  asset links and 10,145 do not.
- Catalog/index reproduction passed; all 51,596 ledger fingerprints validated;
  all nine related index tests passed. `git diff --check` passed, and the
  ledger update preserved the existing bytes before the 188 appended rows.
