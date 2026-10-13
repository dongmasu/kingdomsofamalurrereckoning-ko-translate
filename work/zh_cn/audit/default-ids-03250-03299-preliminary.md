# Preliminary Language Scan: `default` IDs 3250-3299

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3250-3299.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked narrative
  language, proper names, gameplay markup, and a multiline poem.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3257 | `{LINE_CENTER}{1}을 눌러 {*1stealth} 모드로 전환하세요.` | Localize the label inside the indexed marker consistently (likely the Korean equivalent of “stealth”) while preserving `{*1...}` and `{LINE_CENTER}` exactly. | English marks the mode label for localization; Japanese uses “stealth” in Japanese and Chinese uses “sneaking/stealth.” Korean translates the instruction but leaves `stealth` in English. | High |
| 3260 | ... 발라드의 집(House of Ballads)에 속한 우리는 모두 웬센(Wencen)과 궁정을 섬겨. | Confirm whether `the Court` is the specific Fae institution and keep Wencen's relation and “embodiments of Fae glory” wording clear. | English identifies Wencen and the Court as lords/ladies of tradition. Japanese names Wencen as king and interprets the Court as the House of Ballads; Chinese says “our Court.” Korean preserves the broader Court but its identity remains unresolved. This repeats the historical question. | Medium |
| 3262 | ... 장막을 찢고 들어왔다. 먹잇감으로 삼을 따뜻한 배를 찢듯이, 굶주린 채 그 아래서 뛰는 피를 감지하며. 먹잇감의 냄새를 맡으면서. | Preserve the violent comparison and ensure it is clear that the entity is hungry, senses pulsing blood beneath the warm belly, and smells prey; do not normalize the intentionally compressed imagery. | English is a fragmented, predatory image; Japanese and Chinese also use unusual syntax and diverge in details. Korean retains the image and fragments, but the comparison's subject/sequence may be hard to follow. This repeats the historical question. | Medium |
| 3266 | ... 비거 브로드실드(Vigor Broadshield), ... 헬가 스완화이트(Helga Swanwhite), ... 아이사 알파린(Aesa Alfarinn). | Confirm the proper-name spellings and keep all three partner choices attached to the correct descriptions (swordsman, former mage, dagger rogue). | English provides three named candidates and roles; Japanese/Chinese use differing phonetic forms. Korean preserves the role/name mapping, but transliteration remains provisional. This repeats the historical question. | Medium |
| 3268 | 사냥꾼은 달린다, ... 페이 사냥꾼의 각반을 신고. | Retain the poem's eight-line structure, repeated refrain, and hunting image; verify `chausses` and the final line's equipment sense without disturbing line breaks. | The source is an eight-line item poem; Korean preserves the line count and repeated “hunter runs” refrain. `Chausses` is uncommon armor terminology, and the line has a deliberately compressed poetic construction. This repeats the historical question. | Medium |
| 3270 | 카운슬(Counsel)은 분명 중요한 존재야... | Determine whether capitalized `The Counsel` is a person, office, or other named entity; separately identify the Cipher/Hyperian references without treating `Counsel` as a generic advisory body by default. | English and Japanese capitalize/retain Counsel as an entity or title; Chinese interprets it as an adviser. Korean transliterates the English, preserving traceability but not the identity. This repeats the historical question. | Medium |
| 3283 | 가문의 무기 | Determine whether `Family Arms` means weapons belonging to a family or a family coat of arms/heraldic emblem. | English is an isolated title with both readings possible; Japanese says heirloom weapon, while Chinese is literal/ambiguous. Korean follows the weapon reading, which remains unconfirmed. This repeats the historical question. | Medium |
| 3288 | 드렌(Dren)이 그 집안에 있는 한, 그 집안은 절대 무너지지 않을 거라 생각했어. | Identify the antecedent of `it` and whether `his house` means a literal home, family, or named House; avoid repeating `그 집안` if the referents differ. | English's “with Dren in his house, it could never fall” is ambiguous. Japanese says “they” would not fall, while Chinese says the family would not perish. Korean chooses the family reading for both phrases. This repeats the historical question. | Medium |
| 3297 | 내 이름은 펜리 켈(Penri Kell)이야. 직업은 여행자지. | Confirm whether singular `Traveler` denotes membership in the named Travelers faction or a traveler's vocation; preserve the contrast with having no trade. | English capitalizes Traveler and then contrasts it with “trade.” Japanese explicitly says a Travelers member, while Chinese reads it as a profession. Korean follows the vocational reading. This repeats the historical question. | Medium |
| 3299 | ... 라시르 지부의 아르탄 케이드(Artan Caid)는 마법 해제 전문가야. | Confirm what kind of `dispelling` Artan specializes in (curses, hostile magic, or general dispelling) and whether Rathir Chapter is a formal organization branch. | English and Chinese call him an expert at dispelling; Japanese says curse removal. Korean chooses broad magic dispelling. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3260, 3262, 3266-3268,
  3270, and 3283, 3288, 3290, 3297, and 3299 against active Korean and source
  rows.
- Same-numbered historical questions for `Domus Politica` (3252),
  `Master Mana Regen Potion` (3262), `Fine Hair` (3277), `Adept's Ring`
  (3282), `Master Displacing Lining` (3288), and `Sagecraft Altar` (3299)
  belong to `base`, not these `default` entries, and were kept separate.
- ID 3269 retains both indexed `destiny` markers and the `{LINE_SPACE}`
  control. No historical disposition was treated as approval.

## Other Checks

- ID 3201's later historical notes were not imported into this batch.
- ID 3290 retains the Longroad's independence from Adessa and its reliance on
  divine/local help; the precise meaning of “providence” remains open.
- No structural changes were made.

## Batch Status

IDs 3250-3299 received one preliminary reading against the stated references.
At the time of this read-only scan, findings were candidates/questions only.
They were subsequently dispositioned in
[`disposition-batch-default-03250-03299-20261009.md`](disposition-batch-default-03250-03299-20261009.md):
one supported correction was applied, one finding was marked
`not an issue`, and thirteen remain uncertain and unchanged. This does not
constitute independent final linguistic approval.
