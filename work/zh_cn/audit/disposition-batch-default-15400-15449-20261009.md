# Disposition and Edit Batch: `default` IDs 15400-15449

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row when
  findings covered multiple IDs.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Twenty-nine source-row decisions: three accepted, three `not an issue`,
  and twenty-three uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15402 remains uncertain: variables and spacing are preserved, but the
  assigned-PC survey instruction may be legacy/internal UI text.
- ID 15403 remains uncertain: the departure is clear; Pledgeshield's formal
  rank and plural group term remain unresolved.
- ID 15404 remains uncertain: the three names/groups and their relationship
  to the Skorias are not established across the locales.
- ID 15405 remains uncertain: Sparrow may be a person/nickname or a literal
  bird; the pun and identity cannot be settled.
- ID 15406 remains uncertain: the combat and team relations are preserved,
  but whether the Crows are a named team and their Korean display form are
  not settled.
- ID 15407 remains uncertain: the Destiny's Wayfarer title and Alfar form
  need corpus terminology alignment.
- ID 15408 remains uncertain: `boon` and `beholden` admit skill-benefit,
  obligation, or allegiance nuances.
- ID 15410 remains uncertain: both improved visibility and the limited
  activation-range increase are preserved, but Chaos-mechanic names need
  glossary alignment.
- ID 15411 remains uncertain: the label does not establish whether Jienne
  Home is a residence or a named location.
- ID 15414 remains uncertain: the conditional reward and hereditary items
  are preserved; proper-name spellings remain inconsistent.
- ID 15415 remains uncertain: the arena-origin verse is retained, but
  “contested Engard's knowledge” and the proper House terminology need
  contextual review.
- ID 15416 is `not an issue`: the objective and exact count of 50 books are
  preserved.
- ID 15419 remains uncertain: the fight warning is preserved, but Tinehil's
  canonical spelling is unresolved.
- ID 15422 remains uncertain: the loyalty talisman is clear; faction and
  deity forms remain provisional.
- ID 15423 remains uncertain: the causal sequence is preserved, but the
  burden and realms of Winter require lore context.
- ID 15424 remains uncertain: Fateweaving's status as a process, skill, or
  named discipline is unknown.
- ID 15426 is accepted: replace `고대 지하 저장고 방문하기` with
  `고대 저장고 방문하기`. English says `Ancient Vault` and does not specify
  that it is underground.
- ID 15427 remains uncertain: the isolated `Chaos Matter Delivery` label
  does not establish whether it names a quest, cargo, or objective.
- ID 15430 is `not an issue`: the Korean preserves the plan to wait until
  night and escape with Quintis' gem. The preliminary mention of dispelling
  a chest and selling to a `fence` is not present in this English source row;
  those candidate details were not used as evidence for an edit.
- ID 15431 remains uncertain: the warning is preserved, but Gnarsh and
  Prismere terminology need corpus alignment.
- ID 15432 is accepted: replace `병적인 만족을 얻으려 해` with
  `병적인 무언가를 증명하려는 거야`. English says the gutting is meant to
  prove a sick point, not that the speaker seeks pathological pleasure.
- ID 15434 remains uncertain: `last apprentice` may mean final or most
  recent; context is insufficient.
- ID 15436 is accepted: replace `그 사실을 모르는 이는 없을 거야` with
  `그 노력은 분명 눈에 띄었을 거야`. The former says everyone knows,
  overstating English `It has not gone unnoticed`.
- ID 15438 remains uncertain: the terse `Murghan killed` label may be an
  internal status string; agent and UI context are absent.
- ID 15442 remains uncertain: the historical account is preserved, but its
  proper names, factions, and massacre framing need lore review; it is not
  treated as independently established history.
- ID 15444 remains uncertain: Gallows' bloom and Fate essence are retained,
  but their relationship and canonical terms are unknown.
- ID 15445 remains uncertain: the mentor/champion relationship and betrayal
  are clear, but whether champion is a formal title remains open.
- ID 15447 remains uncertain: `take up` may mean assume a role or accept/wear
  a hood; English does not establish inheritance.
- ID 15449 is `not an issue`: the healing invitation is welcoming and its
  polite Korean register is supported by Japanese and Chinese.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15426 | `고대 지하 저장고 방문하기` | `고대 저장고 방문하기` | D-4734 |
| 15432 | `그자는 우릴 배를 갈라 죽이는 데서 병적인 만족을 얻으려 해. 당장 죽이지 않은 자들은 미든으로 끌고 가고.` | `그자는 우릴 배를 갈라 죽여서 병적인 무언가를 증명하려는 거야. 당장 죽이지 않은 자들은 미든으로 끌고 가고.` | D-4738 |
| 15436 | `신들이 내린 시련을 훌륭히 마쳤구나. 그 사실을 모르는 이는 없을 거야.` | `신들이 내린 시련을 훌륭히 마쳤구나. 그 노력은 분명 눈에 띄었을 거야.` | D-4740 |

## Verification

- The preliminary structural report confirms all four locales contain IDs
  15400-15449 in identical order. It records matching variable/line-break
  signatures at the survey, verse, and multiline journal rows.
- Only the accepted Korean `Texto` values at IDs 15426, 15432, and 15436
  changed. The CSV retains its UTF-8 BOM, 72,046 CRLF record endings, and 39
  pre-existing bare-LF endings.
- The active Korean `default` CSV SHA-256 is
  `24c5f98bfaa70173c6a09ba60eaa8e7d9c71c1e9e713088412e7b85a5c086c68`.
- Reversing only the approved substitutions must reproduce the preceding
  checkpoint SHA-256:
  `da996b77f76f6e88e83cb2c1da98b8d3ee300e32204144732027d3b6168dd9ed`.
- Before this batch: 598 accepted, 1,478 `not an issue`, and 2,641
  uncertain. After this batch: 601 accepted, 1,481 `not an issue`, and 2,664
  uncertain (4,746 decisions total).
- Resume at ID 15450; 49,685 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
