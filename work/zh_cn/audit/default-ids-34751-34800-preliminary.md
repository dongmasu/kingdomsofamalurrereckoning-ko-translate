# Preliminary Language Scan: `default` IDs 34751-34800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34751-34800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34751 | Source: `I don't what happened` | Treat the English as a likely missing-`know` source typo and retain the intended uncertainty about Grim Onwig's schemes; do not propagate the malformed syntax into Korean. | Korean naturally renders “I don't know what happened.” Japanese and Chinese also supply that intended reading. | Low |
| 34754 | `악취 나는 놈들` for `stinkers` | Determine whether `stinkers` is a named people/species or an insult for scavengers; retain both the smell and their liking for discarded scraps. | Korean preserves the insult and the contrast about scraps/tossings. English capitalization does not identify a group, and the historical notes specifically ask whether it is a species label. | Medium |
| 34763 | `스승 하나 없던 처지에서 손꼽히는 장인` for `from no master to one of the best` | Confirm whether the line means self-taught or merely formerly without a master, and identify Gavroche's craft from surrounding context. | Korean closely follows “no master”; Japanese/Chinese make the self-taught/repairer implication more explicit. The source itself does not state the craft in this row. | Medium |
| 34769 | Unspecified `그녀` | Preserve the unknown woman's pronoun and the details that she wields a powerful staff and whispers to victims before death; do not invent an identity. | Korean retains the female pronoun and all three details. English/Japanese/Chinese provide no name; the historical log explicitly says her identity is unresolved. | Low |
| 34775 | `에드가는 무슨 짓을 한 거야?` for `What did Edgar do?` | Keep the question neutral unless context establishes misconduct; avoid adding the judgment implied by `무슨 짓`. | English asks what Edgar did without negative wording. Japanese instead asks where Edgar went, while Chinese is neutral. The historical log flags Edgar's action/context. | Medium |
| 34779 | `이야깃거리가 하나 생겼군` for `there's a song for you` | Preserve the song/performance framing and the “one-man-war” title wordplay, rather than changing a song into a story. | English explicitly says “a song” and then supplies a title. Korean calls it something to talk about, though it subsequently refers to a title; Japanese also treats it as a song and Chinese as a song dedicated to the listener. Historical notes flag the title wordplay. | High |
| 34785 | Three-paragraph winter verse | Preserve all three paragraphs and retain the contrast between the last warmth, an unrelenting winter, and a possibly final sunset. | Korean preserves the three-paragraph layout and all central images. English, Japanese, Chinese, and Korean each have two embedded line breaks. The historical audit specifically requires preserving this verse layout. | Low |
| 34789 | `너희 종족` for `your kind` | Confirm whether this is a species/race distinction or a broader cultural generalization about exploration; retain the limited-area access qualification. | Korean preserves the generalization and the exception, but `종족` makes the biological/group sense explicit. The historical audit flags the Understyle “your kind” distinction. | Medium |
| 34790 | `연금술사는 ... 떠났어` for `we lost our alchemist` | Resolve whether the alchemist left or died from context; the English `lost` is ambiguous, so avoid treating either reading as confirmed. | Korean chooses “left,” whereas Japanese and Chinese interpret the alchemist as having died. The potion stock being exhausted and the “nearly a month ago” timing do not settle the event. Historical notes explicitly flag this ambiguity. | Medium |
| 34795 | `팁이라도 말이야` for `A tip, perhaps?` | Check the finger-related wordplay and consider whether `tip` means a fingertip rather than a gratuity; preserve the progression from “one” to a knuckle. | In context with “spare one” and “knuckle,” Korean `팁` can be read as money. Japanese says fingertip and Chinese says finger-tip/knuckle, supporting an anatomical reading. Historical notes flag the `one`/`knuckle` joke. | High |
| 34796 | `정원의 안내자` for `Usher of the Gardens` | Confirm whether `Usher` is a formal office/rank or a generic guide; preserve the deferential service to the liege and offer of information. | Korean's “guide of the Gardens” reads naturally with the information-service context. Chinese uses an usher/seat attendant, while Japanese says guide; the historical log leaves the role open. | Medium |
| 34800 | `아내 위에 올라타는 것` in Lady Ansilla's taunt | Preserve the deliberately bawdy “topping your wife” comparison, the insult about an easy feat, and Ansilla's condescending voice without flattening the sexual/martial double entendre. | Korean makes the sexual reading explicit and retains the two-paragraph signature layout. Chinese is similarly explicit; Japanese instead uses a less direct “beat your wife” reading. The source's exact wordplay/register remains a contextual question noted in the following historical range. | Medium |

IDs 34752-34753, 34755-34762, 34764-34768, 34770-34774, 34776-34778,
34780-34784, 34786-34788, 34791-34794, and 34797-34799 generally retain
the English meaning on this first reading. Proper names, lore, voice, and
display conventions remain integrated-pass candidates; no additional
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 34600-34799 flags the `stinkers`
  label (34754), Gavroche's progression (34763), the unidentified woman
  (34769), Edgar (34775), the one-man-war song (34779), the three-line
  verse (34785), Understyle/“your kind” (34789), the alchemist's departure
  or death (34790), the finger/knuckle joke (34795), and Usher of the
  Gardens (34796). These were checked against active Korean and all locale
  references.
- The following historical entry for IDs 34800-34999 flags the bawdy
  comparison and Lady Ansilla's voice at ID 34800; the row was included here
  because this batch ends at that ID and is cross-referenced to that entry.
- The source at ID 34751 is malformed (“I don't what happened”). Its
  intended meaning is inferred as “I don't know what happened,” consistent
  across the locale drafts.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34751-34800 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 34785 keeps
  two breaks (three verse paragraphs), and ID 34800 keeps the blank-line
  break before Lady Ansilla's signature.
- No runtime-marker discrepancy was detected.
- English spells out `one` at ID 34795; Japanese renders it numerically as
  `1本`. Korean's `하나` preserves the quantity. The numeric difference is
  not a changed value.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 34751-34800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34801.
