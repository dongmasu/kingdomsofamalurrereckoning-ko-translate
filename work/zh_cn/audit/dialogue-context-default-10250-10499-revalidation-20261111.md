# Sequential `default` Revalidation: IDs `10250`-`10499`

- Date: 2026-11-11.
- Scope: compare active Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-eight existing ledger records in this range were retained after
  their four-language fingerprints were verified. All 182 previously
  unrecorded IDs were compared and added.
- Seventeen IDs have correction candidates. Eight IDs have
  evidence-limited findings; the sets do not overlap.
- Of the 182 new IDs, 136 have indexed quest-asset links and 46 do not.
  Five IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10258` | Terminology / name pairing | `Order of Mitharu` is rendered `미사루(Mitharu) 결사`, while the same organization is consistently `미사루 교단(Order of Mitharu)` elsewhere, including `6460`, `9805`, `12769`, `17862`, `56193`, `59891`, and `61561`. Use the established name and organization term; preserve the speaker's uncertainty about whether the teaching is propaganda. | High |
| `10267` | Speech level / address / naturalness | `어서 오십시오, 나그네여` shifts to plain `나는` and archaic `아나운서요`. Japanese uses a lively plain-style greeting and self-introduction. Recast the complete line in one natural, energetic register; do not infer an identity beyond the stated arena-manager/announcer role. | High |
| `10287` | Name pairing | The display label `Arcane Carrack` is `비전 카락선` without the English name. The identical English label also occurs at `8608` and `22801` with the same Korean text. Consider pairing the complete label as `비전 카락선(Arcane Carrack)` across that exact-source group if approved. | Medium-high |
| `10293` | Speech level / naturalness | The consecutive endings `주겠소`, `마시오`, and `필요하오` impose conspicuous 하오체. Japanese is formal but conversational, and Chinese is polite. Rephrase in a consistent natural register without changing the offer, warning not to delay, or request for help. | High |
| `10309` | UI meaning / clarity | `Jump to ability` is rendered `능력으로 이동`, which does not clearly identify the destination. Japanese says to display the ability tree, while the established Korean UI term is `능력 트리`. Consider `능력 트리로 이동`, subject to the exact UI action. | Medium-high |
| `10325` | Name consistency / pairing | The short name `Calum` is `캘럼` without English, while the same first name is consistently `칼룸(Calum)` at `3566` and `51573`. Use the established short-name form and do not expand it to a surname here. | High |
| `10331` | Naturalness | `인기 없는 견해` is a literal rendering of `a less popular view`; Japanese describes a view not commonly held. Consider `그다지 널리 받아들여지는 견해는 아니지만`, retaining that some Kollossae adhere to it. | Medium |
| `10352` | Title pairing | The address `Archsage` is translated as `대현자님` without its English title. Consider `대현자(Archsage)님`, preserving the speaker's polite offer to show the goods. | Medium |
| `10370` | Label pairing | The complete label `Rathir Merchant` is rendered `라시르(Rathir) 상인`, pairing only the place name. Consider pairing the full label as `라시르 상인(Rathir Merchant)`. | Medium |
| `10389` | Title pairing | The title-cased work `Experiments in the Realms of Chaos Ingress` is translated as `혼돈 영역 침입에 관한 실험` without the English title. Consider pairing the complete title while preserving its existing Korean wording. | Medium-high |
| `10392` | Objective wording / name pairing | `Defeat Dink in a fistfight` is `맨주먹 싸움에서 딩크를 이겨라`; the named target lacks English, and `이겨라` reads less like the established objective style. Consider `맨주먹 싸움에서 딩크(Dink)를 쓰러뜨리기`. | High |
| `10396` | Naturalness | `변덕스러운 생물이야` translates `A flighty creature` too literally for a person who forgot the speaker's name twice. Japanese uses a colloquial “fickle fellow.” Consider a natural equivalent such as `변덕스러운 작자야`, retaining the speaker's irritation. | Medium |
| `10419` | Naturalness / name pairing | `Naked but for this shield and her father's sword` becomes `방패와 아버지의 검만 걸친 발리아`, making it sound as though she wore the shield and sword. The personal name `Valia` is also unpaired. Clarify that these were the only things she had/carried, add `발리아(Valia)`, and preserve the account of her father's murder and her revenge. | High |
| `10451` | Name pairing | The sentence identifies the flute player's name as Adelena, but Korean leaves `아델레나` unpaired despite established `아델레나(Adelena)` forms elsewhere. Add the source-local pairing without identifying her as anyone beyond the named flute player. | High |
| `10462` | Naturalness / meaning | `I'll have your parts!` is rendered `네 몸에서 일부를 가져가겠다`, which is awkward and softens the threat. Japanese refers to taking the addressee's body and Chinese to organs. Consider a natural threat such as `네 신체 부위는 내가 가져가겠어!` without specifying a particular organ. | Medium-high |
| `10495` | Terminology / name pairing | The established creature name `Sprite` is left as `스프라이트` without English, although `Boggart` is paired in the same sentence and other entries use `스프라이트(Sprite)`. Add the source name while retaining the list of creatures in the ruins. | High |
| `10496` | Name pairing | The short name `Lue` is rendered `루` without English; the same source-local form is paired as `루(Lue)` at `21595`. Add that pairing only; do not expand it to `Luethar` based on other entries. | High |

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `10262` | Name / label format | `Witchknight Anira` is rendered `마녀 기사 아니라(Anira)`. The role is translated but only the personal name is paired; the isolated label does not settle whether to pair the role separately or the entire title, and `아니라` is also an ordinary Korean connective. Retain pending a consistent title/name format decision. |
| `10270` | Localization status | `Unibox Combat Quest Giver` remains English in Korean; Japanese transliterates the label and Chinese translates it. The extracted string alone does not establish whether this is a player-facing title, a test label, or an internal descriptor, nor how the name `Unibox` should be rendered. |
| `10312` | Address / meaning | English reads `Tirnoch? Have I done well, lady?`; Japanese combines this into an honorific address to Tirnoch, while Chinese retains the separate `lady` address. The line does not establish whether `lady` addresses Tirnoch or someone else. Do not add an addressee or gender. |
| `10404` | Meaning / context | `dead man's switch` could refer to a switch associated with the dead man or a pressure mechanism that must remain depressed; the following sentence says someone must stand on it to hold the door open. The Korean is literal, but the exact object relation is not established by the isolated key. |
| `10425` | Terminology / referent | `liths` is rendered `석판`; English, Japanese, and Chinese do not establish whether these are carved tablets, standing stones, or a specific in-game stone type. Retain pending the referent. |
| `10426` | Localization status | `Developer Relations` remains English in English, Japanese, and Korean, while Chinese translates it. Its display context is unavailable, so it is unclear whether the untranslated form is intentional. |
| `10467` | Name status | English capitalizes `the Isles`, Japanese marks it as a quoted label, and Chinese describes it as an archipelago. Korean `군도` is plausible, but this row alone does not establish whether the Isles is a proper region name. |
| `10487` | Localization status / meaning | The fragment `to spawn "Sleight of Hand"` appears to be a debug or internal instruction; the Japanese also leaves the technical wording largely untranslated. Its intended player-facing meaning and display status are unknown. |

## Duplicate and Structural Checks

- Forty-four exact-English duplicate groups touch this range, comprising
  821 rows across the corpus. Every group has matching Korean text.
- Runtime placeholder and display-wrapper signatures, brace balance, and
  logical line-break counts match across English, Japanese, Chinese, and
  Korean for all 182 new IDs.
- Eight Korean strings contain 25 existing embedded CRLF breaks:
  `10263` (1), `10266` (3), `10286` (4), `10362` (4), `10466` (7),
  `10475` (4), `10494` (1), and `10499` (1). All were preserved.
- Asset associations were used only as candidate context. No individual
  speaker or playback order was inferred.

The four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
