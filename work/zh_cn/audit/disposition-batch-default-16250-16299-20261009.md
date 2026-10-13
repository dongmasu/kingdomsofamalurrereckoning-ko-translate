# Disposition and Edit Batch: `default` IDs 16250-16299

- Decision date: 2026-10-09.
- Scope: the preliminary findings in the range, split into 18 decisions where
  separate rows warranted distinct dispositions; compared active Korean with
  English meaning, Japanese voice/register, Chinese supporting evidence,
  historical audit questions, and recurring terminology.
- Decisions: one accepted, two `not an issue`, and fifteen uncertain.
- One supported Korean `Texto` correction was applied. Uncertain candidates
  remain unchanged. These are working dispositions, not independent final
  linguistic approval.

## Decisions

- ID 16250 remains uncertain: the ambassador title is preserved, but the
  Korean phonetic rendering of Mandolph needs alignment with other appearances.
- ID 16251 remains uncertain: the meeting point, village-exterior location,
  and short distance are preserved. Japanese alone adds “at night”; Korean
  follows English and Chinese.
- ID 16252 remains uncertain: the ingredient quest, potion/barrier mechanism,
  Anira's rule, and intended liberation are retained; names and lore terms
  need alignment.
- IDs 16256-16257 remain uncertain: the insult, already-summoned entity,
  fluctuating power, and learning the plan from Grim, Phasmer, and Crilgarin
  are conveyed; the entity and observation/knowledge nuance need context.
- ID 16261 is `not an issue`: the +40% critical-damage bonus applies when
  attacking unaware enemies from Stealth, as in the source.
- ID 16262 remains uncertain: `Mitharan Rallying Grip` is rendered
  `미타란 결집 손잡이`, but the equipment category and established Mitharan
  terminology are unknown.
- ID 16263 remains uncertain: the quoted passage and its line layout are
  retained; locale versions differ on the water/light/soul imagery and the
  final balance image.
- ID 16264 remains uncertain: Korean says trading is done at Pryderi, matching
  English and Chinese broadly, while Japanese identifies a Pryderi trading
  company. The referent is not established.
- ID 16268 is `not an issue`: `$TR_Shell.cutter_wager$` is preserved exactly
  and the prompt identifies the wager amount as gold.
- ID 16271 remains uncertain: destination and confidence about finding the
  person are preserved; the type of Ohn's Stand and name forms need alignment.
- ID 16276 remains uncertain: the friendly reassurance is retained, but
  `무서운 친구` may sound more hostile than English `intimidating friend` and
  Japanese's rugged/imposing reading.
- IDs 16281-16285 remain uncertain: the hermit blacksmith, Calan Mcleod's
  death by “your people,” the Basilica description, and Alabastra lead are
  retained; names and Basilica's function need context.
- IDs 16287-16288 remain uncertain: the weapons ban and Cloudcrest speculation
  are retained; decree and place-name forms need consistency review.
- ID 16289 is accepted: change `통행증 밀매` to `통행증 위조`. Japanese
  explicitly says the superiors monitored possible permit forgery, Chinese
  says pirated permits, and English's `permit piracy` supports counterfeit
  permits. Korean `밀매` instead asserts trafficking.
- ID 16290 remains uncertain: the portals/doors of knowledge metaphor is
  retained, but its figurative mechanism and voice need integrated context.
- ID 16291 remains uncertain: the recipe retains four ingredients in order,
  quantities 3, 2, 1, and 1, and the paragraph layout; ingredient names need
  glossary alignment.
- IDs 16295-16298 remain uncertain: the Dustling taboo, Syllareta's survival,
  Teers' oath and medal, and Pride of Pryderi label are retained; proper names
  and whether Pride is a company/group remain unresolved.
- ID 16299 remains uncertain: the command to leave the Archsage's mind is
  literal across the row, but the intended mental-space or magical sense is
  not established.

## Verification

- All four locale files contain 50 rows with IDs 16250-16299. The preliminary
  structural check recorded matching embedded line-break counts and normalized
  runtime-token identities/order, including the variable at ID 16268 and the
  recipe layout at ID 16291.
- Only Korean `Texto` at ID 16289 changed. The active CSV retains its UTF-8
  BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings.
- Post-edit SHA-256:
  `a5ce0584d3ef2ca3fada20df6a3679a462d9bd935919674a7deae56087d5d725`.
  Reversing only this text change reproduces the preceding checkpoint hash
  `7b4cf2ce7577c86e5b34de7afe7c3684ea3c1e25d751fbace3691fde72fdd58d`.
- Before this batch: 624 accepted, 1,583 `not an issue`, and 2,898 uncertain.
  After this batch: 625 accepted, 1,585 `not an issue`, and 2,913 uncertain
  (5,123 decisions total).
- Resume disposition work at ID 16300; 48,835 `default` rows remain. The
  preliminary report for IDs 16300-16349 should be checked before proceeding.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
