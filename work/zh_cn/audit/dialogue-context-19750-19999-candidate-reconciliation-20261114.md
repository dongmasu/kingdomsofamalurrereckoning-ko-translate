# Candidate Reconciliation: IDs `19750`-`19999`

- Date: 2026-11-14.
- Rechecked all 19 current ledger candidates against active Korean and the
  English, Japanese, and Chinese rows.
- Rechecked four linked `vagrants` candidates against their source rows and
  current Korean. No speaker or playback order was inferred from asset
  association.
- Two targeted Korean refinements were applied; other supported corrections
  were already present.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `19755` | Confirmed `아가씨들을 꼬시러 다녔지` captures the playful courtship in Japanese `口説いてまわった`, rather than suggesting he physically chased them. |
| `19766` | Confirmed English pairings for `헬가(Helga)` and `아이사(Aesa)`. Retained `마법 병기` provisionally; `magical ordinance` remains ambiguous. |
| `19779` | Refined `시체더미에 파묻혀 있었어` to `시체를 뒤적이고 있었어`, preserving the blunt, self-conscious joke while avoiding the image of being physically buried in corpses. |
| `19781` | Confirmed the condescending proposal is preserved by `미개함을 ... 바로잡다` and the claim that magic and weapons make it easy; no additional meaning from Japanese was inserted. |
| `19797` | Confirmed the established `프레토리안(Praetorian)` title within the complete name. The exact rank construction remains no more specific than the source supports. |
| `19806` | Confirmed `술을 사든가, 아니면 나가` conveys the dismissive `use the door` instruction naturally. |
| `19811` | Confirmed `실라리타(Syllareta)` and `빌리스(Billis)`. Added the missing pairing `베크리(Beckry)`, consistent with the active full-name form `베크리 에이데(Beckry Aideh)`. |
| `19817` | Confirmed `타르가(targa)` retains the source's lower-case common-term styling and the uncertain origin. |
| `19845` | Confirmed `멘리에게` matches `멘리 토그(Menri Togh)` and the related quest usage. |
| `19879` | Confirmed `뚱보 레카(Lekka the Corpulent)` preserves the character's full name and epithet. |
| `19887` | Confirmed the action-objective form `장벽 부수기`. |
| `19888` | Confirmed both `갈레트(Galette)` and `간수 흐레이드(Warden Hreid)` are paired without over-defining Warden as a rank. |
| `19889` | Confirmed `마법사 몰리 피온(Molly Fion)` and preserved the account's uncertainty about redemption. |
| `19905` | Confirmed `떠돌이들` for `vagrants`; the wording remains distinct from `refugees`. |
| `19918` | Confirmed `와이번-기프르 가문(Wyvyrn-Gifres)` and the contemptuous exclamation. |
| `19947` | Confirmed `사냥대장 플린트 에이건(Flint Aegan)` and the circumstances of his death. |
| `19981` | Confirmed `《겸손한 자들(The Humbled)》 주요 출연진`; Japanese supports the principal-cast heading, not a literal rendering of the apparent English typo `Principle`. |
| `19988` | Confirmed `온데아(Ondea)` without inferring whether the label names a person or place. |
| `19999` | Confirmed the natural rebuke `가엾은 것들이야. 나도 가엾게 여기니 너도 그래야 해.` |

## Linked `Vagrants` Entries

The same source term was checked at `36231`, `48443`, `57408`, and `60282`.
The Korean `떠돌이` form is consistent across the Galafor and Beggar's Bluff
references, while each sentence retains its own request or journal context.
These four active ledger candidates were not previously counted in a
candidate-reconciliation batch and are included here.

## Evidence-Limited Items

- `19766`: `magical ordinance` may be a source-side spelling error for
  `ordnance` or an intentional term. The current `마법 병기` remains
  plausible but unverified.
- `19839`: `Collections Thief` still lacks enough UI context to distinguish a
  collector, thief, or fundraising label.
- `19897`: `Den Patron` still lacks enough context to settle the meaning of
  `den` and `patron`.
- `19900`: English `Eternal Hireling` conflicts with the Japanese
  third-class-mercenary reading; no rank is inferred.
- `19996`: the source joke is truncated at `Check his`; the Korean ending,
  line breaks, and unattributed `A.S.` are preserved.

## Verification

- All 19 in-range candidates and four newly reconciled linked candidates have
  explicit dispositions in the accompanying manifest.
- Only `default:19779` and `default:19811` changed; only those two ledger
  `source_fingerprint` values were refreshed.
- Candidate reconciliation now covers 1,093 of 4,015 IDs (27.23%), leaving
  2,922. Evidence-limited items remain unresolved.
- Source CSVs and extracted game assets were not changed.
- No commit was made.
