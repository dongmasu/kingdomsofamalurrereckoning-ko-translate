# Preliminary Language Scan: `default` IDs 53401-53450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 53401-53450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 53404 | `흉내지빠귀` / `멋들어진 지저귐` | Preserve the mockingbird comparison and the speaker's welcoming, teasing tone; check whether it is an epithet for the player. | Korean retains the bird image and fancy-chirp wordplay. English/Japanese/Chinese all support the mockingbird reference, but its personal referent is contextual. | Medium |
| 53405 | `크릴가린은 꽤 미인이지? 페이치고는` | Preserve the suggestive double sense of `toothsome` (attractive/tasty) and the speaker's self-deprecating joke. | Korean keeps the flirtatious evaluation but reduces the food/teeth pun. Chinese is literal (“tasty”) while Japanese explicitly reads “a fine woman.” | High |
| 53407 | `바게스트(고기 5개)` | Confirm the creature/item label and preserve the five-meat quantity. | All locales retain a Barghest-like name and quantity 5; Chinese and Japanese explicitly mark meat as a countable resource. | High |
| 53410 | `고대 알마인어` for `old Almain` | Verify whether `old Almain` means an older historical language/register rather than an ancient language. | Korean preserves the contrast with modern speech; Japanese and Chinese support the old-language reading but do not define its period. | Medium |
| 53413 | Red Legion / Red Legion blades / Osgar and Medgar Krast | Verify canonical faction/name spellings and whether “blades” is a specific weapon type; retain the north-of-Gorhart location and proof objective. | Korean preserves the two targets, location, defeat objective, and blades as proof. Japanese/Chinese specify daggers, while English leaves the weapon type broad. | Medium |
| 53418 | `미든의 흙 위에 누워, 이대로 세상을 떠나자` | Preserve the disarmament and surrender/death implication without overcommitting if “pass on” is figurative. | English and Chinese support laying down arms, lying on the Midden's soil, and passing on; Japanese instead says to wait there. Korean resolves “pass on” as death, a plausible but contextual reading. | High |
| 53419 | `에테네 ... 그분` | Confirm Ethene as the shrine's deity/referent and preserve the wager-like inference that Anokatos keeps secrets with Her. | Korean retains the reverential capitalization and inference. Japanese/Chinese likewise personify or feminize the deity; identity and shrine lore remain open. | Medium |
| 53422 | `참새들(The Sparrows)` | Determine whether `the Sparrows` is a named group or literal sparrows and standardize its display form. | English capitalizes the group name; Japanese uses quotation marks and Chinese says sparrows. Korean preserves both Korean meaning and English traceability. | Medium |
| 53424 | `세상에서 가장 위대한 노래` | Preserve the shared purpose, defiance of the past, rewriting of the future, and “greatest song” fate metaphor. | Korean retains the argument and metaphor. Japanese/Chinese support the poetic reading; whether “song” is literal, artistic, or a fate metaphor needs lore context. | Medium |
| 53428 | `훔쳐 감` for `Stolen Off` | Verify whether this is a UI/status label and whether Korean should be a state label rather than an action phrase. | Korean conveys that an item was stolen, but the isolated label does not establish its interface function or preferred grammatical form. | Medium |
| 53429 | `여러 계절 동안` | Preserve that the barrier served for many seasons and that magic is declining everywhere; check whether “seasons” is literal or a long-period idiom. | Korean follows the source literally and retains the contrast. Japanese says a long time, while Chinese omits the duration, leaving its intended scale open. | Medium |
| 53437 | `너희 족속` / `자기 모습에만 정신이 팔려` | Preserve the insulting address to “your lot,” the traits, and the correction that this is about clinging to the past, not the prisoners. | Korean retains the hostile tone and distinction. Japanese omits or shifts the group reference; English/Chinese support addressing a group directly. | High |
| 53439 | `새 운명 ({1}/{2})` | Preserve both placeholders and record the locale-specific order/format exception; confirm whether the display should use “of” semantics or a fraction-like slash. | English and Korean order `{1}` then `{2}`; Japanese and Chinese order `{2}` then `{1}`. All retain the same marker identities, while Korean renders the relationship with `/`. | High |
| 53441 | `재빠른 종족` for `quickling` | Confirm `Quickling` as a species/name and decide whether to retain a proper-name form rather than the descriptive “quick race.” | English and Chinese treat it as a named creature type; Japanese interprets it as “short-lived one.” Korean preserves the speed idea but makes it generic. | Medium |
| 53444 | `성 오드윅 영구 선교회(St. Odwig's Perpetual Mission)` | Confirm the institution/place name and the meaning of “Perpetual Mission”; distinguish it from a monastery, mission society, or ongoing religious mission. | Korean follows the English name literally. Japanese calls it a perpetual monastery and Chinese an eternal preaching mission, so the institution type remains unresolved. | Medium |
| 53446 | `물리 지속 피해 [사용 금지]` | Determine whether this is an unused/debug label and whether its recognizable technical form `DoT` should be retained. | English labels it `Physical DoT [DO NOT USE]`; all locales localize some or all of the label and warning. The warning is preserved, but this appears to be non-player-facing content. | Medium |
| 53450 | `옛 고어하트` / `고향이었던 곳` | Preserve the speaker's affectionate connection and immediate self-correction that Gorhart used to be home. | Korean retains the beer, home, and correction. The locale references agree on the wistful reversal. | High |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Crilgarin, Barghest,
Almain, Red Legion, Eventide, Midden, Ethene, Anokatos, the Sparrows, Cape
Solace, Freeman, Dreamworld, Quickling, Klurikon, Brother Til, and St.
Odwig's Perpetual Mission.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries titled `default` IDs
  53350-53449 and 53450-53549. The first flags the mockingbird address
  (53404), Crilgarin's suggestive `toothsome` line (53405), the possible
  death euphemism (53418), Ethene/Anokatos (53419), the Sparrows (53422),
  the “greatest song” metaphor (53424), `Stolen Off` (53428), the group
  reference (53437), placeholder order (53439), Quickling (53441), and
  the mission/DoT labels (53444, 53446).
- The second historical entry cites Brother Til's books and St. Odwig's
  Perpetual Mission at ID 53544. Active English ID 53444 contains that
  books/mission objective; active ID 53544 instead says “My friend and
  champion, how may I ever repay you?” The historical reference is
  misaligned with the active source key. It is preserved here, without
  altering the archived audit.
- At 53439 the Korean follows English marker order, while Japanese and
  Chinese reverse the two placeholder identities. The actual `{1}` and
  `{2}` identities are retained in all locales.
- The historical source-keyed entry flags `Physical DoT [DO NOT USE]` at
  53446; the active source-keyed row confirms the exact label and warning.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 53401-53450 once
  and in identical ascending order.
- Physical line-break counts match. Runtime marker identities match except
  for the documented `{1}`/`{2}` order variation at 53439. The bracketed
  `DO NOT USE` text at 53446 is a localized diagnostic label, not treated
  as a runtime token. No hidden format/control characters were detected.
- The five-meat quantity at 53407, ten-troll comparison at 53436, and
  placeholder identities at 53439 are preserved. At 53439, English/Korean
  use `{1}` then `{2}`, while Japanese/Chinese use `{2}` then `{1}`.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 53401-53450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 53451.
