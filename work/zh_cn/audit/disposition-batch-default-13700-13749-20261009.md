# Disposition and Edit Batch: `default` IDs 13700-13749

- Decision date: 2026-10-09.
- Scope: all 12 candidates in the preliminary report and the carried
  historical question at ID 13708.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Twelve new questions received dispositions: one accepted, four `not an
  issue`, and seven uncertain.
- The previously accepted correction D-006 at ID 13727 was verified in the
  active CSV and reconciled; it is not a new disposition or count.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13702 is `not an issue`: English `Father`, Japanese `神官`, and Chinese
  `神父` support the Korean priest address `신부님`. `교단` is a reasonable
  rendering of the Order's rites; the formal institution name remains
  unidentified, but no Korean meaning defect is established.
- ID 13708 is `not an issue`: `Pombero` is preserved identically in all
  source locales and Korean. Retaining the source's Latin spelling avoids an
  unsupported pronunciation choice.
- ID 13711 remains uncertain: the isolated `Murghan killed` fragment does
  not identify its UI function or settle the creature's name.
- ID 13712 is `not an issue`: “west and north of town” is reasonably
  condensed to `마을 북서쪽`, also supported by Chinese. The diary retains
  the source paragraph breaks and darkly comic progression.
- ID 13715 is accepted: revise `회피 특수 공격` to
  `회피 후 사용할 수 있는 특수 공격` so the unlocked attacks' relation to
  Dodge is explicit. The `{*1}` marker, weapon names, and line break remain.
- ID 13717 remains uncertain: locale phonetics differ and do not establish
  the Korean spelling of Cach Cranwyn.
- ID 13724 remains uncertain: the quest sequence is preserved, but Ost
  Ordura, Brigand Hall Caverns, and the lore relation to the Niskaru need
  cross-entry context.
- ID 13727 is reconciled with existing decision D-006: the active Korean
  already says `말리온(Mallion)의 병상 곁에서 대부분의 시간을 보내`,
  restoring the subject supported by English `She`, Japanese context, and
  Chinese `她`. No additional edit or disposition is counted.
- ID 13730 remains uncertain: all entries, quantities, shipment states, dates,
  and 54 embedded line breaks are preserved, but mine-office and workforce
  terminology needs glossary/context review.
- ID 13731 remains uncertain: `his telling` could mean Hallam's performance,
  recitation, or stories; this isolated line does not decide which.
- ID 13739 remains uncertain: English's capitalized `Grounds` conflicts with
  Japanese's courtyard and Chinese's academy reading; destination identity
  is unresolved.
- ID 13748 is `not an issue`: Korean preserves the speaker's self-exile and
  distinguishes it from the broader Alfar family/clan banishment custom.
- ID 13749 remains uncertain: English `staff`, Japanese `臣下`, and Chinese
  `员工` differ in scope; `식솔` may include dependants beyond staff.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13715 | `단검과 페이블레이드의 회피 특수 공격을 해금합니다.` | `단검과 페이블레이드로 회피 후 사용할 수 있는 특수 공격을 해금합니다.` | D-4070 |

## Verification

- The preliminary structural audit found all 50 IDs in identical ascending
  order across English, Japanese, Chinese, and Korean. Record line breaks
  match, including ID 13712 (12), ID 13715 (1), and ID 13730 (54); runtime
  token signatures match after normalizing localized marker contents.
- Only the approved Korean `Texto` cell at ID 13715 was changed in this batch.
  Existing D-006 at ID 13727 was verified but not edited.
- Before this batch: 552 accepted, 1,310 `not an issue`, and 2,203 uncertain.
  After this batch: 553 accepted, 1,314 `not an issue`, and 2,210 uncertain
  (4,077 dispositions total; D-006 is already included).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edit is
  `5d11e2a50a98bacc8d6e4897ce5a9c0e347c4fcd0e3ce7c37149064ea4743348`.
- The generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects. The preliminary
  line-by-line key/order and structural checks were retained.
- Resume at ID 13750; 51,385 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
