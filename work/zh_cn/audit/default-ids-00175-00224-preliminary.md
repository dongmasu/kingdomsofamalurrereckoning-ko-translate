# Preliminary Language Scan: `default` IDs 175-224

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 175-224.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Checked applicable project terms in the official Korean manual glossary.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 176 | 잃어버린 역병 방호제 찾기 | Reconcile `Plagueshield` with `base` ID 127 (`역병 방패`) and dialogue ID 131. | The same English term is rendered differently across resources; the quest objective suggests a recoverable item or supply, but references do not settle the canonical Korean term. | Medium |
| 180 | 페어 고르타(Fear Gorta)와 라즈의 자손(Sons of Laz) | Verify canonical creature/group names, especially `Sons of Laz`. | English names two groups; Japanese and Chinese give different readings for the second group (Japanese suggests Laz soldiers; Chinese says Sons of Laz). The current literal “descendants” may not be the established creature name. | Medium |
| 182 | 엘런드 카스(Elund Carth) | Normalize the character name `Elund` across resources. | This row uses `엘런드`, while `base` ID 117 has `엘룬드(Elund)`. Japanese and Chinese support the same person but do not establish the project's preferred Korean spelling. | Medium |
| 184 | 도칼파르 민족 연대기 | Use the official-manual form `도크알브` for `Dokkalfar`, pending any documented in-game exception. | The project glossary explicitly gives `Dokkalfar = 도크알브`; current Korean `도칼파르` conflicts with that authority. | High |
| 189 | 대사제의 성소 | Confirm the source conflict before settling this name. | English `Hierophant Shrine` and Chinese `大祭司神殿` support a Hierophant's shrine/temple; Japanese says “Guide's altar.” Korean follows English/Chinese broadly, but `Hierophant` may be a title with a separate canonical term. | Medium |
| 191 | 콜로새 정찰 보고서 | Confirm the canonical spelling of `Kollossae`. | English identifies a Kollossae scout report; Japanese `カロシー` and Chinese `克勒塞` differ from Korean `콜로새`. | Low |
| 193 | 좋은 하루요. 처음 보는 얼굴이군. | Consider a natural greeting such as `안녕하시오. 처음 보는 얼굴이군.` after checking this speaker's voice. | `좋은 하루요` is an unnatural literal greeting. Japanese uses a casual `やあ`; Chinese is more formal. Preserve the intended register rather than the English word-for-word form. | High |
| 196 | 테스타먼트가 들어와 ... | Determine whether `Testament` is a named faction/entity and reconcile the localized sources. | English says `the Testament`; Japanese and Chinese identify a `Belen` covenant/group. Korean transliterates English, which preserves traceability but leaves identity and canonical naming unresolved. | Medium |
| 197 | 로살파르(Ljosalfar)의 작품 | Use the official-manual form `료스알브` for `Ljosalfar`, pending any documented in-game exception. | The project glossary explicitly gives `Ljosalfar = 료스알브`; current Korean `로살파르` conflicts with that authority. | High |
| 217 | 또 보자, 필멸자여. | Check the speaker's register against surrounding dialogue before choosing informal Korean. | Japanese `また会いましょう` uses a polite/friendly form, while the Korean uses plain imperative `또 보자`; English does not encode the distinction. | Medium |
| 223 | 깊은 잠이 요람의 마법을 유지하고 있어. | Check whether `The Deep Slumber` is a named ritual and should be distinguished from ordinary sleep. | English capitalizes the term; Japanese explicitly calls it a ritual, while Chinese and Korean use a general sleep reading. The proper-name status is unresolved. | Medium |

## Other Checks

- ID 190 preserves the three ingredient lines and their quantities.
- ID 219 preserves `{*1...}` and `{LINE_SPACE}` markers in order.
- ID 221 follows English `Unseelie` where Chinese instead says winter Fae; retain the English meaning unless context disproves it.

## Batch Status

IDs 175-224 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
