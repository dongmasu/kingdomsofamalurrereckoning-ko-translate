# Preliminary Language Scan: `default` IDs 3350-3399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3350-3399.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked dialogue,
  terminology, names, and parsed CSV text.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3351 | `'운명에 맹세한 자들(Fatesworn)'은 무슨 뜻이지?` | Confirm whether `Fatesworn` is an expansion/faction name to retain or translate; ensure the question asks what the term means without embedding an unapproved canonical Korean title. | English asks the meaning of the capitalized term, Japanese retains it phonetically, and Chinese supplies a meaning-based rendering. Korean uses a translated plural phrase plus English, which may pre-answer the character's question. This repeats the historical question. | Medium |
| 3356 | 잘 침대가 필요하면 술집의 로브(Rove)에게 말해 봐. | Correct the apparent typo to a natural phrase such as `잠자리가 필요하면`; preserve the casual lodging direction. | English and Japanese say to ask Rove at the bar if a bed is needed. Chinese says the same. Korean `잘 침대` is ungrammatical and obscures the intended “need a place to sleep.” | High |
| 3364 | ... 타이브리아(Taibreah)는 그 힘을 모두 자기 안에 받아들여 ... 비탄의 집(House of Sorrows) ... | Confirm whether capitalized `Sorrows` are beings, a magical force, or both, and preserve the distinction between them and the House of Sorrows. | English says Taibreah incorporates all the unleashed Sorrows into herself after Bisarane freed them. Japanese calls them the power of lament; Chinese personifies them as spirits. Korean chooses “power of sorrow,” which remains provisional. This repeats the historical question. | Medium |
| 3368 | 돌아왔구나, 초대받은 자여. | Align `Beckoned` with the chosen player-title rendering used elsewhere; Korean currently varies between `부름받은 자` and `초대받은 자`. | English uses the same capitalized player title; Japanese also treats it as a formal title. Korean's wording is understandable but inconsistent with other active rows. | Medium |
| 3374 | 세터 경(Lord Setter) | Confirm whether `Lord` is a generic honorific or a specific rank (Japanese identifies Setter as a viscount); settle the Korean title/name convention. | English and Chinese use Lord, while Japanese specifies viscount. Korean uses `경` and preserves the English title, leaving rank unresolved. This repeats the historical question. | Medium |
| 3381 | `\"미사루께서 그의 사나운 영혼을 품어 주시길. 이 땅에 그를 사랑할 이는 없으리.\" - 펜토스(Pentos)` | Verify the literal quote bytes/rendering before any edit; compare the parsed Korean text's backslash-quote sequences with the ordinary quote characters in English/Japanese. Preserve the epitaph and speaker attribution. | The parsed Korean field contains literal `\"` sequences. The English/Japanese CSV fields encode quote marks using CSV doubled-quote syntax and parse without backslashes. If the game renders these characters literally, the Korean epitaph may show stray backslashes. | High |
| 3384 | ... 네가 죽은 이유는 나도 수수께끼야. | Confirm whether `your death` means the fact/circumstances of the death or specifically its cause; avoid narrowing the source without scene context. | English says the player's death is a mystery; Japanese/Chinese leave the referent broad. Korean specifies “why you died,” shifting the mystery toward cause. | Medium |
| 3388 | 성 오드윅(St. Odwig)의 선교원 | Confirm whether `Mission` is a religious institution/outpost or a mission/task; align the place name with the Japanese monastery reading if supported by context. | English says `St. Odwig's Mission`, Japanese calls it a monastery, and Chinese says a mission. Korean chooses `선교원`, which can imply a mission school/compound. This repeats the historical question. | Medium |
| 3394 | ... 화려한 노움 기념품은 세월에 빛이 바랬지만 ... | Confirm whether `tarnish` specifically means metal tarnish rather than general fading, and whether the object is a souvenir or heirloom. | English says a gorgeous Gnome keepsake bears years of tarnish; Japanese focuses on discoloration and Chinese on stains. Korean's fading is readable but may miss metal tarnish. This repeats the historical question. | Medium |
| 3397 | 아론(Aron) 발굴지 | Confirm whether `Aron Excavations` is a company/organization, an excavation site, or both; the current `발굴지` selects a physical site. | English capitalizes the phrase; Japanese says excavation site and Chinese says mining company. Korean follows the physical-site reading. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3351, 3353, 3355,
  3364, 3373-3374, 3381, 3388, 3394, and 3399 against active Korean and
  source rows.
- Same-numbered historical questions for Ordination Tome (3355), developer
  test labels (3363-3364), `The Adventure II` (3373), `Altar of Vraekor`
  (3397), and item/effect ranks are separate `base` entries and were not
  merged into these `default` findings.
- ID 3368's `Beckoned` consistency concern is independent of the historical
  `The Maid` title question at ID 3370.
- No historical disposition was treated as approval.

## Other Checks

- ID 3359 describes a heavy two-handed maul; Korean preserves the weapon
  class and two-handed use. ID 3362 preserves the guarded main entrance versus
  trapped alternate route.
- ID 3399 preserves the contrast between restoring the legacy and the
  casualties, with Wencen rendered as powerless rather than sexually
  impotent.
- No structural changes were made.

## Batch Status

IDs 3350-3399 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
