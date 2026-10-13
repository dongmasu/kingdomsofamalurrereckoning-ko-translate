# Preliminary Language Scan: `default` IDs 13550-13599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13550-13599.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13550 | `Motus takeover` -> `모투스의 인수` | Clarify whether this was a hostile takeover, a business acquisition, or another seizure before implying intent. | English and Japanese use takeover; Korean's `인수` is a neutral acquisition. Historical question remains open. | Medium |
| 13551 | `the Sidhe` -> `시드헤(Sidhe)` | Determine whether Sidhe is a people, realm, or place and align its Korean form with established usage. | This row uses `시드헤`, while other active occurrences use `시드(Sidhe)`; the semantic distinction may explain the variants, but is not established here. Historical question remains open. | High |
| 13553 | localized inline markers / repair categories | Preserve each highlighted marker and the `LINE_SPACE` marker in order; confirm the established damaged/broken item terms. | The three `{*1...}` labels are localized, but their marker classes/order match all locales; `{LINE_SPACE}` is present once in the same position. | Low |
| 13554 | Tuatha in `my house` / Witch Knight Myrna | Clarify whether “my house” is a literal home, a palace, or a Fae House/faction. | English says “my house”; Japanese says palace and Chinese says family. Korean chooses `내 집`, which may be too literal without scene context. | Medium |
| 13556 | `Faer` | Preserve the source spelling and confirm pronunciation only with contextual evidence. | The name is isolated and all locales retain `Faer`. Historical question remains open. | Low |
| 13557 | `The Offering begins` -> `봉헌 의식이 시작된다` | Determine whether Offering is a named rite/event or a literal offering. | Korean interprets it as a devotional ritual; English/Japanese/Chinese leave the nature of the offering open. Historical question remains open. | Medium |
| 13559 | `Niskaru Outbreak` -> `니스카루 창궐` | Confirm whether this is an invasion/infestation label rather than a disease outbreak. | Korean's `창궐` remains broad enough for an outbreak of creatures. Historical question remains open. | Medium |
| 13562 | Anokatos / Silent Choir / Nyxaros / monastic retreat | Verify all lore names and determine whether the retreat is a monastery, refuge, or hideout. | Korean retains the names and describes a monastery retreat in the wilderness. Historical question remains open. | Medium |
| 13572 | Bleeding-resistance recipe / ingredient amounts | Preserve all four line breaks, reagent names, order, and quantities `2, 2, 1`. | English, Japanese, Chinese, and Korean each retain four embedded line breaks and the same ingredient counts. | Low |
| 13573 | `harbor wall` / locks and gears | Determine whether this mechanism is a harbor gate/lock system rather than a literal wall. | Korean calls it an `항구 방벽`; Japanese renders a large harbor gate and Chinese describes a harbor wall made of locks and gears. The mechanical referent needs context. | Medium |
| 13574 | houses / Pride / Valor / Fae | Confirm the formal House names and whether the sentence means the Fae cannot leave/pass from this world or cannot disappear from it. | Korean says the Fae will not disappear from the world and uses `긍지`/`용맹`; the source's “pass from this world” is ambiguous. Historical question remains open. | Medium |
| 13583 | Cult of Belen | Verify the cult's established Korean name and Belen spelling. | Korean uses `베렌 교단`; capitalization identifies it as a named cult. Historical question remains open. | Medium |
| 13587 | `The light, stolen! Stolen from my side!` | Determine whether “light” is literal or a person/entity; retain the repeated distressed phrasing until context resolves it. | Korean preserves the repetition and first-person proximity. Historical question remains open. | Medium |
| 13592 | Lupoku -> `로포쿠` | Preserve the established deity spelling. | Korean matches the predominant active-corpus form `로포쿠(Lopoku)`. | Low |
| 13595 | Adath Skoria / Cynric / tyrenium quarry | Verify the names and whether tyrenium is a material name or a place-derived term. | Korean retains the three source terms with parenthetical English where available. Historical question remains open. | Medium |
| 13596 | Lords of Valor -> `용맹의 군주단` | Confirm the faction/team name and whether “joining” means a quest objective or formal membership. | Korean renders Lords of Valor as `용맹의 군주단`; compare with the established House of Valor form. Historical question remains open. | Medium |
| 13598 | Abergawein Residence -> `아버게인 저택` | Verify the proper-name spelling and whether this is a house, estate, or residential district. | Korean chooses a mansion/estate reading; context may identify the residence type. Historical question remains open. | Medium |
| 13599 | `family arms` -> `가문의 문장` | Determine whether this means a heraldic coat of arms or a family heirloom weapon before deciding the Korean sense. | English is ambiguous; Japanese and Chinese render it as a family/heirloom weapon, while Korean chooses the heraldic `문장`. | High |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 13550-13551, 13556-13557, 13559,
  13562, 13574, 13583, 13587, and 13595-13596, 13598 against active Korean
  and all three source locales. They remain preliminary questions; no
  historical disposition was treated as approval.
- Added current-pass candidates at ID 13554 (`my house` versus palace/House),
  ID 13573 (harbor wall/gate mechanism), and ID 13599 (heraldic arms versus
  family weapon).
- IDs 13553 and 13576 contain localized `{*1...}` text. Marker class/order
  matches; ID 13553 also preserves one `{LINE_SPACE}` marker.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range. ID 13572
  contains the only embedded line breaks: four in every locale.
- Brace, dollar, and hash-token signatures match after normalizing the
  localized contents of `{*1...}` markers; no marker-order exception was
  found.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13550-13599 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13600-13649.
