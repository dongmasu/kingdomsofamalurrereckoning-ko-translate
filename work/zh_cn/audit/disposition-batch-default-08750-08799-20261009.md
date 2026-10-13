# Disposition and Edit Batch: `default` IDs 8750-8799

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 8750-8799.
- Decisions use the existing four-locale preliminary comparison and active
  Korean draft. English governs meaning, Japanese informs voice/register, and
  Chinese is supporting evidence.
- Nine findings received dispositions: three accepted corrections, one
  `not an issue`, and five uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 8752 remains uncertain: English repeats an unfinished counterfactual
  `If...`; Korean turns the first condition into a past assertion, while
  attachment of the clauses varies across locales.
- ID 8754 is accepted. Change `널 찾는 사람도 그이고, 지금 포럼에 있어.` to
  `조리엘은 너에게 관심이 있고, 지금 포럼에 있어.` English, Japanese, and
  Chinese say Jorielle is interested in the player and is at the Forum; Korean
  incorrectly says she is looking for the player.
- ID 8760 remains uncertain: the agency assignment is preserved, but the
  canonical Korean name for Domus Politico is not established.
- ID 8761 is accepted. Change `리리아 아래 진실이 없다면, 이 말도
  거짓이리라.` to `내가 거짓말쟁이라면, 리리아의 영역에는 진실도 없으리라.`
  English and Japanese make the absence of truth conditional on the speaker
  being a liar; Korean reverses that relation.
- ID 8773 is accepted. Change `어디 보자. 트래블러스고 시녀의 두건을
  훔치러 왔겠지? 유감이지만 내가 한발 빨랐어. 두건은 내 거야.` to
  `트래블러로군. 시녀의 두건을 훔치러 오라는 의뢰를 받았겠지? 유감이지만
  내가 한발 빨랐어. 두건은 내 거야.` This separates the Traveler identity
  from the Cowl of the Maiden commission rather than implying a Travelers'
  Guild relationship.
- ID 8779 is `not an issue`: the urgency and refusal to wait all day are
  conveyed naturally in Korean.
- ID 8780 remains uncertain: Scholia Arcana has inconsistent Korean forms
  and locales differ between academy/university readings.
- ID 8786 remains uncertain: the exact English QA label may be an internal
  development string or player-facing text.
- ID 8795 remains uncertain: locale evidence varies among a hero's shrine,
  monument, and tomb; the site's function is unresolved.

## Applied Edits

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 8754 | `널 찾는 사람도 그이고, 지금 포럼에 있어.` | `조리엘은 너에게 관심이 있고, 지금 포럼에 있어.` | D-2456: restore Jorielle's interest in the player. |
| 8761 | `리리아 아래 진실이 없다면, 이 말도 거짓이리라.` | `내가 거짓말쟁이라면, 리리아의 영역에는 진실도 없으리라.` | D-2458: restore the source's conditional logic. |
| 8773 | `어디 보자. 트래블러스고 시녀의 두건을 훔치러 왔겠지? 유감이지만 내가 한발 빨랐어. 두건은 내 거야.` | `트래블러로군. 시녀의 두건을 훔치러 오라는 의뢰를 받았겠지? 유감이지만 내가 한발 빨랐어. 두건은 내 거야.` | D-2459: separate faction identity from the theft commission. |

## Verification

- The preliminary report documents matching ordered keys and runtime-marker
  identities/order across all four locales. The four embedded breaks at ID
  8761 are preserved.
- Only the approved Korean `Texto` values at IDs 8754, 8761, and 8773 changed.
- Active Korean `default` CSV SHA-256:
  `4c9d20e254d062aee869ec1fe11188989386f233060515e59eaa7cbf5210be5b`.
- Parsed CSV verification passed: 65,135 records, two fields per record,
  unique ordered IDs 0-65134, UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and no bare LF/CR.
- After this batch: 391 accepted, 787 `not an issue`, and 1,285 uncertain.
  Resume at ID 8800; 56,335 rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
