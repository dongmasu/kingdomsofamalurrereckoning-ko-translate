# Preliminary Language Scan: `default` IDs 2400-2449

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2400-2449.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked terminology,
  pronouns, UI markers, numeric effects, and quest-journal wording.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2400 | 하이페리언(Hyperian)이 기다린다. | Confirm whether `Hyperian` identifies a person, faction, or other entity before choosing a Korean title/form. | English capitalizes the name; Japanese transliterates it and Chinese gives a mythological-name form. Korean preserves the English spelling. This repeats the historical question. | Medium |
| 2403 | 너희 크로우즈(The Crows)는 실력은 괜찮군. | Keep `the Crows` distinct from ordinary crows and smooth the Korean topic construction without changing the dismissive assessment. | English and Japanese identify the Crows as a group/team; Chinese calls them a team. Korean preserves the name but `너희 크로우즈는 실력은` stacks topic markers and reads awkwardly. This repeats the historical question. | High |
| 2410 | 그와치 모르헨(Gwach Morhen) | Confirm the Korean pronunciation of `Gwach Morhen`; retain the English form until a canonical spelling is chosen. | Japanese/Chinese transliterations differ. Korean preserves the source spelling alongside a provisional Hangul form. This repeats the historical question. | Medium |
| 2411 | 대왕 티타리온(High King Titarion) | Standardize `High King` and verify `Titarion` spelling against the title/name glossary. | English says `High King`; Japanese says “supreme king,” and Chinese also uses a high-king title. Korean `대왕` is plausible but should match the project-wide title choice. This repeats the historical question. | Medium |
| 2412 | ... 라시르(Rathir) 세관 안에... 아니, 그 아래에 있어. | Preserve the correction from “inside” to “beneath” and confirm the exact Rathir Customs House structure/location. | English explicitly self-corrects; Japanese/Chinese also distinguish inside versus below. Korean retains the correction and its uncertainty. This repeats the historical question. | Medium |
| 2419 | ... 드베르가(Dvergan)의 보물 지도 ... “아카라-토르(Akara-Tor)” ... | Verify `Dvergan`, `Alfar`, and `Akara-Tor` forms and preserve the distinction between the Alfar inscription and Dvergan script. | English/Japanese/Chinese identify the two writing systems and the named inscription. Korean preserves both scripts and the requirement for two additional fragments. This repeats the historical question. | Medium |
| 2423 | ... 워스원(Warsworn)의 명예로운 이름 ... | Confirm the established Korean faction/rank form for `Warsworn` and keep the warning's direct, formal address. | English/Japanese/Chinese treat Warsworn as a named faction. Korean preserves the English and title traceability; the canonical Korean form remains open. This repeats the historical question. | Medium |
| 2424 | 아마루르(Amalur)의 정교한 구조물도 네 발아래 무너져 내리리니 ... | Preserve the prophecy-like voice and determine what `Amalur's careful constructs` refers to before replacing the broad `구조물`. | English and Japanese both leave the “constructs” image abstract; Chinese also speaks of Amalur's careful construction. Korean retains the poetic collapse and portal-opening sequence. This repeats the historical question. | Medium |
| 2425 | ... 고대 미사란(Mitharan) 석판 ... | Confirm the Korean forms for `Master Hugues` and `Mitharan lith`, including the project's established term for `lith`. | English says `Master` and `lith`; Japanese/Chinese call Hugues a teacher/master and the lith a stone tablet. Korean's `사부`/`석판` is plausible, while Mitharan spelling varies elsewhere. This repeats the historical question. | Medium |
| 2426 | 먼지의 자녀여 | Confirm whether `Child of the Dust` is a formal epithet/religious title or a generic poetic greeting. | English capitalizes each word; Japanese uses a “born of dust” expression and Chinese renders it as a child of dust. Korean preserves the image but not the English title capitalization. This repeats the historical question. | Medium |
| 2438-2439 | 흐렌록(Hrenloc) 침입자 / 브리지 랫(Bridge Rat) 출현 트리거 | Verify the proper name `Hrenloc` and whether `Trigger Bridge Rats` is an internal event/debug label rather than player-facing text. | The English at 2439 is an imperative-like trigger label; Japanese/Chinese similarly read as a trigger. Korean adds “appearance,” a plausible event description, but player-facing status is unknown. This repeats the historical question. | Medium |
| 2445 | ... 콜름 앨바(Colm Alba) ... 동생 기란(Giran) ... | Verify the quest summary's names, sibling relationship, cult membership, and meeting location as a single chain. | English, Japanese, and Chinese agree Colm seeks his brother Giran, who joined the death cult, and asks for a meeting at the Tomb of Fyragnos. None specifies that Giran is younger; Korean `동생` adds that age. The proper-name forms remain provisional. This repeats the historical question. | High |
| 2448 | 죽을 때까지 해보는 편이 낫지. | Render `Better to die trying` as a natural Korean idiom without implying that the attempt continues until death. | English expresses willingness to attempt something despite the risk of death. Japanese and Chinese use different but similarly forceful phrasings; Korean's literal `죽을 때까지 해보다` is awkward and shifts the image. | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2400, 2403, 2410-2412,
  2419, 2423-2426, 2438-2439, 2445, and 2448 against the active Korean and source
  locales. The entity/team names, High King title, Customs House, map scripts,
  Warsworn, prophecy, Mitharan lith, Child of the Dust, debug trigger, and
  quest relationships remain open or provisional.
- Same-numbered historical entries for other resource types were not applied
  to these `default` dialogue and journal rows.

## Other Checks

- ID 2437 preserves `{LINE_CENTER}`, `{*1secondary}`, and `{1}` in the
  source order. IDs 2446 and 2447 preserve 10%, 100 bonus damage, and 75%
  damage reduction.
- No additional high-confidence semantic mismatch was found in the remaining
  inspected entries.

## Batch Status

IDs 2400-2449 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
