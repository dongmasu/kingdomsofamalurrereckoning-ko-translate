# Disposition and Edit Batch: `default` IDs 25051-25100

- Decision date: 2026-10-10.
- Scope: preliminary findings checked against English meaning, Japanese
  voice/register, Chinese supporting evidence, active Korean, historical
  questions, and recurring terminology.
- Decisions: one accepted, eight `not an issue`, and nine uncertain.
- Accepted Korean `Texto` correction: ID 25065. Uncertain setting terms and
  context-dependent interpretations remain unchanged.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 25051 | `$TRSQ01.bribe_value$ Gold` | Not an issue: Korean preserves the exact runtime variable and gold label. |
| 25055-25057 | Mitharan item terms / charged ability values | Uncertain: all health and mana percentages and the ability-description break remain; equipment terminology needs alignment. |
| 25058 | Bristletongue / Font / Jakasen | Uncertain: Fae control, Font-water relation, and request to the apothecary remain; plant/place/name terms differ across locales. |
| 25060-25064 | Madness / Solstice / Doctor Skull / “your grace” | Uncertain: question, title/name, and respectful address remain; Solstice's named status and canonical forms need context. |
| 25065 | `Special Deliveries` chest / linked game-title wrappers | `Special Deliveries` -> `특별 배송` | Accepted: localizes the chest label as in Japanese/Chinese and consistently with other active Korean rows, while preserving all four `{*1...}` wrappers, `{LINE_SPACE}`, and their order. |
| 25066-25067 | Examine Lore / “Yours. Alyn Shir.” | Not an issue: `설화 살펴보기` is a natural UI rendering, and the brief sign-off is preserved in Korean; no context-supported change is established. |
| 25069-25070 | Alabastra / Brogan Adair / troops at gate | Uncertain: immediate help and later troop movement once the gate opens are retained; names need alignment. |
| 25071 | Broken “respo... respons...” denial | Not an issue: Korean preserves the interrupted self-correction and final uncertainty without completing the thought. |
| 25077 | Sinsear / “the House” choice | Uncertain: Korean resolves the unnamed House as the House of Sorrows; English is less specific and other locales differ. |
| 25078-25079 | Erathi Ruin / Piercing Light / General Tilera | Uncertain: ruin, weapon recovery, Niskaru retreat, and follow-up remain; proper-name and weapon-title forms need alignment. |
| 25081-25083 | One of the blessed / plural “they” / Fateweavers | Not an issue: Korean preserves the blessed person's status, plural question, and Fateweavers' accepted limits of understanding despite the source's number-agreement error. |
| 25085 | “thieving these woods” / curses | Uncertain: Korean reads theft in the forest; Chinese explicitly reads stolen timber, while English/Japanese do not resolve the object. |
| 25090 | Alchemy Workbench recipe | Not an issue: Black Cohosh (2), Embereyes (1), and the blank-line/list layout are preserved. |
| 25094-25095 | Octienne / vanished Well / Strange Prisoner | Uncertain: mistake, apparent Well disappearance after the Sprite dies, and return/report sequence remain; recurring name and Well terminology need alignment. |
| 25096 | Teeth of Naros / Primos / deferred duty | Uncertain: destination, search objective, and delayed explanation remain; Primos and Fate terminology vary across locales. |
| 25097 | Odi replacement | Not an issue: Korean preserves that Odi still needs a replacement. |
| 25098 | +12% Critical Hit chance | Not an issue: exact +12% value and critical-hit meaning are preserved. |
| 25099-25100 | “rusty” / “hold my own” / challenge | Not an issue: Korean naturally preserves the figurative confidence and direct challenge. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 25051-25100 once
  and in identical order.
- ID 25057 retains its embedded line break and all listed percentages. ID
  25065 retains four `{*1...}` wrappers and one `{LINE_SPACE}` marker in the
  same order; only the Special Deliveries payload was localized.
- Only Korean `Texto` at ID 25065 changed.
- Active default CSV SHA-256:
  `01153747a92e389392620195d4700b7635b466c7de0f208c7fac655a93134bc6`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 814 accepted, 2,788 `not an issue`, and
  4,609 uncertain (8,211 counted dispositions), excluding duplicate rows
  D-5305 and D-5306. Resume at ID 25101; 40,034 `default` rows remain.

These working dispositions do not complete the integrated review or constitute
independent final linguistic approval.

## Subsequent Context Review (2026-10-11)

All 18 uncertain keys were resolved: one accepted correction at ID 25061 and
17 `not an issue`. The already accepted ID 25065 was not recounted. This
later pass supersedes the provisional uncertain outcomes above. See
[`consolidated-context-review-default-25051-25100-20261011.md`](consolidated-context-review-default-25051-25100-20261011.md)
for the evidence, edit, and byte-level verification.
