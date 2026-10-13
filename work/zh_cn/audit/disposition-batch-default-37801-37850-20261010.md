# Disposition Batch: `default` IDs 37801-37850

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, twelve `not an issue`, and twelve uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37801 | Capstan / Bloodbane / crudok / brownies | Uncertain: the unusual protective behavior is retained; proper-name, creature, and group spellings remain provisional. |
| 37803 | “Fine lads and lasses” / emphatic denial | Not an issue: colloquial praise and the emphatic denial of mischief are retained in a natural Korean line. |
| 37804 | `{LINE_CENTER}` / Havok URL | Not an issue: marker identity/order and URL are preserved exactly; only surrounding instruction text is localized. |
| 37805 | Great Huntress Hartwen | Uncertain: the named character and epithet remain, but English and Chinese explicitly mark Huntress as female while Korean is gender-neutral; the best Korean title form needs voice/terminology alignment. |
| 37809 | flaw in your truth / Mitharu's guidance | Not an issue: abstract source wording, conditional acceptance, and possible correction of the flaw are retained. |
| 37810 | Hillared Gastyr / Racinon / House of Gastyr | Uncertain: justice, inheritance, pronoun, castle, and rebuilding sequence remain; proper-name forms and the precise formal relation of the House need alignment. |
| 37813 | Smoke Bomb values | Not an issue: 10 Physical Damage, 3-second stun, 6-second hidden duration, and 45 Mana cost are retained with the source structure. |
| 37814 | Alfar ranger squad / connections | Uncertain: recruitment through connections and the short time at home remain; canonical Alfar and squad terminology is unsettled. |
| 37815 | Primos / no-disturbance instruction | Uncertain: the prohibition is clear, but English's capitalized `The Primos` may be a named office/title rather than a personal name alone. |
| 37816 | entropy essence / Winter Fae | Not an issue: extracting entropy essence from Winter Fae and the escalation beyond that act are preserved. |
| 37819 | Lorestone Travel | Uncertain: the short UI label is translated compositionally, but whether it names a specific fast-travel action and the canonical Lorestone UI term need alignment. |
| 37823 | greater subject for my work | Not an issue: the speaker's admiration for the people's complexity, vulnerabilities, and strengths is retained. |
| 37826 | returning veterans / Mithros | Not an issue: the lack of welcome, Mithros exception, and young person's difficulty finding a place are retained without changing the source's point. |
| 37829 | Fireball nickname | Not an issue: the speaker explicitly gives the addressee the new nickname and thanks them. |
| 37830 | Nyralim myth / pronoun shifts | Uncertain: the complete seasonal myth and source line layout remain; the youth-of-memory phrase is interpreted temporally, and proper-name/lore conventions need context. |
| 37831 | Beckoned outsider / relief | Not an issue: Korean follows English's “no greater relief” comparison and Japanese; the conflicting Chinese negative does not establish a Korean error. |
| 37832 | Warsworn | Uncertain: departure urgency and Besin's refusal to wait remain; the faction's canonical Korean name is unresolved. |
| 37835 | “master Almain assassin” | Uncertain: Gedrick's assassin role and boots are retained, but `master` may indicate mastery/rank rather than “greatest”; Japanese and Chinese differ. |
| 37838 | Telogrus torturing scholars | Not an issue: ongoing torture of both scholars and magic experts, and the stated purpose of learning about the Erathi, are retained. |
| 37842 | Hall of Appointments | Uncertain: the room/hall meaning is translated, but capitalization may mark a named location and the canonical Korean form is open. |
| 37843 | Court of Summer | Uncertain: the seasonal court is identified; the formal organization/place convention needs alignment with recurring Court terminology. |
| 37845 | Stowaway Troll | Not an issue: both the stowaway role and explicit troll identification are retained. |
| 37849 | Broken Chantry | Uncertain: the damaged religious building is conveyed, but `Chantry` may be a formal institution/place term rather than a generic chapel. |
| Other rows in IDs 37801-37850 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- No source-keyed historical open-question row was found for this range.
  Recurring terms and names were checked against prior project decisions,
  including Warsworn, Court terminology, Chantry, Lorestone, Alfar, and
  proper-name consistency.
- The conflicting Chinese negative at 37831 was not adopted over the
  English-led Japanese/Korean reading.
- At 37813, all four numeric values and the three-line structure match.
  Marker and URL at 37804 are retained.
- The seven-line myth at 37830 keeps the English/Korean/Chinese layout.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37801-37850 once and in identical order, as checked in the preliminary
  structural comparison.
- No CSV text changed. Runtime markers, numbers, and intentional line breaks
  remain untouched.
- The active default CSV remains UTF-8 with BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `383a220362885395984c1aa84b76b4965774637c5690fefba71082cd651be062`.

## Checkpoint

Disposition is complete through ID 37850. Resume at ID 37851; 27,284
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37851-37900-preliminary.md`. The next unused decision ID is
D-12288.
