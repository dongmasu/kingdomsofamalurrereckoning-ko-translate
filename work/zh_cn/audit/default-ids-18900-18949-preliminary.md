# Preliminary Language Scan: `default` IDs 18900-18949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 18900-18949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring names, and lore.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 18902 | Ragnarr / Jottun / Menetyre / Kobolds / Praetorian Paige | Verify the faction, place, people, name, and military-rank forms as one set. | Korean preserves the orchestrated conflict and Paige's promotion demand; cross-locale spellings diverge for several proper names and the Praetorian/Centurion titles. | Medium |
| 18908, 18917 | Esharra / Tirnoch / Amethyn | Align deity/place spellings and preserve the referent of `her`. | Korean retains Esharra's invocation and identifies Tirnoch as the being to reseal/keep secret. Historical notes ask to verify Esharra, Tirnoch, Amethyn, and the pronoun's reference. | Medium |
| 18911 | Jokull / gambling den | Preserve the “one of the most prolific” superlative and the implication that winnings support a comfortable life. | Korean conveys both points naturally; Japanese explicitly says Jokull is one of the highest-earning gamblers. Name form remains a consistency question. | Low |
| 18912 | `Jack Of All Trades 01 Reckoning` | Determine whether this is a title, product/test label, or UI string and retain its intended segmentation. | Korean translates the phrase and separates `01: Reckoning`; the compact English string gives no context. | Low |
| 18919 | `{LINE_BULLET}{*6Requires {1} points in {2} abilities}` | Preserve the nested wrapper, bullet, both variables, and variable order; verify Korean requirement grammar. | Korean retains the bullet, `{*6...}` wrapper, `{1}`, then `{2}`. English/Japanese use the same numeric-variable order; Chinese reverses `{1}`/`{2}`. | High |
| 18921 | Kollossae history / Primos / Wreath / Cipher / Alpha pteryx / Hyperian | Check the long account's formal names, object relationships, and four-paragraph layout together. | Korean preserves the four paragraphs and narrative sequence. Historical notes identify name/rite consistency questions; localized item terms and several lore names vary across locales. | Medium |
| 18924 | new ballad / all the coming ages | Preserve the promise of a story worth singing in future ages and verify whether Ballad is a formal House term. | Korean follows the English image and retains the possibility that Maura may help the addressee. | Medium |
| 18926 | `Stone Shadows` | Determine whether this capitalized string is a named ability, place, or generic image. | Korean translates it as `돌 그림자`; the isolated label does not resolve the category. | Low |
| 18928 | “come far for the wrong way” / Dalentarth | Treat the malformed English as a source issue; preserve the warning that the addressee came the wrong way and must start in Dalentarth. | Korean renders the intended direction naturally; Japanese/Chinese likewise interpret it as a wrong turn. | Medium |
| 18932 | `{*3Luck}` | Preserve the runtime wrapper and verify the official Korean UI term. | Korean localizes only the wrapped label as `{*3행운}`; wrapper identity is intact. | Medium |
| 18933 | `Auto. ($STR0)` | Keep the format string intact and confirm whether the period belongs to the UI label. | Korean retains `$STR0` unchanged; punctuation differs only according to localized label formatting. | Low |
| 18940 | Avery / old harbor / Dvergan make | Preserve the writer's uncertainty about the harbor's origin and retain paragraph/signature breaks. | Korean keeps “might be Dvergan-made” tentative and retains all three paragraphs plus the signature line. Historical note records Avery/name and Dvergan terminology checks. | Medium |
| 18945 | Wending / “right good swindle” / Alfar double standard | Preserve the colloquial admission and accusation without softening the speaker's slang or inventing what the swindle involved. | Korean's `꽤 괜찮은 사기` keeps the boastful tone; Wending identity and Alfar spelling remain terminology questions. | Medium |
| 18946 | Alyn Shir | Align the character-name rendering with other occurrences. | Korean `앨린 시어` differs from other draft forms; Japanese and Chinese also diverge. | Medium |
| 18948 | `Mudhold Fasting` | Confirm the place-name and whether Fasting is a proper location term or a passage. | Korean preserves a phonetic form as `머드홀드 패스팅`; Japanese/Chinese interpret it as a passage/road. Historical note favors retaining the source-name form pending context. | Medium |
| 18949 | higher/lower card wager / three | Keep the card-game terminology and the comparison with the first card. | Korean identifies the drawn value as 3 and correctly says it is lower than the first; this matches English “a three” and the other locales' spelled-out value. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 18902, 18908, 18917, 18919, 18921,
  18924, 18932, 18940, 18945, 18948, and 18949 against the active rows.
  They remain preliminary; no historical note authorizes a translation edit.
- The Chinese-only `{1}`/`{2}` order difference at 18919 was confirmed in
  the source comparison. Korean follows English and Japanese.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 18900-18949
  in identical order.
- No key, row-count, or physical line-break difference was found. The long
  lore entry at 18921 and Avery's letter at 18940 retain their paragraph
  structure.
- At 18919, the nested UI wrapper, bullet, and both numeric variables are
  present in Korean; only Chinese reverses the variable order. The localized
  `{*3...}` wrapper at 18932 and `$STR0` at 18933 are retained.
- No semantic numeric-value mismatch was identified; the `3` at 18949
  corresponds to English “a three.”

## Batch Status

IDs 18900-18949 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 18950-18999.
