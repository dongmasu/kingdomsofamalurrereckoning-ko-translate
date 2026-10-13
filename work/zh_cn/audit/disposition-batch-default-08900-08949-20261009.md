# Disposition and Edit Batch: `default` IDs 8900-8949

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 8900-8949.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Existing audit decisions and
  active-corpus terminology were also checked.
- Thirteen findings received dispositions: three accepted corrections, three
  `not an issue`, and seven uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 8906 is `not an issue`: the malformed English article and unspecified
  “those two” referent are preserved without inventing context.
- ID 8912 remains uncertain: Japanese supports twine/thread and Chinese
  supports hemp rope, but `twining` and the exact inventory item remain
  unclear.
- ID 8915 remains uncertain: English capitalizes `Counsel`, Japanese and
  Chinese read it as an adviser, and Korean identifies a council. Earlier
  corpus findings also leave Counsel's identity unresolved.
- ID 8917 remains uncertain: the ammunition label is supported by English and
  Chinese, but the unusual Sceptre weapon/category needs gameplay or glossary
  context.
- ID 8920 remains uncertain: the locales differ on whether Oathblade is a
  formal rank, mercenary class, or weapon-related title.
- ID 8926 remains uncertain: `Savant` has several plausible rank/occupation
  renderings in the active corpus; no canonical Korean form is established.
- ID 8930 is `not an issue`: trap count, radius, damage, Mana values, and the
  hold-to-increase instruction are preserved and corroborated by Japanese.
- ID 8933 is accepted. Change `오늘 날씨 좋지?` to `오늘 좋은 날이지?`.
  English asks whether it is a good day, Chinese is similarly general, and
  Japanese asks how the listener is; no locale explicitly makes this a
  weather question.
- ID 8934 is `not an issue`: map marker order, the three map types, and fast
  travel/waypoint functions are retained.
- ID 8937 remains uncertain: `Tuatha` is rendered as `투아타` here but often
  as `투아사`; this line does not establish whether the forms should be
  normalized globally.
- ID 8942 is accepted. Change `다시 일어섰지만` to `하늘로 떠올랐지만`.
  Japanese explicitly says the city floated and Chinese says it rose into
  the air; the current Korean instead suggests recovery or revival.
- ID 8947 remains uncertain: `Plagueshield` may be a distinct name or a
  source error for `Pledgeshield`; prior findings defer global reconciliation.
- ID 8949 is accepted. Change `박식한 추측` to `정보에 근거한 추측`.
  English `educated guess`, Japanese “experience-based guess,” and Chinese
  “wise guess” describe an informed/reasoned guess, not a guess made by an
  educated person.

## Applied Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 8933 | `오늘 날씨 좋지?` | `오늘 좋은 날이지?` | D-2497: do not narrow a general “good day” question to weather. |
| 8942 | `마침내 도시는 다시 일어섰지만, 하이페리안은 따라오지 않았다. 도시의 심장부만 움직이지 않은 채 남았다. 우리는 그걸 용납할 수 없었다.` | `결국 도시는 하늘로 떠올랐지만, 하이페리안은 뒤따르지 않았다. 도시의 심장부만 움직이지 않은 채 남았다. 우리는 그걸 용납할 수 없었다.` | D-2500: restore the city's physical ascent, not a figurative recovery. |
| 8949 | `검투사여, 꿈은 이곳에서 이루어진다. 박식한 추측 하나로 이만한 보상을 받는 일은 흔치 않지.` | `검투사여, 꿈은 이곳에서 이루어진다. 정보에 근거한 추측으로 이만한 보상을 받는 일은 흔치 않지.` | D-2502: render “educated guess” as an informed/reasoned guess. |

## Verification

- The preliminary report covers all 50 IDs and records the four-locale key
  order, line-break, and runtime-marker checks. All numeric values and the
  `{LINE_LEFT}{*1Maps}{LINE_LEFT}` sequence are unchanged.
- Only the approved Korean `Texto` values at IDs 8933, 8942, and 8949 changed
  in this batch.
- The active Korean `default` CSV remains 65,135 data records with ordered,
  unique IDs 0-65134, two fields per record, UTF-8 BOM, semicolon delimiter,
  CRLF record endings, and no bare LF/CR.
- The active Korean `default` CSV SHA-256 after the edits is
  `2849e574458937e0fbef68ad968c23536a71aad2df2c27bee34a76ae63196414`.
- After this batch: 396 accepted, 794 `not an issue`, and 1,312 uncertain.
  Resume at ID 8950; 56,185 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
