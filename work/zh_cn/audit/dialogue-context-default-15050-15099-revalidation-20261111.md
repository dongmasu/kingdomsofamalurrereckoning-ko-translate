# Sequential `default` Revalidation: IDs `15050`-`15099`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixteen existing ledger records were fingerprint-checked; all match the
  current four-language sources. The other 34 IDs were added to the ledger.
- Seven correction candidates and six evidence-limited holds are recorded.
  Two existing candidate dispositions were retained, and the earlier
  candidate at `15055` is resolved by the already-corrected Korean text.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These are review findings, not authorization to edit the active translation
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15073` | Naturalness | `다른 곳에서 일자리를 구해야 하기 전까지는` is awkward for “until we had to take work elsewhere.” Consider a conversational phrasing such as `다른 곳에서 일하러 떠나야 할 때까지 라시르에서 살았어.` Japanese supports the work-unit contrast (`荒くれ部隊`); the current `이 거친 무리` is not a clothing reading. | High |
| `15075` | Terminology | `Child of Dust` is `먼지의 자녀` here, while the linked asset review identified `먼지의 자손(Child of Dust)` as the established form at other occurrences, including `18566`. Align this ID with that proposal and include the English term. | High |
| `15078` | Naturalness | `또 한 명의 필멸자를 화장용 장작더미에 바치겠군` is a stiff calque of “Another mortal for the pyre.” Consider a more natural ominous line such as `또 한 명의 필멸자가 장작더미에 오르겠군.` | Medium-high |
| `15082` | Naturalness | Retain the existing asset-review finding: `우리 민족을 고통받게 했어` and `필연적으로 다시 일어설 때까지` are stiff. The prior report proposes `우리 민족에게 큰 고통을 안겼어` and a more conversational rendering of the opponents' likely return. | Medium |
| `15090` | Naturalness | `가장 적은 대출금도 갚지 못할 만큼 부족해` is understandable but awkward. Consider `최소 대출금조차 갚기엔 턱없이 부족해`, preserving the request to return with enough money to repay. | Medium-high |
| `15091` | Speech level / naturalness | `돌아온 걸 환영해` shifts to `감사하네` within one utterance. Japanese keeps a consistent courteous voice. Align the two clauses to one register while retaining Idylla, Beckoned, and the thanks. | Medium-high |
| `15098` | Honorific / English pairing | The English is `Ambassador Keen`, but the Korean parenthetical says `Keen Ambassador`. The established order is `킨 대사(Ambassador Keen)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15064` | Meaning / name | `Aide Forreux` is rendered `보좌관 포루`. Earlier review left the title status and canonical name spelling unresolved; do not infer a definitive title or spelling from this isolated label. |
| `15065` | Meaning | The source label `An Abandoning` can describe an act, person, or place. Japanese and Chinese do not resolve the intended referent; retain `버려진 자` pending context. |
| `15074` | Meaning | “What life I had left here, you sold” is metaphorical. Korean preserves the accusation and the return to war, but the exact object of “sold” remains unclear. |
| `15081` | Meaning | “They shall rise again” has an unclear antecedent after “the sacrifices he made.” Korean specifies `희생자들`; retain pending stronger context rather than deciding whether the source means people or sacrifices. |
| `15087` | Name / meaning | Capitalized `Gale` appears to be a named place, but Chinese reads it as a pass and the source does not establish the exact referent. Keep `게일` without asserting a more specific identity. |
| `15095` | Address | English `dove` is an affectionate address; Japanese omits it and Chinese reads it differently. Korean `친구` is plausible, but the speaker relationship and preferred Korean endearment are not established. |

## Reconciled Findings

- `15055` previously appeared as a `reagents` terminology candidate. The
  active Korean already reads `어떤 재료가 필요해?`, matching the
  source-checked correction recorded for the Murdoc Hain quest; clear the
  stale candidate disposition.
- The existing terminology candidate at `15075` and naturalness candidate at
  `15082` remain open. The repeated `Customs House` label at `15050` matches
  `15032` and other corpus occurrences as `세관(Customs House)`.
- The English/Japanese/Chinese/Korean rows have matching IDs, logical
  line-break counts, and runtime/layout-marker structure. At `15077`, the
  localized text inside `{*1[...]}` differs as expected while the wrapper
  identity and order are preserved. At `15086`, the two-paragraph lore text,
  13 constructed golems, 12 remaining ice columns, and Heimdallyr reference
  are retained.
- No individual speaker or playback order was inferred from asset membership
  or row order.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
