# Disposition and Edit Batch: `default` IDs 29801-29850

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29801-29850, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: one accepted, seventeen `not an issue`, and seventeen uncertain.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29827 | `이 퀘스트의 의뢰인 중 한 명이 사망해 완료할 수 없습니다.` | `이 퀘스트와 관련된 당사자 중 한 명이 사망해 완료할 수 없습니다.` | English says “one of the parties in this quest,” and Japanese says one of the parties concerned. `의뢰인` narrows the dead party to the quest's requester without support. Use neutral `당사자` and preserve the unknown role. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29801 | Gastyr insult letter | Not an issue: the letter retains its attack on the ruler's household/domain, accusation of social superiors, final rebuke, and separated signature. Exact idiomatic scope remains open separately. |
| 29802 | Anokatos / virtuous leader promise | Not an issue: the promise not to fail the woman and to keep her on the virtuous leadership path is retained. Her identity remains open separately. |
| 29806 | Pass required for entry | Not an issue: the access condition is concise and explicit; Korean's formal register is suitable for a gate/UI notice. |
| 29812 | Magnus / qualifying match counterfactual | Not an issue: the attack before the qualifying match and the resulting Champion outcome are preserved. |
| 29814 | Battle Frenzy resistance | Not an issue: Physical and Piercing Damage Resistance, the +12% value, and the Battle Frenzy condition match all locales. |
| 29819 | Debate / no fight left in students | Not an issue: Korean interprets the figurative `fight` as participants willing to debate, supported by Japanese and Chinese. |
| 29820 | Bartering performance / merchant leverage | Not an issue: the performance metaphor and offer to teach bargaining advantage are retained. |
| 29824 | Amulet suspicion / bad acts catch up | Not an issue: the speaker's suspicion remains an inference, with grudging praise and the consequence warning intact. |
| 29828 | Hidden Kobold trigger semantics | Not an issue: the label retains the trigger and hidden-Kobold meaning; player-facing versus internal-label status remains open separately. |
| 29835 | Concert / party after Telogrus is gone | Not an issue: the planned concert, party, Telogrus's disappearance, and celebratory tone remain connected. |
| 29837 | Closing Chaos Portals strengthens weapon | Not an issue: Korean preserves the progressive relationship between closing more portals/rifts and increasing weapon strength; canonical Portal/Rift terminology remains open separately. |
| 29839 | Wand / Aurela / forced departure | Not an issue: bringing the wand, Aurela destroying it, and the resulting forced departure remain in order. The plural antecedent remains open separately. |
| 29840 | Speaker is the town's law | Not an issue: Korean retains the boast and the explanation that the speaker alone accepted the duty of protecting Ayten. Literal authority versus idiom remains open separately. |
| 29845 | Northern cliff camp / surviving prisoners | Not an issue: the camp location, conditional survival of prisoners, and urgency not to arrive too late are preserved. |
| 29848 | Show All Quests | Not an issue: Korean clearly expresses the UI command to display all quests. |
| 29850 | Existing or new EA account | Not an issue: the existing-email/password path and new-account fallback are both preserved. |
| IDs 29801-29850 structural and remaining ordinary text | Keys/order, breaks, runtime markers, values, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; line-break counts and normalized runtime-token identities/order match. The signature separation, hidden-Kobold label, Battle Frenzy +12%, and EA account branches are preserved. |

## Uncertain

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29801 | `ruler of your own hearth` / `amongst your property` | Uncertain: the insult is preserved, but the archaic metaphors and exact scope of lawlessness are source-ambiguous. |
| 29802 | Anokatos / `her` antecedent | Uncertain: the promise is clear, but the woman is not identified in this row. |
| 29805 | Brun / Caeled Coast / Bolgan | Uncertain: the task sequence is preserved, but canonical bard, place, and creature forms need glossary alignment. |
| 29808 | Wyvyrn-Gifres / Great Houses of Rathir | Uncertain: the signet-ring relation is retained, but spelling, hyphenation, and house-name treatment vary across locales. |
| 29810 | Freehold / Chaos Rifts | Uncertain: the investigation and closure objectives are clear, but the place name and plural Rift terminology need corpus alignment. |
| 29811 | Tapestry of Fate | Uncertain: Korean translates the artifact/lore title, while other locales use different established renderings; its canonical name is unresolved. |
| 29813 | Taibreah / Proving Halls | Uncertain: arrival and safe passage are preserved, but the character and trial-venue forms need glossary alignment. |
| 29814 | Battle Frenzy / damage-resistance terminology | Uncertain: the mechanics and value are correct, but canonical Korean ability and resistance labels need integrated review. |
| 29826 | Sworn to War | Uncertain: capitalization may indicate a formal faction/rank/title rather than a generic description; context is missing. |
| 29828 | Trigger Hidden Kobolds label | Uncertain: it appears developer-facing, and the intended audience and exact trigger action are unknown. |
| 29831 | Besin fragment | Uncertain: English is elliptical and Korean retains a fragment-like question, but the preceding context and discovery referent are unavailable. |
| 29833 | Eel Petal | Uncertain: it may be a named plant/reagent or literal description; locale renderings conflict. |
| 29837 | Chaos Portals versus Chaos Rifts | Uncertain: the mechanic is retained, but English's `Portals` and Korean's established `균열` terminology need system-level reconciliation. |
| 29839 | `they` / Priestess Aurela | Uncertain: Korean preserves the plural departure without inventing its antecedent, while Japanese differs on the destroyer's name; scene context is needed. |
| 29840 | `I am the law of the town` | Uncertain: the boast is retained literally, but Japanese reads it as maintaining public order; exact authority/idiom depends on context. |
| 29842 | Kelgar the Black | Uncertain: the epithet and personal name are understandable, but canonical spelling/title treatment differs across locales. |
| Other named terms in IDs 29801-29850 | Gastyr / Anokatos / Brun / Caeled Coast / Bolgan / Freehold / Magnus / Taibreah / Aurela / Ayten / Kelgar / Sverri and related names | Uncertain: meanings are generally retained, but proper-name, faction, place, and title conventions require integrated glossary review. |

## Verification

- Only the approved Korean `Texto` cell at ID 29827 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution were
  preserved. The 29801 signature break, 29814 value, 29828 label, and all
  runtime marker identities/order remain intact.
- Active default CSV SHA-256:
  `492b3944b9d973316f58ce266236a04d30dba9ae3d00d7b7ffe3cf7ced8aa947`.
- The UTF-8 BOM and 72,046 CRLF / 39 bare-LF distribution are preserved.
- Register totals after this batch: 908 accepted, 3,276 `not an issue`, and
  5,320 uncertain (9,504 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29851; 35,284 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
