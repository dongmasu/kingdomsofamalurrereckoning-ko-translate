# Preliminary Language Scan: `default` IDs 9250-9299

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9250-9299.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9250 | `Agarth` → `아가스(Agarth)` | Keep the English spelling traceable and align the Korean name with other Agarth occurrences. | Japanese reads `アガース`, Chinese `阿加斯`, and the active Korean follows the established provisional `아가스` form. Cross-row spelling remains a terminology check. | Medium |
| 9251 | `sacrifice at each one` → `각 제단에 제물을 바친 뒤` | Confirm that “each one” refers to the previously named altars and that the reward-location divination is retained. | English is elliptical; Japanese/Chinese specify each altar. Korean makes the referent explicit, likely from context, and preserves the promised divination. | Medium |
| 9255 | Infections/ailments at Mel Senshir | Preserve that the speaker has seen many infections and ailments and that they were common in the trenches and on the walls; retain the speaker's experienced, matter-of-fact tone. | Korean keeps both the broad experience and Mel Senshir setting. The source's distinction between infections and ailments is compressed to repeated illness, but the core claim remains. | Medium |
| 9264 | Clena's letter / `fluffed and rigid master` / `Prickly Bear` | Preserve the flirtatious, sexually suggestive voice and the bedpost/lock metaphors; clarify the ambiguous master-description without flattening the innuendo. | Korean retains the sexual subtext, longing, hired-blade contrast, and affectionate nickname. Japanese likewise reads “fluffy and strict master”; exact meaning remains uncertain. The ten embedded line breaks and paragraph structure are preserved. | Medium |
| 9265 | Hugues / Allestar Tower / Agarth | Align the Korean spellings for Hugues, Allestar Tower, and Agarth with earlier quest records. | Korean uses `휴그`, `알레스타`, and `아가스`; these are recognizable but vary from other transliterations/older notes. The quest sequence and Hugues' decoy role are retained. | Medium |
| 9272 | Capitalized `The Font` → `원천(The Font)` | Treat as a named magical source/location unless context establishes otherwise; preserve the speaker's dismissive reaction to the claim that it will dry up. | Japanese calls it Ysa's spring, Chinese a sacred spring, and Korean retains the English name alongside “source.” This matches the earlier open question at ID 9163. | Medium |
| 9273 | `beckoned by Ethene` → `에테네가 부른 선택받은 자` | Align Ethene's name and the setting-specific `Beckoned` status with related rows; preserve the rumor/recognition tone. | All references describe a person called/chosen by Ethene. Korean makes both the divine caller and chosen status explicit; the name remains provisional. | Medium |
| 9279 | Wild Fae / Revival refuge camp / sacred domain | Confirm whether `wild Fae` is a faction/category and preserve that the curse was lifted from the grove flora, not necessarily the entire grove. | Korean retains Orla's assistance, the grove's curse, and the hope that the Fae will not retaliate for intrusion into sacred land. | Medium |
| 9283 | `POI Marker` → `관심 지점 마커` | Verify the game's UI expansion and preferred Korean label for POI. | English/Japanese/Chinese retain the abbreviation `POI`; Korean expands it to “point of interest.” The exact UI category is not settled by this label alone. | Medium |
| 9286 | `free of this all` / tomb / candle | Preserve the malformed/incomplete source phrase and both goals—escape the situation and reclaim the candle—without inventing the curse mechanism. | English is ungrammatical; Japanese reads “free of this curse,” Chinese “escape all this,” and Korean retains the broader “all this.” The tomb/candle relationship remains unknown. | Medium |
| 9287 | Capitalized `the Flowering` → `개화` | Determine whether this names a ritual/event (possibly `개화의 의식`) rather than generic flowering; preserve that the item is a gift. | Japanese explicitly calls it a flowering ceremony, while English and Chinese are less specific. Korean uses generic `개화의 선물`. | Medium |
| 9288 | Capitalized `the Cycle` → `순환` | Align this named Fae rebirth/life cycle with `Great Cycle` terminology and verify the persuasion that Alleia return to it. | Korean retains that Alleia is to return to the Cycle, but does not mark the capitalized concept as a proper term. The historical audit identifies it as a setting-specific cycle. | Medium |
| 9292 | `{*1curse}` / `{*1healer}` | Preserve both localized marker wrappers and confirm the established Korean service/NPC term for `healer`. | Korean retains both `{*1...}` tokens in source order and communicates the cure instruction. No token loss was found. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9264-9265, 9272-9273, 9279,
  9283, 9286-9288, and 9292 against the active rows.
- Confirmed ID 9264's ten embedded line breaks and paragraph structure and
  ID 9292's two localized markers; these structural checks do not approve
  the wording.
- Added or refreshed terminology/context questions for IDs 9250-9251 and
  9255.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. The
  ten embedded breaks at ID 9264 match all four.
- Runtime-marker IDs/order and other control tokens match; ID 9292 preserves
  `{*1curse}` and `{*1healer}` in the same order.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9250-9299 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
