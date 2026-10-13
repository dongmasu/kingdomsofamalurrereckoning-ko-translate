# Preliminary Language Scan: `default` IDs 42601-42650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42601-42650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42602 | Rat Exit Location / `쥐 출구 위치` | Determine whether this is a debug/level-design label or player-facing UI text before finalizing its literal wording. | All versions retain a terse location label; the function is not explained in the row. | Medium |
| 42605 | House of Ballads / Sir Sagrell / `하우스 오브 발라드`, `사그렐 경` | Preserve the legend/seat succession logic and standardize the title/name forms. | Korean retains the seat remaining occupied so the great stories continue; the named House and Sir Sagrell require corpus-wide consistency. | Medium |
| 42606 | Trigger Niskaru Hunters / `니스카루 사냥꾼 유발` | Treat as a likely trigger/debug label until its function is known. | The compact label gives no player-facing context; the Korean literal rendering may not be suitable as ordinary UI. | Medium |
| 42610 | The Hierophant / `대사제` | Confirm whether this is a formal title or a named leadership role and apply the same term consistently. | Chinese reads “high priest”; Japanese uses “guide.” The English title and prior audit questions leave its setting-specific role unresolved. | Medium |
| 42611, 42632 | Hugo Bux / Hugues / `휴고 벅스`, `위그` | Preserve the distinction between Hugo and Hugues and verify both canonical Korean forms. | English has separate names, Hugo Bux and Hugues; Korean also renders them distinctly. The historical log specifically warns against conflating them. | High |
| 42613 | engraved steel band / `무늬를 새긴 강철 띠` | Check whether “band” denotes a jewelry setting/ring and keep the item subtype accurate. | English says a stone set in a steel band; Japanese agrees, while Chinese interprets it as a steel ring. Korean follows the English object term. | Medium |
| 42617 | long Arena letter / `전투라는 예술`, championship in the family | Preserve the speaker's battle-as-art metaphor, the conditional account of defeat, and the hope that the Arena/championship remain in the family. | Korean retains the letter's sequence and inheritance wish; the long passage merits integrated review for voice and clause attachment. | Medium |
| 42618 | Tome of Synthesis / Alchemy Lab / Chaos Potion / `합성의 서`, `연금술 실험실`, `혼돈 물약` | Standardize the item, station, and potion names as gameplay/lore terms. | All languages retain the same instruction; Korean localizes the book title and uses generic lab/potion terms. | Medium |
| 42620 | Battle Frenzy / `전투 광란` | Confirm the ability name and standardize the capitalization/term used for its resistance bonus. | The +8% Physical and Piercing Damage Resistance condition is preserved; the named ability's Korean form remains provisional. | Medium |
| 42622 | Faeblades / `페이블레이드` | Confirm the canonical weapon-category name and whether the phrase is a sales slogan. | English names the weapon type; Chinese translates it as spirit sword and Japanese transliterates it. Korean retains the name-like form. | Medium |
| 42623 | Sinsear / `신시어` | Verify the proper place name and avoid replacing it with an interpretive descriptive location. | Korean and Japanese transliterate the name; Chinese translates it as a fiery place. English treats Sinsear as a proper location. | Medium |
| 42626 | Alfar soldiers across the water / `바다 건너편의 알파르 병사들` | Confirm the intended body of water and preserve the Alfar group name. | English leaves the water unspecified; Chinese says across the river and Japanese/Korean say across the sea. Korean follows the sea reading. | Medium |
| 42627 | House of Vengeance / `복수의 하우스` | Confirm whether the faction name should be translated or treated consistently with other named Houses. | English and Japanese retain a formal House name; Korean translates “Vengeance” but keeps `하우스`, unlike established House-name renderings. | Medium |
| 42632 | Hugues / `위그` | Verify the canonical spelling and retain distinction from Hugo at 42611. | Korean uses a separate name form from Hugo; Japanese/Chinese also phoneticize it differently. | Medium |
| 42638 | Bloody Bones / `블러디 본즈` | Determine whether this is a character's name/title or a generic creature label before choosing transliteration. | English capitalizes the two-word form; Japanese transliterates it, while Chinese translates it literally. | Medium |
| 42640 | Hammers / `망치` | Confirm whether this is a general weapon category or specifically warhammers. | English/Japanese/Korean say hammers; Chinese specifies warhammers. The row alone does not establish the equipment category. | Low |
| 42642 | `engage you any longer` / `더는 당신과 함께하지 않기로` | Check whether the speaker is refusing further cooperation/service or simply refusing to continue an interaction. | English is broad; Japanese says no longer follow/obey, and Chinese says no longer serve. Korean interprets it as no longer accompanying the addressee. | Medium |
| 42643 | TEMP / `임시` | Confirm whether this development placeholder should remain literal rather than be localized. | English and Chinese keep `TEMP`, Japanese uses “temporary,” and Korean translates it as `임시`. Historical notes identify the label as a literal development placeholder. | Medium |
| 42647 | scavs aren't partial to intruders / `침입자를 가리지 않아` | Check the negative idiom: preserve that scavs are not fond of intruders, especially edible ones, rather than implying they accept/do not distinguish among them. | English, Japanese, and Chinese describe hostility or lack of favor; Korean's `가리지 않아` may read as indiscriminate treatment and soften the dislike. | High |

IDs 42601, 42603-42604, 42607-42609, 42612, 42614-42616, 42619, 42621,
42624-42625, 42628-42631, 42633-42637, 42639, 42641, 42644-42646, and
42648-42650 generally retain the English meaning on this first reading.
Proper names, register, and recurring terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42620-42649 were checked.
  Relevant open items include Battle Frenzy, Faeblades, Sinsear,
  House of Vengeance, Hugues/Hugo, the Fae-work ledge, Horace, Arkes,
  `TEMP`, Ice Barrage, and the scope of “messages our people sent us.”
- Historical notes confirm Hugo/Hugues should remain distinct and that
  `TEMP` is an internal placeholder; the active Korean name forms remain
  distinct, while the placeholder is localized.
- No new lore was inferred for the Alfar water crossing or the faction
  names.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42601-42650 once
  and in identical ascending order.
- Embedded line-break counts, normalized runtime marker IDs/order, and
  numeric-token sequences match across all four locales.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42601-42650 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-42601-42650-20261010.md`](disposition-batch-default-42601-42650-20261010.md).
This remains a preliminary pass, not independent linguistic approval.
Continue at `default` ID 42651.
