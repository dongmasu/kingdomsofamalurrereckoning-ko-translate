# Preliminary Language Scan: `default` IDs 32901-32950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32901-32950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32911 | `덕분에 우린 이득을 봤지` / `그녀와 우리 예언자가 모두를 보살펴 줘` | Preserve the source's likely “profited from her loyalty” sense and the separate claim that she and the seer look after everyone. | Korean retains both clauses. Japanese makes the profit explicitly financial and reads the latter as parental care; English/Chinese leave the kind of profit and relationship open. | Medium |
| 32912 | `나쁜 소식을 전하는 사람` for `bearer of tidings` | Keep the admission that she sold the pendant this morning; check whether “bad news” is licensed by context or over-specifies a general bearer of tidings. | English does not explicitly say “bad”; Japanese misreads the phrase as disliking carrying letters, and Chinese says bearer of good news. Korean infers bad news from the confession. | Medium |
| 32916 | `$NUM0 MB` saved-game free-space prompt | Preserve the exact runtime value and units and the recommendation/question sequence. | All locales contain the identical `$NUM0 MB` token; Korean retains the free-space recommendation and asks whether to proceed. | High |
| 32923 | `복수의 가문` / `커(Cur)` / `그들 없이` | Standardize House of Vengeance and Cur, and retain the uncertainty about who “them” refers to. | Korean keeps the need to pass through the House and kill the Cur. English/Japanese/Chinese differ on Cur (named entity versus dog/insult); none of the isolated lines resolves the plural antecedent. | High |
| 32926 | `Senior Business Analyst` left in English | Confirm whether this standalone role/title is intentionally untranslated; use an established Korean job-title form only after context/glossary review. | English and Japanese both retain the English title, while Chinese translates it. Korean is identical to English. The row provides no employer or UI context. | Medium |
| 32928 | `머건` for lowercase `murghan` | Determine whether this is a creature/species name and standardize its display form while preserving the overpopulation of the swamp. | Korean transliterates it and preserves spawning/overrun. Japanese and Chinese also identify a creature, with Chinese using a generic “fish monster” term; the setting-specific species form remains open. | Medium |
| 32930 | `성 오드윅은 ... 받아들이라고 강하게 요구해` | Check a likely agency inversion: English instructs the addressee to insist that St. Odwig's admit monks, or else tell the institution to take its “poison” elsewhere. | English's imperative `Insist that St. Odwig's admit...` makes the addressee the one issuing the demand. Korean instead makes St. Odwig the subject that strongly demands admission, shifting who is making the demand. Japanese/Chinese support a demand directed at St. Odwig's. | High |
| 32936 | Pacetor's letter / signature | Preserve the intimate longing, construction imagery, conditional future hope, paragraph break, and signature; do not reproduce the malformed English connective literally. | English has the source typo `then perhaps one day and I can find`; Korean renders the apparent intended meaning coherently. The two prose paragraphs and closing/signature layout are retained across the locales. | Medium |
| 32938 | `클리프브레이크 패스팅` / Cliffbreak Fasting | Standardize the Dverga tunnel-network/location term and preserve Asa's report that Dead Kel salvages the Calamity wreck there. | Korean keeps the location, tunnels, named ship, and salvage action. Japanese describes an underground passage, Chinese a passage, and English capitalizes the proper-name-like `Cliffbreak Fasting`; the historical `fasting` question remains open. | Medium |
| 32940 | `비단을 기르던 사람` for `silkfarmer` | Check the occupational term; preserve that the text is a journal fragment associated with Webwood. | Korean literally says someone who “raises silk.” Japanese describes a silk-gathering artisan and Chinese an養蚕person/silkworm farmer, which suggest sericulture rather than growing silk itself. | Medium |
| 32944 | `먼지 태생` for `dustling` | Standardize the setting-specific address/species term and preserve the speaker's direct question. | Korean uses a dust-born rendering; Japanese omits the term, while Chinese calls the addressee a mortal. Prior audits leave Dustling's species-versus-insult status open. | Medium |
| 32945 | `+70%` propagation chance / `60%` Storm Bolt damage | Preserve both distinct effects and values; retain the named ability form consistently. | All four locales give a 70% chance for Shocking Damage to propagate between enemies and a 60% Storm Bolt damage increase. Korean preserves both values and effects. | High |

IDs 32901-32910, 32913-32915, 32917-32922, 32924-32925, 32927, 32929,
32931-32935, 32937, 32939, 32941-32943, 32946-32950 generally retain the
English meaning on this first reading. Proper names, register, and
setting-specific terms remain integrated-pass candidates; no other distinct
high-confidence wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 32900-32999 flags House of
  Vengeance and Cur (32923), the source error at 32930, the ambiguous
  `silkfarmer` (32940), the `$NUM0 MB` variable (32916), the Pacetor letter
  (32936), Cliffbreak Fasting (32938), and the Shocking Damage/Storm Bolt
  effect (32945). These were checked against all four locale rows and active
  Korean.
- The possible agency inversion at ID 32930 is a high-confidence
  preliminary candidate, not an accepted correction. The source-keyed
  historical log does not supersede the English imperative syntax.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 32901-32950 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker signatures match
  across all four locales throughout the range.
- `$NUM0 MB` at ID 32916 is preserved exactly.
- ID 32936 retains its three newline characters and closing/signature
  structure.
- ID 32945 preserves the `+70%` and `60%` effects.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 32901-32950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32951.
