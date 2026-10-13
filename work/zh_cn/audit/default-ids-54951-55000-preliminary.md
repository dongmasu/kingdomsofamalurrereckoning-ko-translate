# Preliminary Language Scan: `default` IDs 54951-55000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54951-55000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54951 | `그들은 우리 사이에 섞여 산다` for `They Walk Among Us` | Confirm whether this is a title, prophecy, or literal statement, and align its Korean form with the intended work/title. | Korean renders the literal phrase. Japanese calls it “the enemy within,” while Chinese supplies a corpse-related reading; the source-locale conflict is unresolved. | High |
| 54952 | `자물쇠 따기 기술` for `Lockpicking` | Use the established player-facing Korean skill/UI label consistently. | Korean clearly describes lockpicking and preserves the higher-skill success/lockpick-break relationship. The canonical short skill name remains a glossary decision. | Medium |
| 54957 | `Origin Account` / `Origin 계정` | Determine whether this is a login/product label or an in-world account string; preserve the brand name if player-facing. | Korean retains “Origin” and translates `Account`; the isolated label does not identify its context. | Medium |
| 54959 | Father Etair / `mission` / `선교원` | Confirm the religious institution's formal type and the leader's role; preserve the investigation of Etair's murder and activities before death. | Korean identifies the dead leader and directs the player to a monk at the mission. Japanese says monastery, Chinese says preaching mission. | Medium |
| 54962 | `Lykeios` / essence of the Kollossae | Verify whether Lykeios is an institution/school and retain that Onesimos runs it as a great thinker. | Korean preserves the “essence” claim and says Onesimos leads the place. Chinese explicitly identifies it as an academy; English/Japanese leave the institution type implicit. | Medium |
| 54970 | Firstsworn council / `첫 서약자들` | Confirm the formal faction name and whether the gathering place should be named consistently. | Korean translates the plural group and preserves the proposal that the current group may do the same. Historical notes flag Firstsworn as a title/name. | Medium |
| 54974 | `굶주림 때문에 여기까지 왔어...` / beasts and “you” | Preserve the speaker's hunger-driven arrival and the ironic claim of being alone despite wandering beasts and the addressee. | Korean retains all referents but recasts the fragment as “I can be alone even though beasts and you are here,” which is logically awkward like the source. The intended relation/voice needs context. | Medium |
| 54980 | `젬스톤(Gemstone)` / welcome and stock | Confirm whether Gemstone is a tavern/place name and whether “good selection” is a dry double-entendre. | Korean preserves the proper-name-like greeting and the stock line. Chinese explicitly identifies a Gemstone tavern, while English leaves the place type unstated. | Medium |
| 54985 | `주변 전부가 그래. 여기가 바로 컬른(Culn)이었어.` for `All around you. This was Culn.` | Preserve the deliberately abrupt fragment and determine whether Culn names the former landscape/settlement or a specific place. | Korean turns the fragment into a complete “everything around” statement and keeps the name. Japanese/Chinese also form a “this area used to be Culn” reading; more context is needed. | Medium |
| 54991 | Alyn Shir / `앨린 시르` | Standardize Alyn Shir's Korean spelling across the corpus and distinguish the personal name from similar source forms. | Korean follows English in this row. Historical notes flag name consistency at other IDs; the current isolated occurrence does not establish a canonical transliteration. | Medium |
| 54992 | Cutter Brannagh / `커터 브래너그` | Determine whether `Cutter` is a given name, surname, title, or occupational label. | Korean treats both tokens as a personal name. Japanese does likewise phonetically; Chinese reads Cutter as a role/descriptor. | Medium |
| 54993 | Four-line Sorrows' hall verse | Preserve the four lines and verify the “weary hall,” fruit-bearing leaves, and dead-following-suit image before settling poetic wording. | All locales retain three line breaks. Korean keeps the questions and progression; `비탄의 집의 지친 전당` may be an overly literal rendering of the source's personified/poetic image. | High |
| 54995 | five surface wanderers / one at the makeshift camp | Clarify what `all of them` refers to and preserve that the total is five, including one at the camp. | Korean preserves the count and camp inclusion. English does not identify the creatures in this sentence; Chinese uses human “people,” while Japanese explicitly uses creatures. | Medium |
| 54998 | `Additional Thanks` / `추가 감사` | Determine whether this is a player-facing label, credit heading, or internal string and apply the intended casing/style. | Korean translates the phrase, while Japanese leaves it in English and Chinese translates it. Context is not available from the row. | Low |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Oleyn, Cynric Quarry,
Father Etair, House of Sorrows, Lykeios, Onesimos, Firstsworn, Saturnyn,
Sun Camp, Remes, Fateweaver, EA, Gemstone, Curse of Frailty, Akara,
Culn, Cydan, Galafor Plain, Lyria, Anira, Chaos Portals, Alyn Shir,
Cutter Brannagh, Oreyn, Marga, Jenniker, Hugues, Prismere, Font,
Racinon, Pteryx, Familiar, and Lord of Deserts.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54950-55049`.
  Relevant questions include They Walk Among Us (54951), Lockpicking
  (54952), Origin Account (54957), Father Etair's mission (54959), Lykeios
  (54962), Firstsworn council (54970), Sun Camp (54973), hunger/reference
  (54974), Gemstone (54980), the truth distinction (54983), Akara's bottle
  joke (54984), Culn (54985), Cydan (54987), Alyn Shir (54991), Cutter
  Brannagh (54992), the four-line poem (54993), Anira/five creatures
  (54994-54995), and Additional Thanks (54998).
- ID 54950 is the historical range's opening boundary and was included in
  the preceding active report. It is not duplicated here.
- Historical questions remain preliminary prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54951-55000 once
  and in identical ascending order.
- Physical line-break counts match throughout; the verse at ID 54993 has
  three breaks in every locale.
- `{LINE_BULLET}{1}` at 54963, `$SQ151.bribe_value$` at 54988, `{1}` at
  54999, and their identities/order are preserved.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 54951-55000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55001.

## Disposition Cross-Reference

The working disposition pass is recorded in
[`disposition-batch-default-54951-55000-20261010.md`](disposition-batch-default-54951-55000-20261010.md):
14 IDs remain uncertain, 36 are `not an issue`, and no CSV correction was
accepted. This remains an in-progress disposition, not independent final
approval.
