# Preliminary Language Scan: `default` IDs 42751-42800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42751-42800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42752 | Blacksmithing / `대장기술` | Confirm the established Korean skill/category label and use it consistently. | All locales identify the craft/skill; Korean uses a literal technical form. | Low |
| 42753 | `the second time around` / `두 번째로 널 죽이려 들지도` | Resolve whether this means a second attempt/encounter or killing the addressee a second time; preserve the threat without adding a cycle. | Korean follows the “second time” wording, but English is context-dependent and Japanese is less explicit. The historical log flags this phrase. | Medium |
| 42755 | Faeblades / Caelrod / `페이블레이드`, `케일로드` | Standardize the weapon type and character name while retaining the choice between two combat approaches. | English contrasts Faeblades with Caelrod's magic; all locales preserve the player's choice. Name spellings vary. | Medium |
| 42756 | dreg / `천것아` | Confirm the insult's force and the appropriate Korean register. | English/Chinese use a contemptuous “dreg/scum” term; Japanese omits it. Korean uses a strong “lowly wretch” form. | Medium |
| 42760 | Fernanda “would you listen? No.” / `들 리 없었지. 아니나 다를까.` | Preserve the rhetorical rejection without adding a separate “sure enough” event if unsupported by context. | Korean makes the refusal explicit and adds `아니나 다를까`; English's “No” is the terse answer to its own question. | Low |
| 42761, 42742 | Tindertwig / Scarwood Bark; White Flake / Scarwood Bark | Standardize reagent spellings and confirm ingredient categories while preserving recipe amounts. | Korean keeps 2/1 for the fire potion and 2/1 for the Ice potion in their respective rows; localized number glyphs differ by locale. | Medium |
| 42767 | first Magnus / Arena / `초대 마그누스` | Confirm whether Magnus is a title, person, or named champion and standardize its form. | English capitalizes Magnus and refers to the first Magnus; other locales use phonetic name forms. | Medium |
| 42769 | “Luck is the least I'll need” / `운은 아무리 많이 따라도 부족하겠지` | Preserve the idiom that luck is necessary but not sufficient, rather than reading it as merely needing a minimum amount. | Korean idiomatically says even abundant luck would not be enough; Japanese recasts it as wishing good luck, while English/Chinese retain the need-for-luck idea. | Medium |
| 42773 | School of Hard Knocks / `고난으로 얻는 교훈` | Confirm whether this is an idiom/title and keep the intended hard-earned-learning sense. | Korean renders the idiom as lessons learned through hardship; Japanese uses repeated adversity and Chinese hard training. | Medium |
| 42774 | You are entering `{1}` / `{1}에 들어가는 중` | Keep the exact runtime variable and order. | All locales retain `{1}` at the same location. | High |
| 42778 | Bloody Bones / `블러디 본즈` | Confirm whether this is a proper story/character name or a generic creature phrase; standardize its form. | English capitalizes the name; Japanese transliterates it and Chinese translates it literally. | Medium |
| 42779 | Domus Politica / Templar diplomacy / `도무스 폴리티카`, `템플러` | Confirm the institution's formal function/name and standardize Templar terminology. | All sources describe handling diplomatic documentation; Japanese/Chinese give more institutional/generic readings. | Medium |
| 42781 | the Telling / `전승 방식` | Determine whether `the Telling` is a formal cultural concept/title, not simply a method of storytelling. | English capitalizes `The Telling`; Korean uses a natural but generic “tradition of telling.” Japanese and Chinese also use quotation/capitalization-like emphasis. | Medium |
| 42782 | Master's Pick / Guian Stebic / Arrivus engine / `명인의 자물쇠따개`, `기안 스테빅`, `아리부스 엔진` | Standardize the artifact, name, and device forms; preserve the unresolved-box problem and extraction objective. | Korean retains the box, lab in Apotyre, and engine sequence. The proper names differ across references; historical notes flag this chain. | Medium |
| 42784 | `$STR0 (Socketed)` / `$STR0 (소켓 장착)` | Preserve the literal `$STR0` variable and verify the socket-status label. | The variable is byte-for-byte present in all four locales; Korean localizes only the parenthetical label. | High |
| 42785 | Hireling / `용병` | Confirm whether capitalized Hireling is a formal Warsworn rank rather than a generic mercenary. | English capitalizes the role; Japanese describes a third-class mercenary, Chinese says mercenary, and Korean uses generic `용병`. | Medium |
| 42786 | the Carver / Wind / Lightning / Dawn poem | Confirm whether `the Carver` is a formal title and preserve all five short lines without supplying an identity. | Korean retains the five-line structure and the sequence of name/wind/lightning/dawn, though it drops capitalization cues in Korean script. | Medium |
| 42789 | Good day / `좋은 하루요` | Check the Korean greeting's archaic/polite register against the speaker and surrounding dialogue. | English/Japanese/Chinese use a standard greeting; Korean's `-요` construction is marked and may sound old-fashioned in this form. | Low |
| 42790 | leather hood / `가죽 두건` | Confirm item-category consistency with `cowl` and other hood/headgear names. | English/Japanese/Chinese agree on a hood; Korean uses a broad headcloth term. | Low |
| 42791 | `potential of use` / `쓸모가 있을 가능성` | Preserve the speaker's testing/manipulative tone without making the Korean sound more clinical than the source. | English is awkwardly phrased; Korean clarifies that the addressee might be useful and still must prove worth. The historical log explicitly flags this construction. | Medium |
| 42794 | Gwyn Anwy / `그윈 안위` | Confirm the canonical spelling and keep consistent with earlier mentions of the name. | English is the spelling authority; other locales provide differing phonetic references. Historical notes list this name among consistency checks. | Medium |
| 42796 | Warsworn stay/service exchange / `머무르는 대신 그들을 돕게 해 줬어` | Preserve that the Warsworn allow the speaker to stay in exchange for service, without implying a different contract. | Korean makes the reciprocal arrangement explicit; Japanese says they valued the speaker's work, and Chinese is close to the English exchange. | Medium |
| 42799 | the Eldest / `엘더스트` | Confirm the formal group's canonical Korean name and distinguish it from a generic elder. | English capitalizes the group label, Chinese translates “elders,” and Japanese transliterates it. Korean retains the name-like form. | Medium |

