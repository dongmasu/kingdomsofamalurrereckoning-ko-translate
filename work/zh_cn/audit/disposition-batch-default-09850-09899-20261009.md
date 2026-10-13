# Disposition and Edit Batch: `default` IDs 9850-9899

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9850-9899.
- English governs meaning; the actual Japanese locale CSV informs
  voice/register and structure; Chinese is supporting evidence. Historical
  audit notes were also checked.
- Nineteen findings received dispositions: three accepted, two `not an issue`,
  and fourteen uncertain.
- Three accepted corrections are present in the active Korean CSV and are
  recorded below. This disposition is working review, not independent final
  linguistic approval.

## Decisions

- ID 9850 remains uncertain: English capitalizes `Scrivener`, while Japanese
  and Chinese use generic scribe/copyist terms. The person's role or formal
  title is not established.
- ID 9851 remains uncertain: `Hollowlands` is a named region, but the Korean
  spelling differs from ID 9382 (`홀로랜드` / `홀로우랜드`). No corpus-wide
  transliteration choice is established.
- ID 9852 remains uncertain: capitalization and the Japanese rendering allow
  a named item/set reading, while the references also permit a generic
  equipment label.
- ID 9853 remains uncertain: the quest events are preserved, but the mine,
  `Skoria`, and `tyrenium` forms lack verified canonical Korean terminology.
- ID 9855 remains uncertain: the blessing is preserved, but `Helius` needs
  alignment with the project's divine and character-name forms.
- ID 9856 remains uncertain: the location is retained, but the references
  differ on `Waterhall Down` and the identity of `the veil`.
- ID 9860 is accepted: `Undersea Fasting` is rendered as `해저 통로`. Japanese
  explicitly identifies an undersea passage, and Chinese says an undersea
  channel; the return-from location context supports that reading over
  literal fasting.
- ID 9864 remains uncertain: the character identity is clear, but Japanese
  phonetics diverge and the corpus has not established a canonical form for
  `Alyn Shir`.
- ID 9865 remains uncertain: the combat sequence is preserved, but official
  Korean forms for `Primal Magic` and `Jottun Warlord` are unverified.
- ID 9867 remains uncertain: the instruction to choose a lower and upper
  number is retained, but whether `Range Roll` is a formal game-mechanic name
  is unresolved.
- ID 9871 remains uncertain: the literal rendering is plausible, but the
  `Plagueshield` / `Pledgeshield` source-name question and canonical item or
  remedy identity remain open.
- ID 9875 is accepted: the Korean now preserves the source's terse past/event
  fragments (`살해됨`, `실종됨`, `발견됨`). English, Japanese, and Chinese all
  support past events; the former future prediction changed the temporal
  meaning.
- ID 9876 is `not an issue`: `staff` means Seawatch personnel in context,
  consistent with the cross-reference to ID 9533; the Korean retains that
  personnel reading and the scene's address to the liege.
- ID 9879 remains uncertain: the repeat request and target are retained, but
  the canonical forms for Niahm, Smiler, `crudok`, and Corgan Hold remain open.
- ID 9880 remains uncertain: English has `Kollosae`, while Japanese/Chinese
  use the recurring `Kollossae`; it is unclear whether English is a typo or a
  distinct spelling.
- ID 9884 is `not an issue`: Korean preserves both the weakling insult and
  the contemptuous description of the speaker's wife without turning `hag`
  into a literal witch; the references support the insulting, nonliteral
  reading.
- ID 9894 remains uncertain: the relic-loan and return-for-gold conditions
  are preserved, but the Temple of Lyria and Seila Twayn name forms need
  corpus alignment.
- ID 9895 is accepted: `our order` is rendered as `우리 대학`. Japanese
  `本学`, Chinese `学院`, and the project's `아르카나 대학` usage support an
  academic institution rather than a religious order.
- ID 9898 remains uncertain: the account's content, names, and unfinished
  final comma are retained. English, Chinese, and Korean have six embedded
  line breaks while Japanese has seven; the Korean follows English/Chinese,
  but the elevated voice and name spellings need integrated review.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9860 | `해저 단식에서` | `해저 통로에서` | D-2817: use the passage reading supported by Japanese and Chinese. |
| 9875 | Future-tense final clause (`발견되리라`) | Past/event fragment (`발견됨`) | D-2822: restore the temporal force shared by the source locales. |
| 9895 | `우리 교단의 지식을 한데 모은` | `우리 대학의 지식을 한데 모은` | D-2828: reflect the academic institution indicated by Japanese and Chinese. |

## Verification

- All 50 IDs exist in English, Japanese, Chinese, and active Korean in the
  same order. The active CSV has 65,135 records with IDs 0-65134 sequential,
  a UTF-8 BOM, CRLF record endings, and no bare LF or CR bytes.
- Runtime-marker IDs/order and other brace tokens match throughout this range.
  Embedded line-break counts match except ID 9898: English/Chinese/Korean have
  six and Japanese has seven.
- Active Korean `default` CSV SHA-256 after the three accepted edits:
  `f9e51f4f68d54cdbf1275c84b209ba572c78f44b3ed499831f06386a8b9c3757`.
- Before this batch: 426 accepted, 882 `not an issue`, and 1,502 uncertain.
  After this batch: 429 accepted, 884 `not an issue`, and 1,516 uncertain.
- Direct findings and carried historical questions through ID 9899 now have
  dispositions. Resume at ID 9900; 55,235 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
