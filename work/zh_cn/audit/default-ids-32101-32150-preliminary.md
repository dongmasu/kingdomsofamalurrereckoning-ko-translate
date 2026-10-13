# Preliminary Language Scan: `default` IDs 32101-32150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32101-32150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32101 | `황금 기도용 관` for `golden prayer-circlet` | Confirm the established Korean equipment term for `circlet` and standardize the item-name rendering. | English, Japanese, and Chinese identify a golden circlet used as a base. Korean conveys a gold prayer headpiece; other active item names and the manual should determine whether `관` is the right item category. | Medium |
| 32103 | Twelve-break Babelous Potion research entry | Preserve the full academic voice and paragraph structure; verify the intended corrections to the source typos and the humoral theory terminology. | English contains `bother` for “both” and `humeral` for “humoral.” Korean translates the intended “both comprehension and generation” sense and renders the humoral balance as body-fluid balance without copying the typos. It preserves the 12 line breaks and the staged reversal/reordering phenomena. | High |
| 32107 | `파흘랑기족`, `베신 경`, `이몬 섬` | Standardize Fahrlangi, Besin, and Eamonn's Isle spellings and preserve the ambush/strong-resistance sequence. | The four locales agree that the group followed Lord Besin to the island chapel in a fortress and met an ambush with heavy resistance. Existing Korean uses several Fahrlangi forms (`파흘랑기`, `파를랑기`, `파를랑`) and commonly marks Eamonn's Isle bilingually; the current row's forms need corpus normalization. | Medium |
| 32108 | `스콜리아 아르카나`, `유력 가문들`, `달의 정원` | Confirm “the great houses” as a named/political group and standardize Lunar Gardens. | English, Japanese, and Chinese agree on the Scholia Arcana, great houses, and Lunar Gardens as Rathir attractions. Korean retains the contrast and enthusiasm; whether “great houses” denotes a formal set remains open. | Medium |
| 32111 | `무례하게 들렸다면 미안하오` for `No disrespect` | Check whether this speaker is apologizing or merely pre-empting offense; preserve register. | English and Chinese say “no disrespect/offense.” Japanese says not to take offense. Korean turns the disclaimer into a conditional apology, a small pragmatic shift. | Medium |
| 32115 | `영혼결속의 저주` / `그자가 마지막으로 만들어 낸 저주` | Confirm whether `Soulbind` is a named curse and whether “his latest creation” refers to the curse or spell. | English calls Soulbind the caster's latest creation; Japanese describes a final curse, and Chinese calls it his latest masterpiece. Korean retains the curse and its name but repeats “curse” in the follow-up, narrowing “creation” to the same curse. | Medium |
| 32117 | `내 신민들은 그렇게 행동하지 않거든` for `my subjects don't carry such demeanor` | Determine whether `subjects` means political subjects or experimental subjects; retain the fragmentary, guarded voice. | The preceding sentence mentions experiments, but English then says “my subjects.” Korean and Chinese read this as the speaker's political subjects; Japanese omits the clause. Context is needed to distinguish the two senses. | Medium |
| 32121 | `전임 사이온` / `새로 선출된 사이온` | Confirm Scion as a political office and standardize the outgoing/successor terminology. | English describes the outgoing Scion and the newly chosen one, both protected by ancient warriors. Japanese treats these as the retiring and newly selected Scion; Chinese translates them as clergy. Korean preserves the succession relation and uses the active-corpus title `사이온`, but “outgoing” may mean incumbent rather than former. | Medium |
| 32128 | Twelve-break Galt and Susnarus play | Preserve speaker turns, the ornate/euphemistic register, and the source's coercive ambiguity; review names and stage directions together. | English, Japanese, and Chinese present the same stylized romantic/sexual exchange and physical stage directions. Korean retains all 12 breaks and most imagery. Name spellings vary in the Chinese draft, while the exact tone and agency in the final stage direction need contextual review rather than smoothing. | Medium |
| 32132 | `번역` for `Translations` | Determine whether this is a menu/category label, credits heading, or another UI string. | English is a standalone plural noun and Korean is a concise literal label. The row gives no interface context; Japanese and Chinese are also short labels. | Low |
| 32140 | `{LINE_CENTER}Powered by the Big Huge Engine` | Preserve the exact alignment marker and tagline until its localization status is known. | All four locales have the identical `{LINE_CENTER}` marker and English tagline. The historical log explicitly flags whether the engine credit is intended to be localized; the Korean appropriately leaves it unchanged pending that decision. | High |
| 32143 | `무성한 덤불 지대(Overgrown Thicket)` | Confirm this named location's Korean form and the source-reference relation; do not adopt Japanese's unsupported “cave” reading without context. | English names Overgrown Thicket. Korean localizes the name and retains English. Japanese calls it a cave in the thicket, while Chinese uses a forest name; English does not specify a cave. The clause itself is compressed dialogue. | Medium |
| 32147 | `동쪽 바위턱` / `나를 상대해 줄 근위병은 단 한 명도 없으니까` | Resolve who will not approach whom and what “without a single Praetorian to deal with them” modifies. | English can be read as the group avoiding both the eastern ledge and the speaker because no Praetorian is available to handle them. Korean says they will not approach the ledge and that no Praetorian will deal with the speaker, shifting the final relation. Japanese and Chinese also parse the compressed sentence differently. | High |
| 32149 | `광산을 운영하는 가문` and four family names | Confirm whether these are mining families, mining clans, or operators; standardize Darkvari, Cynrics, Zungars, and Skorias forms. | English and Chinese list four mining families and explain that the gnomes' departure removed the miners' jobs. Japanese calls them mining families. Korean's `광산을 운영하는` specifically makes them mine operators; the active corpus has spelling and family/people-form variants for several names. | Medium |

Rows 32102, 32104-32106, 32109-32110, 32112-32114, 32116, 32118-32120,
32122-32127, 32129-32131, 32133-32139, 32141-32142, 32144-32146,
32148, and 32150 generally retain the English meaning on this first reading.
Proper-name spelling, technical vocabulary, and character register remain
candidates for the integrated pass; no separate high-confidence wording
correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32100-32199 flags the prayer-circlet,
  Besin/Fahrlangi/Eamonn's Isle, Scholia Arcana, Scion succession,
  Translations, Big Huge Engine credit, mining families, and IDs 32103,
  32117, 32128, 32143, and 32147. These were checked against the four active
  locale rows. Their context-dependent questions remain open.
- ID 32103's English source errors (`bother`, `humeral`) were compared with
  all locales; Korean appears to translate the intended meanings without
  carrying the misspellings into Korean.
- ID 32147's English syntax remains ambiguous. The Korean's explicit
  attachment of the absence of a Praetorian to the speaker is a candidate
  relation shift, not a confirmed correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32101-32150 once and in identical order.
- Embedded line-break counts match throughout the range, including 12
  breaks each in the long journal at ID 32103 and the play at ID 32128.
- The `{LINE_CENTER}` marker and the following tagline at ID 32140 match
  exactly in all four locales. No runtime-marker identity/order discrepancy
  was detected in the batch.
- No other structural exception was detected in this batch.
- No CSV text or source file was edited.

## Batch Status

IDs 32101-32150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32151.
