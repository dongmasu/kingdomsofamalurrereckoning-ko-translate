# Preliminary Language Scan: `default` IDs 1650-1699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1650-1699.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions and checked markup/paragraph structure.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1657 | 위로 | Confirm whether this standalone UI label means a comparative “higher” value or an upward direction. | English says `Higher`; Japanese and Chinese also describe a higher value. Korean `위로` is primarily directional (“upward”), which may be wrong if this is the high option in a game or stat comparison. | Medium |
| 1670 | ... 요툰(Jottun)만큼 키가 크고 알파르(Alfar)만큼 예리한 종족 ... | Choose a natural, context-appropriate rendering for `as keen as the Alfar`. | English says `keen`; Japanese interprets this as intelligence and Chinese as agility. Korean `예리한` can suggest sharpness rather than perceptiveness/intelligence, so the intended trait needs context. | Medium |
| 1676 | 오래 기다리게 했다면 정말 미안하오. ... 분쟁의 시대를 사는 전사라면 다 그렇소. | Reconcile the formal/male-coded Korean register with the Japanese feminine voice and the dialogue context. | English leaves the speaker's gender/register unspecified; Japanese uses feminine speech, while Korean adopts a distinctly formal masculine ending (`-하오/-소`). Confirm the character voice before choosing a register. | Medium |
| 1691 | ... 로브다. 이 갑옷은 원래 혼돈 학자의 것이었다. | Reconcile the source's `robes`/`amor` wording and keep the garment reference internally consistent. | English first says `robes` and then has the apparent typo `amor`; Japanese consistently says robes, while Chinese follows armor. Korean switches from `로브` to `갑옷`, preserving the cross-source conflict inside one description. | High |
| 1698 | 그 가문(The House)은 페이들 사이에서 권위를 누려 왔고 ... | Identify which named Fae House is meant and apply the established group-name display. | English capitalizes `The House`; Japanese says “we,” and Chinese explicitly reads it as a family/House. Korean's generic `그 가문` does not identify the faction, and the source context is needed before expanding it. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `default` questions for IDs 1654, 1655, 1659, 1666,
  and 1675. They remain open: `Pledgeshield`'s status, the antecedent of
  `They`, the meaning of `flow`, the religious/organizational sense of
  `Authority`, and the lore meaning of `the Crossing`/`Long Winter` are not
  resolved by these isolated rows.

## Other Checks

- IDs 1663 and 1670 retain their source markup and paragraph breaks; ID 1663's
  `{LINE_*}` and indexed style tokens remain in source order.
- ID 1665 preserves the Akara/Dead Kel relationship and the Exile's lair;
  ID 1666 retains Mitharu and the tomb inscription's date.
- ID 1685 follows the manual's `알마인` and `미사루`; ID 1686 distinguishes
  the named Great Cycle from ordinary cycles.
- ID 1694 preserves the threat and lieutenants; ID 1696 keeps the Temple's
  open-pit history and Kollossae attribution.
- The remaining inspected rows preserve their principal meaning and tone.
  No variables, numeric values, or line breaks were changed.

## Batch Status

IDs 1650-1699 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
