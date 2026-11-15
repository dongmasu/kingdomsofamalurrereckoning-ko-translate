# Sequential `default` Revalidation: IDs `31750`-`31999`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 66 existing ledger entries and added 184 IDs. Findings are
  proposals, not approved translation edits.
- Eighteen additional correction candidates were identified: 14 on newly
  recorded IDs and four pre-existing `not-issue` records promoted to
  candidates. One new evidence-limited hold was recorded. Five existing
  candidates and two existing holds were retained.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `31775` | Meaning / format | English names the `Detect Hidden Wealth` bonus. Korean `숨겨진 물건 찾기(Detect Hidden) 보너스 재물` splits and reorders the label, and `물건` does not match `Wealth`. Recast the complete label in Korean as a bonus to detecting hidden wealth; do not retain a partial English label. | High |
| `31806` | Terminology | `Lorestones` are the named in-game collectibles, not generic `전승석`. The established project term is `로어스톤`; use it here, with the source pairing where appropriate. | High |
| `31817` | Name / format | `Motus Mining Operations` is an organization name in the English introduction. Korean `모투스 광산 운영부` lacks the English pairing and may read as a generic department. Pair the organization name and retain the former-director meaning; do not infer a more specific corporate structure. | Medium |
| `31837` | Term consistency / format | English explicitly says `Child of Dust`. Korean `티끌의 자손` differs from the recurring `먼지의 자손(Child of Dust)` form (for example, `3919`), and this row omits the English pairing. Align the established term and pair it. | High |
| `31861` | Place-name / format | Capitalized `the Quays` refers to a named district or location. This row says only `부두`, while another use pairs it as `부두(Quays)` (`17623`). Add the English pairing without deciding whether this is a neighborhood or a general waterfront. | Medium-high |
| `31866` | Naturalness | English asks whether her brother said when she could visit him; Japanese likewise asks whether he told the player. Korean `언제 만나러 가도 되는지 말하던?` is incomplete and unnatural. Use a direct question such as `언제 찾아가면 되는지 말해 줬어?` | High |
| `31883` | Meaning / terminology | `original defenders` means the camp's initial defenders. `초대 수비병` can be read as invited or inaugural soldiers; consider `초기 수비병` or an equivalent that preserves the original-versus-later distinction. | Medium |
| `31885` | Name / format | `The House` is the House of Sorrows in this passage. Korean `비탄의 집` omits the proper-name pairing used elsewhere in the same resource. Add `(House of Sorrows)` at the first reference. | High |
| `31893` | Meaning / naturalness | `I've claimed many ballads` is rendered `많은 발라드를 내 이야기로 만들었지만`, which suggests making the ballads one's own. Japanese says the speaker has told many stories; consider `많은 발라드를 들려줬지만` while retaining the contrast with the Court of Enchantments' song. | Medium-high |
| `31911` | Naturalness | `In addition to inviting you to live amongst us` becomes the stiff `우리와 함께 살도록 초대한 데 더해`. Recast the whole sentence naturally, e.g. `우리와 함께 살자고 초대한 데 이어, 자네의 노고에 감사하는 선물도 준비했네.` Preserve the respectful address and gift meaning. | Medium |
| `31914` | Naturalness | `the second buried Dvergan treasure` is ordered awkwardly as `묻혀 있던 드베르간 보물 두 번째`. Consider `묻혀 있던 두 번째 드베르간 보물` without changing the journal voice. | Medium-high |
| `31917` | Name / format | `Winter King` is a specific title in the source, but Korean `겨울왕` is unpaired. Add `(Winter King)` at its first mention; retain the two possible locations described by the sentence. | Medium |
| `31946` | Names / format | The long petition record leaves several explicit source names unpaired, including `Ansgar Solsvard`, `Starg Njolf`, `Isle Varalin`, and `Lady Gravehal`; `Lady Gravehal` is reduced to `레이디 그레이브홀(Gravehal)`. Pair the complete names and title/name form at first mention. Preserve all paragraph breaks and the source's `(illegible)` markers as `판독 불가`. | High |
| `31969` | Names / terminology / format | The letter keeps its paragraph structure and formal address, but several explicit names are unpaired or underspecified: family `Grastars`, `Myria`, `Cenda`, `Tine`, `Snaketail`, `Ealfhelmn`, and `Motus Mining Interests`; `그라스타르` should identify the family as a house/clan. Add row-local source pairings and clarify `그라스타르 가문` without importing Chinese-only details. Preserve the cough reference and the existing breaks. | High |
| `31970` | Name / format | `Sacred Passage` is a named location and is already a pairing candidate at `31433`; here `성스러운 통로` has no English. Add `성스러운 통로(Sacred Passage)`. The mechanic is the established `레코닝 모드`; pair `Reckoning Mode` at first mention if retaining the row's parenthetical naming style. | High |
| `31977` | Title / name format | English presents the complete label `Docent Nena Adolla`. Korean splits it as `강사(Docent) 네나 아돌라(Nena Adolla)`, unlike the established full title/name pairing such as `Docent Del Gadra` at `23131`. Prefer `강사 네나 아돌라(Docent Nena Adolla)`. | Medium-high |
| `31987` | Meaning / item name | `Amrynthian Band` is called a crown in the related account at `11022` and as `이 왕관` at `57945`. This journal row says `암린시안 관`, which is ambiguous in Korean and may suggest a coffin; use `암린시안 왕관(Amrynthian Band)` while preserving the item's English name. Chinese calls it a ring, but the related English/Korean item context identifies the crown. | High |
| `31988` | Naturalness / verse | The poetic phrase `swollen sea` is rendered `부푼 바다`, an unnatural literal phrase. Japanese describes large waves; consider `거센 바다` or equivalent. Keep all four verse lines and their existing line breaks. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `31932` | Meaning / title | English `Athyll's Fall` and Chinese support a downfall/fall reading, while Japanese `アシルの仲秋` means mid-autumn. Korean `아실의 몰락` chooses the downfall sense. The source conflict is unresolved; do not change or standardize the title without stronger context. |

## Earlier Findings Rechecked

- Existing candidates `31759`, `31767`, `31881`, `31903`, and `31978` remain
  supported by their current four-language text and linked reports.
- Existing holds `31894` and `31999` remain unresolved; neither asset-level
  association nor serialized handlers establish the specific speaker or
  dialogue stage needed to settle register.
- Pre-existing `not-issue` entries `31885`, `31893`, `31970`, and `31987`
  were promoted to candidates after the full-row source comparison. The other
  55 previously recorded IDs remain not flagged.
- `31992` has a Japanese-only placeholder-order difference. Korean's
  `{3}`, `{3}`, `{1}`, `{6}` sequence matches English and Chinese; this is
  not a Korean formatting finding.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- Sixty-three exact-English duplicate groups touch this range (1,223 corpus
  rows). None has divergent Korean text.
- Per-row embedded line-break counts match across all four languages.
  Fifty-three embedded Korean line breaks were preserved, including the
  petition and letter layouts.
- Runtime placeholders and layout/markup tokens were checked. The only
  sequence difference is Japanese placeholder ordering at `31992`, described
  above; Korean matches English and Chinese.

After this range, the ledger contains 40,639 of 65,135 unique IDs (62.38%),
leaving 24,496. Sequential coverage reaches ID `31999`; next:
`32000`-`32249`.
