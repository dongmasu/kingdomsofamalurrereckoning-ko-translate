# Preliminary Language Scan: `default` IDs 29051-29100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 29051-29100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 29052, 29055, 29057-29059, 29061, 29063-29066, 29068, 29070-29075, 29078, 29080, 29082-29085, 29087-29091, 29093, 29095-29096, 29099 | Dialogue, lore, names, item/UI labels, and objectives | Recheck register, established names, and terminology in the integrated pass. | Korean generally conveys the English. Maxen, Bloodstone, St. Hadwyn, High King Titarion, Orella Axl, Ettin, Might, Champ, Waterfall/Stone of Valor, Hyperian, Fomorous Hugues, Sibun, Niskaru, Dalentarth, Warsworn, Ancient Vault, Ram Leodwald, Castellan, Blood Rite, Elbin, City Watch, Hrindi Zungar, Beckoned, Private Cornall, Telogrus, and related UI terms remain candidates. | Medium |
| 29051 | `우리 두 제국` for “our two empires” | Confirm which two powers are meant; retain Maxen's belief that they may cooperate and the speaker's dismissal of it as fantasy. | English and Chinese say “two empires”; Japanese specifies Summer Court and Winter Court. Korean follows English/Chinese generically. Historical audit explicitly flags the two-empires reference, so do not silently replace it with the Japanese interpretation. | Medium |
| 29052 | `{1}` skill and `{2}` points | Preserve both numbered variables, their order, and the buff amount. | English, Japanese, Chinese, and Korean keep `{1}` before `{2}` and identify the skill/point relationship. | High |
| 29053 | `핏빛돌` for `Bloodstone` | Align this item/resource name with the project's established Bloodstone terminology and distinguish it from a generic blood-colored stone. | Korean gives a literal compound, while Japanese preserves Bloodstone phonetically and Chinese translates the mineral literally. English capitalization suggests a named item/resource. | Medium |
| 29054 | `세인트 해드윈(St. Hadwyn)` | Determine whether the possessive fragment names a location/establishment associated with St. Hadwyn; preserve the incomplete source form rather than inventing the omitted noun. | English is the fragment `St. Hadwyn's`; Japanese gives only the saint's name. Korean likewise supplies no possessive noun. | Low |
| 29060 | `에틴(Ettin) 전투 부대` for `ettin war party` | Preserve the possible organized enemy force and the speaker's wish for someone to deal with the shamans first. | English warns that continuing the situation may leave them facing an ettin war party. Korean conveys an impending encounter; Japanese describes a fighting force and Chinese an aggressive faction. Exact group status is contextual. | Medium |
| 29062 | `+1 효과가 ... 처음 2단계에 적용` | Preserve the +1 bonus and its scope: the first two tiers of unlocked Might Abilities. | All locales retain `+1` and the two-tier scope. Korean's wording preserves the scope, though the relationship between “unlocked” and “first two tiers” should be rechecked with the UI context. | High |
| 29067 | `동쪽 절벽 너머 후미` | Confirm the coastal meaning of `cove` and preserve the wreckage drifting toward it and the urgency to search there first. | English identifies a cove past the eastern cliffs. Japanese and Korean use inlet/cove wording; Chinese says cave, which is not supported by the English. Korean retains the search direction and urgency. | Medium |
| 29076 | Heart of Sibun / Niskaru / Warsworn / Ancient Vault | Preserve the artifact's role in bringing Niskaru to Dalentarth, its Warsworn provenance and expected storage, and the troubling transfer to malevolent hands. | English, Japanese, Chinese, and Korean agree on the chain. Korean retains the contradiction and concern; terminology for `Ancient Vault` and the historical artifact remain open. Historical audit flags these exact names/lore. | Medium |
| 29077 | Nested requirement marker `{*6...}` with `{1}` level and `{2}` item/rank | Preserve wrapper identity and both variables; investigate marker payload/order differences across locales without changing the Korean CSV. | English, Chinese, and Korean order `{1}` before `{2}`. Japanese orders `{2}` before `{1}` inside the same `{*6...}` wrapper. Korean matches English/Chinese. This is a Japanese-only runtime-variable order exception, not a Korean mismatch. | High |
| 29079 | `방해받았다` for `I Was Impeded` | Confirm whether this is a named quest/status/debug label and preserve its first-person passive phrasing. | English capitalizes the complete phrase; Korean translates it literally. The historical audit lists this label among terms needing review. | Medium |
| 29081 | `전쟁의 고대 원로` for `Ancient of War` | Establish the formal title and distinguish it from the separately named `Castellan`; preserve that this person leads this keep and Warsworn everywhere. | English treats `Ancient of War` as a title. Japanese renders it as a great general, while Chinese and Korean read it more literally as an elder/ancient. Historical audit flags this title and its role. | Medium |
| 29092 | `또 다른 참새` for `another Sparrow` | Confirm that `Sparrow` refers to a member of the Sparrows group, not a literal bird, and preserve the urgency of going to the City Watch before another killing. | English capitalizes `Sparrow`; Korean translates it as a common noun without the faction's English form. Japanese quotes the group name, while Chinese also reads literal sparrows. Historical audit flags Sparrows. | Medium |
| 29094 | `부름받은 자` for `Beckoned` | Align the formal address with recurring Beckoned terminology and preserve the offer of top-quality handmade armor for a small amount of gold. | English and Chinese use a title-like address; Korean retains the current project form and the sales pitch. Japanese omits the title. | Medium |
| 29097 | `남용될 수 있는 강력한 힘` for magic | Preserve that the Scholia studies magic because it is powerful and can be abused, with “as we've seen” grounding the warning in prior events. | English and Chinese state this reasoning directly. Japanese makes the purpose “so it will not be abused again”; Korean preserves the source's more general warning. | Medium |
| 29098 | `삼천 년` undone by `단 한 해` | Preserve the contrast between three thousand years of inheritance and one year of struggle, and the loss to Telogrus. | All locales retain the 3,000/1-year contrast and Telogrus as the cause/agent of the losses. Korean preserves the numerical contrast and ancestral reaction. | High |
| 29100 | `{*1비전 격노}` / `{*1원소 탈출}` ability labels | Keep both `{*1...}` wrappers and their order; localize payload labels only as supported by the locale references. | English, Chinese, and Korean share the same two wrapped abilities in order; Japanese localizes their payloads too. The differing payload text is expected localization, while wrapper identities/order are preserved. | High |

