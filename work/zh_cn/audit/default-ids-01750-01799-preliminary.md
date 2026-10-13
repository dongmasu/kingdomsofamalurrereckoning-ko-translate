# Preliminary Language Scan: `default` IDs 1750-1799

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1750-1799.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions and checked proper names, lore terms, and
  long-text structure.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1752 | ... 베신(Besin)처럼 니스카루 군주를 풀어 주려던 마법사 파를랑(Fahrlang)의 계획을 막을 때 사용한 무기다. 아이언패스트 요새(Ironfast Keep)로 가서 ... | Keep the historical source-boundary question open and verify the sentence split before linguistic cleanup. | English runs the weapon's history and the next objective together without punctuation. Korean splits them into two sentences, which is readable but remains an editorial normalization awaiting adjacent-context confirmation. | Medium |
| 1753 | 힘 | Confirm `MIGHT` as the formal character attribute and use the official Korean stat term. | English is an all-caps stat label; Japanese transliterates it, and Chinese uses “strength/power.” Korean `힘` is plausible but should be checked against the manual/UI attribute naming. | Medium |
| 1756 | 모든 퀵클링(Quickling)처럼 너도 행동이 앞서는군. | Confirm the established Korean name and whether `quickling` describes a people/species, short lifespan, or quick behavior. | English, Japanese, and Chinese use a lore-specific term; Korean preserves it as `퀵클링`, which avoids an unsupported literal interpretation but remains provisional. | Medium |
| 1762 | 내일의 마이루(Mairu) | Identify `Mairu` and retain the ambiguity of this prophecy fragment until lore context is found. | English, Japanese, and Chinese all preserve a name-like `Mairu` form but do not establish whether it is a people, deity, or concept. Korean appropriately retains the name provisionally. | Medium |
| 1769 | ... 아이텐 서클(Ayten Circle) ... 바람돌(Windstone) ... 에라티(Erathi) ... | Confirm the ritual/place/object terms together and preserve the five-note sequence. | The English connects Ayten Circle, five Windstone notes, and summoning Erathi; Japanese and Chinese differ in how they describe the circle/stones. Korean follows the English sequence but mixes translated and transliterated forms. | Medium |
| 1772 | 오르보칸트(Orbocant)로 돌아가라 | Determine whether `Orbocant` is a named place, institution, or council, then align its Korean spelling. | English and Japanese use a proper name; Chinese explicitly adds a council. Korean transliterates the destination but does not resolve what it names. | Medium |
| 1775 | 마농(Manon)의 몽환 | Resolve whether `Trance` names a spell/state, sleep/coma, or a formal item/title. | English says `Trance`; Japanese says coma and Chinese says a dazed/trance state. Korean `몽환` may suggest a dream rather than an altered state. | Medium |
| 1778 | 아르카디움(Arcadium)으로 가라 | Confirm whether `Arcadium` is a named institution/location or an arena, and use the established spelling. | English and Japanese treat it as a proper name, while Chinese interprets it as an arena. Korean preserves the source name; its referent remains open. | Medium |
| 1791 | 컵의 여왕 메이어(Maire) | Align `Maire` and `Queen of Cups` with the earlier occurrence at ID 1590 and determine whether the suit title is formal lore. | English and Chinese use the same character/title, while Japanese gives a different phonetic form. The Korean repeats its active form from ID 1590; the title/name decision remains open. | Medium |
| 1793 | ... 백년초(Century Plant)가 꽃을 피우면 ... 페트리코(Petrichor)를 손에 넣었으니 ... | Verify whether `Century Plant` and `Petrichor` are named fantasy flora/materials or should use ordinary Korean plant/weather terms. | English capitalizes both; Japanese translates Century Plant and calls Petrichor a fragrance, while Chinese treats them as named flora and rain scent. Korean's `백년초` may imply the familiar cactus, and `페트리코` remains a transliteration. | Medium |
| 1796 | ... 도칼파르(Dokkalfar) 국경 순찰대가 회수했기 때문에 붙은 이름이다. | Keep the incomplete antecedent and determine which recovered object/name this fragment explains. | English begins `So-called because they...` but does not identify the named object. Korean preserves a causal ending, though the isolated line cannot show what “they” or “so-called” refers to. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `default` questions for IDs 1752, 1753, 1756, 1762,
  1769, 1772, 1775, 1779, 1793, and 1796. The sentence boundary, `MIGHT`
  attribute, Quickling, Mairu, Ayten/Windstone ritual, Orbocant, Manon's
  Trance, giant-spider voice/lore, Century Plant/Petrichor, and unexplained
  antecedent remain open; applicable items are reiterated above or below.

## Other Checks

- ID 1779 preserves all three source paragraphs and the sequence of spider
  behaviors; its in-world natural-history voice and magic/size theory remain
  the historical review focus.
- ID 1782 uses `전승` for the capitalized `Telling`; confirm this setting
  concept against other active references before normalizing it globally.
- ID 1784 retains the no-exit-until-fight-ends rule; ID 1795 preserves `+20%`
  and the stealth condition.
- ID 1798 preserves `{*1[Upgrade]}` and the Smoke Bomb/poison-cloud effect.
- The remaining inspected rows preserve their principal meaning and register.
  No variables, numeric values, or line breaks were changed.

## Batch Status

IDs 1750-1799 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
