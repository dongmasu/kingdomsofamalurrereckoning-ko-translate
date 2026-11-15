# Sequential `default` Revalidation: IDs `42000`-`42249`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 66 existing ledger records and added 184 newly reviewed IDs.
- Recorded 27 current correction-candidate IDs and nine evidence-limited
  holds. `42176` has both a candidate and a separate hold; 215 IDs have no
  supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `42003` | Naturalness | `힘이 이렇게 커지다니` is understandable but a little stiff in spoken dialogue. Consider `짧은 시간에 이렇게 강해지다니, 정말 놀랍군... 널 여기까지 이끌어 와서 뿌듯해.` Preserve the warm praise and plain register. | Medium |
| `42009` | Name format | The named rite `the Sojourn` is rendered `순례` without its English name; `Snowmelt Pass` is also unpaired. Pair the full rite and place name while retaining the three-spring instructions. | High |
| `42024` | Terminology | In the `Tidings of War` notice context, `notice` is a delivered notice, not a public posting. Prefer `이 통지서가 도움이 될까?` over `이 공고가 도움이 될까?`. | High |
| `42031` | Terminology | The move description lists the named equipment classes `Kite Shields`, `Bucklers`, and `Talismans`; Korean has inconsistent transliteration/translation treatment. Align the three terms with the project's equipment-category choices and preserve the list structure. | Medium |
| `42039` | Name format | `Firstsworn Champions` is a named historical group but only `첫서약자` is paired. Pair the complete group name without changing the sentence's list structure. | Medium-high |
| `42050` | Objective / name format | `Speak to Tormin` is rendered `토민과 대화`, missing the English name and the established `-하기` objective ending. Prefer `토민(Tormin)과 대화하기`. | High |
| `42061` | Name format | The epithet `Jentilak the Mighty` appears as `강대한 젠틸락` without English. Pair the complete name and epithet. | High |
| `42068` | Full-name format | The source names `Templar Jorielle`; Korean pairs only `Jorielle`. Pair the complete titled name as `성전기사 조리엘(Templar Jorielle)`. | High |
| `42072` | Objective format | `Locate Bisarane` is rendered as a fragment. Use the established action-label form `비사라네(Bisarane) 찾기`. | High |
| `42073` | Naturalness / meaning | `Fae hollows` is more specific than the broad `지하 공간`. Japanese and Chinese describe subterranean hollows/caverns; prefer `페이(Fae)의 지하 동굴` or an equivalent that preserves the cavern sense. | Medium-high |
| `42086` | Name format | The standalone label `Master Makers` is translated as `명장들` without its English name. Pair the complete label. | Medium-high |
| `42089` | Objective format | `Collect Prison Keys` is rendered `감옥 열쇠 수집`, unlike the established `-하기` objective form. Prefer `감옥 열쇠 수집하기`. | High |
| `42096` | Full-name format | The source calls the character `Captain Drefan`; Korean pairs only the personal name. Pair the full titled name as `드레판 대장(Captain Drefan)`. | High |
| `42098` | Title format / meaning | `Varani History: The Ryhming Way` is rendered without the English title and reduces `Ryhming Way` to a generic phrase. Pair the complete title and verify the source's spelling before finalizing the subtitle. | Medium |
| `42107` | Name format | The standalone character name `Yasmin` is not paired. Add `야스민(Yasmin)`. | High |
| `42124` | Title format | `Archsage` is a specific title but appears only as `대현자`. Pair it as `대현자(Archsage)` if this is the established office name in context. | Medium-high |
| `42127` | Title format | The standalone title `Mysterious Observers` is rendered without English. Pair the complete title. | High |
| `42131` | Objective / name format | `Return to Lila` lacks both the established action-label ending and English pairing. Prefer `리라(Lila)에게 돌아가기`. | High |
| `42132` | Objective format | `Hunt the Paragon Barghest` is rendered `파라곤 바게스트(Paragon Barghest) 사냥`. Use `파라곤 바게스트(Paragon Barghest) 사냥하기`. | High |
| `42137` | Meaning / naturalness | `rustic pamphlet` describes a rural/village-style pamphlet; `소박한 전단` can mean merely simple or modest. Prefer `마을 사람들에게 전쟁에 힘을 보태라고 권하는 시골풍 전단`. | Medium-high |
| `42149` | Naturalness / format | `the Dverga fortress of Gravehal Keep` becomes the repetitive `드베르가 요새 그레이브홀 요새`. Prefer a construction such as `드베르가(Dverga)의 그레이브홀 요새(Gravehal Keep)` while retaining the restoration result. | High |
| `42162` | Objective format | `Defeat Assailants` is rendered `습격자 처치`, not the established `-하기` form. Prefer `습격자 처치하기`. | High |
| `42178` | Name / role format | `Massariol Brewmaster` appears as `매사리올 양조 장인` without pairing the people and role. Pair the full source expression while retaining the armor's honey-mead description. | Medium-high |
| `42193` | Meaning | In a loan context, `default` means failure to meet repayment obligations, not merely a late payment. Replace `연체하면` with a phrase such as `상환을 불이행하면`. | High |
| `42197` | Name format | The standalone enemy/role label `Chimera Captain` appears as `키메라 선장` without English. Pair the complete label. | High |
| `42198` | Formatting | Korean has six embedded line breaks, while English, Japanese, and Chinese each have five. The split between `뜨거운 열정과` and `부드러운 고요` interrupts the stanza; align the Korean breaks with the source's six-line poem structure. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `42000` | Meaning / title | English's `the Grand Bursar's` is an incomplete possessive, while Japanese names the Grand Bursary/office. Korean `대회계원` may refer to the person or institution. Retain it pending the intended referent. |
| `42007` | Source term / meaning | English says `dwarf fastings`, likely a source error or rare term; Japanese describes underground passages, while Korean says fortresses. Do not normalize the construction without confirming the intended word. |
| `42028` | Meaning / poetic image | `pyhril tree` and the following images are an in-world poetic catalogue. The line does not establish whether `pyhril` is a named species or a typo; keep `파이릴 나무` provisional. |
| `42047` | Terminology / referent | `Plagueshield` may denote a potion, protective effect, or named item. The isolated `found` message does not resolve the object type; retain `역병 방호제` provisionally. |
| `42095` | Name / people | `Toghs` is a standalone plural name, but this key alone does not establish whether it names a people, group, or another entity. Keep `토그족` provisional. |
| `42115` | UI meaning | `Socketed Gems` could label installed gems or the action/category for socketing gems. Korean `보석 장착` is plausible but does not settle the UI text type. |
| `42146` | Role / register | English specifies a prophetess, while Japanese uses a gender-neutral prophet title. Korean `예언녀` may sound marked; retain it pending context for whether to use a neutral or explicitly female title. |
| `42176` | Meaning / insult | `dreg` is a contemptuous form of address, but its social force is unclear. `밑바닥 인생아` may overstate it; retain the current proposal without choosing a replacement absent character context. |
| `42186` | Terminology / lore | `Sorrows` may name an entity or power rather than ordinary sadness. Existing Korean `슬픔의 인도` remains provisional; do not harmonize it globally without resolving the term. |

