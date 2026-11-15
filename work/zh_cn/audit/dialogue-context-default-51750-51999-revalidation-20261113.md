# Sequential `default` Revalidation: IDs `51750`-`51999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 72 pre-existing four-language fingerprints; all match.
  Append the other 178 IDs without changing existing ledger rows.
- Recorded seven current correction candidates and 14 evidence-limited
  holds; 229 IDs have no current finding. These categories do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `51756` | Speech level / naturalness | Japanese is conversational and familiar (`言及しといてくれよ`), while Korean shifts to the stiff `언급하는 걸 잊지 말게` / `나서겠네`. Keep the request and willingness to help, but use one natural conversational register throughout. | Medium-high |
| `51795` | Speech level / naturalness | `우리 작은 마을이 내놓는 것을 즐기게` is an awkward calque and uses a marked `-게` ending; Japanese invites the visitor to relax and enjoy the village's hospitality. Consider `긴장을 풀고 우리 작은 마을의 환대를 마음껏 누려.` | High |
| `51859` | Meaning | `are now yours to command` means the Scholia Arcana's members are now under the addressee's command. Korean instead says the addressee has the `권한` to command them. Japanese explicitly says the group will follow the addressee. Consider `이제 우리도 당신의 지휘를 따르겠어... 대현자여.` | Medium-high |
| `51889` | Meaning / naturalness | The final line says sharing their memories is the only immortality they can hope for. `유일한 불멸의 희망` can instead mean their sole hope of becoming immortal. Consider `이제 우리가 바랄 수 있는 유일한 불멸은 그것뿐이다.` Preserve the poem's existing line breaks. | Medium-high |
| `51946` | Meaning | The English fragment `It is...` is completed by Japanese `ようやく` (“at last”); Korean `그렇지...` reads as agreement. Consider `마침내... 그 짐승을 쓰러뜨렸어.` while preserving the following sentences. | Medium-high |
| `51964` | Meaning / naturalness | English and Japanese ask whether the listener has tried talking to Gelda about a loan. `대출을 받으려면 겔다와 얘기해 보셨나요?` recasts this as a condition for obtaining a loan. Consider `겔다(Gelda)에게 대출에 관해 이야기해 보셨나요?` | Medium |
| `51998` | Naturalness | `기회의 빛이 환하게 빛나더군` repeats the same “bright/glow” image. Consider a more natural rendering such as `너에게서 기회의 빛이 환하게 일렁이는 게 보였어`, retaining the favorable impression and promised payment. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `51750` | Source conflict | English, Chinese, and Korean say `The Stowaway`; Japanese says `Silverback Troll`. Do not add creature information based on Japanese alone. |
| `51801` | Terminology | `Lyria Acolyte` is rendered `리리아(Lyria)의 시종`. The role may be a religious rank, attendant, or compact entity label; the project's `Acolyte` glossary rendering does not by itself resolve this specific title. |
| `51806` | Terminology conflict | The current `먼지의 자식(Child of the Dust)` conflicts with an earlier accepted `먼지의 아이` follow-up and a later asset review recommending `먼지의 자식`. Preserve the existing text and decision history; resolve the conflicting term policy before proposing an edit. |
| `51821` | Source conflict | English/Chinese support an accusation after the player's prior actions, while Japanese specifically says “after you helped me.” Korean follows the English-led reading; the scene context does not resolve the discrepancy. |
| `51912` | Meaning / referent | The slash-separated clue is preserved, but the referent of `Patrons` and the direction `looks down` remain unclear across the references. |
| `51917` | Meaning / title | The speaker's third attempt to claim a seat in the House of Ballads is clear; the formal sense of `telling` and whether the performance secures that seat remain context-dependent. |
| `51930` | Terminology | `Captain at Arms` identifies a Warsworn role, but its formal office and canonical Korean title remain unsettled. |
| `51949` | Meaning / referent | `Ethene's once-common words` is figurative, and the antecedent of `she` in `But she does not answer` is not established by this excerpt. Do not assign it to Ethene or the Primos by proximity alone. |
| `51959` | Source conflict | The source says there are three Travelers Camps but names only Star Camp and Moon Camp. Korean preserves the same discrepancy; do not invent a third camp. An earlier ledger candidate is not confirmed as a Korean translation error. |
| `51961` | Terminology | The divine title `Authority` is clear, but the canonical Korean form remains unresolved in the decision register. Do not infer a settled title from other context-specific uses. |
| `51985` | Meaning / referent | The antecedent of `they` after Priestess Aurela destroys the wand is absent from the excerpt. The Korean's plural reference is appropriately left generic. |
| `51988` | Terminology / referent | `Scion's Guard` may name a faction, unit, or guard post; the row does not establish which. |
| `51990` | Proper name / title | The Korean title is paired with the full English source, but the established Korean spelling and exact status of `Aster` are not settled by this row. |
| `51999` | Proper name / meaning | `Souldeep Fasting` may be a place name, while Japanese and Chinese describe underground halls/passages. Keep the location and Korean form unresolved. |

## Rechecked Findings and Structure

- Existing ledger entries and fingerprints were preserved. Current findings at
  `51859` and `51959` are documented here without rewriting their prior
  asset-review records. The prior `not-issue` record at `51883` was
  independently rechecked; the current Korean retains the “chosen / to be
  king” meaning, so it is not reopened as a candidate.
- The current review does not treat the previous asset-level `51806`
  terminology candidate as approval to edit; the contradictory term decisions
  require reconciliation first.
- Sixty-five exact-English duplicate groups touch the range, covering 65
  target rows. Korean wording matches within every group.
- Five entries contain embedded line breaks: `51771` (16), `51798` (3),
  `51825` (3), `51889` (9), and `51958` (6), for 37 breaks per language.
  Per-ID line-break counts match across all four languages.
- At `51803`, the Korean marker sequence matches English; Japanese omits
  `{*2}`, while Chinese omits `{LINE_LEFT}` and reorders `{*1}` / `{*3}`.
  The Korean follows English, and no Korean marker correction is proposed.
  Localized marker labels at `51755` and `51825` are translated payloads,
  not missing runtime tokens.
- Of 250 IDs, 192 have indexed asset associations, represented by 197
  ID-asset links across 129 assets; 58 have no indexed asset. Of the 178 new
  IDs, 120 have indexed associations and 58 do not. These links do not
  establish per-key speakers or playback order.

## Range Result

- This range has seven current correction-candidate IDs and 14
  evidence-limited holds; 229 IDs have no current finding.
- After appending 178 IDs, the ledger covers 55,438 of 65,135 unique
  `default` IDs (85.11%), leaving 9,697. Sequential coverage reaches
  `51999`; next is `52000`-`52249`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