IDs 42751, 42754, 42757-42759, 42762-42766, 42768, 42770-42772, 42775-42777,
42780, 42783, 42787-42788, 42792-42793, 42795, 42797-42798, and 42800
generally retain the English meaning on this first reading. Proper names,
register, and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42750-42849 were checked.
  Relevant items include `the second time around`, dreg, Southern Lights,
  Magnus, School of Hard Knocks, Domus Politica, the Telling, Master's
  Pick/Arrivus engine, `$STR0`, the Carver verse, hood/cowl, Eldest,
  and `potential of use`.
- The archived note confirms the four-line Carver verse at 42786 and the
  literal `$STR0` placeholder at 42784. Direct checks also confirm `{1}` at
  42774 and recipe/weapon values.
- This pass does not resolve canonical names or the status of capitalized
  setting terms.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42751-42800 once
  and in identical ascending order.
- Embedded line-break counts and normalized runtime marker IDs/order match.
- ID 42774 retains `{1}` exactly; ID 42784 retains `$STR0` exactly.
- The Carver verse at 42786 retains four embedded breaks (five lines).
- Recipe quantities at 42742 and 42761 remain 2/1 in item order. English,
  Japanese, and Korean show Arabic digits; Chinese uses full-width digits.
  The 42717 +16/+40% values are also retained.
- Japanese writes “one” as `1` in the 42786 verse; the value and line meaning
  are equivalent to the spelled-out wording elsewhere.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42751-42800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42801.
