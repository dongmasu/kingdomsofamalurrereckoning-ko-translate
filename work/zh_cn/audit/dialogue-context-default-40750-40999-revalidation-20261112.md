# Sequential `default` Revalidation: IDs `40750`-`40999`

- Date: 2026-11-12.
- Compared all 250 active rows across English, Japanese, Chinese, and Korean.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 67 existing ledger records; all 67 four-language fingerprints
  match. Added the 183 previously unrecorded IDs.
- Recorded 15 correction-candidate IDs and 21 evidence-limited holds. The
  remaining 214 IDs have no supported finding. Findings do not authorize
  translation CSV edits.
- Asset associations remain grouping clues, not proof of a line's speaker,
  branch, addressee, or playback order.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `40758` | Terminology / format | `The Headsman` varies across the corpus among several Korean forms. Standardize the role/name as `처형인(Headsman)` at this occurrence; this is a standalone label, not evidence of a speaker's voice. | Medium-high |
| `40766` | Terminology / objective | The key and phrase that release Adar's magic circle are described elsewhere in the same quest with `주문`. Replace the vague `마법의 말` with `주문` and retain the established action-label style, e.g. `열쇠와 주문 찾기`. | High |
| `40782` | Terminology / name format | `the Testament` is the named Belen faction, not scripture here; related rows vary between `테스타먼트`, `성약단`, and other forms, sometimes without English pairing. Review this occurrence against the proposed short form `성약단(The Testament)` and the source-supported rendering of `dreg`; do not normalize the faction globally without reviewing each context. | High |
| `40791` | Meaning | English `but a soldier` means “merely a soldier,” not “not a soldier but an officer.” The current Korean also reduces the description to an officer. Restore the belittling “soldier, an officer” sense, e.g. `그자는 그저 군인, 장교에 불과해.` | High |
| `40802` | Name format | The journal entry names the Attwater twins, Fenn, and Anso without English pairing. Pair the proper names while preserving who starts the race and who pays the reward. | Medium-high |
| `40824` | Naturalness | `재생 온기` is an awkward compound for the regenerative warmth of the Barghest's heart. Recast it naturally, e.g. `바게스트(Barghest) 심장이 지닌 재생의 온기가 깃든 부적.` | Medium-high |
| `40841` | Name format | The standalone label `Halina's Corpse` renders the name as `할리나` without English. Pair the full label, e.g. `할리나(Halina)의 시체`. | High |
| `40863` | Format | The same quest uses `라시르(Rathir) 지부 회관`; this row has `지부회관` and does not pair the full place phrase `Rathir Chapter House`. Align the spacing and retain the established place-name form. | High |
| `40890` | Meaning / name format | `revel in the dawn` is positive, but Korean says `새벽을 기뻐하지`, reversing the meaning. Recast as `새벽을 반긴다` or equivalent. The capitalized groups `Soldiers of Summer` and `Guardians of the Light of Spring` also lack English pairing. | High |
| `40911` | Name format | `The Dragon` and `Lotus Killer` are capitalized gladiator sobriquets but lack English pairing. Pair the named sobriquets without changing the line's meaning. | Medium-high |
| `40927` | Terminology / format | This is the same magical spring standardized as `샘(The Font)` / `샘(Font)`. Pair `샘(Font)` at the first reference; retain generic `fountainhead` as `원천`. | High |
| `40954` | Naturalness / terminology | `독 기반 공격` is a calque for `poison-based attacks`. Prefer a natural game-effect term such as `독 속성 공격`; retain the separate `+30` and `+75%` values and all three line breaks. | Medium-high |
| `40997` | Name format | `Ambyth` is rendered `앰비스` without English. Pair it as `앰비스(Ambyth)` and preserve the reference to the others. | High |
| `40998` | Name / objective format | The destination `Terra Templa` is unpaired in this objective. Pair it as `테라 템플라(Terra Templa)` and retain the established action-label form, e.g. `테라 템플라(Terra Templa)에서 사이단(Cydan)과 대화하기`. | High |
| `40999` | Title format | The named Ballad `Ballad of the Ring` appears as `반지의 발라드` without its English title. Pair the title as `반지의 발라드(Ballad of the Ring)`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `40768` | Meaning | `as Caerwyn's blade` can describe a role or a comparison. Korean preserves the blade image; the isolated line does not settle the intended relationship. |
| `40772` | Meaning | `his side` has no explicit antecedent in English. Chinese supplies Bisarane, but the other sources do not; retain Korean's unspecific `그에게` rather than adding a name. |
| `40788` | Meaning / text type | `Oh, Mountains` may be an invocation, title, or set phrase. Korean preserves a direct address; the locale versions do not resolve its category. |
| `40794` | Address | Korean uses `자네`, while other recruitment lines vary in address. The multi-NPC asset does not establish this line's speaker, addressee, or stage; retain the address provisionally. |
| `40797` | Honorifics | `your grace` establishes deference but not the addressee's exact rank. Japanese and Chinese also differ on the honorific; do not normalize `전하` without context. |
| `40806` | Meaning / source conflict | English and Japanese say the travelers went east; Chinese says west. Korean follows English and Japanese, but the directional disagreement remains recorded rather than silently normalized. |
| `40839` | Meaning / verse | The identity/referent of Yolvan and the opening poetic construction are not settled by the isolated verse. Preserve its five-line structure and current wording pending stronger lore context. |
| `40848` | Meaning | `every code I've sworn to uphold` does not identify whether the code is an oath, rule, or institutional code. Korean's broad `규율` is retained. |
| `40851` | Meaning | The English fragments about the Hierophant “slipping,” the address `dove`, and “the tyranny” differ materially across locales and are syntactically incomplete. Keep the current plausible Korean provisional. |
| `40871` | Terminology | The isolated `Trapper` label is read as a trapper in English/Chinese but as an instigator in Japanese. `덫 사냥꾼` is plausible; its exact role remains unconfirmed. |
| `40874` | Meaning | `the statue is my Galataea... or what I've left of her` may mean a likeness/memorial or what physically remains of her. Japanese supports the former; Chinese can support the latter. Retain the current `흔적` provisionally. |
| `40882` | Terminology | Capitalized `Offering` is an act that costs the prisoners their remaining freedom, but this row does not establish whether it is the named Scion rite, a sacrifice, or another offering. `봉헌 의식` may over-specify it. |
| `40900` | Meaning / title | `Hair of the Dog` is idiomatically rendered as `해장술`, while the quest concerns anti-venom and Japanese/Chinese use poison-countering-poison wording. Keep the title provisional rather than choosing a quest-specific reading from this key alone. |
| `40922` | Meaning | `our quarry` can refer to prey/target or a quarry; Japanese and Chinese diverge, and the poem supplies no decisive referent. Retain `사냥감` provisionally. |
| `40953` | Meaning / titles | The two court offices and the “twelfth closest advisor” ranking are unusual, and the locales use differing office descriptions. Korean remains plausible; do not invent a more specific rank or office. |
| `40962` | Terminology | The formal meaning of `Sacrificial Altar of Loyalty` is not established beyond the altar's loyalty modifier. Retain `충성의 희생 제단` pending ritual terminology context. |
| `40966` | Terminology / title | `reigning Grand Champion of Valor` is rendered `현역 최우수 투사`. The exact established Korean title and the distinction between reigning and Grand Champion remain unresolved. |
| `40969` | Meaning | English/Chinese say salvage or recover the silverware; Japanese says polished silverware. Korean follows the first reading, but the in-game action is not established by this key. |
| `40975` | Format / meaning | `St. Odwig's` is an incomplete possessive fragment in every locale. The omitted object is unknown; do not invent one or close the Korean fragment without context. |
| `40984` | Name / referent | `the Sorrows, the large tree` may use `Sorrows` as a proper name. Korean's `비탄의 나무` is plausible, but this tree is distinct from the House of Sorrows and the exact name form is not settled. |
| `40993` | Meaning / title | `Oathblade` is a named blade/title in English and Chinese, while Japanese reads it as a mercenary rank. Keep `맹세의 칼날` provisional rather than inferring a role. |

