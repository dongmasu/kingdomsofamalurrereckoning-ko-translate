# Preliminary Language Scan: `default` IDs 43951-44000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43951-44000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43951 | Turin/Jedda/Oreyn / `투린`; `제다`; `오레인` | Standardize character-name spellings and preserve the unfinished trailing thought. | Korean retains the three-part loss/absence statement and trailing ellipsis; name forms vary across locales. | Medium |
| 43954 | Telling / `이야기 전승` | Standardize the capitalized lore term and preserve the speaker's offer of help. | Korean uses the established descriptive concept; Japanese treats Telling as a named tradition, while Chinese uses an oracle/prophecy term. | Medium |
| 43957 | Wulf is “already gone” / `이미 떠났어` | Leave the fate unresolved unless context confirms death; avoid silently turning “gone” into either death or departure. | Korean reads as having left, Chinese says he has died, and English/Japanese are ambiguous. | High |
| 43958 | Library of lore / `지식의 도서관` | Confirm whether this capitalized Library is a formal institution and standardize the Summer Court/lore terms. | Korean preserves the claim that it will remain strong as Summer Court magic weakens; the institutional status is unresolved in historical notes. | Medium |
| 43960 | `$SQ02.gem_cost$ Gold` / `$SQ02.gem_cost$ 골드` | Preserve the complete runtime variable verbatim and keep the currency label adjacent to it. | The exact `$SQ02.gem_cost$` token appears unchanged in all four locales. | High |
| 43964 | Undersea Fasting; Pepin Jamane; Dverga; Gallows End / `언더시 패스팅`; `페핀 자메인`; `드베르가`; `갈로우스 엔드` | Verify the unusual location name and standardize character, faction, and place forms. | Korean preserves the expedition, stolen tome, missing gnome, and southeast location; historical notes specifically flag Undersea Fasting and these names. | Medium |
| 43969 | Minor Alchemist's Art potion / `하급 연금술사의 비약` | Confirm whether this is a named potion/tier and align its Korean UI/item name with the alchemy glossary. | Korean preserves Oleander's alchemy-maintenance purpose and the retrieval/delivery sequence; Japanese describes a minor alchemy-increasing potion. | Medium |
| 43974 | “Bring your logic, and I shall bring mine” / `네 논리를 가져오시오. 내 논리도 내놓겠소` | Keep the rhetorical challenge while checking that the formal Korean address matches the speaker. | Korean preserves the parallel challenge; Japanese/Chinese use more idiomatic expressions of matching arguments. | Medium |
| 43977 | Lyria's city; courts and byways / `리리아의 도시`; `궁정과 골목` | Clarify the Lyria referent and standardize recurring Lyria terms while preserving the city-as-living-magic metaphor. | Korean retains the metaphor and speaker's modest role; the row itself does not name the city. | Medium |
| 43985 | Director of Partner Management / `파트너 관리 이사` | Confirm the corporate job title and whether it is player-facing or metadata. | English/Japanese leave the title in English while Chinese/Korean translate it. | Medium |
| 43988 | the Well / `샘` | Determine whether capitalized Well is a named structure and use its canonical Korean form. | English capitalizes the term; Korean uses a generic “spring/well.” Historical notes explicitly leave the referent open. | Medium |
| 43991 | seer's three-sentence verse / `침울한 시대... 운명은 내려져 돌이킬 수 없네` | Preserve the compressed prophecy's three-part progression, fate imagery, and any deliberate cadence/rhyme. | The source is a single-line verse with internal rhyme/wordplay around “dealt” and “cast”; Korean conveys foreboding but does not retain the wordplay. The uncertainty is historical-audit flagged. | High |
| 43993 | Fatesworn / `페이트스원` | Standardize the faction name against other project references and preserve that they left a tracking method. | Korean retains the method and its purpose; localized forms vary. | Medium |
| 43996 | Erathi / `에라시` | Verify the people's canonical name and retain that they built the tomb centuries ago to seal a great evil. | Korean follows English/Japanese; Chinese changes the evil into a demon. | Medium |
| 43997 | Fateless; Scion; Beckoned / `운명 없는 자`; `사이온`; `부름받은 자` | Apply consistent Korean forms and capitalization to the three lore identities listed together. | Korean preserves all three and “more,” but these concepts have multiple Korean forms in the active corpus. | High |
| 44000 | cloth-of-gold pantaloons / `금실로 꿰매 만든 ... 판탈롱 바지` | Confirm the material and garment terms; retain the luxurious, playful item-description tone. | Korean describes gold-thread stitching, while English names cloth-of-gold as the material. Other locales use broader gold-fabric/gold-thread descriptions. | Medium |

IDs 43952-43953, 43955-43956, 43959, 43961-43963, 43965-43968,
43970-43973, 43975-43976, 43978-43984, 43986-43987, 43989-43990,
43992, 43994-43995, and 43998-43999 generally retain the English meaning
on this first reading. Names, lore terms, and job/item terminology remain
subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43951-44049 was checked.
  Applicable entries flag Turin/Jedda/Oreyn, Telling, Telogrus/Wulf, the
  Library of lore, `$SQ02.gem_cost$`, Agarth, Pepin Jamane/Undersea Fasting,
  Oleander Sinclair/Minor Alchemist's Art, Lyria, Ettin/ThorsHammer,
  Tilera, Culn, and Court of Summer.
- The following section was checked for the compressed seer's verse,
  Fatesworn, Erathi tomb, Scion, Curran, and Ealfwig Grilricas. Historical
  uncertainties remain open rather than receiving inferred dispositions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43951-44000 once
  and in identical ascending order; each default CSV has 65,135 records.
- No embedded line breaks, runtime style markers, or hidden formatting
  characters were found in this range.
- The `$SQ02.gem_cost$` variable at 43960 is byte-for-byte identical in all
  four locales. No other runtime marker or numeric discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43951-44000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44001.
