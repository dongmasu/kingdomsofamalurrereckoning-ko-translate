# Preliminary Language Scan: `default` IDs 35401-35450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35401-35450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and the historical source-keyed question log.
- Read-only first reading, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35402 | `시워치`, `주군` | Confirm whether Seawatch is a keep that the player can claim and align its Korean name/title with other instances. | English uses `my liege` and `claim it`; Korean retains both the feudal address and acquisition condition. | Medium |
| 35407 | `투아사도 같은 종류의 생물` | Resolve the omitted referent of `same sort of creature` in the surrounding conversation. | Japanese explicitly compares Tuatha with an unnamed `them`; English/Chinese and Korean leave the referent implicit. No specific species should be inferred from this row. | Medium |
| 35410 | `무기 교관` for `master-at-arms` | Verify whether this role manages the armory, trains troops, or serves as a named keep staff position. | Japanese calls the person chief guard, Chinese weapon master; English says the appointee must be worthy of the armory. A mere trainer may narrow the office. | Medium |
| 35413, 35417 | `완벽한 미타란 확장 끈`, `소라 울스트링` | Standardize the item subtype `String` and confirm Thora Woolstring's chosen spelling. | Japanese/Chinese transliterate the item; the English name Thora suggests a name rather than an everyday Korean `소라` word. Confirm with established character references before changing anything. | Medium |
| 35423 | `바너버스의 귀` / `선스파의 눈` | Preserve the speaker's deliberately confused Ear of Barnabus/Eye of Sunspar names without merging them. | English and Japanese switch both the body part and the associated name; Chinese says Barnabus twice. Korean follows English. | Low |
| 35425-35426 | `처형인의 소굴`, `노움인 내가 딱이지` | Confirm Executioner's Den as a location and keep the gnome merchant's wordplay/register. | English uses a named den and the idiom `I'm your gnome`; Korean conveys the pun's intended service meaning. | Medium |
| 35429-35431 | Darkvari, Sons of Laz, `아말도르 쿠라`, `워스워른` | Standardize family/faction names and verify whether Amaldor is a Warsworn rank rather than a first name. | Japanese/Chinese interpret Amaldor as an officer title; Korean transliterates `아말도르 쿠라` as a full name. English alone does not identify the role. | Medium |
| 35432 | `자네의 사냥` | Check whether the speaker means the addressee's hunting days specifically or a broader new life/adventure. | English only says `Yours ... are just beginning` after the speaker's own hunting days have ended; Korean supplies `사냥`, a plausible antecedent but not explicit in the latter sentence. | Low |
| 35436 | `14% ... 5초 동안 출혈 피해 100` | Preserve chance, duration and total-vs-tick interpretation pending gameplay check. | English says 100 Bleeding Damage over 5 seconds for each arrow at 14%; Korean keeps all numbers and does not add a per-tick claim. | Low |
| 35438 | `상품을 처분하고 싶으면` | Check whether `move some merchandise` means sell, transport or discreetly deal goods. | Japanese says move goods, Chinese interprets physical transport; Korean selects selling/disposal. English idiom in a merchant line may refer to sales, but context is needed. | Medium |
| 35439, 35441 | `신들의 ... 관심`, `잡동사니 목록` | Check the contrast between faith-enforced law and the speaker's lesser cases; confirm Junk pile as an inventory UI category. | The English legal statement is elliptical. Korean keeps its structure and the junk tutorial's sell-all-at-next-merchant mechanic. | Medium |
| 35445, 35449-35450 | `여름 궁정`, `얼음 여왕`, one-week loan | Confirm proper faction/title names and preserve the lender's threat of nonmonetary collection after one week. | Japanese interprets Summer Court as a palace; English/Chinese and Korean treat it as a court. All locales preserve the one-week deadline. | Medium |

IDs 35401, 35403-35406, 35408-35409, 35411-35412, 35414-35416,
35418-35422, 35424, 35427-35428, 35433-35435, 35437, 35440,
35442-35444, and 35446-35448 generally retain English meaning on this
first reading. Proper names and character-specific voices remain open.

## Historical Audit Reconciliation

- The source-keyed historical IDs 35400-35599 entry flags Seawatch,
  same-creature referent, master-at-arms, Mitharan String, Barnabus/
  Sunspar's confused item name, Executioner's Den, Darkvari, Sons of Laz,
  Amaldor, bleeding damage, law/faith, Junk pile, Court of Summer, Ice
  Queen and loan terms. All were checked against the active Korean and
  English/Japanese/Chinese references.
- Historical questions are issue inventory, not translation approval.

## Other Checks

- All four locale files contain IDs 35401-35450 once in identical order.
  There are no embedded line breaks or runtime marker tokens in this range.
- ID 35436 preserves 14%, 100 Bleeding Damage and five seconds; ID
  35450 retains the one-week loan term and unspecified collection threat.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 35401-35450 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 35451.
