# Preliminary Language Scan: `default` IDs 32951-33000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32951-33000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32955 | `집행관` for `Headsman` | Determine whether Headsman is a formal opponent/title or a generic executioner before standardizing the Korean label. | Korean translates the title as an executioner/enforcer. Chinese gives executioner; the English capitalization and historical inventory leave its formal status open. | Medium |
| 32956 | `우리 방식` for `our ways` | Preserve the speaker's rejection without adding an ethnic or faction identity unless the surrounding dialogue establishes it. | Korean follows the English's unqualified `our ways`; Chinese expands it to “our Fae ways,” which English does not state. Japanese is similarly general. | Medium |
| 32960 | `초대받은 자의 생각` for `the vision of the Beckoned` | Check whether `vision` means a worldview/plan rather than merely a thought, while preserving the speaker's flattered response. | English and Chinese say vision; Korean/Japanese use thought/idea. The Beckoned's agreement with the speaker remains clear. | Medium |
| 32972 | Source fragment `Cads they sit a foe.` retained unchanged | Keep untranslated until source/context evidence resolves the malformed English; do not borrow a guess from incompatible locale renderings. | English is ungrammatical/nonsensical. Japanese and Chinese produce unrelated garbled phrases. Korean preserves the exact English string, matching the historical instruction to defer rather than invent a meaning. | High |
| 32973 | Three material lines, each `20` | Preserve category order and all quantities exactly. | English, Japanese, Chinese, and Korean list 20 cloth materials, 20 leather materials, and 20 wood. All have two line breaks. | High |
| 32980 | Source stammer `I'm ‒ I'm not...` omitted | Consider whether a hesitant/stammering voice should be retained in Korean before the character's fear and refusal. | English and Chinese visibly stammer; Korean removes the repetition, while Japanese also smooths it. The refusal to investigate what killed the creature and the curse claim remain. | Medium |
| 32987 | `마지막 생존자들` for `the last few remnants` of the Bitter Frost | Preserve the faction identity and refusal to kneel; check whether Korean overstates “last few remnants” as all surviving members. | English and Japanese say a few/remnants; Korean says “last survivors,” and Chinese similarly says the remaining free Winter Fae. The faction's proper Korean form remains a corpus-wide question. | Medium |
| 32991 | `대기실` for `lobby` | Standardize the multiplayer/UI term and preserve both the creation failure and unknown-error message. | Korean calls the lobby a waiting room. Other locales use lobby/大厅. The English misspells `occurred` as `occured`; Korean correctly conveys “unknown error.” | Medium |
| 32999 | Three `{*1...}` localized-label markers | Preserve all three markers and the Korean/English order; verify localized payload vocabulary and the distinction among slot, abilities, and ability. | Korean retains `{*1slot}`, `{*1abilities}`, `{*1ability}` in English source order. Japanese localizes the payloads without changing sequence; Chinese localizes them and places the slot payload second. The instruction still says to drag an ability to the bar to register it in a slot. | High |

IDs 32951-32954, 32957-32959, 32961-32971, 32974-32979, 32981-32986,
32988-32990, 32992-32998, and 33000 generally retain the English meaning
on this first reading. Proper-name spellings, ranks, faction terms, and
dialogue register remain integrated-pass candidates; no other distinct
high-confidence wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 32900-32999 flags the Headsman
  (32955), Apotyre, the malformed English at 32972, Rat Queen (32974),
  Tala-Rane (32977), the purging metaphor (32982), lobby terminology (32991),
  and the marked ability-slot instruction (32999). These were checked
  against all four locale rows and active Korean.
- The malformed text at ID 32972 remains intentionally unresolved. No
  locale's proposed-looking phrase was used as a correction.
- The markers at ID 32999 retain wrapper count and order in Korean. Locale
  payload localization/reordering is recorded separately from wrapper
  structure and is not treated as a Korean mismatch.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 32951-33000 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range.
- ID 32957 preserves `{1}`. ID 32999 preserves all three `{*1...}` markers;
  Korean marker identities and order match English.
- ID 32973 preserves the three source lines and the `20/20/20` quantities.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 32951-33000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33001.
