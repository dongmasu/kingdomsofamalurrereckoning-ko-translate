# Preliminary Language Scan: `default` IDs 45651-45700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45651-45700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45655 | `The Tithes that Bind` / `결속의 십일조` | Confirm the established/formal title and whether `Tithes` is a religious levy rather than a generic donation. | The English title is capitalized and suggests a binding tithe; Japanese and Chinese render it as a contribution/charity, while Korean keeps the binding element. | Medium |
| 45656 | Frost Trap damage / `냉기 피해`, `빙결 피해` | Verify that Ice Damage and Freezing Damage are distinct game damage types and use consistent UI terminology. | Korean retains 40 Ice, 10 Freezing, 4 seconds, and 30 mana. Chinese places the duration before the damage values; English, Japanese, and Korean use damage-first order. | Medium |
| 45661 | `Sorcery Destiny` / `마법 운명` | Standardize the Destiny and Sorcery labels with the game's established ability/UI terminology. | English presents both as named game concepts; Japanese transliterates them, while Chinese and Korean translate them. The gameplay instruction is retained. | Medium |
| 45670 | Kollossae ideological division / `콜로사이 사람들은 사상 때문에 분열` | Confirm the group name and preserve that the Kollossae were divided in ideology when the player arrived in Idylla. | Korean and Chinese explicitly retain ideological division and the subsequent rescue; place and people spellings vary across locales. | Medium |
| 45673 | Relentless Assault / `무자비한 강습` | Standardize the ability name while retaining the “while active” condition. | English capitalizes the named ability; the Korean condition is clear, but the name should match other occurrences. | Medium |
| 45674 | `Brother` / `형제여` | Determine whether Brother is a religious title, kinship address, or ordinary vocative, and align register with the speaker. | English and Chinese include the address; Japanese omits it. Korean preserves it in a formal sentence. | Medium |
| 45676 | Witch Knight Myrna / Prismere Chantry | Confirm the established forms for Witch Knight and Chantry and preserve both objectives: defeat Myrna and destroy the Chantry. | Korean retains both required actions and the possessive relationship. The rank, institution, and Prismere spelling remain glossary questions. | Medium |
| 45677 | `{1}` confirmation prompt | Retain the control token and verify the Korean particle around it in the rendered UI. | All locales retain `{1}` in the confirm instruction. The Korean follows the source action and keeps the variable intact. | Medium |
| 45681 | Brutal/Precise/Arcane Weaponry | Standardize all three ability labels and distinguish “invest in abilities” from merely possessing the weapons. | Korean correctly describes investing in abilities to unlock special attacks; translated ability names remain consistency candidates. | Medium |
| 45688 | `Director of Business Development` / `사업 개발 이사` | Confirm the intended corporate/job-title rank and canonical Korean rendering. | The isolated English title is untranslated in Japanese and translated in Chinese/Korean; there is no context to establish the organization's hierarchy. | Medium |
| 45690 | `your grace` / `각하` | Check the honorific against the addressee's rank and the project's register conventions. | English uses a formal address; Japanese uses a lord/noble honorific and Chinese a general respectful title. `각하` may be rank-specific. | Medium |
| 45695 | `Aye?` / `그래?` | Confirm whether this is agreement, a question, or a dialectal attention response from surrounding dialogue. | The isolated English fragment is ambiguous; Japanese reads as a transition/acknowledgment and Chinese as surprise. | Medium |
| 45697 | `while parrying` / `막기 중` | Distinguish a parry from a generic block using the game's Korean combat terminology. | English names the specific action `parrying`; Chinese also uses a generic block reading, while the Korean may not distinguish the mechanic. | Medium |
| 45698 | Wulflac casualty notice | Review formal Korean letter register, names, military affiliation, and all paragraph separators. | Korean preserves the condolence, service location, death in battle, closing, and signature. The six line breaks/blank paragraphs are retained in all locales. | Medium |
| 45700 | `Cynoc's Eye` / `사이녹의 눈` | Confirm canonical spelling and whether this is a formal artifact/quest-object name. | The objective is clear; Japanese and Chinese transliterate Cynoc differently, while Korean has no parenthetical English spelling. | Medium |

IDs 45651-45654, 45657-45660, 45662-45672, 45675, 45678-45680,
45682-45687, 45689, 45691-45694, 45696, and 45699 generally retain the
English meaning on this first reading. Names and setting terminology remain
subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries for IDs 45650-45749.
  Relevant questions include Nil Kern, Amman, Allestar/Idylla/Kollossae,
  Bronwen Senn, Witch Knight Myrna, Prince Bran/Icebrine Coast,
  Gadflow/Necro Crystal, Fridrik Arnarsson, Eventide, and Cynoc's Eye.
- The historical notes specifically identify the title, damage-type,
  ability-name, rank, and honorific questions at 45655-45656, 45661,
  45673, 45677, 45681, 45688, and 45697; these remain unresolved candidates.
- ID 45698 is a formal casualty letter; its layout was compared across all
  four locales without changing or completing the text.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45651-45700 once
  and in identical ascending order.
- All four locales preserve matching line-break counts, including the
  paragraph layout of ID 45698.
- ID 45656 retains 40 Ice Damage, 10 Freezing Damage, 4 seconds, and 30 mana.
  Chinese lists the duration before the damage values; Korean follows the
  English/Japanese damage-first sequence. No value is missing or changed.
- Runtime-marker identities/order and special whitespace match; no hidden
  formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45651-45700 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45651-45700-20261010.md`](disposition-batch-default-45651-45700-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45701.