## Historical Audit Reconciliation

## Disposition Review Addendum (2026-10-10)

- ID 29053: candidate correction is `블러드스톤(Bloodstone) 획득하기`.
  English names the Bloodstone as an item, and ID 2 in the active Korean
  corpus already uses `블러드스톤(Bloodstone)` for the same item. The current
  `핏빛돌` is an inconsistent literal translation.
- ID 29081: candidate correction is to replace `전쟁의 고대 원로` with
  `전쟁의 장로`. The English uses `Ancient of War` as the title of the
  Warsworn leader; ID 3334 already has the accepted Korean title
  `전쟁의 장로` and explicitly treats it as a title. This correction aligns
  the recurring title without changing the separate Castellan role.

- The historical inventory for IDs 29034 and 29037-29099 flags the Heart of
  Sibun, Might tiers, Ancient of War, named UI labels, Vigor, and preservation
  of variables, nested markup, numeric sequences, and line breaks.
- ID 29077 was inspected directly: Japanese alone reverses `{1}` and `{2}`
  inside the nested requirement wrapper; Korean matches English and Chinese.
- ID 29100 is within this batch and within the historical 29100-29199
  inventory. Its localized ability-name payloads are expected; the `{*1}`
  wrappers and order match.
- These are structural/context findings, not approved translation changes.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 29051-29100 once,
  in identical order.
- Embedded line-break counts match across all four locales.
- The only normalized variable-order exception is Japanese ID 29077
  (`{2}` before `{1}`); Korean aligns with English/Chinese. ID 29100's two
  `{*1...}` ability wrappers are present in identical order, with localized
  payload text.
- The `$TRSQ01.bribe_value$` variable at ID 29041 falls in the prior batch
  and remains documented there; no source/work CSV was edited in this batch.
- No unexpected Unicode format character or other structural exception was
  found.

## Batch Status

IDs 29051-29100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 29101.
