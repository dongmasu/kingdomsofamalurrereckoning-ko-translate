# Sequential `default` Revalidation: IDs `25500`-`25749`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 59 existing ledger records and added 191 previously unrecorded
  IDs. Eight in-range correction candidates and one evidence-limited hold
  were recorded. One additional out-of-range duplicate ID, `58994`, was
  recorded as a correction candidate.
- Retained six existing correction-candidate IDs and two evidence-limited
  holds; ID `25720` has both a name-pairing candidate and a separate
  unresolved Aster-name hold.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `25526` | Name / format | This is the named material `Mitharan Spiritweave Cloth`; only `Mitharan` is paired in Korean. Consider pairing the complete item name: `미타란 영혼베틀 옷감(Mitharan Spiritweave Cloth)`. | Medium |
| `25549` | Meaning | English says the first Fae to set foot in Amalur came from that place. Korean instead says the place where Fae first set foot was there. Consider `아말러(Amalur)에 처음 발을 디딘 페이(Fae)들이 거기서 왔다고 들었어. 그래서 데티어(Detyre)에 페이가 그렇게 많은가 봐.` | High |
| `25553` | Name / format | `Hellbane` is a capitalized named topic, transliterated without its English form. Pair it as `헬베인(Hellbane)에 대해 들려줘.` | Medium-high |
| `25595` | Naturalness / duplicate consistency | The same English line appears at `25595`, `37899`, `37948`, and `59623`. Japanese marks `37899` as polite and the other three as casual; Korean appropriately keeps `37899` polite but varies the three casual versions. Consider aligning this row to `다른 선물이 더 왔는지 가끔 들러서 확인해 봐.` | High |
| `25596` | Meaning / naturalness | `impress the Maid` does not necessarily mean romantically winning her heart. Korean `시녀의 마음을 얻을 수 없어` adds that implication. Consider `넌 시녀(The Maid)에게 인정받을 수 없어.` | Medium-high |
| `25599` | Terminology / format | The same title `Ancient Delfric` is rendered as `원로 델프릭(Ancient Delfric)` at `631` and `원로 델프릭(Delfric)` at `35501`, but as `고대의 델프릭(Delfric) 대장군` here. Align with the established `원로 델프릭(Ancient Delfric)`. | High |
| `25632` | Naturalness / letter format | The letter's closing `진심을 담아, 알파르 군(Alfar Army) 캔웬 대장(Captain Canwen)` reads like a literal sign-off. Consider `알파르 군(Alfar Army) 캔웬 대장(Captain Canwen) 드림.` | Medium |
| `25727` | Meaning / terminology | `Hexes` is the card game, not curses: the Chinese source says `六牌`, and the game's other entries identify it as a card game. Replace `주술들` with the established card-game name, e.g. `저 빌어먹을 헥스(Hex)!` | High |
| `58994` | Meaning / duplicate consistency | This out-of-range row duplicates `25576` and `63906` exactly in English, Japanese, and Chinese. Its Korean `테스타먼트(Testament)` differs from `벨렌의 성약단(Belen's Testament)` at the other two IDs. Align `58994` with the latter; this ID is also recorded in the ledger. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `25544` | Naturalness / context | English and Japanese both present a fragment equivalent to “As the Tuatha have learned.” The Korean fragment sounds incomplete in isolation, but the preceding clause may supply its syntax. Do not join or recast it without dialogue context. |

## Rechecked Existing Findings

- Retained the naturalness candidate at `25627` for the stilted first-person
  introduction `오르도(Ordo)라고 불린다`; the earlier proposal remains
  `오르도(Ordo)라고 해`.
- Retained the naturalness candidates at `25699` and `25700` from the
  source-backed asset review.
- Retained the naturalness and speech-level candidates at `25713`.
- Retained the `Bodan` English-pairing candidate at `25720`; its separate
  Aster spelling remains on hold.
- Retained the meaning candidate at `25742`.
- Retained the speech-level hold at `25615`; asset association does not
  establish who is speaking or the scene stage.

## Duplicate And Structural Checks

- The range touches 59 exact-English duplicate groups, covering 1,288 corpus
  rows. Korean matches within each group except the documented
  `The Testament` group (`25576`, `58994`, `63906`) and gift-check group
  (`25595`, `37899`, `37948`, `59623`). Japanese distinguishes the polite
  `37899` from the three casual lines; Korean register follows that
  distinction, while the in-range casual wording at `25595` remains a
  consistency candidate.
- Other repeated short lines with Japanese variants, including `Yes?`,
  `Greetings.`, `Prepare yourself.`, and `Where do we go now?`, were not
  mechanically unified; their Korean remains appropriate to the available
  source evidence.
- Logical line-break counts and normalized brace-token signatures match
  across all four languages for all 250 IDs.
- ID `25567` explicitly identifies the first-person speaker as Edgard
  Bastion. No other speaker or dialogue order was inferred from asset links,
  NPC symbols, handler names, or row order.

After recording this range and the duplicate candidate at `58994`, the ledger
contains 36,058 of 65,135 IDs (55.36%), leaving 29,077. Sequential coverage
reaches ID `25749`; the next range is `25750`-`25999`.
