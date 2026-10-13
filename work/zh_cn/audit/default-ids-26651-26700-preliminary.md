# Preliminary Language Scan: `default` IDs 26651-26700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26651-26700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26651-26661, 26663-26671, 26674-26679, 26681-26686, 26688-26691, 26694-26700 | Dialogue and concise UI wording | Recheck character voice, idioms, title capitalization, and context-dependent short strings during integrated review. | Korean generally follows English meaning and Japanese voice. ID 26652 keeps the oil-and-water faction metaphor and desire to escape; ID 26664 preserves the need to leave a death scene undisturbed; ID 26689 retains the speaker's confession about avoiding work and the appeal to help others. | Medium |
| 26652-26653, 26662, 26668-26669, 26672-26675, 26680, 26686-26687, 26692-26693 | Warsworn/Travelers / Erathi / Templar / Faeblades / Taibreah / Lady's Children / spiritual cult / Kollossae, Lykeios, Hyperian, Mairu / Seawatch / Hanged Men | Standardize faction, race, relic, location, and proper-name forms; determine the named-object senses from context. | Historical questions already inventory these names and terms. `Lady's Children` at 26672 is rendered `귀부인의 아이들`; Japanese identifies Lady Ancilla, so confirm whether the English title is a proper name. `The Hanged Men` is rendered literally as `교수형에 처한 자들`; check the faction/name convention. | High |
| 26660-26661, 26664, 26670, 26680, 26689-26691, 26695 | Mining output / magical reservoir / investigative scene / expedition / Lykeios essay / mine management / tunnel testing | Preserve specialized meaning, rhetorical argument, and referents across the longer text. | ID 26660 distinguishes ore successfully mined from waste rock removed. The long three-paragraph Lykeios essay at 26680 retains its argument that debate resolves social questions through a Kollossae power contest; it has four actual embedded line breaks in every locale. Korean's “우리 민족” for “our people” should be checked against the Kollossae collective terminology. | Medium |
| 26685, 26692-26693 | `$TR_Shell.rhose_wager$` / Chaos-defense recipe / `{*1[Active]}` ability marker | Preserve variable identity/order, every ingredient amount, line layout, and localized wrapper payload. | ID 26685 retains the wager variable. At 26692, English/Japanese/Korean specify Chaos Essence (3), Ysa's Breath (2), Seaflax (1), Essence of Fate (1); Chinese alone gives the first quantity as 2. Korean matches English and Japanese. At 26693 all locales retain the `{*1...}` wrapper in place and order while localizing `[Active]` by design. | High |
| 26651, 26653, 26666, 26669, 26672, 26680-26682, 26684, 26686, 26698, 26700 | Gnarsh / Keening / Grim Onwig / Taibreah / Lady's Children / Lykeios / Requiem / Seawatch / Revival / Sveri Brond / Derfel | Maintain canonical Korean spellings and apply the project's eventual Korean-English parenthetical convention consistently. | The source-keyed history records these as continuing name, faction, or place questions. This pass does not settle canonical forms. | Medium |

## Historical Audit Reconciliation

- The preserved question log groups Travelers/Warsworn, the shepherding
  metaphor, spiritual-cult wording, mining output, magical reservoir,
  Templar, Lady's Children, Templars, and Canyon Hill.
- It specifically calls for a holistic review of the Lykeios/Kollossae/
  Hyperian/Mairu essay and its “exclamation point” metaphor.
- It also lists the Hanged Men, Revival, wager variable, reagent amounts,
  Active marker, tunnel testing, and names including Sveri Brond.
- Historical records are inputs to this preliminary scan, not approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26651-26700 exactly
  once and in identical order.
- Actual embedded line-break counts match. The Lykeios essay at ID 26680 has
  four embedded line breaks in each locale, retaining all three paragraphs.
- Runtime-token identity/order matches. At ID 26693, the `{*1...}` wrapper is
  preserved and its enclosed Active label is localized by design.
- The wager variable at ID 26685 is preserved. The ingredient quantities at
  ID 26692 match English/Japanese in Korean; Chinese has a source-locale
  quantity discrepancy (Chaos Essence 2 versus 3).
- No Korean translation CSV was edited.

## Batch Status

IDs 26651-26700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26701.
