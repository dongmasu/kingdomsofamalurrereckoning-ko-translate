# SQ100 / Esha Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 97 `default` keys found in `1313479.quest_bxml` (`SQ100`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ100`, the asset-level symbol
`NPC_ALA_UNS_Esha`, and 55 serialized `dialog_line_*` handlers. Its text
concerns Esha, Bareth's research into the murghan, Eventide and Ashmoor
survivors, Gask, and the Twilight Pass.

All 97 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map keys to individual callbacks, speakers, branches, addressees, or
playback positions. The Esha symbol therefore does not establish that Esha
speaks every dialogue-like row. The group also contains character/location
labels, quest titles, and short player-response text.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV. `candidate` means an editor decision is warranted; `uncertain` preserves
an unresolved reading rather than proposing a speculative correction.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `15745`, `25806` | Terminology / meaning | The same `Eventide clan` is rendered as `이븐타이드 부족(Eventide clan)` at `15745` and `이븐타이드(Eventide) 가문 ... 일족` at `25806`; other rows in this asset use `이븐타이드(Eventide) 일족`. Japanese uses `一族`. Consider using `이븐타이드(Eventide) 일족` for the group. At `25806`, English says Eventide was `a clan of the highest regard`; Japanese explicitly says it was one of the most respected clans. Preserve that relation with `가장 존경받는 일족 가운데 하나였어`, rather than making it sound uniquely the most respected. | High |
| `46978` | Name pairing | `Cadsymyr` is translated as `카드시미르` without its English name. The established spelling is `카드시미르(Cadsymyr)` elsewhere, including the related SQ102 text. Add the pairing only, preserving the source-supported sentence and tone. | High |
| `52699` | Meaning / tone | English says `a mere Child of Dust such as you`, and Japanese likewise has `ただの`. The current active Korean `너 같은 먼지의 아이` omits this dismissive qualifier. Consider `어쩌면... 너처럼 하찮은 먼지의 아이(Child of Dust)가 그를 쓰러뜨릴 수도 있겠어.` The prior November 6 typo correction is not being reopened; this finding is against the current active row, whose wording differs from that earlier snapshot. | Medium-high |
| `9719` | Name pairing | `Child of Dust` is used as a direct address, but Korean `먼지의 아이여` omits the English pairing. The same term is paired elsewhere in this group. Consider `먼지의 아이(Child of Dust)여`, preserving the rest of the sentence. | High |

The prior hold at `40051` remains unresolved: English says Gask inflicted evil
“here,” while Japanese describes a calamity brought to this land. The existing
Korean follows the English location without establishing whether the action
was confined to that exact place. Retain the hold; do not apply the earlier
proposal changing `이곳에` to `이곳에서`.

Other prior questions were reconciled against the active rows. The current
`Eventide` spelling is consistent at `40721`; `37976`'s `여름 가문` reading
is supported by the Japanese and Chinese family/clan readings, so the
capitalized English `Summer Houses` alone is not treated as proof of a formal
faction title. `4593`'s `다른 ... 생존자들이 오는지 살펴볼게` is compatible
with English `look out for` and Japanese waiting for other survivors; the
Chinese search wording does not establish a Korean error. The prior
corrections at `52699` (particle) and `61659` (softening “little use” rather
than “no use”) are reflected in their earlier reviewed wording; only the
current `52699` nuance described above is proposed. The meaning and tone at
`8195` were retained in the prior independent verification and remain
acceptable here.

Seven groups of identical English full strings occur within the asset:
`Ordo` (`124`, `2479`, `4822`, `6670`, `9892`), `Gask` (`1355`, `3234`),
`Eventide` (`16459`, `18890`, `35752`), `I am forever grateful`
(`18714`, `61952`), `Twilight Pass` (`26607`, `28283`, `29960`, `32142`),
`Esha's Errand` (`40840`, `45667`), and `Bareth` (`57377`, `59204`, `61706`,
`64108`). All seven groups have identical Korean text within each group. No
majority-based normalization is proposed.

The other 91 rows showed no clearly supported correction in this pass. Across
the four locales, the 97 rows have no embedded line breaks, runtime
placeholders, or markup.

## Coverage and Limits

All 97 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. Five correction
candidates and one unresolved finding are recorded with four-language source
fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`124`, `641`, `1176`, `1340`, `1355`, `1996`, `2114`, `2479`, `3234`,
`3769`, `3814`, `4593`, `4822`, `5157`, `6228`, `6670`, `7452`, `8195`,
`9460`, `9692`, `9719`, `9892`, `10382`, `10691`, `10843`, `11027`,
`12650`, `14354`, `15745`, `16046`, `16140`, `16351`, `16459`, `18090`,
`18714`, `18722`, `18890`, `19366`, `19835`, `20604`, `22020`, `22138`,
`24515`, `25806`, `26166`, `26206`, `26607`, `27460`, `28060`, `28283`,
`29960`, `30555`, `30955`, `31575`, `31660`, `32142`, `32754`, `35629`,
`35752`, `36058`, `36961`, `37036`, `37976`, `40051`, `40348`, `40721`,
`40840`, `41498`, `42985`, `43078`, `43615`, `44160`, `45079`, `45667`,
`46295`, `46690`, `46978`, `47265`, `49371`, `49393`, `50593`, `50717`,
`52699`, `52823`, `57377`, `57481`, `58102`, `59204`, `61493`, `61659`,
`61702`, `61706`, `61952`, `62123`, `62530`, `64108`, `64489`.
