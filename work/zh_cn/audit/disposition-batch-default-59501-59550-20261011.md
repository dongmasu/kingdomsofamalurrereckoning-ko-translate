# Disposition Batch: `default` IDs 59501-59550

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Three accepted corrections, 35 `not an issue` IDs, and 14 uncertain
  findings. Two uncertain findings (59521 and 59538) overlap accepted
  corrections for separate unresolved terminology questions.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17849 | 59521 | `마법이 제대로 걸려 있다면 어떤 자물쇠든 열 수 있다고 알려진 대가의 곡괭이는 도둑맞을 당시 손상된 듯하다. 아리부스 엔진이 곡괭이의 마법에 간섭했을 것이다.` | `마법이 제대로 걸려 있다면 어떤 자물쇠든 열 수 있다고 알려진 달인의 자물쇠따개(Master's Pick)는 도둑맞을 당시 손상된 듯하다. 아리부스 엔진이 그 마법에 간섭했을 것이다.` | The sentence explicitly says the item opens any lock; Japanese and Chinese also identify a lockpick. Reuse the accepted `달인의 자물쇠따개(Master's Pick)` wording at D-734 and D-7086. The exact canonical possessive/title remains unsettled. |
| D-17850 | 59531 | `영리한 페이 장난꾸러기 아만이 보물 상자를 여는 열쇠 여러 개를 남겼다는 전설이 있다. 요르반의 잠긴 상자마다 맞는 열쇠를 찾아 보물을 챙겨야겠다.` | `전설적인 페이 장난꾸러기인 영리한 아만(Amman the Clever)은 보물 상자를 여는 열쇠 여러 개를 남겼다. 요르반의 잠긴 상자마다 맞는 열쇠를 찾아 내가 보물을 챙겨야겠다.` | Restore the source's direct claim that the legendary Fae trickster Amman the Clever left the keys; make the name/title parse clearly and preserve the narrator's intent to take the valuables. |
| D-17851 | 59538 | `군대를 모아 히에로판트에 전선을 가져가 전쟁을 일으킬 계획이라고 들었어... 뭐, 그런 비슷한 얘기야.` | `군대를 모아 히에로판트를 상대로 전쟁을 벌일 계획이라고 들었어... 뭐, 그런 비슷한 얘기야.` | English's `bringing a war front to` is awkward; Japanese and Chinese both read the plan as waging/declaring war against the Hierophant. Preserve the speaker's uncertainty at the end. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17852 | 59501 | The four seasonal sections, planting/harvest instructions, and 29 embedded newlines are retained; several plant, wand, and Hollow names remain provisional, and Japanese gives a different Sparrowgrass etymology than English. |
| D-17852 | 59504 | English/Chinese identify a heavy two-handed maul while Japanese says axe; Korean's maul reading is supported, but Warsworn's Korean faction spelling is unresolved. |
| D-17852 | 59508 | The exemption from ordinary rules and protection of the speaker's own group are retained; Unbound's canonical faction form remains open. |
| D-17852 | 59512 | Japanese explicitly says XP, while English and Chinese retain broader “experiences”; the Korean game-XP interpretation is plausible but not certain. |
| D-17852 | 59514 | The warning is retained, but Deep Slumber and `Reverie` may be setting-specific terms; the lower-case English wording and locale readings do not settle their relationship. |
| D-17852 | 59521 | The lockpick category is accepted above; whether the named tool should be `달인` or `장인` remains unresolved across prior decisions. |
| D-17852 | 59522 | The land/law/king contrast and freedom of movement are preserved, but Faelands and Travelers forms remain part of corpus-wide terminology reconciliation. |
| D-17852 | 59527 | The upgrade marker, hold-button instruction, and lightning attack are preserved; the canonical Korean skill name `Storm Bolt` remains unsettled. |
| D-17852 | 59530 | The speaker's earned status and reason are clear, but the identity of the Order and the formal Korean rank/title remain unresolved. |
| D-17852 | 59538 | The corrected war-against relation is accepted above; the canonical Korean title for `Hierophant` remains unresolved. |
| D-17852 | 59541 | English and Japanese retain the initials `A. S.`, while Chinese expands them to Alyn Shir; Korean preserves the primary-source initials pending context. |
| D-17852 | 59544 | The ongoing income and Argine's gratitude are retained, but the antecedent/source of “it” is unspecified across the references. |
| D-17852 | 59549 | The appointment is preserved, but whether `Centurion Rank` is a formal rank or title needs reconciliation with related uses. |
| D-17852 | 59550 | The compliment and respect are preserved; Secandra's Korean spelling requires corpus-wide consistency review. |

## Not an Issue

Decision D-17853 records these 35 IDs: 59502-59503, 59505-59507,
59509-59511, 59513, 59515-59520, 59523-59526, 59528-59529, 59532-59537,
59539-59540, 59542-59543, and 59545-59548. ID 59502 sensibly follows the
intended meaning of malformed English `was always had`; ID 59511 preserves
the +10% resistance value; ID 59528 preserves the wager variable; and ID
59501's lineation and planting sequence were checked separately above.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Rechecked the source-keyed prompts for the seasonal almanac, Bertran's
  malformed source, Warsworn/Unbound, XP, Deep Slumber/Reverie, Master's
  Pick, Storm Bolt, Amman, the Hierophant, Arden's Hut, Argine's income,
  Centurion, and Secandra. Open name/title questions remain uncertain.
- The 29 embedded newlines in the seasonal almanac are retained. The
  localized markers at 59518 and 59527, wager variable at 59528, and +10%
  value at 59511 remain in their checked positions.
- Pre-edit CSV SHA-256:
  `3b89ddb25d40a316e826f584df26ba36ca831345d86be84debb0090a34ba531b`.
- Post-edit CSV SHA-256:
  `71ec16a797ee214a868b8510de6ce9d4239f065445fbc1b75dfc19eac1e8432d`.
  Byte comparison against the backup confirms only IDs 59521, 59531, and
  59538 changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59501/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `3b89ddb25d40a316e826f584df26ba36ca831345d86be84debb0090a34ba531b`).

D-17849 through D-17851 record three accepted corrections, D-17852 records
14 uncertain findings, and D-17853 records the remaining 35 `not an issue`
IDs. Direct register totals: 1,735 accepted, 13,265 `not an issue`, and
11,328 uncertain (26,328 total); next D-17854.

Resume at `default` ID 59551; 5,584 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
