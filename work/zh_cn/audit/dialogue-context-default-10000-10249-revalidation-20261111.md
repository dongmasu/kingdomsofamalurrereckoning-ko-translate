# Sequential `default` Revalidation: IDs `10000`-`10249`

- Date: 2026-11-11.
- Scope: compare active Korean against English meaning, Japanese voice,
  register and layout, and Chinese supporting evidence.
- Sixty-eight existing ledger records in this range were left unchanged after
  their source fingerprints were checked. All 182 previously unrecorded IDs
  were compared and recorded.
- Thirteen new IDs have correction candidates. Seven IDs have
  evidence-limited findings; none overlap.
- Of the 182 new IDs, 135 have indexed quest-asset links and 47 do not.
  Asset associations do not establish a line's speaker or playback order.
- Non-dialogue rows were assessed as UI, objective, item, book, or other text;
  speech-level, address, and honorific fields are marked not applicable where
  dialogue review does not apply.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10079` | Speech level / naturalness | `난 신사요` and `보상하겠소` use conspicuous 하오체, while Japanese is plain conversational and Chinese is polite. Rephrase in a consistent, natural register without changing the promised reward or the glimpse of the thieves leaving by the back window. | High |
| `10090` | Terminology / name pairing | `Order of the Ash` is rendered `잿빛 기사단`, but the same organization is `잿빛 교단(Order of the Ash)` at `21805`, where its spellcasting role is explicit; `2138` also uses `잿빛 기사단`. Review these source-keyed occurrences together and use one term for the magical order, pairing the complete name where appropriate. | High |
| `10154` | Name pairing | The named wine `Turner's Finest` is only `터너의 최고급 와인`. Consider pairing the full product name, e.g. `터너의 최고급 와인(Turner's Finest)`. The related description at `49035` also uses this name and should be checked together. | High |
| `10155` | Naturalness | `종교 목걸이` is an awkward literal phrase for `religious necklace`. Consider wording such as `종교적 의미가 담긴 목걸이`, preserving that the necklace was stolen and that its pendant glows in the narrator's presence. | Medium |
| `10173` | Naturalness | `All my boys` covers the speaker's two sons, brother, and beloved Avery. `내 남자 가족들` is unnatural Korean; consider `가족 중 남자들은 모두 투아사에게 빼앗겼어`, retaining the following list and grief about the war. | High |
| `10174` | Name pairing | The objective `Go to Rathir Harbor` is `라시르(Rathir) 항구로 가라`, pairing only the city name. Consider pairing the complete named destination as `라시르 항구(Rathir Harbor)로 가라`; `17491` has the same partial pairing and is a related occurrence. | High |
| `10177` | Address / naturalness | `제발, 나그네여...` sounds stilted as a direct plea to a stranger. Consider a more conversational address such as `부탁이야, 여행자...`, retaining the unfinished plea and not inferring the speaker. | Medium |
| `10178` | Honorific / name pairing | `Lady Sagrell` is rendered `레이디 사그렐(Lady Sagrell)`, while the established source-supported form is `사그렐 부인(Lady Sagrell)` (including `20742` and the Sagrell standardization record). Use the established title and name form. | High |
| `10179` | Naturalness / meaning | `interrupting the target` becomes `대상을 방해합니다`, which does not clearly say the effect interrupts the target's action. Consider `대상의 행동을 방해합니다`, preserving the 110 Physical Damage value. | High |
| `10186` | Name pairing | The named first name `Effie` appears only as `에피`; other source rows identify the full name as Effie Cruikshank, but this line does not establish the surname. Consider the source-local pairing `에피(Effie)` without expanding it to a full name. | High |
| `10187` | Speech level / naturalness | `일을 마치고 오너라` uses an archaic command. Japanese is a softer request (`仕事が済んだら来てちょうだい`). Rephrase conversationally while leaving the exact register open until the speaker is established from direct evidence. | Medium |
| `10196` | Meaning / naturalness | `He's a dear` is rendered `참 소중한 사람이야`, which can mean a cherished person rather than an endearing or sweet one in this cage-related context. Consider wording closer to the affectionate or gently ironic sense, while preserving the observation that he is quiet and content. | Medium |
| `10219` | Name pairing | The family names `The Goodchilds` and `the Darkkens` appear as `굿차일드 가문` and `다르켄 가문` without English. Consider pairing both complete family labels, e.g. `굿차일드 가문(Goodchilds)` and `다르켄 가문(Darkkens)`, while preserving the speaker's worry about the siege. | High |

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `10002` | Meaning / name status | English capitalizes `Orison`, Japanese retains it as `Orison`, while Chinese translates it as prayer. Korean follows the English/Japanese term. The isolated sentence does not establish whether this is a named rite or prayer in general; retain provisionally. |
| `10059` | Meaning | `Keep with your own` is ambiguous in isolation. Japanese reads as “know your place,” Chinese differs substantially, and Korean reads as staying with one's own side. Do not guess the intended admonition without scene context. |
| `10150` | Meaning | `troubled man` may mean a man in distress or a troublesome man, and the source languages diverge on the next clause (`may have wronged` versus having suffered injustice). Korean's reading is plausible but not confirmed; retain pending context. |
| `10172` | Localization status | `Quality Assurance Testers` remains English in English, Japanese, and Korean, while Chinese translates it. The isolated label does not establish whether untranslated credits/test text is intentional. |
| `10205` | Rank | `Private Edstar` is rendered `에드스타 이병`. Japanese uses a generic enlisted-soldier term and Chinese a generic private rank; the game's exact rank equivalence is not established here. Retain pending role context and keep aligned with the existing rank question at `9452`. |
| `10222` | Meaning / ability name | English says `Trigger Arrows`, Japanese transliterates the name, Chinese describes firing arrows, and Korean says `기폭 화살`. Without the ability's mechanics, the intended trigger/action is unresolved; do not replace the name by guesswork. |
| `10246` | Speech level / text type | `보라` and `-로다` make the Korean markedly archaic, but the line's isolated exclamatory wording may be deliberately theatrical or quoted. The asset link does not establish speaker or delivery; retain pending direct context. |

## Duplicate and Structural Checks

- Thirty-eight exact-English duplicate groups touch this range, comprising
  727 rows across the corpus. Every group has matching Korean text.
- Runtime-placeholder counts and order, layout-control tokens,
  display-wrapper positions, brace balance, and logical line-break counts
  match across English, Japanese, Chinese, and Korean for all 182 new IDs.
- Nine Korean strings contain 44 existing embedded CRLF breaks:
  `10037` (9), `10058` (4), `10067` (2), `10086` (1), `10090` (4),
  `10116` (1), `10124` (1), `10165` (4), and `10236` (18). All were
  preserved.
- The full 10-line ballad at `10037` and four-stanza verse at `10236` retain
  their existing logical line breaks. No gender, speaker, or playback order
  was inferred from asset membership.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
