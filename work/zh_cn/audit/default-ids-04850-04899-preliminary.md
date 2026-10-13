# Preliminary Language Scan: `default` IDs 4850-4899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4850-4899.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked meaning, names,
  UI text, line layout, and terminology.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4850 | 이 도시의 지도자들인 템플러는 서로 뜻이 맞지 않아. 각자 충성을 바치는 대상도 다르고, 목적도 서로 충돌하지. 네가 그들 사이에 끼어든 모양이야. | Preserve the awkward apposition `our leadership, the Templars` and clarify whose allegiances conflict. | English/Japanese/Chinese identify the Templars as the city's leadership and describe competing allegiances/motives. Korean conveys this but `지도자들인 템플러` and `목적도 서로 충돌하지` merit a readability check. | Medium |
| 4854 | 저 뒤에 누가 있는지 알면 놀랄걸. 진짜 지독한 범죄자들이야... 아마도. 대부분은 그냥 피란민처럼 보이는데, 누가 범죄자인지 어떻게 알겠어? | Preserve the speaker's uncertainty about the people “back there” without turning the suspicion into a fact. | English explicitly qualifies `real, hardened criminals... I think` and questions how to distinguish them from refugees. Korean keeps `아마도` and the uncertainty, though the location/referent of `back there` remains context-dependent. | Medium |
| 4862 | 마을 사람들이 기이한 상황에서 사라진다는 예비 보고는 과장이 아니었습니다. 몇몇 피해자가 집에서 끌려갔으며, 폭력의 흔적은 엄청난 힘을 지닌 포식자의 소행임을 가리킵니다. 몸싸움의 흔적을 감추려는 노력은 거의 없었지만, 굴로 이어지는 흔적은 사실상 전혀 없습니다.\n\n특히 패트릭 모칸(Patrick Morkan)이라는 신사가 제 관심을 끌었습니다. 마을 사람들을 모두 면담했는데, 실종 사건에 아무런 우려도 보이지 않은 사람은 그뿐이었습니다. 희박한 단서지만, 현재로선 제가 가진 전부입니다. 더 알아내는 대로 다시 편지를 보내겠습니다.\n\n수습 마법사 레르카라 펠(Adept Lerkara Fel) | Keep the predator as a tentative inference and standardize the rank `Adept`. | English says the violence points to a powerful predator but does not identify it. Korean preserves that inference and all paragraph breaks. `Adept` is rendered differently from nearby uses (`수행자`, `수습생`), so the formal-rank term needs corpus-wide review. | Medium |
| 4868 | 그들은 세상에서 가장 강력한 조직을 이루고 있지. 필멸자 종족들이 분쟁에 휘말린 지금은 특히 그래. 두 번째 봄이 오고 있어. 내 말을 기억해. | Clarify what `body` means and whether `a second spring` is literal or prophetic. | English and Chinese allow an organization/political body reading; Japanese calls it a powerful group. All references retain the “second spring” prophecy. Korean's `조직` is plausible but not definitive. | Medium |
| 4872 | 우리는 그들을 해방했어. 남녀를 가리지 않고, 알파르와 인간을 가리지 않고 말이야. 그들을 벨렌(Belen)에게, 그분의 낙원으로 데려다주었지. | Preserve the unsettling euphemism that the speaker calls killing “liberation” and delivering people to paradise. | English/Japanese/Chinese all describe the same euphemistic religious claim. Korean retains both the euphemism and the deity's honorific. | Medium |
| 4876 | 그리고 조언 하나 하자면, 이 땅에는 야생 이븐루트(Evenroot) 변종이 있어. 방금 이 나무에 한 것처럼 물을 주면 쓸 만한 보상을 얻을지도 몰라. | Confirm the established plant name and whether `variant` refers to a plant or sapling. | English/Japanese/Chinese describe a wild Evenroot variant that can be watered for a reward. Korean calls it a variant and preserves the conditional reward; `이 나무` may over-specify its form. | Medium |
| 4885 | 비무장 전투가 부모 항목 | Treat `Unarmed Fighter Parent` as a possible internal asset/UI label; do not silently rewrite it as player-facing prose. | All references preserve a fragment with `Parent`; the intended UI use is unknown. Korean's literal `부모 항목` is awkward but may reflect a developer label. | Medium |
| 4886 | 말수가 적은 사람이지만, 마법물품 제작대 앞에서는 솜씨가 뛰어나. | Preserve `Sagecrafter's table` as a workstation and use the official Korean `Sagecraft` terminology. | English and Japanese explicitly refer to a crafting table/workbench; Korean correctly interprets it as a station rather than a literal dining table and matches the manual's `마법물품 제작` term. | Low |
| 4887 | 당신의 {*1inventory}가 가득 차 더는 아이템을 소지할 수 없습니다.{LINE_SPACE}상인에게 아이템을 {*1selling}하거나 잡동사니 화면에서 아이템을 {*1destroying}해 보세요. | Localize the visible labels inside indexed spans while preserving the span markers and order. | English labels are `inventory`, `selling`, and `destroying`; Japanese and Chinese translate those visible labels inside the same markers. Korean leaves all three visible English words untranslated. `{*1...}` marker identities, `{LINE_SPACE}`, and order are preserved. | High |
| 4890 | 그것을 찾아 처치하고, 그 몸에서 코라 꽃잎(Kora Petal)을 뽑아내. | Clarify what `its vessel` refers to before settling on `body`. | English leaves the vessel's identity unstated; Japanese/Chinese interpret it as the creature's body. Korean follows that likely reading while the quest object/context remains unresolved. | Medium |
| 4892 | 떠오르는 태양을 향한 신성한 맹세와 함께,\n사랑의 영원한 물결이 가까이 흐르네;\n만족과 꿀처럼 달콤한 진실이 흐르는 작은 시내,\n이슬 맺힌 골짜기의 꽃향기처럼\n부푼 열기를 애처로이 견디고,\n시간과 의심을 지나 마침내,\n우연의 법정에 선 하늘의 배심원처럼\n한때 닥쳐오던 악을 내어놓네;\n사랑, 그중에서도 더없이 신성하고 아름다운 사랑:\n나의 믿음인 벨메이드 여왕의 기억,\n내 마음과 의지, 부드럽게 가라앉히는 바람,\n엎드린 대지처럼, 나무의 품처럼,\n나는 기꺼이 맞으리. 벨메이드를 기억하네. | Review the poem's difficult metaphors, lineation, and final sentence while preserving all 12 source line breaks. | English/Japanese/Chinese diverge on several opaque images, including the “heavens jury” and “once impending evil.” Korean preserves the poem's line count but some phrases remain difficult to parse (`부푼 열기`, `악을 내어놓네`, `엎드린 대지`). | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4850, 4854, 4862,
  4868, 4872, 4876, 4885-4886, 4890, and 4892 against active Korean and
  matching source rows.
- Same-numbered historical questions for `base` and `affix` remain separate;
  no cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Control-marker sequences and explicit line-break counts match the English
  rows in all three references and active Korean.
- No active CSV structure or text was changed.

## Batch Status

IDs 4850-4899 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
