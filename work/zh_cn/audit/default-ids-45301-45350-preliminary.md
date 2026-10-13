# Preliminary Language Scan: `default` IDs 45301-45350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45301-45350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45302 | Widow / Webwood / `과부와 웹우드` | Confirm whether `the Widow` is a named entity rather than a generic widow, and clarify its relationship to Webwood. | English capitalizes Widow and leaves the connection unknown; Korean/Chinese use a generic widow reading, while Japanese says “deceased wife.” The speaker explicitly says the connection is not known. | Medium |
| 45303 | Father / mission / Mitharu's plan | Confirm the religious title and institution terms, and preserve the self-correcting emphasis “for us. For me.” | Korean addresses the figure as `신부님` and renders mission as `선교회`; Japanese instead describes a priest and monastery. Korean retains the repeated clarification about Mitharu's plan. | Medium |
| 45305 | Travelers / `여행자들` | Standardize the formal Travelers group name. | The capitalized faction name is rendered generically; English, Japanese, and Chinese all identify departure from the group. | Medium |
| 45306 | Proving Halls / `증명 전당` | Review the formal place name and distinguish completing the trial from escaping the dungeon. | Korean preserves arrival, Bisarane's magical construct, the trial, and escape, but `증명 전당` may not convey the trial sense. Japanese calls it a trial shrine; Chinese uses a proof hall. | Medium |
| 45308 | Edgard “is gone” / `사라졌다` | Clarify whether Edgard is dead, absent, or has left, and retain the fan's exaggerated attachment. | English `gone` is ambiguous; Chinese makes death explicit, while Korean and Japanese say he is gone. Do not resolve the fate without context. | Medium |
| 45309 | beast count | Preserve the request to kill and bring back one beast's heart. | Korean, English, and Chinese express one beast lexically; Japanese includes the numeral `1`. This is an equivalent quantity, not a missing Korean count. | High |
| 45311 | test book / Fae `discorporation` / incomplete source | Keep the implementation/test metadata distinct from lore, confirm the Korean term for `discorporation`, and do not complete the final clause. | The long English test string includes UI/page-testing instructions and Fae lore, then ends mid-comparison at `just as with`. Korean likewise remains an incomplete fragment. The historical log records the source as 1,727 characters with no line breaks. | High |
| 45313 | Sorrows / inverted Gallows Tree / `비탄의 형상의 모습` | Confirm whether Sorrows names an entity or force, and review the redundant Korean ending without changing the lore claim. | English says the inverted Gallows Tree is “the form of the Sorrows.” Korean preserves the relation but repeats `form/shape`; Japanese/Chinese interpret Sorrows as a named force or entity. | Medium |
| 45314 | Ruby farewell letter / `루비가` | Preserve the intimate farewell, fear-to-peace image, and sign-off; check whether the Korean signature form is natural in the established letter style. | The Korean retains the final goodbye and Ruby's name but renders `Yours, Ruby` as the fragment `루비가`. The source is a personal farewell, not a title or objective. | Medium |
| 45316 | Shrine of the Firstsworn / `퍼스트스원 성소` | Standardize Firstsworn and determine whether `Shrine` should follow the project's established sanctuary/temple term. | The proper name is transliterated and `Shrine` is translated literally; historical notes repeatedly flag Firstsworn spelling and formal place terminology. | Medium |
| 45319 | Faer Gorta / refugees / lever | Confirm the creature name and preserve the lever's purpose: disable the trap and stop more Faer Gorta entering so refugees may have a chance. | Korean keeps the named creature phonetically and retains the causal sequence. Chinese instead calls them skeleton soldiers; Japanese also transliterates the name. | Medium |
| 45326 | Antiquarian / Fae Telling / `유물 연구가` | Confirm whether Antiquarian is a formal role and keep Fae Telling distinct from generic folklore or the act of telling. | Korean describes the speaker as an artifact researcher and renders Telling as `전승`; Japanese says antiquarian/collector and “tradition,” while Chinese uses cultural narratives. | Medium |
| 45331 | “Florian is stealing collections” / `소장품` | Clarify what `collections` refers to and whether it means collected objects, a collection, or institutional holdings. | Korean and Chinese choose collection/property readings; Japanese instead says Florian is stealing donations. The short English source lacks context. | Medium |
| 45339 | “They will cease immediately” / `당장 중단해라` | Preserve whether the speaker predicts the stalling will stop or orders the addressee to stop it. | Korean shifts the English declarative threat into a direct command. Chinese retains “they will stop,” while Japanese omits the final sentence. | High |
| 45342 | `your grace` / `전하` | Confirm that `전하` is the intended honorific for this addressee and preserve the deferential register. | Korean explicitly says it is an honor to meet `전하`; Chinese uses `陛下`, while Japanese omits the title. The title's fit depends on scene context. | Medium |
| 45346 | “you will have my respect” / `존중은 잃지 않겠다` | Preserve the English promise that the addressee will earn/receive respect, rather than implying respect already exists and will merely not be lost. | Korean says the speaker will not lose respect for the addressee; English and Chinese frame respect as something the addressee will have/gain. | High |
| 45348 | localized armor UI markers | Preserve marker occurrences and item-label associations; record the Japanese-only localized payload-order difference for integrated structural review. | English, Korean, and Chinese order the five `*1` marker payloads as armor, weapons, armor, inventory, armor. Japanese orders them armor, armor, weapons, inventory, armor. The marker family and occurrence count remain five; the Korean order follows English/Chinese. | High |

IDs 45301, 45304, 45307, 45310, 45312, 45315, 45317-45318, 45320-45325,
45327-45330, 45332-45338, 45340-45341, 45343-45345, 45347, 45349-45350
generally retain the English meaning on this first reading. Names, setting
terms, and UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45250-45349 against
  the active rows in this batch. It flags the Widow/Webwood relation,
  mission/father terminology, Hierophant and Proving Halls, the Age of Arcana
  test book and `discorporation`, Gallows Tree/Sorrows, Firstsworn, Antiquarian
  and Fae Telling, Florian's collections, `Your Grace`, and localized armor
  markers.
- The historical entry describes ID 45311's English source as 1,727
  characters, without line breaks, and ending mid-comparison. Korean keeps
  the unfinished thought; do not complete it.
- The historical note describes four `*1` style-marker IDs/order at 45348.
  The active English row contains five `*1` marker occurrences; Japanese
  reorders the second and third payloads relative to English, Korean, and
  Chinese. Preserve this verified occurrence count in the later structural
  review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45301-45350 once
  and in identical ascending order.
- All four locales preserve the same line-break counts throughout this
  range. ID 45309 expresses one beast in all locales, although Japanese uses
  the numeral `1`.
- ID 45348 contains five `*1` marker occurrences in every locale. The
  Japanese payload order differs as recorded above; Korean matches English
  and Chinese.
- No other numeric-value or hidden-formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45301-45350 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45301-45350-20261010.md`](disposition-batch-default-45301-45350-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45351.
