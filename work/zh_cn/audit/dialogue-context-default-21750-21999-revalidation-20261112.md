# Sequential `default` Revalidation: IDs `21750`-`21999`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 67 existing ledger records and added 183 previously unrecorded
  IDs. Fourteen candidate IDs and one new evidence-limited hold were recorded;
  the existing hold at `21937` was retained.
- The prior candidate at `21794` was cleared. Direct self-identification
  supports `Byrn Elgar` at `21944` and `Lord Saramer` at `21992`; no asset
  association or row order was used to assign other speakers or dialogue
  order.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `21761` | Meaning | Japanese and Chinese identify five individual recruits, not five squads. Change `신병 다섯 분대` to `신병 다섯 명` while retaining the returned medicine detail. | High |
| `21777` | Name pairing | `Mithroliths` is a named lore term and appears without its English pairing here. Consider `미스로리스(Mithroliths)` rather than the unpaired `미스로리스들`; retain the already paired `언바운드의 길(Unbound Path)`. | Medium-high |
| `21795` | Meaning / word choice | English `my work` and Japanese `私の研究` refer to research, not an artwork. Replace `제 작품` with `제 연구`, retaining the sarcastic, elevated tone. | High |
| `21829` | Naturalness | `옳은 일을 하고 싶다면... 분명 옳은 일은 있으니` repeats the same wording awkwardly. Consider `옳은 일을 하고 싶다면, 나중에 나를 찾아와. 옳은 일은 분명 있으니까.` | High |
| `21872` | Terminology | `Authority` is the deity/concept whose established Korean rendering is `권능(Authority)`; `권위(Authority)` instead reads as ordinary authority. Consider `권능(Authority)의 선물`. | Medium-high |
| `21891` | Meaning / terminology | Japanese identifies a `航海日誌` and English says `logbook`; `기록부` is less specific and unnatural for the maritime setting. Consider `항해 일지`. | Medium-high |
| `21909` | Terminology | This named group, `the Testament`, is rendered as a bare transliteration. Related entries use `성약단(The Testament)`. Consider using that established form here. | High |
| `21914` | Meaning | English `Yes?`, Japanese `ん？`, and Chinese `怎么了` are a brief response or “what is it?”, not `왜?` (“why?”). Consider `응?` or `무슨 일이야?`. | High |
| `21922` | Meaning / consistency | This repeats the Khamazandu journal wording at other IDs. The proposal to become its `instrument` is rendered as becoming its `대리인`, which narrows the meaning. Align with the reviewed group wording `이 세상에서 자신의 뜻을 이루는 도구가 되어 준다면`; preserve the following progress update. | High |
| `21956` | Name / terminology | `Child of Dust` is a named lore identity, but the Korean `먼지의 자손` is unpaired. Consider `먼지의 자손(Child of Dust)` and keep it distinct from `Dustling`. | Medium |
| `21961` | Terminology / naturalness | Align `ritual of penitence` with the related `참회 의식` wording rather than `속죄 의식`; `atonement` remains `속죄`. The repeated `아노카토스` can also be reduced to `그에 따르면`. | High |
| `21973` | Naturalness | `불쌍한 병약한 아드님` stacks near-synonymous modifiers. Consider `병든 아드님` or another concise rendering, preserving the deferential address and the line's register. | High |
| `21983` | Terminology / consistency | `Master Belne` varies in Korean title form, and the current `벨른 장인` differs from the reviewed `마스터 벨른(Master Belne)` form. Align the title without changing the objective's sequence or item. | High |
| `21986` | Naturalness | Korean `작고 조그마해` duplicates the size description. English contrasts small gnomes with their vicious response; Japanese and Chinese support the contrast. Consider `조심해. 노움들은 덩치는 작아도, 네 정체를 알아채면 사납게 덤빌 거야.` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `21814` | Meaning / referent | `your lady` is rendered differently by the references: Japanese says “mother,” Chinese says “wife,” and English does not resolve the relationship. Retain `부인` provisionally; do not infer the referent. |
| `21937` | Speech level / source discrepancy | Retain the prior hold. The available row-level evidence does not resolve the discrepancy sufficiently to select a correction. |

## Rechecked Findings And Structure

- Existing candidates at `21761`, `21795`, `21829`, `21914`, `21922`,
  `21961`, `21983`, and `21986` remain supported. Other candidates in the
  range were assessed against the current four-language rows and documented
  above.
- `21794` was cleared: its casual price-negotiation wording is supported by
  English, Japanese, and Chinese. The rows at `21865`, `21932`, `21938`,
  `21964`, and `21971` were also checked and retained; the first matches the
  established `Children of Erathell` equipment labels, `21938` already pairs
  the title/name and location, `21964` correctly pairs the saint and deity,
  and the remaining translations preserve their title and potion-timing
  meanings.
- The range touches 45 exact-English duplicate groups (1,116 corpus rows);
  Korean wording matches within each group. Per-row logical line-break
  counts and normalized runtime/control-marker sequences match across the
  four languages.
- Asset links and co-occurring NPC/handler symbols were treated only as
  grouping clues. No unsupported individual speaker, branch, or playback
  order was inferred.

The ledger now contains 33,277 of 65,135 IDs (51.09%), leaving 31,858.
Sequential review reaches ID `21999`; the next range is `22000`-`22249`.
