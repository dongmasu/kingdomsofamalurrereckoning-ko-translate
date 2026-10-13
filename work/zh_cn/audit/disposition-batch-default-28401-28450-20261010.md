# Disposition and Edit Batch: `default` IDs 28401-28450

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28401-28450, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, two `not an issue`, and eight uncertain.
- Accepted corrections at IDs 28427 and 28443 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28427 | `우리 민족이 내딛는 걸음마다 맞서고 있지` for “it rebukes my people's every step” | Accepted: change to `우리 민족이 내딛는 걸음마다 꾸짖고 있지`. English explicitly personifies the land as rebuking the people; Japanese also describes it as admonishing them. The current wording only says the land opposes them. |
| 28443 | `멜 센시르(Mel Senshir)로 끌려갈 운명` for “doomed to end up in Mel Senshir” | Accepted: change to `멜 센시르(Mel Senshir)에 가게 될 운명`. English and Chinese express a fated destination, and Japanese says the speaker is destined to end their life there; no locale says they are forcibly dragged there. |
| 28404, 28414, 28437, 28460 | Deuce / Gnome mayor statement / reagent values / ability layout | Not an issue: the card value and sequence, criticism of the Gnome mayor, four reagent lines, and the distinct weapon/effect categories are retained. The Japanese-only line-break difference at 28460 is preserved. |
| Remaining ordinary dialogue, objectives, and concise UI wording in IDs 28401-28450, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported. |
| 28403 | `부름받은 자` / `the Beckoned` | Uncertain: the role and honor relation are preserved, but the capitalized protagonist title remains part of corpus-wide glossary alignment. |
| 28408 | `분부대로……` for “Your bidding...” | Uncertain: Korean reads as an acknowledgment (“as commanded”), while Japanese and Chinese ask what the addressee wants or commands. English is a fragment, so resolve the speech act from dialogue context. |
| 28425 | Hierophant / seer / Daughters of Lyria contrast | Uncertain: English idiom “it beats the Daughters” is compressed and the antecedent of `it` is unclear; Korean chooses a comparative reading. Preserve pending dialogue context. |
| 28432 | `Adessa Livrarium` / underground vaults | Uncertain: the vault instruction is preserved, but Japanese and Chinese use different conventional renderings of the named library. |
| 28438 | `farce` / Walen and Daltan pants-wetting bet | Uncertain: Korean retains the joke and wager, but `난장판` may lose the absurd/sham quality of `farce`; retain pending tone review. |
| 28445 | Capitalized `Glass` | Uncertain: the source makes Glass a destination beyond the Blackened Hall; Korean `유리` can read as common glass, while the locales give divergent proper-name readings. |
| 28448 | `Tempest` / `폭풍` | Uncertain: the isolated capitalized label may be a named spell/effect or generic weather term. Preserve pending gameplay context. |
| Other named terms in IDs 28401-28450 | Beckoned, Destiny/card terms, Sage, Hierophant, Daughters of Lyria, Adessa Isles, reagent names, Order of the World, Winter Court, and named items/factions | Uncertain: retain current identities pending corpus-wide name, role, faction, and item terminology alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28401-28450 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
  Recipe values at ID 28437 remain unchanged.
- Only Korean `Texto` at IDs 28427 and 28443 changed. No source CSV, key,
  row order, or variant structure changed.
- Active default CSV SHA-256:
  `efa190aa44c8def396cf760cd83d89e045bc8f50027b4c63394a367bbd0b1263`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 878 accepted, 3,005 `not an issue`, and
  5,010 uncertain (8,893 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28451; 36,684 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
