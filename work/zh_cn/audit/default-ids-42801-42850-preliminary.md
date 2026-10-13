# Preliminary Language Scan: `default` IDs 42801-42850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42801-42850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42804 | Greetings / `안녕하시오` | Check the Korean greeting's marked old-fashioned/formal register against the speaker's voice and nearby dialogue. | English is neutral; Japanese welcomes the listener and Chinese uses a standard greeting. Korean's `-하시오` adds a distinctive archaic register. | Medium |
| 42807 | Gifre / husband added his name / `기프르 앞에 자기 이름을 붙였다` | Clarify whether the husband added a given name or surname before Gifre, and keep the intended shared-name pride. | English says “added his name in front of Gifre”; Chinese reads surname, while Korean stays close to “his name” and preserves sharing the resulting name. | Medium |
| 42808 | past the top of the Well / `샘 위층을 지나` | Confirm whether the Well is a named location/landmark and what “top” denotes, rather than interpreting it as an upper floor. | English, Japanese, and Chinese direct the listener past the Well/top; Korean's `위층` can imply a building floor. | Medium |
| 42810 | Hierophant / our guide / `대사제`, `인도자` | Determine whether both terms refer to the same leader and standardize the title if appropriate. | English first says the pair devoted themselves to the Hierophant, then says “our guide” blessed them. Korean uses two distinct terms; Japanese repeats “guide.” | Medium |
| 42815 | Garaner / `가라너` | Verify the canonical name spelling and consistency with other references. | English name is explicit; Japanese/Chinese provide variant transliterations. | Medium |
| 42816 | Mel Senshir's loss / `함락` | Confirm whether “loss” specifically means the city's fall/capture or a broader defeat/loss. | Japanese/Chinese read the city as lost; Korean makes the military fall explicit. | Medium |
| 42822 | `{1} secrets` / `{1}가지 비밀은 이미 모두` | Preserve the quantity placeholder and avoid adding a count/unit not supported by the runtime value. | All four locales retain `{1}`. Korean adds the natural counter `가지` and an explicit `모두`; the variable identity/order is unchanged. | High |
| 42824 | Counsel / former Primos / Hyperian / `상담자`, `프리모스`, `하이페리온` | Determine whether `Counsel` is a title/office and confirm the long sentence's role and antecedents; standardize all names. | Korean identifies Arkes as the former Kollossae Primos and keeps the claim about the disaster stopping the Hyperian. Other locales use adviser/leader-like terms and different name forms. | Medium |
| 42827 | Grinning Vane Spirrick / Freeman / `웃는 베인 스피릭`, `프리맨` | Confirm whether `Grinning` is an epithet, part of the name, or a nickname; standardize Freeman/faction terminology. | English and Chinese treat Grinning as an epithet/name component; Japanese explicitly marks “Grinning” as a nickname. Korean follows the epithet reading. | Medium |
| 42829 | “What a gig!” / `정말 꿀직업이야` | Preserve the boastful, colloquial voice while checking that `gig` means an easy lucrative job/opportunity. | Korean uses a colloquial “sweet job” rendering; Japanese says great work and Chinese says great event. The logo/word-of-mouth context supports a promotional gig. | Medium |
| 42830 | the Widow / `위도우`; children / `새끼들` | Confirm whether Widow is a named creature/title and whether its “children” are a brood; keep the warning's two claims distinct. | English capitalizes Widow and mentions fangs plus protective offspring. Chinese reads it as a generic widow, while Japanese recasts the fangs as baring teeth. | Medium |
| 42831 | Unseelie / Bhaile / Amethyn / `운시일리`, `베일`, `아메신` | Standardize the faction, city, and cave names, including the distinction between former Unseelie affiliation and the Winter King's court. | Korean follows the English distinction; Chinese instead calls Bhaile a former Winter Fae city, while Japanese agrees with the Unseelie reading. | Medium |
| 42833 | Ljosalfar walking-stick-war-club / gold-leaf staff | Preserve the ironic name origin and the contrast between modest use and ornate construction. | Korean retains that the staff is named ironically after a humble walking-stick/club and is covered in gold leaf. Other locales differ in the Ljosalfar group term. | Medium |
| 42836 | Maybryn Wine / Gwalchmai / Carasta Arawyn / `메이브린`, `그왈흐마이`, `카라스타 아라윈` | Standardize the wine, merchant, and beneficiary names; preserve that the aged wine enabled a deal made on Carasta's behalf. | Korean retains the transaction and promised gold reward; phonetic spellings differ across locales. | Medium |
| 42837 | Fa Cela'de / the Faithful / `파 켈라드`, `충실한 자들` | Confirm whether the faction name should be retained as a proper name and distinguish “Faithful” from generic loyalty. | English names the group and glosses it “the Faithful.” Korean translates the gloss and transliterates the group; Chinese calls it an army. | Medium |
| 42840 | one vicious crudok / `아주 사나운 놈` | Preserve the creature term and the singular count without adding a new quantity. | English says “a vicious one”; Japanese makes the count explicit as one. Korean conveys a singular creature naturally. | High |
| 42849 | arrogant bastards / `거들먹거리는 놈들` | Check whether the Korean insult is too mild for the source's profanity/hostile voice. | English and Chinese use a coarse insult; Japanese says “despicable guys.” Korean keeps contempt but softens the explicit profanity. | Medium |

IDs 42801-42803, 42805-42806, 42809, 42811-42814, 42817-42821, 42823,
42825-42826, 42828, 42832, 42834-42835, 42838-42839, 42841-42848 generally
retain the English meaning on this first reading. Proper names, register,
and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42790-42849 were checked.
  Relevant items include Eldest/Anwon, Gnarsh, Counsel/Primos/Hyperian,
  Aodh/Sedeas/Skycrown, Virki, Grinning Vane Spirrick, Widow, Bhaile/
  Amethyn, Ljosalfar, Maybryn Wine, Fa Cela'de, and the item's staff title.
- Historical notes explicitly require `{1}` at ID 42822 to remain a
  quantity placeholder. The active Korean retains it exactly.
- Proper-name forms remain candidates pending corpus-wide terminology review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42801-42850 once
  and in identical ascending order.
- Embedded line-break counts and normalized runtime marker IDs/order match.
- ID 42822 retains `{1}` exactly and in source order.
- Japanese writes the singular “one” explicitly as `1` at 42840; the count
  remains singular in all four locales.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42801-42850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42851.
