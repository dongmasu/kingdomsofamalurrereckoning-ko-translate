# Candidate Reconciliation: IDs `45750`-`45999`

- Date: 2026-11-15.
- Rechecked all 20 current correction candidates against English, Japanese,
  Chinese, the active Korean CSV, and linked terminology uses. English
  anchors meaning; Japanese is the primary reference for voice and register;
  Chinese is supporting evidence.
- `45816` was already reconciled and counted with the Aster-family group; it
  is not counted again here.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `45759` | Retained. `조제액의 조성을 바꾸면` accurately and naturally conveys changing the formula solution's composition; the interruption remains conversational. |
| `45766` | Retained. `오그라(Augra)` is paired, and the question remains direct without assigning an individual speaker. |
| `45774` | Retained. `아우렌다(Aurenda)의 등불` pairs the named artifact owner without deciding whether the artifact has a canonical title. |
| `45787` | Retained. `토민(Tormin)` is paired, and the informal direction matches the Japanese. |
| `45794` | Retained. The objective already uses the established action form `주변 순찰하기`. |
| `45816` | Previously reconciled. The Aster-family group was counted in the `33000`-`33249` pass and reconfirmed in `34000`-`34249`; the active form remains `애스터(Aster) 가문`. |
| `45817` | Recast the return as a man who is emotionally shattered and destitute, and clarified that he begs for drink to lose himself: `우리에게 돌아온 건 상심한 데다 빈털터리가 된 남자 하나뿐이었어. 그는 정신을 놓을 때까지 마실 술을 달라며 애원했지.` Japanese `打ちひしがれ` supports the emotional sense of `broken`; the sources do not say he was physically injured. |
| `45818` | Retained. The current item already pairs `미타란(Mitharan) 공포비늘(Dreadscale) 머리장식`; the Dreadscale follow-up preserves this established Korean set term rather than forcing the base-only `드레드스케일` spelling. |
| `45827` | Changed `감시대장` to `경비대장(Captain of the Watch)`. Japanese `警備隊長`, Chinese `守备队长`, and parallel active references support the guard-captain reading. Broader office-term harmonization remains separate because other records are mixed. |
| `45833` | Retained. The objective already pairs `아델레나(Adelena)` and uses the action-form `돌려주기`. |
| `45838` | Retained. `장다리(Longlegs)` follows the established epithet and preserves the speaker's informal warning. |
| `45875` | Retained. `조제법이 실린 수송품 파괴하기` follows the scoped Nanne-quest terminology decision and the objective `-하기` form. |
| `45899` | Retained. `볼턴(Bolton)` is paired, and the warning about enthusiasm and experience is preserved. |
| `45922` | Retained. `전망대의 보초병 처치하기` uses the established action-form objective. |
| `45932` | Retained. The journal text already uses plain narrative speech and matches the source meaning. |
| `45941` | Retained. `몸에 걸친 장비는 어디서 만든 것인지 알 수 없다` correctly describes an unknown maker or origin, not an unknown manufacturing method. |
| `45943` | Retained. `줄리아(Julia)` is paired and the question is natural. |
| `45949` | Retained. `안실라 부인의 아이들(The Lady's Children)` matches the established story title. |
| `45969` | Retained. `아사 아딩(Asa Arding) 구출하기` pairs the target and follows the action-form objective style. |
| `45992` | Retained. `퓨리(Furies)` is paired as the source's mythic group, and the description preserves their vengeance role and the armor's appearance. |

## Evidence-Limited Holds

The five existing holds remain open and unchanged: `45819` (missing object
after “summoning” and conflicting faction detail), `45829` (letter fragment
versus grave inscription), `45886` (insult intensity), `45968` (mission,
monastery, or chapel), and `45994` (first Cycle versus Japanese third
discovery).

Asset association does not establish any individual speaker or dialogue
order. No broad replacement was made for the mixed `Captain of the Watch`
office references.

## Changes and Verification

- Korean rows `45817` and `45827` changed using
  `tools/replace_text_preserve_eol.py`.
- Refreshed only those two rows' four-language ledger fingerprints.
- Reconciled 19 newly counted candidates; `45816` was already counted.
- The complete ledger fingerprint check, index and both catalog
  reproducibility checks, nine dialogue-context tests, 11 CSV-preservation
  tests, CSV record/order/BOM/newline checks, and CRLF-aware diff check passed.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
