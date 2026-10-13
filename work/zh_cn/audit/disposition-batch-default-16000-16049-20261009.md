# Disposition and Edit Batch: `default` IDs 16000-16049

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split into 22 decisions where
  multi-row findings needed distinct row-level dispositions; compared against
  active Korean, English meaning, Japanese voice/register, Chinese supporting
  evidence, recurring terminology, and historical audit questions.
- Decisions: three accepted, four `not an issue`, and fifteen uncertain.
- Three supported Korean `Texto` corrections were applied. Uncertain
  candidates remain unchanged. These are working dispositions, not independent
  final linguistic approval.

## Decisions

- ID 16000 remains uncertain: English, Japanese, and Chinese say `silver`
  without specifying coins; Korean's `은화` may narrow it to currency.
- ID 16001 remains uncertain: `Behind the Veil` is translated literally, but
  the row does not establish whether Veil is a named place, group, or metaphor.
- ID 16002 remains uncertain: the delivery-to-construction sequence is
  retained; the status and canonical forms of Materials, Paddy, Keep, and
  Tower need quest/name context.
- ID 16003 is `not an issue`: the speaker's defiance, refusal to be stopped,
  and conditional image of waves and wind consuming their bones are retained.
- ID 16004 is accepted: change `미타루(Mitharu)` to `미사루(Mitharu)`.
  Decision D-152 and the official Korean manual establish `Mitharu = 미사루`;
  the active form is inconsistent with that approved term.
- IDs 16006-16008 remain uncertain: the title, creature label, and Klurikon
  name are preserved, but canonical spellings and whether `Chaos Critter` is
  a named type remain unresolved.
- IDs 16010-16011 remain uncertain: the sacred-ground image and healing offer
  are retained; Green's name/color status and the speaker's lore identity need
  context.
- IDs 16015-16016 remain uncertain: the fake deaths, desertion, Red's pursuit,
  tribute acceptance, and satisfaction are retained; Red's identity and
  related scene context remain open.
- ID 16018 is accepted: replace the phrase that adds `운명` with
  `직물에서 풀려나온 실오라기처럼`. English says `the weave`, Japanese
  describes a thread coming loose from the weave, and Chinese compares it to a
  frayed thread on cloth; neither English nor Japanese establishes a
  specifically Fate-related weave.
- IDs 16020-16024 remain uncertain: the destination, House of Ballads
  encounter, deserter bounty, and Vauner House label are retained; proper-name
  forms and the category of Vauner House need lore context.
- ID 16026 is `not an issue`: the cut neck, likely bandit cause, and small
  pendant tightly held in the woman's fist are preserved.
- IDs 16030-16033 remain uncertain: the Jottun study, book-wrapping label,
  gnome description, and Akara heaven-to-hell threat are retained; names and
  lore terminology remain provisional.
- IDs 16035-16036 remain uncertain: the eastern bastion rumor and Founding of
  Scholia Arcana title are conveyed; canonical place and institution forms
  remain open.
- ID 16037 is accepted: replace the literal/technical `기동성` with
  `자유롭게 움직일 수 있지`. Japanese explicitly says the addressee can move
  freely around the city, while English contrasts their mobility with the
  locals' lack of it; the Korean now conveys that contextual freedom naturally.
- ID 16039 remains uncertain: the Zungar threat, accepted task, and northern
  mine are retained; names and family/faction forms need corpus alignment.
- ID 16040 remains uncertain: the surprise and instruction to place the items
  beside the Litany Altar are retained; the plural item's referent is absent.
- ID 16041 is `not an issue`: the body being taken to the doctor, remaining
  tasks, and blood cleanup are preserved.
- ID 16042 is `not an issue`: the short question about finding the male
  referent is conveyed without a material meaning change.
- ID 16043 remains uncertain: the ongoing workload and scaffolding-fingers
  image are retained, but the strained-hand metaphor and added `뻣뻣해` need
  context before a more specific rendering is approved.
- ID 16044 remains uncertain: `{1}/{*2{2}}` is preserved exactly; the
  established Korean UI term for `Health` remains a glossary question.
- IDs 16045-16046 remain uncertain: the siege chronology and Ordo/Fateweaver
  exchange are retained; the names and irony require broader voice/term
  alignment.
- IDs 16048-16049 remain uncertain: Ljosalfar's established `료스알브` form
  and the Crows' commercial draw/tournament condition are retained; Icebrine
  and Crows terminology need corpus-wide alignment.

## Verification

- All four locale files contain the same 50 IDs in this range. The preliminary
  structural check found matching embedded line-break counts and runtime-token
  identities/order, including the three line breaks at ID 16018 and nested
  `{1}/{*2{2}}` at ID 16044.
- Only Korean `Texto` values at IDs 16004, 16018, and 16037 changed. The active
  CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- Post-edit SHA-256:
  `be773a06b5607c8db979c0c803ab60f3e8c9caa1cc086f2c08e795b2c4db353a`.
  Reversing only these three text changes reproduces the preceding checkpoint
  hash `590af67de306094fdc27637d954212530fd0224c4a608743409df6fbac22abf9`.
- Before this batch: 616 accepted, 1,549 `not an issue`, and 2,832 uncertain.
  After this batch: 619 accepted, 1,553 `not an issue`, and 2,847 uncertain
  (5,019 decisions total).
- Resume disposition work at ID 16050; 49,085 `default` rows remain. The
  preliminary report for IDs 16050-16099 already exists.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
