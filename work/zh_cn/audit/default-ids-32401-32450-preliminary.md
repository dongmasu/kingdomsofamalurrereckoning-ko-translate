# Preliminary Language Scan: `default` IDs 32401-32450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32401-32450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, numeric values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32402 | `이리온` / `파스머 험` / `리텐` / `그림 온위그` | Standardize Irion, Phasmer Humm, Rithen, and Grim Onwig spellings. | The Korean preserves the request, theft, curse, rescue, and follow-up objective. The historical log flags these names; Japanese and Chinese use differing transliterations, so spelling remains a terminology decision rather than a meaning correction. | Medium |
| 32403 | `위나돈` for Ynadon | Standardize the justice-god's name against the project glossary and other occurrences. | English identifies Ynadon as the god of justice; Korean preserves the star/blessing claim. Japanese and Chinese transliterations differ, and the historical log explicitly flags Ynadon. | Medium |
| 32405 | `4%` stun for `5초` | Preserve the exact proc chance, target condition, effect, and duration. | English specifies a 4% chance to stun a poisoned enemy for 5 seconds. Korean retains all four elements; the Japanese and Chinese values agree. | High |
| 32410 | `워스원` / `클루리콘` / crossing into Klurikon | Standardize Warsworn and Klurikon; retain the repeated-crossing tragedy claim without resolving the lore further. | English says their crossings into Klurikon have always ended in tragedy for them. Korean retains the centuries and recurring tragedy; Japanese also describes tragedy whenever they enter. The Chinese wording about a boundary is less clear and does not override English. | Medium |
| 32418 | `전승` for the capitalized Telling; House of Ballads | Check the established rendering of the named Telling and faction while preserving the prophecy-to-armor sequence. | Korean keeps the conditional claim that the Telling will also hold for the addressee, the true-knight restriction, and the need for armor. The historical log flags both terms; the exact lore terminology remains unsettled. | Medium |
| 32422 | `알마인` / `나르카 병증` / `알세룬드` | Standardize Almain, Narca, and Alserund; keep the potion's two linked treatment goals distinct. | Korean preserves administering the potion to the Almain, freeing him of the curse, and then beginning treatment of Alserund's Narca affliction. The historical log flags Almain/Narca terminology; no separate clause loss was found. | Medium |
| 32424 | `하성` for `Lower City` | Check whether this compressed form clearly denotes the lower part of a city and matches other district labels. | English, Japanese, and Chinese identify a city district (`Lower City` / 下層地区 / 下城区). `하성` may instead read as a lower fortress/citadel in Korean; this is a terminology and clarity candidate, not a confirmed error. | Medium |
| 32426 | `초대받은 자` for `Beckoned` | Confirm the established in-world title form. | The standalone English title is a past-participle epithet. Korean's `초대받은 자` preserves the invited/called sense; Japanese also uses a “called/invited one” form, while Chinese treats it as “summoned.” The historical log flags this term. | Medium |
| 32430 | `네 부하가 상대도 안 된다` for `your man doesn't stand a chance` | Check whether “your man” means a subordinate or simply the opponent/player's fighter, and avoid adding a relationship not established by context. | English predicts that the addressee's man has no chance. Korean's `부하` specifically means subordinate; Chinese supports the no-chance prediction but does not establish rank. Japanese diverges substantially, so context is needed. | Medium |
| 32432 | `용맹의 가문` for `House of Valor` | Standardize this named House alongside House of Ballads and House of Pride. | Korean preserves the named faction concept but renders House differently from its current `발라드 가문` form for House of Ballads. The historical log flags House of Valor as a proper-name consistency question. | Medium |
| 32436-32437 | `발라드 가문` / `시녀` / `페이의 빈터` | Preserve the summons, Sagrell's assignment, Maid's plans, and the warning about digging above a Fae Hollow; review established lore-name forms. | The Korean retains the source actions and causal context. The historical log flags Maid and Fae Hollow terminology; other locales use differing renderings, so neither is treated as an approved canonical form here. | Medium |
| 32439 | `{*1이정표}` then `{*1기술}` | Preserve the two localized marker wrappers and their order as in English. | English and Korean place Milestones before skills. Japanese and Chinese reverse the order, but the Korean marker sequence matches the English source and the historical question's required sequence. Wrapper identities and order are structurally preserved. | High |
| 32440 | `봉헌물이 나쁘냐고?` for `Is the Offering bad?` | Determine whether capitalized Offering denotes a rite/practice or an offered object, and choose the Korean noun accordingly. | English capitalization suggests a named practice, while Korean `봉헌물` can denote the object offered. Japanese uses a “thing offered” form and Chinese uses a sacrifice/rite reading; the locale evidence conflicts, so keep the sense open. | Medium |
| 32445 | `에테어` for Etair | Standardize the character's name against the established corpus form. | The Korean preserves the well-being question. Japanese and Chinese transliterations differ, and the source-keyed historical log calls out Etair spelling. | Medium |
| 32449 | `어서 오세요` for `Greetings` | Check whether the line is a general greeting or specifically welcomes someone who has arrived, and preserve the speaker's register. | English is a neutral greeting; Korean is a welcome, supported partly by Japanese's “glad you came” reading, while Chinese uses a formal greeting. Context is not available in the isolated row. | Low |

Rows 32401, 32404, 32406-32409, 32411-32417, 32419, 32421, 32423,
32425, 32427-32429, 32431, 32433-32435, 32438, 32441-32444, 32446-32448,
and 32450 generally retain the English meaning on this first reading.
Dialogue voice, isolated UI labels, and proper-name spellings remain
candidates for the integrated pass; no other distinct high-confidence
wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32400-32499 flags the names and
  lore terms at IDs 32402-32403, 32410, 32418, 32420, 32422, 32426-32427,
  32429, 32432, 32436-32437, and 32445. Those entries were checked against
  all four locale rows and the active Korean.
- The log specifically requires preserving ID 32405's `4%` and `5 seconds`,
  and ID 32439's marker sequence. Both values are intact; Korean follows
  English marker order at 32439, unlike Japanese and Chinese.
- Name spellings and named-lore terms remain open candidates. No historical
  question was treated as an accepted correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32401-32450 once and in identical order.
- No embedded line-break discrepancy was detected in this range.
- The two `{*1...}` wrappers at ID 32439 are present in the same order in
  English and Korean. Their localized labels differ by language as expected.
- ID 32405 preserves `4%` and `5` seconds; no other numeric-value discrepancy
  was identified.
- No CSV text or source file was edited.

## Batch Status

IDs 32401-32450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32451.
