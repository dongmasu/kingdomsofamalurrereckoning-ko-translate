# Sequential `default` Revalidation: IDs `33000`-`33249`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 49 existing ledger entries and added 201 IDs. Findings are review
  proposals, not approved translation edits.
- Thirteen new correction candidates were recorded. Four holds were added on
  new IDs, and the existing `not-issue` at `33096` was promoted to an
  evidence-limited hold. Seven existing candidates and the hold at `33002`
  remain; the other 40 prior entries remain not flagged.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `33004` | Name / format | The inscription names the ring `Maisie's Luck`; Korean `메이지의 행운` omits the English pairing used for this named item elsewhere. Consider `메이지의 행운(Maisie's Luck)`. | Medium-high |
| `33018` | Title / format | The label `Irion, King of Cups` occurs at 20 IDs, all with the same Korean `컵의 왕 이리온(Irion)`. The person is paired but the title is not. Consider pairing the complete English label, e.g. `컵의 왕 이리온(Irion, King of Cups)`, and review the duplicate group together if approved. | High |
| `33089` | Name / format | The inscription names the Durek people, but `듀렉` is not paired with `Durek`. Consider `듀렉(Durek)` while preserving the verse. Korean line breaks match English and Japanese; Chinese alone has one fewer embedded break. | High |
| `33098` | Title / format | The standalone, title-cased label `The Road Patrol` is translated as `도로 순찰대` without an English pairing. If this is the named quest/title indicated by its label form, consider `도로 순찰대(The Road Patrol)`. The asset link does not establish a speaker or playback context. | Medium |
| `33113` | Speech level | English, Japanese, and Chinese use a direct conversational apology, but Korean switches to polite `틀렸어요` / `믿고 싶지 않았어요`. Consider a consistent plain-conversational register, such as `너... 내가 널 잘못 봤어. 우리끼리 의지해 온 지도 오래돼서 낯선 사람을 믿고 싶지 않았어.` No speaker is inferred. | Medium-high |
| `33120` | Naturalness / register | `보석을 빼내고 싶으신가, 나그네?` is stilted and can suggest extracting gemstones rather than removing socketed gems. Japanese supports a courteous question. Consider `빼고 싶은 보석이라도 있으신가요, 나그네?` or an equivalent natural service offer. | Medium |
| `33128` | Meaning / title | `Decayed Estate` is rendered `낡은 저택`, which understates the decay conveyed by Japanese `朽ちた邸宅` and Chinese `破败`. Consider a stronger form such as `황폐한 저택(Decayed Estate)`, preserving the label's name pairing. | Medium-high |
| `33130` | Terminology / format | The source says `counter-ward`; Korean uses the awkward `반결계 주문`. Japanese has `対抗呪文`, and Chinese describes magic used to break a seal. Consider the established `대항 주문` wording with the exact source term paired, e.g. `대항 주문(counter-ward)`, while retaining `ward` as `결계` elsewhere in the story. | Medium-high |
| `33141` | Name / format | `Aster family` is a named lineage, but Korean `애스터 가문` omits the English name. Consider `애스터(Aster) 가문`. | High |
| `33150` | Title / format | The source identifies `Archsage Jubal Caledus`; Korean pairs Jubal Caledus but not the office/title `Archsage`. Consider `대현자(Archsage) 주발 칼레두스(Jubal Caledus)`. The linked asset does not map this key to a speaker. | Medium |
| `33166` | Item-name format | `Flawless Mitharan Mystic Grip` is a complete item label, but only `Mitharan` is paired. Related Mitharan Grip labels pair the full English item name. Consider pairing the complete source label after confirming the established Korean form for `Mystic Grip`. | Medium-high |
| `33195` | Title / format | `Log of the Frostbreak Voyage` is a document title, but Korean `프로스트브레이크 항해 일지` omits the English title. Consider pairing the complete title without changing its wording. | Medium |
| `33248` | Meaning / naturalness | `reopen to the Faelands` means Mithros opens its border/doors to the Faelands; `패란즈의 문을 열다` can instead read as opening the Faelands' own door. Rephrase so Mithros is again opening to `패란즈(Faelands)`, consistent with Japanese's border wording. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `33095` | Meaning / terminology | `The Sorrows` may be a force or personified beings: Japanese says `嘆きの力`, while Chinese uses `悲灵`. Keep `비탄의 힘` provisional rather than resolve the referent from this line alone. |
| `33096` | Meaning / terminology | `Narca affliction` is rendered as `나르카 병`; Japanese calls it a curse, while Chinese uses a broader affliction/influence term. Related Korean references alternate between `저주` and `병증`, including the unresolved terminology at `32422`. Keep this wording provisional. |
| `33149` | Meaning / poetry | The English phrase `a seat of elegance near kin` is syntactically unclear. Japanese omits the `kin` idea while Chinese retains it more literally; Korean's `가까운 혈족` is not securely established. Preserve the poem and hold this interpretation. |
| `33186` | Meaning / place label | `Red Pepper Quarters` can describe a district or living quarters. Japanese says `部屋` (room), Chinese says `区` (district), and the isolated label does not resolve the intended place type. |
| `33234` | Meaning | `Telogrus ... took him` is ambiguous: Chinese supports taking him away, while Japanese `取り憑いた` means possessing him. Korean `데려갔다` follows one possible reading; retain it provisionally. |

Existing candidate IDs `33076`, `33102`, `33109`, `33176`, `33194`,
`33203`, and `33247`, and existing hold `33002`, were rechecked against their
linked reports and current four-language rows. Their dispositions remain
unchanged. Existing row `33096` was reclassified from `not-issue` to an
evidence-limited hold.

## Repeated Sources And Structure

- Fifty-seven exact-English duplicate groups touch this range (1,031 corpus
  rows). Korean wording matches within every group; no translation was
  unified by frequency.
- The repeated `Yes?` text at `33063` shares the established Korean
  `무슨 일이야?`; Japanese and Chinese commonly use equivalent
  “what is it?” responses. This is consistent with the earlier
  source-checked disposition at `21914`, so it is not a new finding.
- Korean embedded line-break counts match English and Japanese throughout
  this range. At `33089`, Chinese alone has one fewer break. Poetry and the
  long tale at `33130` retain their Korean line layout.
- Korean runtime/layout token signatures match English throughout this range.
  At `33100`, Japanese reorders `{1}`, `{2}`, and `{3}`, while Korean matches
  English and Chinese. The `{*1...}` wrappers at `33108` remain in their
  original order; the icon token at `33019` is unchanged.
- Variables, numeric values, and punctuation were checked. No Korean token
  or value loss was found.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 41,601 of 65,135 unique IDs (63.87%),
leaving 23,534. This range ends with 20 candidates, six holds, and 224
not-flagged entries. Sequential coverage reaches ID `33249`; next:
`33250`-`33499`.
