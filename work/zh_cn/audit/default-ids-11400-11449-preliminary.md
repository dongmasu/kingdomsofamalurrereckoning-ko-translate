# Preliminary Language Scan: `default` IDs 11400-11449

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11400-11449.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11400 | small/large enemy pull behavior | Preserve the opposite movement effects for small versus large enemies and verify the exact UI verbs. | Korean says attacks pull small enemies toward the player and pull the player toward large enemies. English, Japanese, and Chinese support the same direction reversal. Historical notes already flag the ability description. | High |
| 11402 | Oracle of Idylla / Hallidite → `신탁자 할리다이트` | Confirm whether Oracle is an office/title and standardize Hallidite's spelling. | Korean preserves that Hallidite bears a message. The references use prophet/oracle language and differ in personal-name transliteration. Historical notes already flag both. | Medium |
| 11404 | `them` / Frostbreak Sea / Obsidian Isle | Keep the search area broad without inventing what “them” refers to. | English does not identify the object/person to be found. Korean omits the pronoun object naturally and preserves the west-to-east/Obsidian Isle area; other references likewise do not establish the referent. Historical notes already flag it. | Medium |
| 11406 | `Hoarders in the Sewer` → `하수도의 수집광` | Determine whether Hoarders is a named faction/quest title or a generic description. | Korean reads it as people who hoard/collect in the sewer. English capitalization and Japanese/Chinese compound nouns leave the proper-name status open. Historical notes already flag it. | Medium |
| 11407 | `The Eldest` → `맏이` | Confirm whether this is a personal title/leader rank or the generic oldest sibling/person. | Korean chooses the ordinary kinship term “eldest”; Japanese transliterates the title and Chinese says elder. Historical notes already flag this title. | Medium |
| 11412 | `of Ice Shield` → `얼음 방패의` | Preserve this composable affix fragment and verify how it combines with the adjacent `Master` string. | Korean retains the possessive fragment rather than making a standalone sentence. Historical notes already flag its composition. | High |
| 11414 | Chaos Matter / Chaos Nodes / Telogrus | Verify the resource/node terms and preserve the destroy-and-harvest requirement. | Korean retains that Chaos Matter is necessary to defeat Telogrus and can only be obtained by destroying Chaos Nodes and harvesting their essence. The named terms remain provisional. Historical notes already flag this lore/quest text. | Medium |
| 11415 | Keepers / Crossing / Fae empires | Verify the Keepers' role and preserve that both Courts agreed not to harness the Crossing's power. | Korean says the Keepers exist to prevent either Fae empire from using the Crossing, and that Summer and Winter agreed not to draw on it. English/Japanese/Chinese support the prohibition; “live to prevent” remains an idiom, not an immortality claim. Historical notes already flag it. | Medium |
| 11418 | Akara / Dead Kel / Hanged Men / Nette | Verify names and lore references; preserve the letter's eight-line structure and the speaker's uncertainty about Akara. | Korean retains the expedition's end, the Hanged Men's pursuit, the voice's promise, and the question about Akara. All seven prose lines after the heading remain separated by the source line breaks. Japanese and Chinese differ on the “cultivated mystery” and truth/light metaphors. Historical notes already flag this letter. | Medium |
| 11419 | `Paling Wand` → `창백한 마법봉` | Resolve the item identity before fixing its Korean name; Japanese suggests a tilling tool while Chinese suggests a pointed wand. | English title alone does not identify the object. Korean follows a literal pale-wand reading; the conflicting supporting references remain unresolved. Historical notes already flag this. | High |
| 11421 | Oathblade Kirby → `맹세의 검 커비` | Determine whether Oathblade is Kirby's formal title/rank or a descriptive epithet. | Korean treats it as a title and preserves both the debt of gratitude and payment. Japanese identifies a first-class mercenary; Chinese treats Oathblade as a blade-name. Historical notes already flag the title question. | Medium |
| 11424 | `Mudhold Fasting` → `머드홀드 패스팅` | Verify the place name and preserve the speaker's inability to persuade the woman to leave until her work is complete. | Korean follows the English agency and duration. Japanese reads a route/tunnel and Chinese a channel, so the location type remains open. Historical notes already flag this. | Medium |
| 11425 | Mallion Anwon / Abergast / City Watch | Verify spellings and preserve the sequence from tracing the poisoning to reporting it and being attacked. | Korean retains each event and Abergast's apparent madness. References support the sequence but vary on names and “hermit-merchant” wording. Historical notes already flag these names and events. | Medium |
| 11427 | Lord Ysa / House of Ballads / Court of Summer / Seelie Fae | Align Ysa and House of Ballads with recurring forms and retain the “mortal years” date qualification. | Korean uses `야사 경` despite active forms such as `이사(Ysa)` and renders House of Ballads as `발라드의 집`, unlike recurring `하우스 오브 발라드`. The founding relationship and approximate five-hundred-mortal-year age are retained. Historical notes already flag the lore terms. | High |
| 11436 | `The Preordained` → `예정된 자들` | Keep this faction/group name consistent with previous occurrences. | Korean treats Preordained as a plural group and preserves losses across Mithros plus the unknown ally. Historical notes already flag this recurring term. | Medium |
| 11439 | `your worshipfulness` → `각하` | Preserve the courtly/flirtatious sarcasm without making the honorific literal or possessive. | Korean uses `각하` and says the addressee cannot fault the speaker for wanting them alone. English and Japanese support the teasing tone; Chinese's “possess you” is more literal. Historical notes already flag the honorific. | Medium |
| 11447 | “our mages” / “your army” | Clarify whose army is advancing and preserve the expectation that the addressee does not object. | Korean follows English: the speaker's mages support the addressee's army entering Alabastra. Japanese can be read as the speaker's army accompanying an army; Chinese supports the addressee's force. Historical notes already flag the pronouns. | Medium |
| 11432 | `Bahrain` → `바레인` | Determine whether this is a test string, country name, or named island. | English and Japanese say Bahrain; Chinese adds “island.” Korean gives the standard country-like transliteration, but this isolated label lacks context. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11400, 11402, 11404, 11406-11407,
  11412, 11414-11415, 11418-11419, 11421, 11424-11425, 11427, 11436,
  11439, and 11447. They remain open; prior candidate readings were not
  treated as approved.
- Cross-checked Ysa and House of Ballads at ID 11427 against active forms,
  including IDs 11236 and 31067; both names have competing Korean forms.
- Preserved all variable terms and the full letter layout at ID 11418. No
  translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- ID 11418's letter lineation is preserved; no structural exception was
  found.
- Official Korean manual terminology could not be independently searched in
  this environment. No active CSV was edited; checkpoint hashes remain
  unchanged.

## Batch Status

IDs 11400-11449 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 11450-11499.
