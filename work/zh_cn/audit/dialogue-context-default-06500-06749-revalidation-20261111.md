# Sequential `default` Revalidation: IDs `6500`-`6749`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `6500`-`6749`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 183 new IDs were reviewed and recorded. The other 67 IDs already had
  review-ledger records and were left unchanged.
- Sixteen IDs have correction candidates. Three IDs have evidence-limited
  holds.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6512` | Meaning / naturalness | `I'm glad you found me here` becomes `여기서 만나다니 반갑군`, which shifts finding the speaker to meeting them. Japanese and Chinese both retain the idea of being found. Consider `여기서 날 찾아줘서 반갑군`. | Medium |
| `6517` | Meaning | English says the wild Fae are `related to` the Fae of the Summer and Winter Courts; Korean narrows this to `혈연 관계`. Japanese says hybrid and Chinese says kin-related, but the English does not specify blood relation. Consider the broader `관련이 있어` unless the lore context confirms kinship. | Medium |
| `6556` | Meaning | English says to `deliver` Astor's coveted dagger, while Korean says `돌려줘야`, implying it previously belonged to him. Japanese also says to deliver it. Consider `전달해야`. | High |
| `6591` | Meaning | `Wielders of this relic` is translated as `이 유물을 휘두른 이들`, which suggests a weapon. Japanese and Chinese describe using/wearing the relic. Consider `이 유물을 사용한 이들`. | High |
| `6594` | Name / format | `Tuatha Vangard` is translated as `투아사(Tuatha) 선봉대`; the English unit label `Vangard` is not paired. Consider `투아사(Tuatha) 선봉대(Vangard)`, preserving the source spelling pending confirmation that it is a typo. | Medium |
| `6613` | Speech level | `어서 오시오` shifts to `한잔 드릴까요?`, mixing an archaic `-오` form with polite `-까요`. Japanese uses a consistent friendly-polite greeting. Consider `어서 오세요, 검투사님! 한잔 드릴까요?` | High |
| `6638` | Naturalness / terminology | `느린 사고의 저주` is a literal, awkward title. Japanese describes delayed thought (`思考遅延`). Consider `사고 지연의 저주`. | Medium |
| `6644` | Name / format | `Irion, King of Cups` is displayed as `컵의 왕 이리온(Irion)`, omitting the English title. The exact English label occurs in 20 IDs and all 20 currently share the same Korean text; if accepted, update that duplicate group consistently, e.g. `컵의 왕(King of Cups) 이리온(Irion)`. | Medium |
| `6650` | Terminology | `fastings` refers to the Dverga tunnel/bunker network. Korean `지하 통로` loses the established term `패스팅(Fastings)` used elsewhere, including IDs `16478` and `54487`. Consider `패스팅(Fastings)`. | High |
| `6657` | Naturalness | `전쟁을 치른 자부심 넘치는 노병` is an awkward rendering of `a proud veteran of the war`. Consider the more idiomatic `자랑스러운 참전 용사`, preserving the speaker's joking pride. | Medium |
| `6658` | Meaning / terminology | `Gnomish titles` is narrowed to `노움 작위`, which specifically means noble rank. Japanese and Chinese use broader terms for titles. Consider `노움 칭호` unless the surrounding context establishes noble rank. | Medium |
| `6662` | Meaning | `On to Alabastra!` is rendered `알라바스트라로 진격하자!`, adding a military advance absent from the English, Japanese, and Chinese. Consider `알라바스트라로 가자!` or another rallying phrase without implying an attack. | Medium |
| `6691` | Name / format | The standalone proper-name label `Lesotho` is rendered `레소토` without its English form. Consider `레소토(Lesotho)` if this is an in-game name label. Its precise referent is not established by the asset index. | Medium |
| `6703` | Name / format | The standalone proper-name label `East Timor` is rendered `동티모르` without its English form. Consider `동티모르(East Timor)` if this is an in-game name label. Its precise referent is not established by the asset index. | Medium |
| `6724` | Speech level | `순찰할 수 없소` uses distinctive `-소` speech for an explanation of a patrol restriction. Consider a contemporary polite or plain form after checking the speaker's surrounding lines; no individual speaker is inferred from the multi-NPC asset. | Medium |
| `6734` | Format / naturalness | The journal paragraph repeats `나로스의 이빨(Teeth of Naros)` three times in close succession. Consider keeping the English parenthetical at first mention and omitting the redundant repeats within this same entry. | High |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `6530` | `Trigger Rats` is a standalone label with no indexed quest-asset context. Japanese transliterates it, Chinese translates it literally, and Korean uses `트리거 쥐`; retain pending evidence about whether this is a creature name, a mechanic, or an internal label. |
| `6562` | English and Chinese specify pulling and holding the two controls; Japanese says to hold them, and Korean says to press and hold. The resource does not establish whether `{1}` and `{2}` are triggers or other controls. Retain the clear Korean instruction pending control-binding evidence. |
| `6710` | Korean `그는 영웅이다` reads as written narration, while Japanese `彼は英雄よ` is conversational. The linked assets do not map this key to a speaker or confirm whether it is dialogue or journal text. Hold the register judgment rather than infer a voice. |

## Duplicate and Structural Checks

- Thirty-four exact-English duplicate groups touching the new IDs (690 rows
  across the full corpus) were checked; Korean text matched within every
  group.
- Logical line-break counts match across all four languages for the 183 new
  IDs.
- Korean embedded breaks use CRLF at IDs `6506` (4 breaks), `6507` (5),
  `6519` (3), `6529` (8), `6570` (4), `6673` (1), and `6688` (4), for 29
  existing breaks total. These byte-level differences were preserved.
- At ID `6562`, Japanese and Chinese place the display markers in a different
  order; Korean matches English. At ID `6583`, Japanese reorders the dynamic
  variables, while Korean matches English and Chinese.
- Of the 183 new IDs, 126 have indexed asset links and 57 do not. Asset
  membership does not establish an individual speaker, handler mapping,
  branch, or dialogue order; unsupported values remain unknown.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
