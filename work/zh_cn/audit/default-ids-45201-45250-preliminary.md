# Preliminary Language Scan: `default` IDs 45201-45250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45201-45250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45206 | Lux / Codex of Order / aegis / `룩스` / `질서의 서` / `마법 방패` | Confirm whether Lux is a named source/place and whether `aegis` is best represented as a shield/ward; standardize Codex terminology. | Korean preserves the magical shield, warm golden light, summer dawn, and Codex reference. The source has a trailing U+00A0; Chinese has the same trailing character, while Japanese/Korean do not. | Medium |
| 45207 | portents / “telling” / `불길한 징조` | Preserve the omen/portent meaning and standardize House of Sorrows terminology. | Korean says the House is full of ominous signs rather than sorrow and that the player's arrival reveals how dark the age has become. The historical log asks whether “telling” is an omen/portent. | Medium |
| 45211 | Hospitalis Quarters / Abblier / petition board | Confirm the location name and the custodian's title; retain the donation, return, and reward sequence. | Korean preserves the merchants' donations, return to the medical quarters, petition-board custodian, and reward. Other locales use differing generic hospital-area names and transliterations. | Medium |
| 45213 | Offering / `봉헌식` | Confirm whether this capitalized event is a formal rite and why Quay attends; standardize Quay's name. | Korean asks why old Quay came to the offering ceremony. Japanese/Chinese also read it as an offering/sacrifice; the formal event status remains open. | Medium |
| 45215 | Detect Hidden / `은신 감지` | Confirm the canonical skill name and whether `by 3` denotes three points or levels. | Korean preserves a temporary +3. Japanese interprets it as three levels; Chinese says three points. The source does not specify the unit. | Medium |
| 45222 | fence / `장물아비` | Preserve the criminal resale meaning and confirm the Travelers' formal group name. | Korean correctly names a fence as a buyer of stolen items; Japanese/Chinese support the criminal sense. English capitalizes Travelers, while Korean calls them travelers. | Medium |
| 45230 | Last Breath / Executioner legacy | Retain the armor inheritance, the mother's title, access to the secret lair, and the choice between continuing or creating a legacy. | Korean preserves the full sequence and distinguishes the armor's name from its mother's vigilante title. The historical log leaves their relationship/terminology for glossary review. | Medium |
| 45232 | MERCANTILE / `상업` | Confirm whether this is a skill/menu heading and standardize it as a UI label rather than generic commerce. | English presents the label in all caps. Korean gives a short category term; Japanese uses “business acumen” and Chinese “trade.” | Medium |
| 45236 | high security area / `고경계 구역` | Confirm the intended security classification and use a natural, consistent Korean UI/location term. | Korean says a “high-alert/high-boundary area,” which may not clearly mean a high-security area. The objective to free Agarth is preserved. | Medium |
| 45237 | Sentinel of the House of Pride / `용맹의 가문 수호자` | Confirm and standardize the formal title and House name. | Korean preserves finding a way past a guardian but renders Sentinel descriptively. Japanese uses a watcher; Chinese uses a sentinel. | Medium |
| 45239 | Silkfarmer remains / `비단 재배자의 유해` | Confirm the occupation/itemized remains term and retain the recent spider-attack cause and proper burial objective. | Korean preserves the remains, likely spider-attack victim, other possible remains, and burial. Chinese has an apparent typo and Japanese/Chinese use different occupation terms. | Medium |
| 45240 | “I... I felt it was my duty” / `... 내 의무라고` | Preserve the speaker's hesitation/stutter if it is intentional voice rather than a pause only. | English repeats “I” after the hesitation; Korean keeps the pause but not the repeated subject. Japanese/Chinese also rephrase the hesitation. | Low |
| 45242 | “meant to be your last mission” / `네 마지막 임무였잖아` | Follow the English claim that this was meant to be the final mission; retain the warning that Moon Camp will not help now. | Korean matches English. Japanese adds that the player was sent to a place of death, which is unsupported by English; the historical log specifically says to follow the English meaning. | High |
| 45244 | Cadsymyr Witch Knight / `카즈시미르의 최고 마녀 기사` | Confirm the title/territory form and clarify the English appositive without adding a gender or role implication. | Korean identifies the speaker as Gadflow's subordinate and highest Witch Knight of Cadsymyr, then says actions define him. Name forms and syntax vary across locales. | Medium |

IDs 45201-45205, 45208-45210, 45212, 45214, 45216-45221, 45223-45229,
45231, 45233-45235, 45238, 45240-45241, 45243, and 45245-45250 generally
retain the English meaning on this first reading. Names, setting terms, and
UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 45150-45349 were checked for
  the House of Sorrows, Lux/aegis, “telling,” Hospitalis Quarters, Offering,
  Detect Hidden, criminal fencing, Last Breath/Executioner, Mercantile,
  Sentinel, silkfarmer remains, the final-mission statement, and Cadsymyr
  Witch Knight.
- The historical log specifically says to follow English at ID 45242 rather
  than Japanese's added death-sentence implication; preserve the +3 value at
  45215; and clarify the area/title terms at 45232, 45236-45237, and 45244.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45201-45250 once
  and in identical ascending order.
- ID 45215 retains the +3 value in all locales. No line breaks or runtime
  markers were found in this range.
- ID 45206 has a trailing U+00A0 in English and Chinese only; the Korean and
  Japanese values do not contain it. No other hidden formatting character or
  numeric discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45201-45250 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45201-45250-20261010.md`](disposition-batch-default-45201-45250-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45251.
