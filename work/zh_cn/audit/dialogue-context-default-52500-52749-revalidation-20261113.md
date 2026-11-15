# Sequential `default` Revalidation: IDs `52500`-`52749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 69 existing ledger fingerprints; all match and those rows
  remain unchanged. Added the other 181 IDs in ascending order.
- Recorded 11 current correction candidates and eight evidence-limited holds;
  231 IDs have no current finding. Categories do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `52512` | Speech level | Korean `지지할 사람은 거의 없을 걸세` / `토론을 시작하세` uses marked 하게체. Japanese is plain conversational (`支持しない考え方だろうな` / `討論を始めよう`). Consider a consistent conversational form such as `그 입장을 지지할 사람은 거의 없겠지. 좋아, 토론을 시작하자!` Do not infer who is speaking. | Medium-high |
| `52524` | Format / name consistency | The same English name `Acathan` is rendered both `아카탄` (`아카탄의 춤`) and `아카사` (`아카사 늪지`) in one entry. The existing `Acathan wetlands` at `21210` uses `아카사 습지대`. Consider aligning this occurrence to `아카사의 춤(Acathan Dance)`; preserve the title and surrounding paragraph structure. | High |
| `52525` | Naturalness | `turn in my vials` / Japanese `薬瓶を渡したい` is rendered `약병을 제출하고 싶어요`, which sounds bureaucratic for a spoken handover. Consider `약병을 건네고 싶어요.` The exact speaker and dialogue stage are not established, so this is not a register attribution. | Medium |
| `52580` | Meaning | English `only in your understanding` and Japanese `汝の理解によってのみ` / Chinese `在你的理解中` express a possessive relation. Korean `당신을 이해함으로써만` instead makes the worshippers' understanding of the addressee the means. Rephrase to preserve `your understanding` without choosing a more specific theological interpretation. Keep all 14 line breaks. | Medium-high |
| `52582` | Speech level | Korean `가져오게` and `번역해 주겠네` shift to marked 하게체; Japanese `持ってきたら...翻訳してあげるから` is conversational. Consider `그런 책을 더 찾으면 가져와. 기꺼이 번역해 줄게.` This is a row-level register finding, not a claim about a specific speaker. | Medium-high |
| `52596` | Format / name pairing | The Korean `지팡이의 여왕 아르진(Argine)` pairs only the personal name. The source title is `Argine, Queen of Staves`; other active occurrences use the same Korean title and name but omit the English title. Consider `지팡이의 여왕(Queen of Staves) 아르진(Argine)`. | High |
| `52617` | Naturalness | `He sells ... outside in the square` is rendered `바깥 광장에서 ... 팔고 있지`, an awkwardly literal location phrase. Consider `광장에서 정통 의식용 페이블레이드를 팔고 있어`, retaining the outdoor-square location without the redundant-sounding `바깥 광장`. | Medium |
| `52618` | Meaning | English `earned through sweat and heartache`, Japanese `汗と悲しみ`, and Chinese `汗水和心痛` include emotional pain. Korean `땀과 고생으로 얻은` reduces this to general hardship. Consider `땀과 마음고생으로 얻은 것` or another natural phrase that preserves the emotional component. | Medium-high |
| `52633` | Format / name pairing | Source `Lady Goodchild` is rendered `굿차일드 부인` without the English title/name pairing, unlike other named Goodchild references in the active translation. Consider `굿차일드 부인(Lady Goodchild)`; do not add a given name not present in this source line. | High |
| `52699` | Meaning / tone | English `a mere Child of Dust such as you` and Japanese `ただの` include a dismissive qualifier omitted in current Korean `너 같은 먼지의 아이`. Consider `너처럼 하찮은 먼지의 아이(Child of Dust)` while preserving the tentative `perhaps` and sentence flow. | Medium-high |
| `52702` | Meaning / creature-combat consistency | Japanese says `見つけて殺さねばならん` (“must find it and kill it”), and the linked SQ19 material concerns the Crudok. Korean `찾아 파괴해야 해` treats the creature as an object. Consider `그걸 찾아 처치해야 해`, consistent with the related Crudok wording at `60652`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `52540` | Meaning / UI terminology | English `Auto-Attempt` and Chinese support an automatic attempt, while Japanese `自動解呪` suggests automatic dispelling. Korean follows English. The exact menu mechanic cannot be established from these labels alone; retain the current wording pending gameplay/UI evidence. |
| `52546` | Meaning / title | `the Beckoned` may be a formal title or a descriptive address. The Korean bilingual form preserves the source, but this isolated line does not settle the role. |
| `52548` | Meaning / referent | `splendid court` could describe a royal court or a physical domain/courtyard. Japanese and Chinese also use palace imagery, but the speaker and referent are not identified here; retain `궁정` provisionally. |
| `52563` | Terminology / lore | `the sorrows that remain on the victim` may mean grief or supernatural entities. Japanese uses generic sorrow wording, while Chinese makes the spirit reading explicit. Keep Korean `슬픔` provisional rather than deciding the lore term from one line. |
| `52575` | Address / tone | `little creature` is a direct address, but the speaker, relationship, and intended register are unknown. Retain `작은 생명체야`; do not infer a speaker or rewrite its tone from this row alone. |
| `52680` | Meaning / referent | English `her old poppet` can mean an old doll or an affectionate term; Japanese and Chinese favor a cherished-person/object reading. The Korean `그 오래된 인형` selects the literal doll reading, but the antecedent and object are not established. |
| `52715` | Terminology / referent | `my Well` is capitalized, while Japanese uses `泉` and Chinese `井`. The line does not establish whether it names a source/place or is generic, nor whether it is related to `Font`; retain `샘(Well)` pending context. |
| `52734` | Terminology / referent | `Glass of Ambient` may be a named magical object or destination. Japanese keeps a literal glass term and Chinese differs; Korean `앰비언트의 거울` is retained pending stronger evidence about the referent and canonical title. |

## Rechecked Findings and Structure

- The four existing candidate records in this range remain active:
  `52525`, `52596`, `52699`, and `52702`. Their source fingerprints match;
  no existing ledger disposition was overwritten.
- Forty-four exact-English duplicate groups touch the range, covering 47
  target rows. Korean wording matches within every group.
- Nine entries contain embedded line breaks, totaling 53 in each language.
  Per-ID break counts match; the Korean embedded line breaks are CRLF while
  the three reference CSVs use LF. Line-break contents and runtime/display
  token sequences match, so no newline or token change is proposed.
- Of 250 IDs, 184 have indexed asset associations, represented by 190
  ID-asset links across 123 assets; 66 have no indexed asset. Among the 181
  newly recorded IDs, 116 have indexed associations (121 links across 66
  assets) and 65 do not. Asset links do not establish per-key speaker or
  playback order; unsupported speaker and order values remain unknown.

## Range Result

- This range has 11 current correction-candidate IDs and eight
  evidence-limited holds; 231 IDs have no current finding.
- After adding 181 IDs, the ledger covers 55,987 of 65,135 unique `default`
  IDs (85.96%), leaving 9,148. Sequential coverage reaches `52749`; next is
  `52750`-`52999`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
