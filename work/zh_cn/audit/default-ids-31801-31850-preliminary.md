# Preliminary Language Scan: `default` IDs 31801-31850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31801-31850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31804 | `번개 피해 +30` / `번개 피해 +75%` | Preserve both values, the blank line, and the two distinct damage lines; verify the ability label in the UI glossary. | English, Japanese, Chinese, and Korean agree on +30 Lightning Damage and +75% Lightning Damage. Korean preserves the values and layout. | High |
| 31805 | `대사제` for `Hierophant`; Irion's loyalty checks | Confirm the canonical rank and whether loyalty checks follow Grim's failed coup as the source states. | English and Korean link Irion's loyalty checks to the Hierophant stopping Grim's coup. The title remains a consistency candidate. | Medium |
| 31812 | `체액 불균형` for source typo `humeral inbalance`; seven-break journal/list | Preserve all seven line breaks and numbered findings; review whether the source intends `humoral` imbalance, literal `humeral` imbalance, or a medical joke. | English contains several typos, including `does not seem to coping`, `it its`, `inadvertant`, and `humeral inbalance`. Japanese/Chinese follow a humerus/upper-arm reading, while Korean interprets the phrase as bodily-fluid imbalance. Korean preserves all numbered claims and the seven-break layout but resolves the source ambiguity differently. | Medium |
| 31814 | `여보` for `Dear` | Confirm whether the address is an intimate/spousal vocative or a conversational “dear”; retain the addressee's dismissive certainty. | The line begins with `Dear` before reporting a public confession and political downfall. Japanese omits the vocative; Chinese uses “dear,” while Korean selects the intimate `여보`. | Medium |
| 31817 | `지질학 최고 전문가` for `Master Geologist` | Determine whether this is a formal rank or an occupation/degree; standardize the Motus Mining Operations title. | English capitalizes Master Geologist and separately identifies a former Director role. Japanese treats geology as a specialty; Chinese calls the speaker a geology master. Korean interprets it as top expertise. | Medium |
| 31821 | `워스원 동료 조리` / `저들` | Keep the antecedent of “them” unresolved and distinguish Warsworn comrade from biological brother. | English says Jory was killed by “them” while the group addressed their threat. Japanese omits the pronoun, and Chinese states the killing occurred in battle. Korean uses a comrade reading and preserves an unspecified plural enemy. | Medium |
| 31825 | `도미누스` / `마기스터` | Confirm both as formal offices and standardize the Onyx Tower/Rose Court terms. | English names two titles and presents their alliance as surprising. Japanese and Chinese partly translate or interpret the offices; Korean transliterates them. | Medium |
| 31833 | `아카라가 존재하지 않는다` | Reconcile this character's denial of Akara with nearby statements that Akara blesses the Scion and is associated with a slave/mouthpiece; preserve it as an in-world belief unless context proves a source contradiction. | The row calls Akara nonexistent and his magic illusion/coincidence. IDs 31702 and 31729 speak of Akara as a source of service/blessing. This may be deliberate disagreement among speakers rather than a continuity error. | Medium |
| 31835 | `타이윌리` / Ratofer's return over ten years ago | Standardize Tywili and keep the “over ten years” interval tied to his return. | English, Japanese, Chinese, and Korean agree on the timeline; name spelling remains a glossary issue. | Medium |
| 31838 | English payloads in `{*1...}` wrappers | Localize `Combat Mode` and `Main Menu` inside the wrappers if the strings are displayed to Korean players; preserve both `{*1}` wrappers and their order. | Japanese and Chinese translate both payloads, but Korean leaves the English terms. Wrapper count/order match all locales; only the payload content differs. | High |
| 31844 | `아직 뛰는 심장` of a recently killed Barghest | Preserve the explicit post-mortem movement and the wave-like heat; verify Barghest spelling. | English and Chinese explicitly say the heart is still beating after the creature's recent death. Japanese compresses this to heat radiating from the heart. Korean retains both details. | Medium |
| 31845 | `암포라` for `Amphora` | Confirm whether Amphora is a named quest object or a generic vessel and standardize its Korean form. | English capitalizes Amphora; Japanese transliterates it and Chinese translates it as a two-handled jar. Korean uses the transliteration. | Medium |
| 31847 | `넝마주이, 거리의 꼬마, 악동` | Preserve the reclaimed/defiant voice and the statement that the group also has a place. | The speaker lists stigmatizing labels and accepts them before asserting belonging. Korean retains the list and defiance. | Medium |
| 31849 | `조심해` for `Head up` | Confirm whether this is a warning to stay alert or a literal instruction to look up. | Japanese says “don't let your guard down,” Chinese says “raise your head,” and English permits both. Korean follows the Japanese warning sense. | Medium |
| 31850 | `운명 없는 자` for `Fateless One` | Standardize this formal player title and its capitalization/display convention. | All locales treat it as a direct form of address, but the translated forms vary. Korean uses the current corpus rendering. | Medium |

Rows 31801-31803, 31806-31811, 31813, 31815-31816, 31818-31820,
31822-31824, 31826-31832, 31834, 31836-31837, 31839-31843, 31846,
31848, and 31850 generally retain the English meaning on this first reading.
Names, ranks, register, and recurring terms remain candidates for the
integrated pass; no separate high-confidence wording correction was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entries for IDs 31800-31899 were checked.
  They flag lightning values, Irion/Hierophant, Lorestones, Katarina's
  trap, Ettinmere findings, the address `Dear`, Master Geologist, Jory,
  Dominus/Magister, Niskaru, Akara, Ratofer/Tywili, Detyre bloodsports,
  Child of Dust, Combat Mode, Barghest heart, Amphora, Rag-pickers,
  Brother Fallon, and `Head up`.
- ID 31812 retains seven source line breaks and all three numbered findings.
  The source errors are not reproduced verbatim in Korean; the
  `humeral`/`humoral` interpretation remains open.
- ID 31838 retains both `{*1}` wrappers in source order. Their payloads
  remain English in Korean although Japanese and Chinese localize them.
- The apparent Akara contradiction at 31833 is recorded as a possible
  character-belief/lore-context issue, not a confirmed continuity defect.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31801-31850 once and in identical order.
- Embedded line-break counts match throughout this range, including all
  seven line breaks at ID 31812 and the blank line in ID 31804.
- Runtime-marker wrapper identities and order match. The two marker
  payloads at ID 31838 differ by locale; Korean retains English text.
- Numeric meaning is retained at ID 31804 (+30 Lightning Damage and +75%
  Lightning Damage).
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31801-31850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31851.
