# Preliminary Language Scan: `default` IDs 5150-5199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5150-5199.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled applicable historical questions and checked meaning, names,
  tone, markup, and line breaks.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5152 | 도슨트 아우그라 테넷(Docent Augra Tenet) | Determine whether `Docent` is an academic rank/title or a museum-guide role; choose a Korean title after confirming the speaker's affiliation. | English and Chinese use `Docent` as a title; Japanese calls the character a mentor. The Korean transliteration does not establish the role. | Medium |
| 5153 | 네가 선택했어. 시녀에게는 챔피언이 한 명뿐이야. | Confirm `The Maid` as the Windemere title and `Champion` as a formal House of Ballads role; the first sentence may mean the addressee has been chosen rather than made a choice. | English says “You have chosen,” while Japanese says the addressee was chosen. The Korean follows English literally. All sources establish that the Maid has only one Champion. | Medium |
| 5154 | 하프웨이 핼리발트(Half Way Halibalt) | Preserve the source spelling while determining whether `Half Way Halibalt` is a deliberate pun. | English and Chinese retain the unusual phrase; Japanese writes it phonetically as a name. The intended pronunciation/wordplay remains unclear. | Low |
| 5155 | ...첫 번째 시련인 의심의 제단(Altar of Doubt)에 도전해. | Verify whether `first circle` is a trial stage, a magical circle, or a named division; retain `Altar of Doubt` as the location/name pending context. | English says “circle,” Japanese calls it a magical circle, and Chinese suggests a cycle/round. Korean chooses “trial,” which is plausible but not established. | Medium |
| 5157 | ...트와일라이트 패스(Twilight Pass)에는 머건(murghan)이 숨을 만한 구석이 많으니, 뛰어들기 전에 잘 살펴봐... | Standardize the creature term `murghan` and check whether “look before you leap” is literal movement advice or a general caution. | All sources identify hiding places for the creatures. Korean preserves the caution; the historical audit also flags the creature's Korean form and number handling. | Medium |
| 5160 | 난 고어하트(Gorhart)의 간수야. 형편없는 간수지만. | Confirm whether `Warden of Gorhart` means a prison guard or a settlement's appointed warden. | English names Gorhart, while Japanese uses a general guard term and Chinese uses a prison warden. Korean selects a jailer, which may be too narrow for a town office. | Medium |
| 5165 | ...너희 같은 종족이 필멸자의 삶을 사는 데 필요한 시설이 있어... | Preserve the distinction between the addressee's kind and mortals, while checking whether “your kind” means species, Fae, or another group. | English/Japanese/Chinese all distinguish the addressee's kind from mortal life. Korean makes the species reading explicit; context is needed to confirm it. | Medium |
| 5171 | ...우리가 기리는 슬픔과 무너진 자존심, 마땅한 복수를 위해서. 그가 슬픔의 집(House of Sorrows)을 전쟁에 이용하게 둘 수는 없어. | Keep the parallel faction rhetoric and confirm that the capitalized `House` is specifically the House of Sorrows. | English uses `House` in the final clause; Japanese says “this house,” and Chinese reads it as a family. Korean names the House of Sorrows, a supported contextual inference that should be checked against the scene. | Medium |
| 5182 | 그건 내 거야! | Check whether this is a simple ownership claim or a sharper reaction to theft; Japanese's phrasing implies “that's someone else's property.” | English/Chinese say “That's mine”; Japanese emphasizes that it belongs to someone. The Korean follows the direct English sense; delivery depends on the scene. | Low |
| 5184 | ...어깨 위에 머리가 하나뿐인 사람을 보니 반갑네. | Preserve the literal multi-headed-creature joke alongside the idiom about sanity; maintain the character's dry humor. | English, Japanese, and Chinese all retain the one-head image. Korean preserves it, though “사람” may be less apt if the speaker addresses a nonhuman creature. | Medium |
| 5186 | 차크람 사용법을 숙달해 피해를 높이고 강력한 새 공격을 해금하세요. | Rephrase `unlocking powerful new attacks` in natural Korean UI language and confirm the project's preferred Chakram term. | English/Japanese/Chinese describe mastery increasing damage and granting new attacks. `공격을 해금하세요` is understandable but sounds like a literal game-system calque; the formal imperative register is also distinct from nearby tutorial text. | High |
| 5193 | ...아이템을 {*1crafted}했습니다.{LINE_SPACE}이제 {*1inventory}에 들어 있습니다. | Translate the visible labels inside the `*1` wrappers while preserving wrapper IDs/order and `{LINE_SPACE}`; check whether “it” should explicitly be the crafted item. | All three language references localize the visible labels, keeping the same wrapper IDs and control marker. Active Korean leaves `crafted` and `inventory` in English. | High |
| 5195 | ...준비도 안 된 채 집안의 고난을 겪게 할 시간은 없어. | Determine whether capitalized `House` denotes a Fae house/faction rather than a household; avoid reducing the political/institutional sense to generic family hardship. | English capitalizes `House`; Japanese says the group's problems and Chinese explicitly says family struggles. Korean uses `집안`, which may sound domestic and understate the factional meaning. | Medium |
| 5197 | 은신 중 미인지 NPC의 시야 범위가 15% 감소합니다. | Confirm that the stat reduces unaware NPCs' vision range, rather than reducing the player's chance of being detected. | English says `Sight range on unaware NPCs`; Japanese/Chinese also assign the reduced sight to the NPCs. Korean preserves that reading, the percentage, and the stealth condition. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 5152-5155, 5157, 5165, 5171,
  5184, 5186, 5193, and 5197 against the active Korean and matching sources.
- Same-numbered questions for other resource types were kept separate.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts match across all four locales for every row.
- No control-marker or runtime-wrapper identity/order mismatch was found.
- No active CSV structure or text was changed.

## Batch Status

IDs 5150-5199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
