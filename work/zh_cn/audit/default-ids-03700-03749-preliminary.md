# Preliminary Language Scan: `default` IDs 3700-3749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3700-3749.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions by resource type and checked names,
  dialogue register, lore terms, UI values, and control markers.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3701 | 화이트스톤(Whitestone)의 에스윈(Eswin) 시장과 일하면서, 그가 스코리아(Skoria) 광산 가문의 소유인 광산을 빼앗으려 한다는 걸 알게 됐다. | Clarify whether `Skoria mining family` is a family, a mining house/company, or both. | English says the mine belongs to the Skoria mining family; Japanese calls it the Skoria family mine and Chinese calls it the Skoria mining family. Korean preserves the basic relation but the family/company category remains uncertain. | Medium |
| 3706 | 데시데루스 트라브(Desiderus Trav)의 아리아드(Ariad)에서 검객으로 시작했지만, 사람을 죽이는 일은 도저히 못 하겠더군. 치유사를 도우며 지냈는데, 그도 사라졌어. | Confirm whether `Ariad` is a unit/organization and whether the Healer's aid disappeared or died. | English says `he's gone`; Japanese reads missing, while Chinese says dead. Korean follows Japanese with “disappeared,” which is plausible but not certain. | Medium |
| 3707 | 냄새와 그림자가 깃든 이 숲은 사냥하기 좋다. 두 발로 걷는 몸으로는 잠복도, 사냥도 할 수 없다. 피를 갈구하는 마음은... 고통스럽다. | Preserve the nonhuman speaker's unusual `two-legs` self-description and the wood's smell/shadow imagery without flattening the voice. | English is deliberately nonstandard; Japanese and Chinese keep the two-legged perspective. Korean retains it, though `두 발로 걷는 몸` is explanatory rather than a compact in-world term. | Medium |
| 3721 | 결속이 필요하면 내가 해 줄게. | Identify whether `binding` means bookbinding, magical binding, or another service. | English is isolated; Japanese says sealing/warding, while Chinese reads bookbinding. Korean `결속` remains broad but may sound abstract. | Medium |
| 3724 | 가입하러 왔나? 후원자 같아 보이진 않는데. | Clarify whether `patron` means customer, sponsor, or member of the organization. | English contrasts joining with looking like a patron/customer; Japanese calls the person a job requester and Chinese a customer. Korean's `후원자` can suggest a financial sponsor, while the first clause already means joining. | Medium |
| 3726 | 선교회(Mission)의 진짜 정체를 밝히도록 도와줘. 그들은 우리의 생각을 가둬 영원히 못 나가게 하려 해. 하지만 명심해. 네 정신만은 갇혀선 안 돼! | Confirm whether `the Mission` is a named religious institution and preserve the “prison of ideas” metaphor. | Japanese identifies a monastery and Chinese a preaching institution; English capitalizes `Mission`. Korean uses `선교회`, which may imply evangelism rather than the specific institution. The metaphor and warning remain. | Medium |
| 3731 | `{*1[Upgrade]}` | Confirm whether the localized marker label should remain English or follow the localized Japanese form. | English and active Korean use `Upgrade`; Japanese localizes the marker label. Preserve the marker identity and order whichever display policy is chosen. | Low |
| 3732 | 하이페리언(Hyperian)의 비극으로 죽은 전임자와 비교하면 아노카토스(Anokatos)는 정말 비밀이 많은 사람이야. | Ensure the comparison clearly says Anokatos is more secretive than his predecessor, who died in the Hyperian tragedy. | English and Chinese support that relation. Korean retains it, but `전임자와 비교하면` can initially attach the death phrase ambiguously; the sentence is worth a naturalness pass. | Medium |
| 3742 | 상황 파악 좀 해, 친구. 네가 그렇게 멍청하지만 않았어도 불쌍한 넝마 수집꾼들을 편히 죽게 내버려 뒀을 텐데. | Check whether `rag-pickers` means scavengers rather than people who specifically collect rags. | Japanese says poor beggars and Chinese says scavengers; English literally says rag-pickers. Korean is literal and may sound like a distinct occupation, despite the insult's broader scavenger sense. | Medium |
| 3744 | 저장 데이터가 손상되어 덮어쓸 수 없습니다. 다시 시도하거나 취소하시겠습니까? 아니면 저장을 비활성화한 채 계속하시겠습니까? | No meaning issue found; verify all three choices remain visible and ordered in the UI. | English has retry, cancel, or continue with saving disabled. Korean preserves all three choices and the corrupted-save reason. | Low |
| 3749 | 거대한 순환(Great Cycle)이 분쟁을 요구한다면, 파괴가 뒤따를 거야. | Align `Great Cycle` with its established Korean lore term and capitalization policy. | English capitalizes the concept; Japanese uses a quoted “Great Cycle,” Chinese has “Great Cycle,” and Korean preserves the English name parenthetically. The semantic relation is retained. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3701, 3705-3708, 3712,
  3716, 3718, 3721, 3724, 3726, 3734, 3736, 3742, and 3749 against active
  Korean and matching source rows.
- Same-numbered historical questions for `base` items (including IDs 3703,
  3708, 3714, 3716, 3723, and 3729) remain separate from these `default`
  rows; no cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- ID 3740 retains the source's two damage values (800 and 110) and line break.
- ID 3731 retains `{*1...}`; no token structure was edited.
- IDs 3700-3749 map to the same active `default` IDs; no CSV structure changed.

## Batch Status

IDs 3700-3749 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
