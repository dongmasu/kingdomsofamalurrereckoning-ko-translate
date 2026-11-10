# MQ05 / Glianal Main Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 332 `default` keys associated with `563881.quest_bxml`
  (`MQ05`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID MQ05`, the asset-level symbol
`NPC_DAL_SEE_Glianal`, and 136 serialized `dialog_line_*` handlers. Its keys
cover the Codex of Destiny, Glianal, Nyralim, Ysa, Gnarsh, the Tuatha, and
related dialogue, choices, objectives, journal entries, and UI text. The
asset-level NPC symbol and handler count do not map individual localization
keys to speakers, callbacks, branches, or playback order. Speaker attribution
and dialogue order therefore remain unknown at the key level.

## Correction Candidates

These are read-only findings and proposed text, not permission to edit the
active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `12413` | meaning / naturalness | “Fewer and fewer in this world” has no explicit subject in Korean, although the following sentence identifies the Fae. Make the subject clear: `이 세상에서 페이(Fae)는 점점 줄어드는 것 같군. 하지만 페이들 자신은 그 사실을 가장 늦게 깨닫지.` | Medium |
| `19649` | meaning / terminology | `formed their order` is rendered `교단을 세웠을 때`, which adds a specifically religious sense. Japanese `会` and Chinese `团体` support a broader organization: `페이트위버들이 조직을 세웠을 때`. | Medium-high |
| `27669` | naturalness | `아니, 넌 아니야` is an awkward, underspecified reply. Prefer `아니야. 이 세상에서 운명의 장난감이 아닌 건 너뿐이야. 넌 더없이 아름다운 새로운 존재야.` | High |
| `3919`, `15080`, `15194`, `16846`, `25049`, `32384` | terminology / consistency | The same `Child(ren) of Dust` identity varies among `먼지의 자식`, `먼지의 자손`, and `먼지의 자녀`, and several occurrences omit the English name. The previously reviewed `18566` uses `먼지의 자손(Child of Dust)`; align these references to `먼지의 자손` and add the matching singular or plural English form where the phrase names the people. For `32384`, also prefer `이런 게` over `이런 일`: `흥미롭군. 하지만 왜 이런 게 먼지의 자손(Child of Dust)에게 모습을 드러낸 거지?` | Medium-high |
| `39561` | naturalness / meaning | `그가 나보다 너를 더 호의적으로 대할 거야` can ambiguously compare him with the speaker. Clarify the comparison: `운이 좋으면 그가 나를 대할 때보다 너를 더 호의적으로 대할 거야. 적어도 호기심은 보일 수밖에 없어.` | High |
| `50607` | meaning / naturalness | `that damned old mossy log` is a teasing reference to Nyralim, but Korean omits the insult and `tell ... yourself` is flattened. Prefer `늙고 이끼 낀 고목한테 직접 말해. 난 이 먼 서쪽까지 온 투아사(Tuatha)가 더 있는지 찾아볼게.` | Medium-high |
| `55018` | consistency | This repeats the `Ysa's end ... hold back the tide` passage at `35100`, but translates `hold back the tide` differently (`막을 수 있을 뿐` vs. `늦출 수 있을 뿐`). Align the clause with `35100`: `난 밀려오는 물결을 늦출 수 있을 뿐이야.` | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `60868` | speech level / honorifics | Korean `기다리고 계셨지` honors Nyralim inside an otherwise casual line; Japanese uses casual `待ってるわ`. This may be intentional respect toward Nyralim, and no key-to-speaker mapping confirms the addressee relationship. Retain provisionally. | Uncertain |
| `61926` | speech level | English `Greetings`, Japanese `よく来たな`, Chinese `致敬`, and Korean `안녕` differ in greeting tone. Without a confirmed speaker or scene stage, do not prescribe a replacement. | Uncertain |

## Coverage

All 332 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. The 41 exact-English duplicate groups (106 rows)
already have matching Korean translations. No embedded line breaks or
runtime/markup markers were found. Twelve IDs received correction candidates;
two register questions remain unresolved.

The linked ledger records all 332 IDs and their four-language fingerprints.
No speaker, callback, branch, or playback order was inferred from asset-level
metadata. No Korean CSV edit was applied.
