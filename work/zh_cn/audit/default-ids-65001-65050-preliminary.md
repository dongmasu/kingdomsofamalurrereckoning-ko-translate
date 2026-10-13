# Preliminary Language Scan: `default` IDs 65001-65050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 65001-65050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 65003 | `The Trackers Tracked` / `쫓기는 추적자들` | Preserve the title's wordplay that trackers themselves are being tracked/pursued. | Korean conveys the reversal through “trackers being chased”; Japanese/Chinese do likewise. Plural nuance remains open. | Low |
| 65005 | `kerchief` / `손수건` | Verify whether this is specifically a kerchief/scarf or a handkerchief, while retaining its reagent-handling material. | Korean chooses handkerchief; Japanese says scarf and Chinese handkerchief. English distinguishes the worn cloth from its alchemical use. | Medium |
| 65009 | `we Beckoned met` / `우리 불려온 자들이 만나` | Preserve the plural/group sense of the Beckoned meeting to fulfill their roles. | Korean retains the collective and purpose; the awkward English wording is regularized without changing the event. | Low |
| 65015 | Poison passive / `지속 효과` | Preserve the exact passive marker and that Poison attacks propagate to other enemies. | Korean retains the `{*1...}` marker and the skill effect; it generalizes “obscure toxins” as rare toxins. | Medium |
| 65019 | `a hundred crates` and missing items | Preserve the hypothetical example: one or two items disappearing from every haul would go unnoticed. | Korean retains the 100 crates and repeated one-or-two loss, with the ship-to-vault direction intact. | Low |
| 65021 | `Familiar Mastery` / `사역마 숙련도` | Verify canonical skill name and preserve Level 3 as the condition. | Korean retains the level and companion-mastery sense; Japanese/Chinese vary in whether it is mastery or familiarity. | Medium |
| 65023 | lock-picking control tutorial | Preserve the control icon, slider action, correct-angle condition, and risk of a broken pick. | Korean includes the full conditional instructions and exact `#NAMED_ICON_360_LS#` token; Japanese omits some conditions. | High |
| 65024 | Crinneus / 300 years / locks and social order | Preserve the claim that Crinneus viewed locks as a failure of social order, then the speaker's appreciation of locks' intrinsic beauty. | Korean retains both arguments and the 300-year value. Name transliteration differs by locale. | Medium |
| 65028 | Ventrinio / Dren / Field of Huber | Preserve that Ventrinio knows a way past the immortal entrance defender and is waiting with allies south of Klurikon. | Korean keeps the route, destination, and allies. Chinese wording is structurally confused; Korean follows English/Japanese. | Low |
| 65032 | `N,` / `N에게,` | Treat `N,` as an incomplete letter salutation unless surrounding text proves it is a person/name. | Korean provisionally addresses N; Japanese explicitly formats it as “To N.” | Medium |
| 65033 | `before the siege was broken` | Preserve the temporal relation: sneaking through opposing lines was impossible before the siege ended. | Korean retains the before-clause and opposing defensive lines; the exact event meant by “broken” depends on context. | Low |
| 65039 | `siege-breaker` / `포위망을 무너뜨린` | Preserve this as a descriptive epithet/title for the Crystal War hero. | Korean conveys the feat but not a fixed title; Japanese/Chinese similarly localize the phrase. | Medium |
| 65043 | jail rear / `감옥 뒤편` | Keep the suggestive but noncommittal hint that there may be something worth seeing behind the jail. | Korean preserves the ellipsis and uncertainty. Japanese contains a typo in the instruction but supports the same hint. | Low |
| 65045 | Winter Fae and House of Sorrows subject to Tuatha malice | Preserve that both groups remain affected by the Tuatha's hostility despite the apparent liberation of Klurikon. | Korean retains both groups and the present threat. House of Sorrows rendering should follow the project terminology decision. | Medium |
| 65048 | `master-at-arms` / `무술 교관` | Verify whether Ollie's role is an arms/combat instructor, weapons officer, or broader military training post at Gravehal Keep. | Korean selects martial-arts instructor; Japanese says security chief and Chinese says provost. The English title is context-dependent. | High |
| 65049 | Tilera and the retreat from Klurikon | Preserve that the Tuatha produced an enemy she could not defeat and her forces barely survived withdrawal. | Korean retains the inability to win and near-disastrous retreat; “produced a foe” remains a source-level ambiguity. | Low |

Other reviewed rows generally retain first-read meaning, including scouting,
quest objectives, place names, lock imagery, greetings, and combat
descriptions. Findings remain provisional and are not confirmed corrections.

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 64950-65134, including Familiar
  Mastery, Ventrinio/Dren, the letter salutation, rank terminology, and
  `master-at-arms`.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 65001-65050 once
  and in identical ascending order.
- Embedded newline counts and runtime marker identities/order match.
- The passive marker at 65015 and `#NAMED_ICON_360_LS#` at 65023 are
  preserved; the marker at 65015 remains followed by one line break.
- The 300-year reference, Level 3, and 100-crate quantity are retained.
- No translation CSV edit was made.

## Batch Status

IDs 65001-65050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 65051.
