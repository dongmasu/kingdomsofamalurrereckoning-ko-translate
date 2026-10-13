# Preliminary Language Scan: `default` IDs 44651-44700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44651-44700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44653 | Elf's Best Friend / `엘프의 단짝` | Confirm whether `Elf` is generic or refers to the setting's Alfar/Fae, and standardize the established people-name. | English uses `Elf`; Japanese and Chinese also use generic elf terms. The historical log leaves the distinction from Alfar/Fae open. | Medium |
| 44656 | Winter Court; Midnight Gardens / `겨울 궁정`; `한밤의 정원` | Check proper-name capitalization and retain the complete garden imagery and stanza structure. | Korean preserves the violet/moonflower, blue grass, frost, aurora, corpse, and blood-red fruit imagery. Japanese recasts Winter Court as a Winter Fae palace and has a different flower reading; all four locales preserve six embedded line breaks and the blank stanza break. | Medium |
| 44657 | Adept / Savant / `숙련자` / `사반트` | Confirm canonical rank terms and preserve the distinction between Adept and Savant. | Korean expresses that no one in Scholia Arcana's history has been more deserving of a Savant's ring. Japanese instead describes a first-rank mage receiving a ring; Chinese uses a term closer to attendant/scholar. The setting-specific rank is unresolved. | High |
| 44658 | The Borrowed Lands / `빌린 땅` | Confirm whether this is a formal title and standardize `Tala-Rane` and `Alfar`. | English formats the phrase as a title followed by an explanation. Korean retains the title-like dash and uses `알파르`; Japanese/Chinese also differ in title punctuation or elf terminology. | Medium |
| 44661 | owner and proprietor / `주인이자 운영자` | Preserve the speaker's formal, service-oriented register and check whether the paired business titles are intentionally redundant. | English uses a polite proprietor voice; Korean keeps formal speech. Japanese shifts to casual speech, so English supports the Korean register here. | Low |
| 44672 | chrysalae / `크리살라이` | Confirm the established Korean name and whether the item is a species/collectible rather than generic seeds. | English names `chrysalae` and says they are “seeds, of sorts.” Korean preserves the name and analogy; Chinese replaces the name with generic wild seeds, while Japanese transliterates it. | Medium |
| 44676 | recursively nested ice sculpture | Keep the recursive description explicit and verify that every smaller figure retains its own held figure. | Korean preserves the person-like form holding a smaller form, which holds a still smaller one. English, Japanese, and Chinese share this recursive structure. | Low |
| 44687 | Heliodorus / Dareios / `헬리오도로스` / `다레이오스` | Confirm canonical spellings and keep the family ring and journal delivery as two distinct requests. | Korean correctly identifies Heliodorus as the speaker's younger brother and Dareios as an old comrade; Chinese also says younger brother, while English/Japanese only say brother. The name spellings remain glossary questions. | Medium |
| 44689 | Delver / Tender paths / `탐굴자` / `보살피는 자` | Confirm the formal House roles and standardize their Korean forms. | English presents two named paths. Korean preserves the choice and distinguishes the roles; Japanese renders them as bearer/protector and Chinese as researcher/caretaker. | Medium |
| 44693 | `chipping away` / `계속 파고` | Confirm the object of the ongoing digging from quest context; do not replace it with a generic “keep working” sense. | English's idiom is ambiguous in isolation, but Korean and Japanese explicitly retain digging, which fits the surrounding excavation context. | Low |
| 44697 | “old Fanny” / `늙은 '패니'` | Check whether `old` is affectionate familiarity or literal age, and preserve the nickname's marked quotation if intentional. | English puts quotation marks around “Fanny”; Korean also marks the name but may read `늙은` literally. Japanese marks the name without adding “old,” and Chinese omits the quotation marks. | Medium |
| 44699 | Preordained / `예정된 자들` | Confirm and standardize the faction/title rendering. | English capitalizes the faction name; Korean retains a collective designation. The line's warning and after-dark condition are preserved. | Medium |
| 44700 | fence / `장물로 팔기` | Confirm the criminal/UI sense of `fence` and retain both theft and resale actions. | Korean explicitly renders fencing as selling stolen goods; Chinese also says steal and sell, while Japanese uses a generic sale. The English is a concise objective label. | Low |

IDs 44651-44652, 44654-44655, 44659-44660, 44663-44671, 44673-44675,
44677-44686, 44688, 44690-44692, and 44694-44696, 44698 generally retain
the English meaning on this first reading. Names, setting terms, and UI labels
remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44650-44749 were checked for
  Atteia/Florian, Elf's Best Friend, Mama Blackwood/Agarth, the Midnight
  Gardens poem, Adept/Savant, Borrowed Lands/Tala-Rane, Kandrian, Rogue
  Harvest, chrysalae, the Fae trickster statue, shield craft, the recursive
  ice sculpture, Heliodorus/Dareios, Delver/Tender, Fanny Flanagan, and
  Preordained.
- The historical log identifies the poem's flowers and imagery, Alfar/Fae
  terminology, the formal status of Borrowed Lands/Rogue Harvest, rank
  names, path roles, and the “old Fanny” line as open questions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44651-44700 once
  and in identical ascending order.
- ID 44656 has six embedded line breaks in every locale, including the blank
  stanza separator. ID 44662 retains `{LINE_SPACE}{LINE_LEFT}` in identical
  order across all four locales.
- No numeric-value discrepancy or hidden formatting character was found.
  Japanese uses the digit `2` for the two paths at 44689; this agrees with the
  English wording and does not change the value.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44651-44700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44701.