## Rechecked Findings

- All 66 existing ledger fingerprints in this range match the current
  four-language rows. Existing candidates `42003`, `42024`, `42073`, `42096`,
  `42131`, `42149`, and `42176` were rechecked and retained. `42186` remains
  an evidence-limited hold.
- The old candidate at `42063` is released: Korean accurately conveys the
  English and Japanese that nobody tried to stop the visitors. Its existing
  ledger row is left byte-for-byte unchanged under the append-only rule, so
  the historical candidate status remains visible.
- Sixty-one exact-English duplicate groups (1,010 corpus rows) touch this
  range. Korean matches within every group; no translation was unified
  merely because English is identical.
- Nine multiline rows contain 46 embedded Korean line breaks. Eight have
  matching per-row break counts across all four languages. At `42198`, the
  Korean poem has one extra break; its stanza layout should be checked against
  the source before editing.
- Of 250 IDs, 198 have indexed asset associations; 132 of the 184 newly
  recorded IDs are linked. Asset membership does not establish an individual
  speaker, branch, addressee, or playback order. Unsupported attribution and
  order remain unknown.

## Range Result

- The range has 27 current correction-candidate IDs and nine
  evidence-limited holds; `42176` has both. The remaining 215 IDs have no
  supported finding.
- The ledger covers 48,266 of 65,135 unique `default` IDs (74.10%), leaving
  16,869. Reviewed IDs with indexed asset links total 39,171; 9,095 have no
  indexed asset link. Sequential coverage reaches `42249`; next is
  `42250`-`42499`.
- Four-language fingerprints, regenerated catalogs, nine related index
  tests, and the line-ending-aware diff check must pass before this batch is
  considered recorded. Translation CSVs remain unchanged.
