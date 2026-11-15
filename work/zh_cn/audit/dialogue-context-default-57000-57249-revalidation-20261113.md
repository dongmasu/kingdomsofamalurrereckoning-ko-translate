# Sequential `default` Revalidation: IDs `57000`-`57249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 65 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 185 IDs in ascending order.
- Eight new correction candidates and six evidence-limited holds are recorded
  on new rows. Six existing candidates and two evidence-limited holds were
  rechecked without rewriting their ledger rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `57013` | Name / format | English names `the Withering` as the calamity that may return; Japanese treats it as a named term, while Korean has only `쇠락`. Consider pairing the established Korean rendering with `(The Withering)` without changing the poem's lineation. | Medium-high |
| `57025` | Naturalness | `공정하게, 그리고 피로 이끕니다` is a stiff, literal coordination of “justly and with blood.” Recast the clause naturally while preserving both just leadership and the bloodshed associated with the House of Valor. | Medium |
| `57060` | Name / format | English capitalizes `Font`, and Japanese identifies the spring as Ysa's. Korean `위쪽 샘` lacks the established pairing for this named spring. Consider `위쪽 샘(The Font)` or an equivalent that preserves the location reference. | High |
| `57112` | Naturalness | `남은 생애 동안 여행을 시작할 수 있겠어` is awkward for “travel as I come upon my remaining days.” Consider `이제 남은 날들을 여행하며 보낼 수 있겠어.` | Medium-high |
| `57173` | Naturalness / speech level | `군인 생활이 아들에게 규율을 가르쳐 주길 바란다` reads like written narration. The English is direct conversation and Japanese uses a conversational wish. Consider a natural spoken ending such as `아들에게 군인 생활이 규율을 가르쳐 주면 좋겠어`, without inferring the speaker's identity. | Medium |
| `57217` | Name / format | This UI label explicitly says `Ysa - The Font`; Korean includes `이사(Ysa) - 샘` but omits the approved English pairing for the named Font. Use `이사(Ysa) - 샘(The Font)`. | High |
| `57229` | Speech level / naturalness | The line shifts into marked 하오체 (`아름다우시구려`, `좋아하오`) while Japanese is conversational and the final `살집이 많거든` is casual. Recast in one coherent conversational register while retaining the deferential `my liege` address and the deliberately odd “fleshy” remark. | Medium-high |
| `57231` | Terminology / format | Capitalized `the Sorrows` is the named power in this exchange; Japanese and Chinese likewise describe the power of lament/sorrow. Pair the established `비탄의 힘` with `(Sorrows)`. | Medium-high |

## New Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `57003` | Meaning / source conflict | English and Chinese say `{1} Services`, while Japanese has `{1}"礼拝の儀"` (worship rite). Preserve the runtime token; the row alone does not establish whether the UI entry means general services or a religious rite. |
| `57028` | Meaning / term | English `trumped up Fae` can suggest an overblown, self-important, or fabricated figure. Japanese omits this characterization and Chinese reads it as fabricated; Korean `허풍만 늘어놓던` selects a boastful reading. Do not replace it without context resolving the intended sense. |
| `57068` | Terminology / source interpretation | English gives the established rank `Pledgeshield McGowan`; Japanese describes him as a second-rank mercenary, and Chinese uses a shield-of-oath rendering. Korean follows the established `서약방패병(Pledgeshield)` term, but the cross-locale rank interpretation remains unsettled. |
| `57128` | Name / source conflict | English names the fortress `Fallen Hall`; Japanese instead says a fortress-like `shrine of the dead`, while Chinese gives a fallen hall. Korean follows English/Chinese. Keep the paired name pending stronger context; asset association alone cannot resolve the disagreement. |
| `57232` | Name / referent | Capitalized `the Alley` may be a venue or proper name. Japanese transliterates it as `アリー`, while Chinese and Korean use the generic “alley” sense. The short greeting does not establish whether to retain `골목` or pair a named venue. |
| `57241` | Meaning / address | English uses the vocative `dove`; Chinese renders it literally as a peace envoy, while Japanese omits it. Korean `그대여` avoids a literal bird reading but may lose an endearment. Retain pending clearer idiomatic context. |

