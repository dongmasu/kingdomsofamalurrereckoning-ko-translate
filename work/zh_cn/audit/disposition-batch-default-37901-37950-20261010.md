# Disposition Batch: `default` IDs 37901-37950

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, fourteen `not an issue`, and seven uncertain.
- CSV change: ID 37916.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37901 | Prester's Path | Uncertain: petitions and divine favor are retained, but Japanese suggests a petition board and Chinese a small path; proper-name/status remains unclear. |
| 37902 | recommendations / casting | Not an issue: Korean assigns roles according to the listener's recommendation, supported by Japanese and Chinese despite terse English wording. |
| 37903 | Chaos magic against Niskaru | Not an issue: shortest route and emphasis on powerful Chaos magic are retained. |
| 37904 | Dagger damage values | Not an issue: +13 Physical Damage and +35% Damage with Daggers keep their distinct labels, order, and layout. |
| 37907 | one-in-five vessel loss | Not an issue: the rate, lost sailors, vital supplies, and urgency are retained; context supports rendering the sailors as dead/lost. |
| 37908 | daggers hidden in the Sidhe | Not an issue: the warning against theft and safe hiding place elsewhere are retained. |
| 37909 | sword pommel / icy shards | Not an issue: gem extraction causes the cracking and shattering into twelve icy shards; this is a natural rendering of “a dozen.” |
| 37916 | protest the mission | Accepted: change `선교소 임무에 항의` to `선교소에 항의`; English says protest the mission as an institution, Japanese says monastery, and Chinese says preaching center. The prior wording instead made `mission` sound like an assignment. |
| 37917 | source typo `Unilkely` | Not an issue: Korean renders the intended low-probability possibility; the misspelling remains a source-only defect. |
| 37920 | Emotional Tuatha | Uncertain: literal label meaning is retained, but its UI/test-text role and intended category are unknown. |
| 37924 | Legs / Japanese `腰` | Not an issue: Korean follows English `Legs`, also supported by Chinese; Japanese's waist/hips reading is an isolated locale divergence. |
| 37926 | Truth card / Dverga paradox | Not an issue: both contradictory clauses remain unreconciled and the uncertainty/debate are preserved. |
| 37930 | “Leave a lady to her drink” | Uncertain: the request to be left alone to drink is retained; Korean's `여자` may lose the English social/register nuance of `lady`, but Japanese also omits it. |
| 37932 | capitalized Well | Uncertain: alarm at what is being done to the Well is preserved; the row does not prove whether this is the formal Well of Souls. |
| 37933 | peaceful place / question | Not an issue: Korean retains the source's question mark and apparent rhetorical/questioning tone. |
| 37934 | family mine / Skoria Mine | Not an issue: last family possession, Eswin's intent, active valuable ore, and his motive are retained. |
| 37937 | Mithros | Uncertain: original spelling is supplied parenthetically, but locale forms differ and the canonical Korean transliteration needs alignment. |
| 37940 | Court of Winter workshops | Uncertain: varied enchantments and the oldest/traditional workshops are retained; formal Court and Fae terminology needs alignment. |
| 37943 | focused energies / levitation | Uncertain: shared energy source and safe levitation are present, but Korean turns the focusing subject into a device and the source pronoun's referent is contextual. |
| 37946 | Beckoned / city fate | Not an issue: urgency and both discussion topics are retained. |
| 37948 | recurring gift check-in | Not an issue: occasional return and inquiry about further gifts are retained consistently with its repeated occurrence. |
| Other rows in IDs 37901-37950 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- No source-keyed historical open-question row was found for this range.
  Candidate terms were compared with existing project decisions and
  terminology notes, including Prester, mission, Well, Mithros, and named
  locations.
- At ID 37916, English/Japanese/Chinese identify a religious institution;
  removing `임무` corrects the object of protest without choosing a more
  specific institution type.
- At ID 37924, Korean follows English/Chinese rather than Japanese's
  waist/hips reading. Dagger values, vessel fraction, and marker structures
  remain unchanged.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37901-37950 once and in identical order, as checked in the preliminary
  structural comparison.
- Only active Korean `Texto` at ID 37916 changed.
- The two-line dagger-stat structure, values, and detected runtime markers
  remain unchanged.
- UTF-8 BOM and original mixed endings are preserved: 72,046 CRLF and 39
  bare-LF endings. Active default CSV SHA-256:
  `b6bb2034d8abf6563a9ff4a296bb11a3f74c552cf46f1798b58dd733b3f69f99`.

## Checkpoint

Disposition is complete through ID 37950. Resume at ID 37951; 27,184
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37951-38000-preliminary.md`. The next unused decision ID is
D-12333.
