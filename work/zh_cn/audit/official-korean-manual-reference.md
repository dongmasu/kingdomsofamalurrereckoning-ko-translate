# Official Korean Manual Reference

Source: `references/manual/Kingdom of Amulur 공식 한글 설명.pdf`
Read-only extraction date: 2026-10-12

This working reference condenses the 11-page PDF (printed pages 1-21) for
translation review. The PDF remains the primary source; this note is a
navigation aid, not a replacement or an exhaustive glossary. Page numbers
below are **1-based PDF pages**, not the printed page numbers: PDF page 7
contains printed pages 13-14, and PDF page 8 contains printed pages 15-16.
Some older audit reports mistakenly label these PDF indices "printed" pages;
check the PDF spread before relying on a printed-page citation.

## Setting and Core Concepts

- Amalur is threatened by war, a new magic, and an eastern force. Fateweavers
  foresee fixed destinies, but the resurrected hero has no life recorded in
  Fate's tapestry and can change Amalur's future through the power of
  Reckoning (p. 1).
- The game world is the Faelands, rendered `패란즈` in the manual. The manual
  describes the Almain, Varani, Ljosalfar, and Dokkalfar peoples (pp. 1-3).
- `Fateweaver` is `페이트위버`; Fate is `운명`; Fate energy is `운명 에너지`;
  Reckoning mode is `레코닝 모드` (pp. 1, 3, 5).
- A Well can be a proper lore concept, while the manual also uses ordinary
  springs and shrines. Decide `Well` from its local English context rather
  than translating every occurrence as the same physical object (pp. 3-4,
  9).

## Peoples and Deities

| English | Manual Korean | PDF page |
| --- | --- | ---: |
| Almain | 알마인 | 1 |
| Varani | 바라니 | 1 |
| Ljosalfar | 료스알브 | 1 |
| Dokkalfar | 도크알브 | 1 |
| Belen | 벨렌 | 2 |
| Ynadon | 이나돈 | 2 |
| Mitharu | 미사루 | 2 |
| Lyria | 리리아 | 2 |
| Gaea | 가이아 | 2 |
| Ethene | 에테네 | 2 |
| Aryllia | 아릴리아 | 2 |
| Njordir | 뇨르디르 | 2 |
| Thyrdon | 사이르돈 | 2 |
| Vraekor | 브래코르 | 2 |
| Lopoku | 로포쿠 | 2 |
| Ohnshan | 오샨 | 2 |

Keep the distinction between the god Mitharu (`미사루`) and the Mitharan
people/adjective (`미타란`) established by English context.

English spellings in this table are aligned to the source CSVs, not inferred
by romanizing the manual's Korean. D-20392 (2026-10-15) corrects the former
guessed `Inadon`/`Gaia`/`Sairdon`/`Oshon` headings using the divine-role menu
rows at default 26106/15781/42685/48696. The original PDF/extraction is
unchanged. Source `Lupoku` also denotes `Lopoku` (Mischief patron, default
13951/2009); both map to manual `로포쿠`. Use each English row's local
wording for gender/titles: default 11113 says goddess/her for Ohnshan even
though the menu says God of Air.

## Skills and Crafting

| English | Manual Korean | PDF page |
| --- | --- | ---: |
| Alchemy | 연금술 | 4 |
| Blacksmithing | 대장기술 | 4 |
| Detect Hidden | 숨겨진 물건 찾기 | 4 |
| Dispelling | 디스펠 | 4 |
| Lockpicking | 자물쇠 따기 | 4 |
| Persuasion | 설득 | 4 |
| Mercantile | 상술 | 4 |
| Sagecraft / Sagecrafting | 마법물품 제작 | 4, 8 |
| Stealth | 은신 | 4 |
| Sagecraft Altar | 마법물품 제작 제단 | 8 |

## Weapons and Equipment

The manual distinguishes these weapon classes (PDF p. 7, printed pp. 13-14):

| English | Manual Korean |
| --- | --- |
| Staves | 지팡이 |
| Chakrams | 차크람 |
| Sceptres | 셉터 |
| Longswords | 롱소드 |
| Hammers | 해머 |
| Daggers | 대거 |
| Longbows | 롱보우 |
| Faeblades | 패블레이드 |
| Greatswords | 그레이트소드 |

On 2026-10-16, the original PDF page 7 (printed page 13) was rendered and
visually checked for D-21274: it explicitly prints `패블레이드(Faeblades)`,
matching the extraction. The former `페이블레이드` table entry was an
incorrect reference transcription, not an authorized alternate manual
spelling. D-21274 uses `패블레이드 숙련(Faeblade Mastery)`. This correction
does not silently rewrite prior translation decisions or their history.

The manual also uses `서클릿` as the established Korean equipment term in
the audited corpus; preserve the distinction between a circlet and a crown
or generic headpiece. The PDF explains equipment slots, item rarity, damage
types, gems, shards, and sockets (pp. 6-8).

## Factions and Quest Structure

The manual names these factions (PDF p. 7, printed pp. 13-14):

- House of Ballads: `하우스 오브 발라드`
- House of Sorrows: `하우스 오브 소로우`
- Scholia Arcana: `스콜리아 아르카나`
- Travelers: `트래블러`
- Warsworn: `워스원`

Use later accepted audit decisions for normalized in-text forms such as
`발라드의 집`, `비탄의 집`, and `용맹의 집`; the manual's faction list
establishes identity and context, while those decisions establish the
project's preferred Korean renderings. The manual distinguishes main,
faction, side, and task quests (p. 7).

## Review Use

- English CSV text remains the meaning anchor. Japanese is useful for voice,
  register, and honorifics; Chinese is supporting evidence.
- Reuse explicit manual terminology when the English source identifies that
  term. Do not infer a name or role solely from a manual no-hit.
- The manual is a broad gameplay guide, not a complete lore encyclopedia. It
  does not by itself settle every named place, character, rank, quest title,
  item, or expansion term.
- For each decision, record the PDF page (and printed spread if known)
  and the exact English source context where the manual term applies.
