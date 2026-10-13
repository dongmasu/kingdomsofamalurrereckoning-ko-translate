# Preliminary Language Scan: `default` IDs 60351-60400

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 60351-60400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 60354 | promise about seeing death | Determine whether this is deliberately literal dark humor or means the speaker will not foretell the addressee's death. | Korean follows English's “if I see your death.” Japanese instead says they will not prophesy it; Chinese follows the literal English construction. | Medium |
| 60357 | “Until they find a better home” / `더 나은 거처를 찾을 때까지만` | Identify who “they” are and whether the line refers to the guests/refugees or another group. | Korean leaves the subject implicit. English and Chinese retain an unspecified plural; Japanese says until a suitable place is found. The historical prompt leaves the referent open. | Medium |
| 60359 | the Cur / `복수의 사냥개(Cur)` | Confirm whether `Cur` is a named antagonist/title or an epithet, and whether “hound of vengeance” is an established Korean form. | English capitalizes `Cur`; Japanese transliterates it, while Chinese uses “vicious dog.” Korean adds “of vengeance,” which is not explicit in English. | Medium |
| 60360 | `decorprealicative magics` / `비물질화 마법` | Verify the intended technical term and the Arrivus Engine's selective-dematerialization function; preserve the source's broken wording without silently treating it as certain. | English contains apparent source typos (`posession`, `decorprealicative`, `arrivus`). Japanese supports a dematerialization reading, but the device, hollow box, and “quarry” remain context questions. | Medium |
| 60363 | five / “higher” / “No go” | Clarify the card-game rule and preserve the speaker's correction or failed wager. | English says the second card is a five and higher, then rejects the play; Korean retains that sequence. Japanese says the five is high and the listener loses; the source-keyed audit flags the contradiction. | Medium |
| 60374 | `Skyblossom, whispers` / `스카이블라섬에서 ... 속삭임처럼` | Determine how the fragment “She deserves Skyblossom, whispers” is punctuated and whether `whispers` is a name, apposition, or separate fragment. | Korean adds a simile-like “like a whisper”; English is syntactically unclear, Japanese omits the final word, and Chinese retains it as a separate fragment. | Medium |
| 60377 | Mitharan Prismere Brace / `미사루 프리즈미어 보호대` | Check the canonical rendering of `Mitharan` and whether `Brace` is the established item type. | The source is a compact item-name label; Korean preserves the three components, but the ethnicity/material name and equipment term need glossary comparison. | Medium |
| 60382 | `Guatemala` / `과테말라(Guatemala)` | Establish whether this standalone value is a country name, a test/internal label, or another proper name before choosing display formatting. | All four locales preserve the same standalone name; there is no sentence context. | Low |
| 60393 | Testament's cistern / `벨렌의 유언` | Resolve the source-name conflict and identify the cistern's faction/owner before standardizing the title. | English says `Testament`; Japanese and Chinese say `Belen Covenant`. Korean follows English's Testament reading with a Belen form. | Medium |
| 60394 | `Going Rogue` / `독자 행동` | Determine whether this is a quest/title, a behavior description, or a UI label before settling the Korean wording. | English capitalizes the phrase; Japanese reads “a step toward rebellion,” while Chinese and Korean use solo/independent-action readings. | Medium |
| 60396 | `The House` / `하우스` | Identify which House is meant and whether the faction name should be explicit in Korean. | English capitalizes the generic-looking term; Japanese specifies House of Ballads, while Korean leaves it as “House.” The historical prompt leaves the referent open. | Medium |
| 60400 | `The Lost Litanies` / `잃어버린 연도문` | Confirm the canonical Korean for `litanies` and whether this is a named book/quest. | English and Chinese describe lost litanies/prayers; Japanese says a missing litany book. Korean uses the specialized term `연도문`; title status remains open. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Sagrell,
Caelrod, Hera Edithing, the Cur, Bhaile, Gadflow, Guian, Eloren, Arrivus
Engine, Hrindi, Skyblossom, Telogrus, Dureks, Dokkalfar, Ljosalfar,
Fieriol, Teeth of Naros, Skoria, the Crows, Sandstone Villa, Ethene,
Anira, Testament/Belen Covenant, Kollossae, Chakrams, and the House.
The eight-line Bayala Tirin poem at 60378 retains the source's paragraph
breaks; its names, historical sequence, and verse wording remain
preliminary. Existing Korean bilingual-name formatting is retained as
found; this pass does not impose a global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed historical entries for IDs `60350-60400` in the
  archived `60350-60449` question range. Applicable open prompts include
  Sagrell's command (60352), Caelrod (60353), the death omen (60354), Hera
  Edithing (60355), the tournament fighter (60356), refugees/home (60357),
  Cur/Gadflow/Bhaile (60359), Guian/Arrivus Engine/dematerialization and
  the multi-paragraph letter (60360), the card wager (60363), Hrindi and
  Skyblossom/whispers (60374), the Prismere Brace (60377), the Bayala
  Tirin/Dureks fate poem (60378), Guatemala (60382), the Crows final
  (60388), the Sandstone Villa deed (60389), Ethene/father (60390), the
  Testament cistern (60393), Going Rogue (60394), the Kollossae shield
  (60395), “The House” (60396), Chakram values (60398), and Lost Litanies
  (60400).
- Historical prompts remain open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 60351-60400 once
  and in identical ascending order. All four full `default` files retain
  matching key order.
- Embedded newline counts match throughout the batch, including the
  multi-paragraph letter at ID 60360 and the poem at ID 60378.
- Runtime-token sequences match; no structural marker exception was found.
- Card rank `five` at ID 60363 is retained; Japanese alone writes the
  second-card ordinal as an explicit `2`. Japanese also makes “something”
  explicit as `1` at ID 60392. Neither difference changes the apparent
  quantities; the card-rule contradiction remains open.
- No translation CSV edit was made.

## Batch Status

IDs 60351-60400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 60401.
