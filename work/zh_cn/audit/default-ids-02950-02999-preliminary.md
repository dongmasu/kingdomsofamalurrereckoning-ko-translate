# Preliminary Language Scan: `default` IDs 2950-2999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2950-2999.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked tone, names,
  terminology, markup, and line layout.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2953 | 고향에 돌아가게 된다면... 아니, 그 낡은 성엔 관심 없어. 난 밤낮으로 라시르(Rathir)에서 술과 여자를 즐길 거야. | Preserve the speaker's mid-sentence retraction and bawdy preference; confirm whether Rathir is the speaker's home or merely the preferred destination. | English and Japanese both restart after “home”; Chinese makes the disavowal explicit. Korean retains the self-correction and boast, while “낡은 성” has no identified referent in this isolated row. This repeats the historical question. | Medium |
| 2957 | 아카라-토르(Akara-Tor) | Confirm the canonical place-name form and whether “your captain friend” is an established relationship/title or a casual description. | English, Japanese, and Chinese agree that someone waits deep in Akara-Tor and advise the player and captain to stay together. The Korean is plausible, but the name's spelling and relationship context remain open. This repeats the historical question. | Medium |
| 2958 | 우물에서 냄새가 강하게 풍겼다. 우물이 찾는 게 이 냄새일 거야! | Identify the object/scent the well seeks; do not silently infer a corrected English source. | English is tautological and does not name the scent. Japanese inserts Leachwood; Chinese also leaves the referent implicit. Korean repeats “smell” without identifying the sought material, so the quest clue may be incomplete. This repeats the historical question. | Medium |
| 2964 | 당신이 부름받은 자인가요? 미지의 땅에서 온 축복받은 방문객. | Preserve the inferred identification as a statement rather than a question, and check the second sentence's fragment/punctuation. | English says “You must be the Beckoned” as an inference, followed by an appositive description. Korean turns the first clause into a question, changing the speech act. The Japanese and Chinese are declarative. This also repeats the historical title-consistency question. | High |
| 2968 | 축하합니다, 운명 없는 자여! {*1운명의 전환 카드}를 잠금 해제했습니다... | Confirm the established Korean forms for `Fateless One`, `Twist of Fate card`, and `Special Deliveries`; preserve every indexed markup token and the product title. | English and Japanese contain four indexed markup spans around localized labels/product titles; Korean retains the visible token shapes and product-name text. The player-title and card/chest terms remain corpus-wide consistency questions. The old draft also flags this row for token and terminology verification. | Medium |
| 2971 | 낮추기 | Determine whether the UI label means a lowering action, a lower category/value, or a directional control. | English is only `Lower`; Japanese transliterates the English label and Chinese gives a lower-state adjective. Korean chooses an action. This repeats the historical question and the similar `default` question at ID 2814. | Medium |
| 2976 | ... 최초의 맹세자(Firstsworn)의 이름으로 맹세의 칼날(Oathblade) 계급을 수여하노라. | Confirm the canonical Korean names and whether `Oathblade` is a rank or an honorific title; preserve the formal award voice. | English explicitly bestows the rank of Oathblade in the Firstsworn's name. Chinese calls it a title, Japanese renders it as a mercenary rank, and Korean says `계급`. The ceremonial wording is coherent, but the formal terminology is unresolved. This repeats the historical question. | Medium |
| 2983 | 갤로스 엔드(Gallows End)에는 너 같은 사람이 더 필요해. ... 낚시하고 기도하고 먹는 게 지혜라고 생각하거든. | Retain the speaker's dismissive sarcasm and align `Gallows End` with the project's chosen Korean spelling. | All three source versions make the “fish, pray, eat” list a criticism of local wisdom. Korean preserves the sarcasm. The proper-name bilingual form is present, but Korean place-name consistency remains a corpus-wide issue. This repeats the historical question. | Medium |
| 2988 | 무역 회의소 | Determine whether `Chamber of Trade` is a commercial guild/institution or a tax/customs office; do not select solely from one locale. | English and Chinese support a trade/commerce institution, while Japanese says tax office. Korean follows the former. The source conflict is unresolved. This repeats the historical question. | Medium |
| 2991 | ... 풋내기 꼬맹이가 아닌 사람을 만나 반갑군. ... 광대극 무대나 다름없어. | Confirm whether `lily-giglet` is an invented slur for a young girl and whether `mummer's farce` refers to a literal performance or figurative sham. | English uses two unusual expressions; Japanese interprets the first as a girl and the second as a farce, while Chinese treats the first as a performer. Korean's insult and farce readings are plausible but not settled by the line alone. This repeats the historical question. | Medium |
| 2995 | 델버들(Delvers) | Confirm whether `Delvers` is a formal group name or a common noun for miners/excavators/researchers, then align the Korean form. | English capitalizes the term, Japanese transliterates it, and Chinese calls them researchers. Korean transliterates the name with a Korean plural. The role/group identity remains unresolved. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2953, 2957-2958, 2963-2964,
  2968, 2971, 2976, 2983, 2988, 2991, and 2995 against active keys and source
  rows. ID 2963's crude joke is retained without changing its meaning.
- The question at ID 2964 about `Beckoned` is separate from its grammatical
  shift; the historical `base` questions for other numeric IDs were not
  imported into this `default` batch.
- No historical disposition was treated as approval.

## Other Checks

- ID 2968's indexed markup labels and ID 2979's `{LINE_SPACE}` and
  `{LINE_LEFT}` controls remain in the Korean text; ID 2979 retains the 7 GB
  value and line layout.
- IDs 2969 and 2979 use legacy tutorial/platform wording; no values or
  controls were changed.
- The remaining inspected rows had no additional high-confidence meaning
  shift. Proper-name Korean/English marking remains inconsistent across the
  full draft and needs a corpus-wide consolidated policy check.

## Batch Status

IDs 2950-2999 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
