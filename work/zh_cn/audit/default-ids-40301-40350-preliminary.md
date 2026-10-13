# Preliminary Language Scan: `default` IDs 40301-40350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40301-40350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40301 | `피해자는 페이야` / House of Ballads knight | Preserve that she is Fae and a House of Ballads knight and that the inference is that someone in Gorhart killed her; confirm whether “victim” is explicit in context. | English implies a killing but does not directly label her a victim in this sentence. Korean makes that role explicit. The historical log asks whether Fae do not kill their own, which is a causal belief rather than verified fact. | Medium |
| 40303 | Seven trainer variables and skill/level bounds | Preserve each variable's identity/order and distinguish skill level bounds `{5}-{6}` from character level `{7}`. | English, Japanese, and Korean use `{1}{2}{3}{4}{5}{6}{7}` in source order; Chinese uses `{1}{2}{3}{4}{7}{5}{6}`. Korean preserves English order and all three paragraphs. | High |
| 40315 | “trying to cure it” / `치료하려 했다는 이유` | Keep the referent of `it` open until surrounding context establishes whether the speaker means a disease, the war, or another condition. | English asks how many died in the war, describes battlefield corpses, then says they call the speaker a monster for trying to cure “it.” Korean retains the ambiguity; the existing audit explicitly asks whether this means curing a plague. | Medium |
| 40316 | `니랄림`; `리바이벌 야영지` | Standardize Nyralim, Lyenna, Mithros, and Camp Revival; preserve that the necklace may relate to Mithros's monoliths and that the requested meeting is for a demonstration. | Korean retains the hypothesis and purpose. The place/person/god-name spellings and the type of Revival remain unresolved in earlier notes. | Medium |
| 40318, 40321 | `바실리카 노스트라`; gem/socket terms; `미사루` | Standardize Basilica Gnostra, gems/sockets, and Mitharu while retaining the speaker's training/experience and the claim that only one people received divine guidance. | Korean preserves the training and divine-guidance claims. Proper names and socket terminology vary across the active corpus and remain candidates. | Medium |
| 40320, 40322 | `트래블러`; fair folk/Sidhe; Draug's Toothpicks | Preserve the named Travelers' reluctance to deal with Fae, the pocket-picking joke, and that the paired daggers are held by Gunnar Frode of the Sidhe and are required to become a Traveler. | Korean retains the joke and quest condition. The English has awkward wording (“fewer many pockets”); Korean resolves it as fewer pockets to pick. Travelers/Sidhe forms remain inconsistent in prior audits. | Medium |
| 40325 | `{*1}` map/travel markers and `{1}` key | Preserve the three marker identities and `{1}` while localizing only the visible labels and retaining the local-map-to-world-map direction. | Korean keeps the source marker sequence and key prompt. Japanese/Chinese localize marker payloads; this is an expected localized-label difference, not a token change. | High |
| 40327 | +7% Damage Resistance; 30% Mana cost | Preserve the active-condition qualifier, +7% value, and 30% sustained Mana cost. | Korean retains both values and the two-line layout; the Japanese uses a different localized term for the active qualifier but agrees on values. | High |
| 40330-40332 | blue beasts; great houses; Cradle of Summer/Great Cycle | Preserve the ship-hull damage from poisonous secretions and standardize the named houses and Summer/Great Cycle lore. | Korean retains the creature threat and the claim that the species protects the Cradle's place in the Great Cycle. Some locale phrasing differs on whether the houses are “great,” prestigious, or noble; names remain open. | Medium |
| 40339-40340 | `승격`; Queen of Staves / `지팡이 여왕 아르진` | Confirm whether ascension in the House of Ballads means promotion, a named rite/state, or another lore event, and standardize the card-court title. | English capitalizes House of Ballads and Queen of Staves. Korean reads ascension as promotion and translates the title; Japanese also uses a promotion reading, while Chinese interprets ascension differently. | Medium |
| 40343 | `서책` for `codex` | Confirm whether this is a specific named Codex rather than a generic book, while retaining that the speaker watched the player take it and thought all copies were gone. | Korean preserves the observation and perceived disappearance but uses a generic book term. The historical log flags the lost Codex. | Medium |
| 40345 | `손상된 저장 데이터` for `corrupted save data` | Confirm the game's exact destructive-save UI term and retain the irreversible deletion warning. | Korean preserves both the all-data scope and irreversibility. English says “corrupted,” while Japanese/Chinese use damaged/corrupted-save readings; the UI label should follow the game's convention. | Medium |
| 40349 | statue of Elodan Bloodgood holding a sculpture | Preserve the nested statue/sculpture image and check the intended display/model description. | Korean retains that Bloodgood's statue holds a sculpture and that the arrangement seems right. The English is intentionally odd/repetitive, so do not silently simplify it without asset context. | Medium |

IDs 40302, 40304-40314, 40317, 40319, 40323-40326, 40328-40329,
40333-40338, 40341-40342, 40344, and 40346-40348 generally retain the
English meaning on this first reading. Proper names, lore, and source
ambiguities remain subject to integrated review.

## Historical Audit Reconciliation

- `work/zh_cn/audit/from-ja_jp/open-questions.md` has a source-keyed entry
  for IDs 40250-40349. It flags the Fae/Houses premise, trainer variables,
  curing referent, Nyralim/Lyenna/Mithros/Revival, gem sockets, Travelers
  and Fae, Draug's Toothpicks/Sidhe, map markers, great houses/Cradle of
  Summer, ascension, Queen of Staves, Codex, save deletion, and Bloodgood
  statue. ID 40350 falls outside that historical range.
- These questions were checked against the active rows. No global
  terminology change is authorized.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40301-40350 once
  and in identical order.
- Embedded line-break counts match; ID 40303 retains two embedded breaks
  and all seven variables. Chinese alone reorders `{7}` ahead of `{5}{6}`;
  Korean retains the English sequence. ID 40327 preserves +7% and 30%.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40301-40350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40351.
