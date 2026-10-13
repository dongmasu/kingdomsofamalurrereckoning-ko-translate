# Disposition Batch: `default` IDs 37151-37200

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, ten `not an issue`, and eleven uncertain.
- CSV changes already present and verified: IDs 37154, 37156, and 37157.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37152 | `RadialProgressBar` / `방사형 진행률 표시줄` | Uncertain: English is a camel-cased identifier while Japanese/Chinese describe a circular progress gauge. Whether this is player-facing UI or a developer label is unresolved; do not normalize it without resource context. |
| 37153 | Beckoned address | Not an issue: the established `부름받은 자` form and urgent instruction are retained in polite register. |
| 37154 | Age-neutral `brother` / `동생` | Accepted: change `동생과 나는` to `형제와 나는`; English does not specify relative age, and Japanese/Chinese conflict on younger versus older brother. Remove the unsupported age inference. |
| 37155 | `Brigands Quarter` / `도적 지구` | Uncertain: Korean follows the English label, but Japanese identifies Aiten Prison and Chinese a bandit camp. The location conflict needs game context; do not replace the English-grounded form speculatively. |
| 37156 | `Blast my beard!` / `수염 폭발할 일이` | Accepted: change the awkward literal calque to `이런, 젠장!`; all three references convey an exclamation/curse. Preserve the miners' condition and the two sites returning to operation. |
| 37157 | `amiable king` / `다루기 쉬운 왕` | Accepted: change to `우호적인 왕`, which matches the friendly/amiable meaning in English, Japanese, and Chinese rather than suggesting a king who is easy to control. |
| 37159 | Exposure / city of whispers | Not an issue: the ironic reversal and Adessa rumor-network image remain. |
| 37160 | `$SQ120.gift_cost$` | Not an issue: the exact runtime variable and gold-cost context are preserved. |
| 37161 | Three Swords / legendary blade | Uncertain: English and Japanese make Three Swords a name/epithet, while Chinese can imply a set of three swords. Korean preserves both the name and one-blade reading; the referent remains unresolved. |
| 37163 | Cradle of Summer / long autumn | Not an issue: the source of Fae magic, preservation failure, decline, and seasonal metaphor are retained. |
| 37167-37168 | Gwyn Anwy / Culn fields | Uncertain: the hardship, bandit danger, and starvation are preserved, but canonical personal/place-name spellings need alignment. |
| 37170-37171 | Gravehal Keep / Berenike's Camp | Not an issue: Korean preserves the distinction between keep and camp and uses established Gravehal spelling; no supported row-local correction is established. |
| 37172-37173 | Unsocket action / 100% health siphon | Not an issue: the equipment target is clear and the exact 100% value/effect are retained. |
| 37179 | Summer Fae / magical right / Halcyor | Uncertain: the political or natural-entitlement sense of “magical right” and Halcyor's canonical spelling remain open; Korean preserves the claim and attempted correction of balance. |
| 37181 | Champion “is no more” | Uncertain: English euphemism conflicts in nuance with Japanese disappearance and Chinese absence; Korean does not settle death versus departure. |
| 37184 | Fatesworn / `페이트스원` | Uncertain: the faction/title meaning is clear, but the corpus has unresolved competing Korean forms; do not apply a local or global spelling change here. |
| 37186 | `two-fighter handicap` | Uncertain: English is ambiguous between facing two fighters and fighting as a pair; Korean explicitly selects two opponents, while Japanese describes a two-person disadvantage. |
| 37187 | Great collection / Hallam the White / Fae Cairns | Not an issue: commissioning, Hallam's role in creating the collection, and his crafting of the Cairns are retained; the broad Korean `장서` reading is plausible in context. |
| 37189 | `Stowaway` objective | Uncertain: English/Chinese say Stowaway, while Japanese alone specifies a troll. Korean follows the English person/title reading; creature identity needs context. |
| 37193 | Souldeep Fasting / Offering | Uncertain: Japanese and Chinese identify a passage, while the English compound may be a name or source anomaly. Korean follows the passage reading; location and ritual naming need context. |
| 37195 | Report “it” / `그 일` | Not an issue: the antecedent remains unspecified, as in the sources; generic `그 일` avoids inventing a referent. |
| 37197 | Poor/needy share / future generations | Not an issue: the denial of harmful intent and the speaker's limited means reserved for descendants remain. |
| 37199 | `Disable Sprite` | Uncertain: this may be a developer/debug control or player-facing label, and Chinese's fairy reading differs from the technical English/Japanese sprite reading. Keep unchanged pending resource context. |
| Other rows in IDs 37151-37200 | Dialogue, names, values, objectives, and labels | Not an issue: remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Source-keyed questions at IDs 37154-37163, 37167-37172, 37179,
  37181, 37184, 37186-37189, 37193, 37195, and 37199 were checked against
  all four locale rows and the grouped historical entry for IDs 37000-37199.
- Existing questions about Fatesworn and Three Swords elsewhere in the
  register were retained as unresolved terminology/context issues; no
  corpus-wide replacement was made.
- The three accepted corrections were already present in the active CSV
  when this batch resumed. Their previous/current text and rationale are
  recorded in the edit addendum.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37151-37200 once and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match; `$SQ120.gift_cost$` at 37160 and the 100% value at 37173 are
  preserved.
- Only active Korean `Texto` cells at IDs 37154, 37156, and 37157 differ
  from the preceding checkpoint's recorded text.
- The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
  are preserved.

## Checkpoint

Disposition is complete through ID 37200. Resume at ID 37201; 27,934
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37201-37250-preliminary.md`. The next unused decision ID is
D-12056.