## Rechecked Existing Findings

| ID(s) | Current finding and disposition |
| --- | --- |
| `57032` | The title `Templar` remains unresolved between a personal rank and the separately defined gnome-templar faction. Preserve the existing terminology hold. |
| `57037` | The combination `머리가 좀 이상한 위험한 무리` remains awkward for “a bad lot, not right in the head.” The earlier proposal to separate the danger and sanity descriptions remains supported. |
| `57074` | The objective still lacks the English pairing for `Aster amulets`; the format proposal remains supported. Keep the `Aster` Korean spelling unresolved, since the sources do not choose between `아스터` and `애스터`. |
| `57144` | The second mention of `Venris` in the same objective still omits its English pairing; the existing ID-scoped proposal remains supported. |
| `57195` | `five crews of fresh recruits` refers to five recruits, not five squads. Korean `신병 다섯 무리` preserves the group ambiguity; use wording that clearly counts five recruits while retaining the five bottles. |
| `57198` | `The Vorm Brothers` remains a proper group name without English pairing. The existing proposal `보름 형제(The Vorm Brothers)` is consistent with the paired `Vorm` name at `28748`. |
| `57221` | `우리 민족의 미래라는 수수께끼` remains awkward and can make the future itself sound like the riddle. The earlier proposal `우리 민족의 미래에 관한 수수께끼` remains supported. |
| `57248` | **No correction.** The accepted deity form is `로포쿠(Lopoku)`; `Lupoku` is an attested English variant for the same deity. The earlier “exact source spelling” proposal was mistaken. The existing append-only ledger row is retained, and this report supersedes its candidate judgment. |

## Earlier Range Questions Rechecked

- `57054` correctly names Lord Kandrian and the signet ring; no correction was
  established.
- `57055` and `57067` use `강사(Docent)` consistently as a personal title
  and rank. Their English pairings and promotion wording are retained.
- `57062` preserves the named Hollowlands, Bloodbane, and Brownies; the four
  language versions support the creature/hunt reading.
- `57070` follows English and Chinese (“I am appreciated”); Japanese instead
  says the speaker is satisfied. No source-supported Korean correction was
  established.
- `57075` correctly identifies Bisarane as the person responsible; all
  language versions support the accusation.
- `57090`'s concise UI label `전투 개시` is compatible with the battle having
  begun; no wording change is proposed.
- `57093` retains the four-line verse stanza, with three embedded breaks in
  each language. `57095` and `57100` retain their established Kandrian and
  Belen's Testament references.

## Repeated English and Structure

- Sixty-eight exact-English duplicate groups across the corpus touch this
  range, covering 1,368 rows. Korean wording matches within all 68 groups.
- Two rows contain embedded line breaks: `57013` (5) and `57093` (3). Each
  language has eight embedded breaks total, with matching per-ID counts.
- Runtime/display markers match in identity and order: `{1}` at `57003` and
  `57158` is preserved in all four languages.
- Of 250 IDs, 203 have indexed asset associations, represented by 206
  ID-to-asset links across 127 assets; 47 have none. Of 185 newly recorded
  IDs, 139 are linked through 142 links across 75 assets, and 46 are
  unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- All 65 pre-existing ledger rows remain unchanged; 185 new IDs were appended
  in ascending order.
- The ledger covers 59,327 of 65,135 unique `default` IDs (91.08%), leaving
  5,808 unrecorded IDs. Sequential coverage reaches `57249`; next is
  `57250`-`57499`.
- The eight new candidates and six new holds are proposals only. Rechecked
  findings at existing IDs remain documented here without rewriting their
  append-only ledger rows. No translation CSV was changed.
