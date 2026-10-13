# Preliminary Language Scan: `default` IDs 55001-55050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55001-55050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and source annotations.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55001 | The keep's former appearance and the key | Clarify whether the key is explicitly connected to the dream or is an unexplained transition; preserve the remembered keep's height and beauty. | Korean preserves the dream and key but, like the English, does not explain their connection. Japanese and Chinese also leave it implicit. | Low |
| 55005 | `너라면... 너라면 이걸 가져가도 돼` | Verify the repeated false start against the active Korean row. | Direct CSV comparison confirms Korean already repeats `너라면` twice, matching the repeated `you might` in English/Japanese and the repeated possibility in Chinese. The earlier preliminary wording incorrectly claimed the second repetition was omitted. | High |
| 55016 | `후원자` / `everything ... produces` | Check whether the patronage is financial sponsorship and keep the ownership claim clear. | English explicitly says the speaker owns everything Scholar Hugues produces; Korean retains that claim but `후원자` can sound broader than a financial patron. Japanese says investor. | Medium |
| 55020 | `어떤 순서로 들어가야 해?` | Retain the English/Japanese-supported question about entry order. | English and Japanese both ask which order to enter in. Chinese differs on the underlying context, but Korean follows the primary English meaning without adding a mechanic. | Medium |
| 55022 | `샘(Font)` | Confirm the established Korean display form for the named Font and distinguish it from an ordinary spring/fountain. | English capitalizes `Font`; Japanese treats it as a named sacred spring. Korean includes the English name but leads with a generic Korean noun. | Medium |
| 55023 | `첫 서약자들의 전당(Hall of the Firstsworn)` | Resolve whether the destination is the Firstsworn Hall or a shrine, and standardize the faction/place name. | English says Hall and Korean follows it; Japanese says shrine. Chinese also says Hall. The historical note flags the source-locale divergence. | Medium |
| 55026 | `걸어서... 빠져나올 수 있었는데` | Preserve the speaker's interrupted/stammered speech, particularly the broken `wa- walked` phrase. | Korean retains several repetitions and pauses but smooths the English false start into ordinary wording. Japanese also restructures the hesitation. | Medium |
| 55029 | `자기 사람들을 칼로 몰살시킨 뒤니` | Recheck who killed whose people and whether the last group is leaving or has been killed. | English says the last of “them” go after putting their own people to the sword; Korean makes the slaughtered group an explicit object and may shift the antecedent/agency. Japanese describes the last person dying, while Chinese says the last wave of slaves left. | High |
| 55039 | `그걸 ... 뜯어낼 수밖에 없어` | Identify the referent of `it` from quest context before deciding whether Korean needs an explicit object. | The English and Korean leave the object unspecified; Japanese and Chinese do too. The row alone does not identify what is being torn from the body. | Medium |
| 55044 | `낮은 쪽을 고르겠다고?` | Confirm the established phrasing for the low/high card call and preserve the ace reveal. | The English and Japanese indicate a low call followed by an ace; Korean conveys the call and win, while the Chinese text has a different card-rank rendering. | Medium |
| 55046 | `친숙도 2레벨` for `Level 2 Familiar` | Confirm whether `Familiar` is a game-system/entity term or means familiarity, then use the established term. | Korean interprets it as `친숙도`; the isolated fragment does not establish whether this is a named gameplay category. | High |
| 55049 | `my lady` / `내 부인` | Confirm the addressee's relationship or title before specifying “wife.” | English `my lady` does not establish marriage. Korean narrows it to wife; Japanese uses the honorific `奥様`. | Medium |
| 55050 | `veracity` / `내가 진실하다는 걸 증명` | Preserve the sense of demonstrating truthfulness/veracity. | The Korean wording conveys that the speaker will demonstrate being truthful; no supported correction is established by the isolated row. | Low |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Jenniker, Tree Cave, Alleia,
Oreyn, Marga, Ugnar, Quarter-way Quix, Fae, Ysa, Prismere, Firstsworn, Font,
Racinon, Lyria, Pteryx, Calder Vonn, Cape Solace, Undersewer, Gravehal,
Cynoc's Eye, Familiar, and Alyn Shir. Alyn Shir is written as
`앨린 시르(Alyn Shir)` here; compare its spelling with other occurrences
before selecting a corpus-wide form.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54950-55049` and
  `55050-55149`. Relevant prompts for this batch include the dream/key
  connection (55001), chains (55002), Jenniker's Treatise (55004), the
  blood-hunger fragment (55005), Quarter-way Quix (55014), Hugues's
  patronage (55016), the title (55017), Ysa/Prismere (55018), the entry
  order (55020), Font (55022), Hall versus shrine (55023), broken speech
  (55026), Racinon (55027), the slaver passage (55029), litany (55032),
  Pteryx armor (55033), Undersewer (55037), `it` (55039), Gravehal (55041),
  high-low cards (55044), Familiar (55046), Lord of Deserts (55048), and
  `veracity` (55050).
- ID 55050 is the opening boundary of the historical 55050-55149 range and
  is included here once. It will not be repeated in the next active batch.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55001-55050 once
  and in identical ascending order.
- Physical line-break counts match across all four locales.
- Runtime variables and markers at 55021 match in identity and order.
- ID 55030's `[DO NOT USE]` source annotation is localized in the other
  three files; its bracketed annotation treatment is retained.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 55001-55050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55051.

## Disposition Cross-Reference

The working disposition pass is recorded in
[`disposition-batch-default-55001-55050-20261010.md`](disposition-batch-default-55001-55050-20261010.md):
5 IDs remain uncertain, 45 are `not an issue`, and no CSV correction was
accepted. The 55005 finding was corrected after direct inspection of the
active CSV. This is an in-progress disposition, not independent final
approval.