## Rechecked Existing Findings

- Existing candidates `40758`, `40766`, `40782`, `40863`, and `40999` were
  rechecked against current four-language text and retained. `40758` is a
  term/format issue, not a speaker-voice issue.
- `40791` and `40802` were reclassified from prior `not-issue` dispositions
  after the current text showed the English `but` polarity omission and
  unpaired proper names, respectively.
- `40851` and `40874` were restored to evidence-limited holds after comparison
  with their earlier source-conflict and referent notes.
- Existing holds `40794`, `40900`, and `40969` remain unresolved. All
  rechecked source fingerprints match the active four-language rows.

## Repeated Sources and Structure

- Fifty-four exact-English duplicate groups (1,435 corpus rows) touch this
  range. Korean agrees within 53 groups. The only differing group is IDs
  `19618`, `22319`, and `40915`: Japanese distinguishes accepting a request
  (`依頼を受ける`) from completing it (`依頼を終える`), so the Korean
  `의뢰 수락하기` / `의뢰 완료하기` distinction is retained.
- The three multiline entries (`40792`, `40839`, and `40954`) have matching
  newline counts across all four locales. The Korean entries contain eight
  embedded CRLF breaks total. The five-line verse at `40839` and the blank
  separation in the effect text at `40954` are preserved.
- `40786` retains `{1}`; nested `{*0{2}}` at `40836` is present in all four
  locales. At `40814`, Korean follows the English/Japanese dodge-label,
  icon, and button order; Chinese places its localized dodge label later.
  The sprint marker at `40982` and all item values at `40792`/`40954` remain
  intact.
- Of the 183 newly recorded IDs, 139 have an indexed asset link and 44 do
  not. Asset association does not establish a per-key speaker or dialogue
  order.

## Range Result

- Rechecked 67 existing ledger records and added 183 new records. The range
  has 15 candidate IDs, 21 evidence-limited holds, and 214 IDs with no
  supported finding.
- Five existing ledger dispositions were updated: `40758` was reclassified
  from a voice flag to terminology/format; `40791` and `40802` are now
  candidates; `40851` and `40874` are now holds. Historical reports remain
  unchanged.
- The ledger covers 47,345 of 65,135 unique `default` IDs (72.68%), leaving
  17,790. Reviewed IDs with indexed asset links total 38,442; 8,903 have no
  indexed asset link. Sequential coverage reaches `40999`; next is
  `41000`-`41249`.
- Four-language fingerprints, generated catalogs, nine related index tests,
  and scoped diff checks must pass before this batch is considered recorded.
  Translation CSVs remain unchanged.
