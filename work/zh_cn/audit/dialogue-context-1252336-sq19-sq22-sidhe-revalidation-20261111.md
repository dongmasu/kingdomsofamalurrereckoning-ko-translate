# `SQ19` / `SQ22` Sidhe and Vorm Lodge Revalidation

- Date: 2026-11-11.
- Scope: all 156 `default` IDs linked to `1252336.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Fourteen correction-candidate IDs and one evidence-limited proper-name hold
  are recorded. The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest IDs `SQ19` and `SQ22`, four NPC symbols
(`NPC_DAL_LJO_LucaSoren`, `NPC_DAL_VAR_ArhausVorm`,
`NPC_DAL_VAR_GunnarFrode`, and `NPC_DAL_VAR_SihtricVorm`), 101 serialized
`dialog_line_*` handlers, and 156 distinct localization keys. The handler
names use the `Sidhe_NQD` prefix; both that prefix and the explicit quest IDs
are retained as separate asset-level evidence. The keys have not been mapped
to individual callbacks. The multi-quest, multi-NPC association does not
establish a speaker, branch, or playback order for any row; those remain
unassigned or unknown.

The text covers the two Vorm brothers and their lodge, Luca Soren's recovery
from a Thresh attack, the Sidhe and its creatures, the Travelers, and
lodging-related exchanges. All 156 rows were compared across English,
Japanese, Chinese, and active Korean. They include dialogue, names, and
short labels; asset association alone does not make every row spoken dialogue.

There are 17 groups of identical English source text, covering 43 rows. Every
such group already has identical Korean text. No reviewed row has an embedded
line break or markup. The two rows containing
`$Sidhe_NQD.m_inn_cost$` preserve the token exactly in Korean.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `789`, `31733`, `50572`, `54557` | Meaning / terminology / format | `Vorm` is the brothers' family name, but the rows currently use `보름스(Vorms)족`, `봄 형제`, `보름(Vorm) 가문`, and `워름(Vorms)들`. The source and related entries identify the Vorm brothers/family, not a people or species. Standardize the surname as `보름`; render the group as `보름 가문` or `보름 형제` according to each sentence, and include the corresponding English name consistently. | High |
| `9152` | Speech level / naturalness | One sentence shifts from the formal plain ending `같았다` to conversational `변했어` / `일이지`. Japanese keeps a consistent plain conversational voice. Use one register throughout, for example `아득한 옛날에는 달렌타스(Dalentarth) 전역이 지금의 시드(Sidhe)와 같았어. 하지만 세상은 변했지... 이상한 일이지.` | High |
| `3052`, `31081`, `29779`, `30408`, `56700`, `63118` | Speech level / naturalness | Endings such as `믿기지 않는군`, `놀랍군`, `신기하군`, `쾌적하군`, `것 같군`, and `돌아왔군` sound stiffer than the corresponding Japanese conversational lines; `56700` and `63118` also switch immediately to casual speech in the next sentence. Recast these locally in natural conversational Korean without inferring a shared speaker. | Medium |
| `32713` | Naturalness | `a brownie attached firmly to his ass` is rendered as a brownie being “찰싹 붙인 채,” which is understandable but awkward and loses the clear biting image in Japanese. Prefer a natural description such as `브라우니(Brownie) 한 마리한테 엉덩이를 꽉 물린 채`. | High |
| `38818` | Meaning / terminology / format | This is another direct address to the `Child of Dust`, but it uses `먼지의 자손` while the same asset's comparable addresses at `2426` and `38399` use `먼지의 아이`; it also omits the English pairing. Align the term and pairing with the chosen project form for this epithet. | High |
| `43557` | Format / terminology | The source capitalizes `Fae Hollows of Dalentarth`; Korean renders the phrase as `달렌타스(Dalentarth)의 페이(Fae) 동굴`. It may be a named category of locations rather than one unique place, so whether to add the full phrase pairing (for example, `페이 동굴(Fae Hollows)`) remains uncertain. Do not force a singular place-name reading. | Medium; hold on proper-name status |
| `58975` | Meaning | Korean calls the Thresh a `마법 생물`, adding “magical”; English says only dangerous creatures and describes them as demented trees, while Japanese and Chinese likewise do not add that property. Remove the unsupported modifier, e.g. `위험한 생물이라고 들었어. 면도날처럼 날카로운 가지가 달린 광기 어린 나무라더군.` | High |

The `Vorm` finding is limited to the family-name uses in this group. A
corpus search also found different forms outside this asset, including
`보름(Vorms)` at `36790` and other `Vorm` family references; those IDs remain
outside this asset's reviewed set and should be handled when their own context
groups are reviewed.

## Complete Reviewed ID Set

`79`, `128`, `467`, `789`, `1206`, `1549`, `2269`, `2385`, `2426`, `2908`,
`3052`, `3427`, `3600`, `3806`, `4812`, `5284`, `5553`, `5634`, `5976`,
`6276`, `6477`, `6667`, `6877`, `7058`, `7603`, `7647`, `8999`, `9152`,
`10677`, `10958`, `11171`, `11253`, `11590`, `12181`, `12329`, `12968`,
`13369`, `13419`, `13603`, `13696`, `14049`, `14080`, `14393`, `14458`,
`14668`, `14836`, `15663`, `16193`, `16458`, `16648`, `18715`, `19461`,
`20820`, `21562`, `21939`, `22250`, `22911`, `23246`, `23424`, `23534`,
`23701`, `23982`, `24479`, `24789`, `25889`, `26001`, `26447`, `27231`,
`28080`, `29779`, `29997`, `30352`, `30382`, `30408`, `30626`, `30803`,
`30919`, `31023`, `31081`, `31733`, `31842`, `32520`, `32695`, `32713`,
`33072`, `33270`, `33568`, `33973`, `33974`, `34791`, `36092`, `36270`,
`36984`, `37045`, `37438`, `38255`, `38260`, `38342`, `38399`, `38805`,
`38818`, `38987`, `39555`, `40061`, `40684`, `41060`, `41239`, `42227`,
`43557`, `43736`, `43763`, `44072`, `44135`, `44337`, `45151`, `46181`,
`46502`, `46895`, `47212`, `47946`, `48559`, `48610`, `48667`, `49055`,
`50092`, `50467`, `50478`, `50572`, `51220`, `51777`, `52445`, `54557`,
`55309`, `55822`, `55836`, `56700`, `57446`, `57505`, `57791`, `58081`,
`58173`, `58975`, `60517`, `60584`, `60726`, `61356`, `61601`, `61638`,
`62377`, `62865`, `63118`, `64055`, `64609`, `64637`, `64778`, `64804`.

All 156 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
