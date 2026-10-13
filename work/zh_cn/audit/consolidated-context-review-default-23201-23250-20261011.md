# Consolidated Context Review: `default` IDs 23201-23250

- Review date: 2026-10-11.
- Scope: all fourteen keys previously uncertain in IDs 23201-23250, checked
  by exact ID across English, Japanese source, Japanese-derived Korean,
  Chinese, active Korean, and accepted terminology.
- Result: all fourteen resolved (two accepted edits and twelve
  `not an issue`); no uncertainty remains from this batch.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18575 | 23203 | troll / lost city institution | not an issue | English is itself hesitant and metaphorical. Korean preserves the troll, the city's lost institution, and the same uncertainty rather than inventing a referent. |
| D-18576 | 23207 | Stowaway / city board request | not an issue | Escort, sewer maintenance, assaults, retribution, one guard unit, permanent removal, and lack of applicants are retained. Japanese clarifies the city board as a job board; Korean `시 게시판` is compatible with the English. |
| D-18577 | 23209 | Eyeshadow Darkness | accepted | Change the unnatural `아이섀도 어둠` to `아이섀도 어두운 정도`. English `Darkness`, Japanese `目の周りの濃さ`, and Chinese `眼影暗度` all describe the degree of eyeshadow darkness; the setting's UI function need not be guessed. |
| D-18578 | 23210 | Akara hymn / Scion | not an issue | Korean preserves the devotional voice, Akara's guidance/blessing, service, return, and every stanza. `후계자(Scion)` keeps the unsettled title traceable to English. |
| D-18579 | 23211 | Mallion / unspecified `it` | not an issue | Korean preserves the unspecified object, urgency, bed, and direction; it does not invent what must be taken to Mallion. |
| D-18580 | 23217 | Fomorians / Pombero / Mabinogi | not an issue | The three boastful offices and familiar `brother` turn are intact. Source names are paired in Korean, and English governs the Fomorians reading despite locale differences. |
| D-18581 | 23220 | The Hero and the Maid / ballads | not an issue | The bilingual work title, urgency, enemy possession, and ability to alter the ballads' outcome are preserved. The duplicated English article is a source typo, not a Korean omission. |
| D-18582 | 23224 | Haxhi / Mountain Trolls / Declan | not an issue | Korean preserves the hunt and kills, return to Declan, good news, and promised reward for the Haxhi Mountain Trolls. Haxhi and Declan retain their English spellings. |
| D-18583 | 23232 | Ambassadors Keen and Brenner | not an issue | Both ambassadors' reciprocal plotting and the speaker's weariness of deception are retained. Japanese corroborates the Korean mapping of Keen to Alfar and Brenner to Varani. |
| D-18584 | 23235 | Goyen Reen / forfeited soul | not an issue | Trust, secrets, life, betrayal, and the soul consequence remain. Korean's moral `영혼을 저버렸지` preserves the source's figurative force without asserting a literal mechanism. |
| D-18585 | 23237 | Johann Lionbeard / Jackal-Tooth tale | not an issue | The complete story, character reveal, humor, and all 26 embedded line breaks are retained. `콜로세` is the already accepted Kollossae form (D-9868/D-9942); other named entities are traceable to the source. Malformed English quotation marks do not create a Korean meaning error. |
| D-18586 | 23244 | Freezing / Ice Barrage | not an issue | All Freezing effects receive +250% duration and Ice Barrage receives +60% damage; both values are exact and the skill name is paired with English. |
| D-18587 | 23247 | Resist Arrest | not an issue | `체포 저항` preserves the resisting-arrest meaning as a concise label. Its exact resource/UI role is not needed to confirm the translation. |
| D-18588 | 23249 | Freemen ownership warning | accepted | Change `자유민(Freemen)` to the approved named-faction form `프리맨(Freemen)`, reusing D-18219 at ID 64974. Ownership and the command to leave remain unchanged. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23209 and 23249 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23209 | `아이섀도 어둠` | `아이섀도 어두운 정도` |
| 23249 | `이 훌륭한 시설은 이제 자유민(Freemen)의 소유야. 그러니 계속 가...` | `이 훌륭한 시설은 이제 프리맨(Freemen)의 소유야. 그러니 계속 가...` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23209-23249-D18577-D18588/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`ce88c5ad4bde545d5c7e85a49881b38c1549ff469424390cd8a739c9be6ad1a0`.
Post-edit SHA-256:
`1603ae26cd8770906a0c82e02e4b05d409cb2fc3a92023ce567211f3d9a5a2f7`.
Reversing only these two approved cell substitutions reproduces the backup
byte for byte. The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and
73 pre-existing bare-LF endings are preserved. All five English, Japanese
source, Japanese-derived Korean, Chinese, and active Korean files have the
same 65,135-ID order. The established 26 embedded line breaks in ID 23237,
the runtime-marker order at 23218, and the +250%/+60% values at 23244 remain
unchanged.

D-18575-D-18588 resolves fourteen keys: two accepted and twelve `not an
issue`. Totals are 2,042 accepted, 23,492 `not an issue`, and 12,990
uncertain (38,524 counted). Next D-18589 at `default` ID 23251. The earlier
working dispositions are reconciled in
[`disposition-batch-default-23201-23250-20261010.md`](disposition-batch-default-23201-23250-20261010.md).
