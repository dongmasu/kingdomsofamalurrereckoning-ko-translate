# Context and Name Review D-19771

Date: 2026-10-13. Closed the carried open findings in `default` IDs
29551-29650. Compared the active Korean cells directly with English,
Japanese, and Chinese source CSVs under `src/csv/`; English anchored meaning,
Japanese informed voice/register, and Chinese supported cross-checks.
Checked the official Korean manual extraction and accepted terminology
decisions. No PAK or PAK-derived material was consulted.

## Accepted Corrections

| ID | Before | After | Basis |
| ---: | --- | --- | --- |
| 29551 | `나로스의 요툰 노예` | `나로스의 요툰 노예(Naros Jottun Slave)` | Preserve the exact capitalized source label while retaining the readable Korean rendering. The row describes a Naros-associated Jottun slave; it does not require deciding whether this is a formal rank. |
| 29554 | `데이리어드가 뭐죠?` | `데이리어드(Deireadh)가 뭐죠?` | English, Japanese, and Chinese all ask about the quoted term. Add its exact source spelling without selecting among competing phonetic spellings. |
| 29571 | `스플릿록 지하` | `스플릿록 심층부(Splitrock Depths)` | Reuse D-19569's correction for the same location, supported by English and linked location/journal context. |
| 29578 | `완벽한 미타란 강화 장식` | `흠 없는 미타란 강화 장식` | Apply the accepted Flawless quality form from D-19766 and preserve the established Mitharan distinction. The component remains a trim/decoration; no narrower item category is invented. |
| 29581 | `세이블의 서신들` | `세이블의 서신(Missives of Sable)` | D-18257 establishes this named-book/document form from repeated context. |
| 29584 | `운명의 극장` | `운명의 극장(Theater of Fate)` | English and Chinese identify a theater; Japanese's altar wording is a locale divergence. Reuse the English-led Korean term used in accepted D-12374 and related rows. |
| 29591 | `슈올리아 아르카나` | `스콜리아 아르카나` | The official Korean manual, PDF page 7, establishes `Scholia Arcana = 스콜리아 아르카나`. |
| 29597 | `평안히 잠들길.` | `평안하길.` | English `Be at peace` and the broad Japanese/Chinese wishes do not specify sleep or death. Remove that unsupported implication. |
| 29598 | `블랙스크리크` | `블랙슈리크(Blackshriek)` | Reuse the recurring English-paired Korean form confirmed at D-19074; the creature's class is not needed in this standalone name. |
| 29605 | `학자 클레아스 네렌` | `학자 클레아스 네렌(Cleas Nerenne)` | English and Japanese identify the same scholar; retain the readable Korean transcription and add the exact name to disambiguate the differing Chinese phonetics. |
| 29617 | `성소를 파괴하라` | `예배당을 파괴하라` | D-19739 established `Chantry = 예배당` from English, Japanese, Chinese, and same-term Korean usage. Preserve the objective's imperative. |
| 29620 | `챔피언이 된 너에게 도박장과 투기장은 맡겨졌어. 이 모든 걸 관리할 준비를 너와 하고 싶어 하던 요쿨과 얘기해 봐.` | `챔피언으로서 도박장과 투기장은 네 것이야. 요쿨과 얘기해 봐. 그가 이 모든 시설의 운영 방안을 너와 의논하고 싶어 했어.` | English says the venues are the Champion's and Jokull wanted arrangements with the addressee to manage them; Japanese supports the management hand-off. Restore ownership and the explicit discussion of operating arrangements without over-specifying their division. |
| 29630 | `페이트스원 DLC 받기` | `페이트스원(Fatesworn) DLC 받기` | Keep the Korean transliteration and UI wording, adding the exact DLC name used by English, Japanese, and Chinese. This resolves row identification without asserting a corpus-wide Fatesworn title policy. |
| 29642 | `이디야 ... 히페리온` | `이디라(Idylla) ... 하이페리언(Hyperian)` | Reuse the accepted Idylla form from D-18904 and Hyperian form from D-19584/D-19722. All three source locales identify the same destination beneath Idylla and the site of sin/absolution. |
| 29644 | `무르간` | `머건` | Reuse the accepted Murghan spelling from D-19732/D-19740. The current Bareth form and conditional threat remain intelligible; no unsupported creature taxonomy is added. |
| 29646 | `리시움 숲` | `리세움 숲(Lyceum Grove)` | Align this row to the recurring source-paired form in active Korean IDs 1312, 6020, 52820, and 53525. The English name is retained so this local alignment does not claim a global phonetic ruling. |

## Closed Without Further Edits

| Finding | Disposition |
| --- | --- |
| D-9342 / 29575 | `not an issue`. English and Chinese leave the deceased group unspecified; Japanese's “parents” is not imported. Korean preserves the unnamed plural and the consolation that their deaths were not in vain. |
| D-9346 / 29592 | `not an issue`. Korean's oblique speech and concealed inner motives are supported by the English metaphor and Japanese's “conceal one's hand”; Chinese's literal hands do not prove a Korean error. |
| D-9372 / 29608 | `not an issue`. English apposition identifies the Queen of Spring as the Maid of Windemere and Belmaid as her servant. Korean preserves that relation; Chinese supports it. |
| D-9373 / 29609 | `not an issue`. `Warden` can denote a local keeper/authority; Korean's broad `관리인` avoids choosing a prison governor or guard where Japanese and Chinese diverge. The bounty and armband condition are preserved. |
| D-9374 / 29616 | `not an issue`. D-9350 already corrected singular to plural `그것들` and `각각의 중심부`; the source omits the antecedent, so the existing translation correctly leaves it unnamed. No edit or recount. |
| D-9382 / 29647 | `not an issue`. `수석 광고 관리자` preserves both the seniority and advertising-management role in the English credit; Chinese independently translates it. Its audience does not affect the Korean meaning. |
| D-9349 / D-9383 named-term scopes | Mixed closure: apply the exact accepted corrections above where a source-linked spelling or term is established; close the remaining checked names as `not an issue` because their Korean forms remain traceable and the rows preserve the English-led relations. No global transliteration changes are inferred. |

D-9377 / 29625 was already accepted by D-19507 (`사반트 린`), and D-9379 /
29635 was already accepted by D-19659 (`부름받은 자`). They were verified in
the active CSV and not recounted. D-9350 / 29616 was likewise already
accepted; its separate antecedent concern is closed above without changing
the text.

## Validation and Resume

The 16 approved changes affect only the listed `Texto` cells. Pre-edit
SHA-256:
`9c034d182f94fe4a100287c2cf37245d793c6bd6522555271456aefd13156161`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-context-D19771/locatexts_zh_cn.koalocatext_default.csv`.
Active SHA-256:
`47ffb6298a249f19269ae4f0e78185c64c86ad84490c14d7f61829034b076f9f`.
Applying the exact inverse reconstructs the backup byte-for-byte. The UTF-8
BOM, all 65,135 IDs and their order, 72,011 CRLF endings, 73 bare LF endings,
and every non-target byte are preserved. The immutable source Chinese CSV
hash remains `b8381db941f87c909a1159da9976a5c2c7b2df5fbf3c789479f5c836a2fe2f3b`.

All carried findings in this range now have terminal dispositions. The
historical operational totals **3,419 accepted / 34,118 not an issue / 987
uncertain** remain unreconciled and are not recalculated. The separate
Chinese-only affix holds were already closed by D-19565.

Next: D-19772, IDs 29651-29750. First genuinely open finding: D-9395 / ID
29655. D-9397 / ID 29660 was already accepted by D-19659 and is not
recounted.
