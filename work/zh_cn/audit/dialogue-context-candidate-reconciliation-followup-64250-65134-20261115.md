# Candidate Reconciliation: Final Ranges `64250`-`65134`

- Date: 2026-11-15.
- Reconciled the 22 candidate IDs in the four final sequential ranges against
  the current Korean, English, Japanese, and Chinese rows.
- English was used for meaning, Japanese for voice and phrasing, and Chinese
  as supporting evidence. Asset membership was not used to infer a speaker or
  playback order.

## Previously Reconciled

The seven existing candidates already rechecked in the sequential
`64250`-`64499` pass were not counted again: `64283`, `64287`, `64372`,
`64377`, `64438`, `64447`, and `64469`. `64447` was nevertheless reopened
for the separate naturalness issue below; the prior name-pairing correction
remains intact.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64412` | Held | English `scavengers` and Japanese `ゴミ漁り` support scavenging, but do not establish a more precise Korean group label. Keep the current `폐품 수집꾼들` rather than infer raiders or a specific creature. |
| `64447` | Corrected | `The Offering is doomed` predicts that the rite cannot succeed. `실패하게 됐어` is stiff and weakens that force. Use `봉헌 의식(The Offering)은 이제 실패할 수밖에 없어. 축복을 받을 사이온(Scion)이 없으니까.` |
| `64633` | Retained | `아직도 머릿속엔 늑대의 생각이 가득해` naturally conveys the source's wolf-thoughts; the clumsy two-legged body and inability to catch a chicken remain intact. |
| `64643` | Retained | The current quest objective `코볼트(Kobold) 처치하기` uses the established concise action form and preserves the target. |
| `64664` | Retained | The current journal preserves Khamazandu's bargain, the Warsworn, the return to Cloudcrest, and Besin's Helm. |
| `64706` | Retained | The English and Japanese say `tour`; Chinese describes a tournament circuit, and the subjects are fighters. The current `이번 시즌 순회 대회` conveys that event context naturally and avoids implying a performance tour. |
| `64722` | Corrected | `the latest to have this authority` refers to Anokatos as the current/latest holder. Replace the calque `그 권한을 가진 가장 최근 인물` with `지금 그 권한을 맡은`; retain the plain conversational register and ongoing failure to meet his duties. |
| `64768` | Retained | The current line pairs `Storyteller` and preserves the source's qualification that the title is used only by his own people. The formal descriptive register is retained. |
| `64795` | Retained | `칙허장` matches the same Ratofer document terminology in the related quest context; the informal question remains natural. |
| `64911` | Corrected | The line identifies both the speaker and their people as Kollossae. Replace the awkward `나와 내 동족은 콜로사이족이다` with `나와 내 동족은 모두 콜로사이(Kollossae)야`, consistent with the preceding informal challenge. |
| `64916` | Retained | The English hollow is specified as a cave by Japanese and Chinese; `이 동굴 바닥` is supported and natural. |
| `64922` | Retained | The description preserves the hammer, Age of Deep Gloam, Skycrown Mountain, and the ettin belief without adding an individual discoverer. |
| `64964` | Retained | `화장해` precisely renders `cremate`; the fresh-corpse condition and the scavenger's return to her den remain intact. |
| `65048` | Retained | `무기 교관` matches the active project-wide rendering for `master-at-arms`; the source's report-to-Paddy objective is preserved. |
| `65109` | Corrected | This is the same player-choice response as `44752`, `46201`, `48041`, `49860`, and `58374`. English, Japanese, and Chinese use the same wording; align Korean with `돈을 낼게` while preserving `$VMC_NQD.cost_mine$`. |
| `65134` | Corrected | English and Japanese identify Three Swords as the blademaster, and related rows establish `세 자루의 검(Three Swords)` as the epithet. Quote the epithet so it is not read as a literal count of swords: `검술 대가인 '세 자루의 검(Three Swords)'이 남긴 전설의 무기를 찾았다.` |

## Reopened Exact-Source Group

`58374` was previously retained as `돈을 내겠어` on the rationale that its
Japanese phrasing differed. Direct comparison shows that its English,
Japanese, and Chinese text is identical to `49860` and `65109`, including the
same player-choice wording and runtime variable. That prior rationale was
incorrect. `58374` and `65109` now both use the already established
`돈을 낼게. ($VMC_NQD.cost_mine$ 골드)`. The embedded variable and spacing are
unchanged. `58374` had already been included in the cumulative candidate
reconciliation, so reopening it does not count the same ID twice.

## Applied Changes

Six active Korean rows changed: `58374`, `64447`, `64722`, `64911`, `65109`,
and `65134`. The other final-range rows were retained or held as listed.
The previously changed text at `64283` was also checked; its stale ledger
fingerprint from the preceding session was refreshed without changing its
text again. Only the fingerprints for these seven changed or previously
changed IDs were updated.

Fifteen new unique candidates were reconciled; the seven previously
reconciled IDs above were not counted twice. Cumulative candidate
reconciliation is `3,518 / 4,026` (`87.38%`), with `508` remaining. This is
not completion of the candidate review. The evidence-limited case `64412`
remains held rather than guessed.

## Verification

- The CSV preservation helper changed only the requested `Texto` fields.
- The review ledger validates all 65,135 IDs and four-language fingerprints.
- The CSV retains its UTF-8 BOM, 65,135 ordered IDs, 71,839 CRLF separators,
  242 LF-only separators, and zero bare CR characters.
- All 11 CSV-preservation tests, all nine context-index tests, and the
  CRLF-aware `git diff --check` passed.
- Source CSVs, extracted game assets, and game binaries were not changed.
- No commit was made.
