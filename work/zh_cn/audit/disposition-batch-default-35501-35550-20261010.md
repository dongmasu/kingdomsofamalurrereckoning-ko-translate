# Disposition Batch: `default` IDs 35501-35550

- Decision date: 2026-10-10.
- Scope: all 50 IDs; reconciled the preliminary scan with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  values, markers, and structure.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, eleven `not an issue`, and nine uncertain.
- CSV change: ID 35516.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35501 | Ancient Delfric | Uncertain: the English title/name is retained, but prior D-097, D-6082, and D-8395 leave `Ancient` unresolved as age, rank, or other title. Do not infer a Korean rank from the Japanese general or Chinese elder reading. |
| 35503 | Dueling `second` / Rose-of-Shadows | Uncertain: the assigned duel role and sword-point action are retained; whether `second` is an attendant and whether Rose-of-Shadows is a substance or named item need scene context. |
| 35506-35507 | Lyria address / Oleander's fame joke | Not an issue: 35506 follows the English question rather than the Japanese prayer, and 35507 preserves the source's self-interrupting fame joke and names. |
| 35508 | `greater good` of the gnomes | Not an issue: `민족 전체의 대의` preserves the collective interest and the speaker's personal risk without narrowing the source's rhetorical phrase. |
| 35512 | House of Pride / Dren | Uncertain: the account of Dren guarding the House and ordering the group away is clear, but prior audit decisions leave the canonical Korean form and institution status of House of Pride unresolved. |
| 35513 | Skill-point UI markers and ordering | Not an issue: localized grammar places `{1}` before `{*1기술}`, while English places the emphasized skill label before `{1}`. The sentence relation, marker identities/counts, and `{2}` upgrade action are preserved; no runtime value was reordered or removed. |
| 35515 | Henge / Teeth of Naros | Uncertain: the travel function and destination are clear, but prior Henge decisions leave the structure's type and canonical Korean name open. |
| 35516 | Reserve Armory access | Accepted: change `예비 무기고도 보여 주고 싶군` to `예비 무기고를 이용할 수 있게 해주고 싶군`. English explicitly offers access; showing or guiding someone through the armory is narrower. Japanese's tour-like reading does not override the English meaning. |
| 35519-35520 | Ost fragment / Bridgette's sacrifice | Not an issue: the interrupted question and unresolved clause at 35519 remain unfinished as in English; 35520 preserves the sacrifice, beneficiaries, and the speaker's remembrance of his wife as strong. |
| 35523 | Witch Knight officers and Gask | Uncertain: the two officers, Gask, and liberation objective remain in the correct sequence; canonical rank terminology remains unsettled across prior audit entries. |
| 35525 | Battle Frenzy values and Mana cost | Uncertain: the first-kill `+10%`, second consecutive-kill `+20%`, reset timing, line breaks, and sustained `30%` Mana cost are retained. Whether the Mana basis is maximum or current remains unresolved; do not add a basis from Japanese alone. |
| 35529 | Tyr Magnus / Champion title | Not an issue: the comparison with his father and contrast between making money and defending his title are preserved. `티르 마그누스` is a plausible rendering; locale spelling differences alone do not establish an error. |
| 35530 | Crown of the Sun / replacement Keepers | Not an issue: the destination, Pura's training of replacement Keepers, and challenge are retained. No row-local meaning error is supported. |
| 35531-35533 | Warsworn Keep / Summer Faelands / Wild Fae | Uncertain: the leader, count of three Keeps, conditional future Keep, provoking force, and boot protection are preserved; faction, place, and species spellings remain glossary questions. |
| 35537-35538 | Mudhold Fasting / Whispering Witch / survey quarry | Uncertain: the agreement, escape condition, location, and target-as-quarry reading are retained. Proper-name forms and the exact named location need cross-corpus alignment. |
| 35540 | Stealth-kill labels | Not an issue: the successful stealth kill and the Daggers/Faeblades enabling the attacks are retained; all three `{*1...}` markup spans remain present. |
| 35543 | Nyxaros account and trailing fragment | Not an issue: the speaker's judgment that the person did not deserve the observed fate and the deliberately unfinished final clause are both retained. |
| 35545 | Ancient objects / Ametair | Uncertain: the objects' age and inferred value are preserved; the antecedent and canonical Ametair spelling remain open. |
| 35549-35550 | High/Low card result / Prophet and fold | Not an issue: choosing Low, drawing a four, losing because it is High, and bringing freedom-seekers into the group are conveyed. |
| Remaining ordinary text in IDs 35501-35550 | Dialogue, labels, names, values, markers, and structure | Not an issue: the other 29 IDs were checked against all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- D-097, D-6082, D-8395, and the recent First Sword decision preserve
  unresolved rank/title terminology; this batch does not promote a locale
  interpretation to a canonical Korean term.
- The House of Pride, Henge, Witch Knight, Summer Faelands, and personal-name
  forms remain glossary/context questions.
- The 35513 token-order difference is a localization-order exception, not a
  missing or changed runtime marker.

## Verification

- English, Japanese, Chinese, and active Korean rows for IDs 35501-35550
  were checked; keys and row order are unchanged.
- ID 35525's embedded line breaks and values are unchanged. Runtime marker
  identities and counts are retained, including the localized order at 35513.
- Only the approved Korean `Texto` at ID 35516 changed. UTF-8 BOM, 72,046
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35551; 29,584 `default` IDs remain through 65134.
