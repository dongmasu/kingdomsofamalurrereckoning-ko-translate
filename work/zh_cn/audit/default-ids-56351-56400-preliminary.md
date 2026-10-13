# Preliminary Language Scan: `default` IDs 56351-56400

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56351-56400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56351 | `Gallows End` / `교수대 끝자락` | Align the named location with the corpus's existing Gallows End variants and decide the canonical Korean form separately. | The active draft already uses several phonetic forms and literal translations for Gallows End; prior audits identify this as a cross-corpus consistency problem. | Medium |
| 56358 | “upsetting bets left and right” | Clarify whether the line means disrupting gamblers' expectations, causing wagers to change hands, or changing the bets themselves. | Korean uses a figurative “turning the tables”; Japanese describes bets flying around, while Chinese says gamblers are upset. The historical question leaves the idiom unresolved. | Medium |
| 56359 | `발라드의 전당 문장이자 하프 문장` | Preserve that the ring bears the House of Ballads' harp crest without suggesting two separate crests. | English describes one harp crest belonging to the House. Korean's current wording can read as “the House crest and a harp crest,” repeating `문장` and implying two emblems. | High |
| 56360, 56393 | `Augur` / `점술가` | Align the bare label with the corpus's other renderings of Augur, including `예언자`, while confirming the office's exact meaning. | Both rows use `점술가`, whereas other Korean entries call the Augur a prophet (`예언자`). This label variation is not yet resolved. | Medium |
| 56371 | Ealfwig Grilricas / “will not suffer an approach he can see” | Check the intended meaning of “fastidious” and whether visible approach or ingratiation is being rejected. | Korean describes him as meticulous and says he will not tolerate a conspicuous approach. Japanese interprets him as difficult to please and says ingratiating oneself is unlikely; Chinese emphasizes caution. | Medium |
| 56376 | wager “against the Crows” | Preserve whether the bet is specifically on the Crows' defeat and retain the 100,000-gold amount. | Korean explicitly says Tyr bet that the Crows would lose; English and Chinese support this reading, and Japanese states the Crows are the losing side. The amount is preserved as `십만`. | Medium |
| 56377 | escaped quote text `\\"...\\\\"` | Verify whether the backslashes are intended display characters or an accidental CSV-text escape artifact. | The parsed Korean cell contains literal backslashes before both outer quotation marks; the English, Japanese, and Chinese cells do not. This is a formatting/runtime-display candidate, not a translation disposition. | High |
| 56380 | Sojourn / Service / Giving | Confirm the ritual/historical meaning of the three capitalized terms and preserve their progression from outward to inward and past to present. | Korean retains the spatial and temporal movement but lowercases/translates the named concepts; Japanese does likewise. Chinese diverges on the historical relation, so English remains the semantic anchor. | Medium |
| 56392 | St. Hadwyn / `성 하드윈` | Check the spelling and Korean form against the `St. Hadwin` spelling in the previous batch and other in-corpus mentions. | English uses `Hadwyn` here, while nearby source material has `Hadwin`; Korean renders both as `하드윈`, which hides the source spelling variance but may be correct if they are the same saint. | Medium |
| 56398 | `Skull Sprite` / `해골 요정` | Confirm the creature/category term for Sprite and whether this is a named enemy label. | Korean translates Sprite as `요정`; Japanese transliterates it and Chinese uses a demon-like creature term. The isolated label gives no encounter context. | Medium |
| 56400 | `the Sorrows` / `슬픔의 무리` | Confirm whether the Sorrows is a named faction, entity, or force and align the Korean term with prior uses. | Korean treats it as a “group of sorrow”; the source capitalizes the named term, and previous audits record competing readings as a force/entity or House/faction. | Medium |

Other reviewed rows generally preserve the first-read English meaning. Names
and terms remain provisional, including Gallows End, Archsages, Sydanus,
Coilsbain, the Hierophant, Lyenna, Moon Camp, Nyralim, Avicenn, Kollossae,
Kerrod, Tywili Coast, Menetyre, Mithros, Brogan MacQueen, Crow Peak,
Ealfwig Grilricas, Tosai, Tyr Magnus, the Crows, Sojourn, Service, Giving,
Bloody Bones, Uduath, Reddle, St. Hadwyn, Lykeios, Skull Sprite, the Arena,
and Bisarane.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56350-56449`.
  Relevant prompts include the Gambling Den idiom (56358), Ealfwig
  Grilricas (56371), betting against the Crows (56376), Sojourn/Service/
  Giving (56380), and the Sorrows (56400). These remain open prompts, not
  accepted corrections.
- ID 56350 was reviewed in the preceding active report and is the opening
  boundary of this historical range. ID 56400 lies within it and is included
  once in this active batch; no row is skipped or duplicated.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56351-56400 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts and normalized runtime-marker frame/order match throughout
  the batch. `{1}: {2}` at 56372 is unchanged.
- The 100,000-gold wager at 56376 is preserved as one hundred thousand.
- At 56377, the backslashes before the Korean quotation marks are present in
  the parsed text value; no CSV was edited to remove them.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56351-56400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56401.
