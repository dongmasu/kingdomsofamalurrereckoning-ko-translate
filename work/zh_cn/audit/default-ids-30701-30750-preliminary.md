# Preliminary Language Scan: `default` IDs 30701-30750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30701-30750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30707 | Four-line Indarian poem | Preserve the four-line form, names/titles, and the closing wish that peace never cease; check the poem's meter and the official forms of `Magus King`, `Kandrian`, and `Aodh`. | Korean retains the source's four lines and the key image of capturing fire, but the proper titles/names remain terminology candidates. Historical notes explicitly call out the poem. | Medium |
| 30708 | `우리에게 할 일이 정말 많아` for the source fragment `We have so much` | Preserve the unfinished fragment unless context confirms the implied noun/action; Korean currently completes it as “we have much to do.” | English ends mid-thought without an object, and Chinese retains the incomplete phrase. Japanese omits the fragment. Korean supplies `할 일`, which is plausible but not present in the source text. | High |
| 30713 | `캐스러스의 움푹한 곳` for `the Hollow of Cathrus` | Confirm whether Hollow of Cathrus is a formal place-name and standardize it as such rather than a generic depression. | The row describes a key to a destination. Korean translates “Hollow” descriptively; Japanese and Chinese explicitly frame it as a cave/location. | Medium |
| 30717 | Proper name `Wystran Nol` | Resolve the Chinese-only trailing U+FEFF format character; confirm Korean transliteration of both names. | English, Japanese, and Korean have no format character. The Chinese text ends with U+FEFF after the name. The row keys and visible name are otherwise aligned. | High |
| 30719 | `카드에 재회가 나와 있었다면` for `If a reunion was in the cards` | Preserve the idiom's fate/predestination sense while deciding whether the card image is intentional in this setting. | Korean keeps the card image and connects it to the Tapestry's design; Japanese says reunion would have been fate, while Chinese also explicitly mentions cards. Historical notes flag the metaphor. | Medium |
| 30725 | `신들의 폭풍` for `the Godstorm` | Confirm the canonical Korean name and capitalization for this named historical event. | English uses a capitalized event name; the Korean translates it semantically. The source describes it as the singular event worthy of attention. | Medium |
| 30737 | Desert Runner/Rattlesnake fable | Preserve the animal roles, dialogue turns, repeated voice/borrowing motif, and the causal ending that explains the rattlesnake's clicking sound. | Korean retains the complete fable, dialogue paragraphs, and line-break count. Names and the exact tail-sound image remain candidates for the integrated pass. | Medium |
| 30738 | `앞날이 어두워` for `They are doomed` | Preserve the stronger claim that the newest Crows are doomed rather than only saying their prospects are bleak. | English says “doomed”; Korean softens this to “their future is dark.” The rest of the line retains the search for a fourth member/new leader so the tournament can continue. | High |
| 30744 | Chapter 5: `We Climb` poem | Preserve source lineation and its repeated “nothing” ending; reconcile the Japanese/Chinese extra breaks without changing the Korean draft's English-aligned layout. | English and Korean have 8 embedded line breaks; Japanese and Chinese have 11. Korean follows English here. The entry's prose/verse division and final repetition were checked. | High |
| 30748 | Duplicated source `is` in the blade-lever instruction | Treat `is located is in` as an English source typo; retain the location and route past the Faer Gorta rune trap. | Korean gives a grammatical instruction, consistent with Japanese and Chinese. This is a source-text defect, not a Korean structural exception. | Medium |

Rows 30701-30706, 30709-30712, 30714-30716, 30718, 30720-30724,
30726-30736, 30739-30743, 30745-30747, and 30749-30750 generally retain
the English meaning on this first reading. Their names, register, fragments,
lore terms, and surrounding quest context remain for the integrated pass; no
separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30700-30799 was checked against
  the applicable rows, including the Rond Farm, Cathrus, Hystis, Tapestry,
  Efyr Dynnwel, Godstorm, Castellan, Tuatha, Crows, and the Rattlesnake fable.
- The narrower historical questions at 30707-30708, 30719-30720,
  30725, 30737-30738, 30744, and 30748 were reviewed. ID 30708's incomplete
  source fragment, card/Fate metaphor, fable, Doom statement, poem, and
  duplicated source `is` remain documented; historical notes are not
  approvals.
- The four-line Indarian poem, eight-break Desert Runner fable, and
  Chapter 5 layout were checked. The latter has a locale divergence:
  English/Korean use 8 breaks; Japanese/Chinese use 11.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30701-30750 once,
  in identical order.
- Normalized runtime-token identities/order match; no runtime token was
  found to be missing or reordered.
- ID 30717 has one Chinese-only trailing U+FEFF. No corresponding character
  appears in English, Japanese, or Korean.
- Numeric meaning is retained. ID 30725's “one event,” ID 30738's “fourth
  member,” ID 30743's “every gladiator,” and ID 30744's chapter number are
  written differently across locales but do not show a quantity discrepancy.
- No Korean-specific key/order or structure exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30701-30750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30751.
