# Preliminary Language Scan: `default` IDs 32551-32600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32551-32600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, values, and
  recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32551 | `미타란 지속용 리벳` for Mitharan Sustaining Rivets | Standardize Mitharu/Mitharan forms and clarify what “Sustaining” denotes in the item name. | Korean preserves Flawless and the rivets but uses `지속용`, which may read as “for durability/sustaining” without context. Locale translations are literal and do not settle the item effect. | Medium |
| 32556 | `성 하드윈의 불멸 선교원` / `마법물품 제작` for St. Hadwyn's Undying Mission / Sagecraft | Verify the institution title and standardize Sagecraft as a distinct named discipline, without conflating it with general enchanted-item crafting. | Korean retains the signed religious essay and its gem/shard metaphor, work ethic, Mitharu's Light, and concluding reflection. It renders both “sage's craft” and “sagecraft” as `마법물품 제작`, while Japanese reads gemcraft and Chinese reads enchantment. This is a cross-corpus terminology candidate, not a settled correction. | Medium |
| 32558 | `라시르의 역사서` for `A Rathiri history` | Confirm whether `Rathiri` is a regional adjective/name and preserve that this is a history of the current war. | Korean preserves the book/history sense and the current-war subject. Japanese and Chinese use different Rathir/Rathiri forms; spelling is provisional. | Medium |
| 32566 | `친구` for vocative `dove` | Reconcile this recurring endearment with the earlier Dove entries; avoid silently turning a familiar address into generic “friend.” | English directly addresses “dove,” Korean uses `친구`, and Chinese uses “peace envoy”; Japanese omits the vocative. Earlier reports treat it as a likely endearment but leave the Korean equivalent open. | Medium |
| 32568 | Nina's ten-line blessing and signature | Preserve the father's wishes, the “do your part” responsibility, the plea not to grow up too quickly, and the signature. | Korean retains all ten advice lines plus the blank line and sign-off; all locales have 12 newline characters. It joins “Fear nothing” and “Embrace everything” syntactically across their separate lines, but both commands remain. | High |
| 32580 | `떠도는 샘` for `the Wandering Well` | Standardize the named Well and distinguish the location from generic wells. | Korean retains the search objective and translates the proper-name components. The capitalization and historical Well terminology make this a corpus consistency question. | Medium |
| 32581 | `마법물품 제작` for `Sagecrafting` | Standardize the named skill/discipline against the repeated Sagecraft/Sagecrafting uses. | Korean uses the project's recurring semantic rendering; Japanese calls it gemcraft and Chinese calls it enchanting. Keep distinct from general item crafting only if setting context supports that distinction. | Medium |
| 32582 | `초대받은 자` for `Beckoned` | Standardize the formal epithet/title while retaining the prayer addressed to its bearer. | Korean preserves the direct address and prayer. English, Japanese, and Chinese differ in how they construe the title; the historical inventory repeatedly leaves Beckoned open. | Medium |
| 32587 | `고문` for quoted `counsel` | Clarify whether the source means a counselor/adviser, counsel/advice, or another named entity; avoid a Korean reading as torture. | English says a “counsel” is somewhere in the Primos' sanctum and then says to discover “what this is.” Japanese and Chinese explicitly read a person/adviser; Korean `고문` is ambiguous between adviser and torture. The historical log labels this source term “torment,” which does not match the active English row's `counsel`; record that historical wording as a stale/mismatched reference pending cleanup. | High |
| 32590 | `밀수꾼의 도주` for `Smuggler's Run` | Check whether Run means an escape, route, or named smuggling operation; standardize the title only with context. | Korean selects “escape”; Japanese reads a smuggler's work and Chinese a smuggler's escape. The isolated title does not settle the intended sense. | Medium |
| 32591 | `테스타먼트` / `깊은 슬픔의 상처` | Standardize Testament and retain the claim that the woman was left alive to suffer grief. | Korean preserves the survival, grief, and prediction of regret. “Wounds of grief” is figurative in English; the Korean “wounds of deep sorrow” remains a plausible rendering, with faction terminology open. | Medium |
| 32594 | `환영이라고 하기엔 위협이 대단하군` for `Big threats for an illusion!` | Clarify whether this is a warning about a dangerous illusion or a comment that an illusion poses a large threat. | English is compressed and ambiguous. Korean interprets it as a threat too formidable to be an illusion; Japanese warns of danger from illusions, while Chinese also leaves the relation unclear. Context is needed. | Medium |
| 32595 | `운시엘리 요새` / `앤실라 성` | Standardize Unseelie and Castle Ansilla spellings and preserve that the map shows the complete fortress layout. | Korean retains the map's scope, faded writing, cracked/yellow paper, and estimated age. The source-keyed historical question flags the two place/fortress names; no lore attribution is inferred here. | Medium |
| 32598 | Denric's three-entry journal; Southern Passage / Teeth of Naros | Preserve the three entries, expedition chronology, relationships, and fragmentary source wording without filling gaps. | Korean retains the search for volume three, the underground-route hypothesis, the Southern Passage, Sveri's favor/scout role, Cranwyn's joining, need for one more person, and final camp plan. All four locales have the same 13 newline characters and three entry blocks. | High |

Rows 32552-32555, 32557, 32559-32565, 32567, 32569-32579, 32583-32586,
32588-32589, 32592-32593, 32596-32597, and 32599 generally retain the English
meaning on this first reading. Names, lore terms, and register remain
candidates for the integrated pass; no other distinct high-confidence
wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32500-32699 flags the Templar/
  mission title and Sagecraft terminology at ID 32556, the child-blessing
  poem at 32568, “counsel” at 32587, and the three-volume journal at 32598.
  These were checked against all four locale rows and active Korean.
- The historical log describes ID 32587's term as “torment,” while the
  current English CSV says “counsel.” This mismatch is explicitly recorded;
  the Korean `고문` is ambiguous and remains an open candidate.
- The structure and source chronology of the journal at ID 32598 were
  checked. Neither it nor the poem at 32568 was rewritten.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32551-32600 once and in identical order.
- Embedded line-break counts match throughout the range. ID 32556 has eight
  newline characters, ID 32568 has 12, and ID 32598 has 13 in every locale.
- ID 32563's `1,000` objects value is preserved. The quantities `100` and
  `10` at ID 32519 were checked in the preceding batch report.
- No runtime-marker discrepancy or other line-break exception was detected.
- No CSV text or source file was edited.

## Batch Status

IDs 32551-32600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32601.
