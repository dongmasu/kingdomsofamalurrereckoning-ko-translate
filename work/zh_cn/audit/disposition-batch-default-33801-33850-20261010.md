# Disposition Batch: `default` IDs 33801-33850

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary candidates with English meaning,
  Japanese voice/register, Chinese supporting evidence, historical questions,
  active Korean, and runtime structure.
- Decisions: three accepted, one `not an issue`, and twelve uncertain
  findings, plus one `not an issue` disposition for remaining ordinary text.
- CSV changes: IDs 33802, 33807, and 33827 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33802 | Hallowed Tree as a `beacon` / `표식` | Accepted: change the phrase to `그들에게는 길잡이가 주어졌다.` The source calls the sapling a beacon; `표식` understates its guiding/landmark role, and `그 대가로` incorrectly suggests an exchange. Retain the five-paragraph account and the unresolved House/Midden/burial terminology. |
| 33804 | Fate magic smell metaphor / named-discipline status | Uncertain: Korean preserves the hostile sensory metaphor, but the capitalization and lore status of Fate magic are not settled by this line. No change. |
| 33805 | `It's your funeral` / Bloodbane and Aron Excavations | Uncertain: the warning/taunt is retained, but canonical names for the excavation company and Bloodbane need corpus/context review. |
| 33807 | Localized location/fast-travel/world-map marker payloads | Accepted: localize payloads to `{*1장소}`, `{*1빠른 이동}`, `{*1장소}`, and `{*1세계 지도}`. Match established Korean UI vocabulary and Japanese/Chinese localization; preserve all six wrappers/arguments, English order, `{LINE_SPACE}`, and `{1}`. Use `장소를` with the localized payload. |
| 33812 | Sativa Fiber / `사티바 섬유` | Uncertain: the fresh/unpicked condition is preserved, but locale readings differ on leaf/fiber and the item identity is not established. |
| 33817 | Conditional creature imagery in the verse | Uncertain: the conditional and wings/tails/claws imagery remain, but the creatures and poetic image need context. |
| 33820 | `Before The Talk` / `대화 전에` | Uncertain: the literal heading is plausible, but the row does not establish whether it is a named quest/title. |
| 33826 | `third random crime` / `세 번째 무작위 범죄` | Uncertain: count and crime examples remain; `random` may be colloquial rather than a system qualifier, and locale versions omit or alter it. |
| 33827 | Brother/sister ages and speaker gender | Accepted: change the opening to `내 형제자매인 하리트와 구엔페어와 함께 아데사로 왔어.` English does not specify the speaker's gender or sibling ages; remove the unsupported `형` and retain both sibling relationships. |
| 33829 | Lords of Valor / `용맹의 군주들` | Uncertain: the title challenge is retained, but formal title/faction status and canonical Valor terminology need alignment. |
| 33833 | Omitted `my lovely` endearment | Uncertain: Korean retains the appearance compliment and flirtatious offer but omits the explicit affectionate address. Japanese also reduces the address; the right Korean tone cannot be safely inferred in isolation. |
| 33836 | House of Seasons Adherent | Uncertain: Korean conveys follower/adherent status, but the named faction and role terminology are unsettled. |
| 33839 | Delma O‘Mooney spelling | Uncertain: the name is transliterated, but locale spellings differ and the source's curly apostrophe should remain the English lookup reference. No canonical Korean spelling is established. |
| 33840 | Valor Arena business account | Uncertain: the one-paragraph sequence and business meaning are retained; venue, place, and proper-name forms require integrated consistency review. |
| 33844 | Critical-damage and dagger/faeblade modifiers | Not an issue: both separate values and their stealth/unaware-enemy conditions are preserved; no gameplay-value change is warranted. |
| 33849 | Standalone `Revival` / `부활` | Uncertain: the one-word label could name an ability, action, status, or place; context is needed before changing it. |
| Remaining ordinary text in IDs 33801-33850 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was identified. All 50 ordered IDs, line breaks, marker identities, and numeric values align with the source rows. |

## Historical Audit Reconciliation

- The source-keyed entry for IDs 33800-33899 is present in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` and explicitly flags
  House of Sorrows/Midden rites, runtime location markers, Sativa Fiber,
  family/context at 33827, House of Seasons, and Valor Arena.
- At ID 33807 the payload text is localized without changing token identity,
  multiplicity, or order. The argument remains in English/Korean order;
  Japanese and Chinese reorder it, which is not necessary for this correction.
- No historical question was treated as authorization to edit the CSV.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 33801-33850 once
  and in identical order.
- ID 33802 retains five paragraphs; ID 33807 retains all six wrappers and
  arguments; ID 33840 remains one paragraph; ID 33844 retains `+30%`, `+60%`,
  and the blank-line separation.
- Active default CSV SHA-256:
  `abc0082e8d7ac7b8519db9f7160f681311dd0226bb275c2615b621958d9886af`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 33851; 31,284 default IDs remain through ID 65134.
