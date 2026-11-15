# Sequential `default` Revalidation: IDs `25750`-`25999`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 66 existing ledger records and added 184 previously unrecorded
  IDs. Twenty-one new correction-candidate IDs and two evidence-limited holds
  were recorded.
- Retained five existing correction-candidate IDs and two existing holds.
  ID `25777` remains both a pairing candidate and a terminology hold; the
  separate holds at `25766` and `25871` are new.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `25752` | Format / naturalness | English `It would be... enthralling.` and Japanese retain an audible hesitation; Korean `매혹적이겠군.` removes it. Preserve the pause, e.g. `정말... 매혹적이겠군.` without changing the tentative tone. | Medium |
| `25758` | Name / format | The displayed title is `Tenets of Augur`, but the Korean pairs only `Augur` in `예언자(Augur)의 교리`. Pair the complete title, e.g. `예언자의 교리(Tenets of Augur)`. | Medium |
| `25778` | Title / format | `History of Aodh` is a displayed title, while Korean pairs only the name `Aodh`. Consider `아오드의 역사(History of Aodh)`. | Medium |
| `25814` | Item title / format | The full named item `Ring of Ludicrous Speed` is rendered only as `말도 안 되게 빠른 반지`. Pair the complete item name. | Medium-high |
| `25822` | Title / format | The displayed title `The Broken Crown` has no English pairing. Consider `부서진 왕관(The Broken Crown)`. | Medium |
| `25823` | Name / title format | `Maire, Queen of Cups` is rendered as `컵의 여왕 메어(Maire)`, leaving the English epithet unpaired. Pair the complete name and title, e.g. `컵의 여왕 메어(Maire, Queen of Cups)`. | Medium-high |
| `25826` | Book title / format | The book title `Common Trading Practices` is translated without its English title. Consider `일반적인 교역 관행(Common Trading Practices)`. The source's `appesr` typo is not a Korean-text issue and is left untouched. | Medium-high |
| `25840` | Naturalness / terminology | `루체른과 상호작용했다!` is a technical-sounding calque. Japanese describes using the lucern; consider a natural UI message such as `루체른(Lucern)을 사용했습니다!`, subject to the game's exact interaction action. | Medium |
| `25852` | Name / title format | The English display name is `Savant Raina Njorn`, but Korean pairs only the personal name. Pair title and name together, e.g. `사반트 라이나 노른(Savant Raina Njorn)`. | High |
| `25856` | Name / format | The named place `Basilica Noscere` is rendered `바실리카 노스케레` without its English form. Add the complete pairing. | Medium-high |
| `25885` | Meaning | English says the heart was acquired for Anker; Japanese says it was brought back for him. Korean `가져다줬다` can state that it was delivered to him, an event not established by those sources. Consider `앵커 에드뮤어(Anker Edmure)를 위해 ... 심장을 구했다`. | Medium-high |
| `25896` | Name / format | `the Warren` is a named location, but the Korean leaves `워런` unpaired. Consider `워런(The Warren)` while retaining the generic `트롤(Troll)` reference. | Medium-high |
| `25898` | Title / format | The displayed title `Principle of Harmony` is translated without an English pairing. Consider `조화의 원리(Principle of Harmony)`. | Medium |
| `25912` | Meaning / naturalness | Japanese explicitly describes the weather as nice (`今日はいい天気だね`); Korean `오늘 참 아름다운 날이군` sounds literary and describes the day rather than the weather. Consider `오늘 날씨 참 좋네.` | High |
| `25915` | Format | The Korean entry has three embedded line breaks, while English, Japanese, and Chinese each have four. It combines two source lines; restore the five-line layout without changing the confession's meaning. | High |
| `25925` | Naturalness / tone | `가엾은 행렬이군` is an awkward collocation for the people in a caravan, and `놈들이` adds contempt not present in Japanese. Recast the opening around `참 안됐군. 난 그들의 이야기를 믿어` and keep the later warning firm but sympathetic. | Medium-high |
| `25926` | Naturalness | `좋은 저녁.` is incomplete as a Korean greeting. Japanese and Chinese support an evening greeting/wish; consider `좋은 저녁 보내.` | High |
| `25963` | Meaning / format | The description explains a wordplay on `hatpins`, but Korean `모자핀에서 이름을 딴` omits the source term and weakens the wordplay. Consider `‘모자핀(Hatpins)’이라는 말장난에서 이름을 딴 단검...`. | Medium |
| `25976` | Item title / format | The named item `Vigilant Garb` is translated as `경계의 복장` without its English form. Pair the complete item name. | Medium-high |
| `25984` | Name / format | The lore sentence names both `Tinniat` and `Vreakor`, but neither is paired in Korean. Add `티니아트(Tinniat)` and `브레이코르(Vreakor)` without otherwise changing the account. | High |
| `25996` | Naturalness | `경험치 99,999 손실!` is a stiff noun-stacked rendering of `Lost 99,999 XP!`; Japanese uses a natural lost-experience construction. Consider `경험치 99,999를 잃었다!`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `25766` | Naturalness / placeholder grammar | The sentence uses `{1}` and `{2}` for rolled values, but the generated values' types and display forms are not established. Korean particles `이` and `가` may or may not fit those substitutions; do not change them without confirming the runtime values. Placeholder count and order are intact. |
| `25871` | Meaning / item identity | `Glass of Ambient` is rendered as `앰비언트의 거울`. Chinese supports a mirror reading, while Japanese uses glass (`ガラス`); the source wording alone does not settle whether this is a mirror, lens, or another named artifact. Retain pending item-context evidence. |

## Rechecked Existing Findings

- Retained the English-pairing candidate and terminology hold for
  `25777` (`Chrysalae`); the current sources do not settle its canonical
  Korean form.
- Retained the `Eventide` group/name candidate at `25806`; the earlier
  candidate remains to use `일족` and to avoid claiming it was uniquely the
  most respected clan.
- Retained the naturalness candidate at `25832` for `엄한 눈썹`; consider
  `날카로운 눈매` while preserving its informal register.
- Retained the meaning/name candidate at `25913`; the English and Chinese
  place reading does not establish that the Pryderi is a company.
- Retained the meaning/address candidate at `25939`; the sources do not name
  a third-person beneficiary for the speaker's debt.
- Retained the speech-level hold at `25942`; although the Brio attribution
  comes from the user's identification, the available row does not establish
  the scene stage, and the Japanese farewell differs in nuance from Korean
  `잘 가시오`.

## Duplicate And Structural Checks

- The range touches 65 exact-English duplicate groups, covering 1,214 corpus
  rows. Korean is identical within every group. Japanese varies for some
  short prompts and farewells, including `Yes?`, `Hello.`, `Watch your back.`,
  and `See you.`; those differences were not mechanically propagated without
  row-specific contextual evidence.
- English, Japanese, and Chinese line-break counts agree throughout the
  range. Korean line-break counts also agree except at `25915`, recorded
  above.
- Placeholder/control-marker multiplicities and order match after treating
  localized `{*1...}` payloads as the same marker family. No missing or
  duplicated runtime marker was found.
- Asset links, NPC symbols, handler names, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order. Speaker attribution and order remain `unknown` unless independently
  established by direct dialogue evidence.

After recording this range, the ledger contains 36,242 of 65,135 IDs
(55.64%), leaving 28,893. Sequential coverage reaches ID `25999`; the next
range is `26000`-`26249`.
