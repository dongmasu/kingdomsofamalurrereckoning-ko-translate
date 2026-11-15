# Asset Revalidation: `571972.quest_bxml` (`HV03`, House of Valor)

- Date: 2026-11-11.
- Scope: all 83 `default` IDs linked to this asset; all 83 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Four correction candidates and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML explicitly identifies `QUEST_ID HV03`, includes seven NPC symbols,
and contains 48 `dialog_line_*` handlers. These establish a House of Valor
arena-tournament context, but do not map individual localization IDs to
speakers, handlers, branches, addressees, or playback order. Speaker
attribution remains unassigned and dialogue order unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8310` | Naturalness / grammar | `울프 팩(Wolf Pack)를` has an incorrect object particle after a consonant-final noun. The earlier name review confirms `Wolf Pack` is the named team here, not a generic wolf group. Correct the particle to `울프 팩(Wolf Pack)을`; retain Brogan, the team, and the arena rule. | High |
| `38891` | Name pairing / format | `Brogan` is rendered without its English parenthetical in `대장 브로건은 명사수야`, although this row names the character and comparable rows pair the name. Consider `대장 브로건(Brogan)은 명사수야.` | High |
| `57501`, `59142` | Terminology / naturalness | These identical lines render capitalized `the Pit` as the literal `구덩이`. Japanese specifies the fighters' waiting area (`待機所`), while ID `913` in this asset calls it `투기장`; the related `Gladiator Pit` label is `검투사 투기장`. Consider a clearer shared location term such as `투기장 대기 구역` rather than `구덩이`, subject to confirming the in-game place distinction. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `28842` | Meaning / nuance | English `upstart` and Japanese `成り上がり者` carry a disparaging sense of a newly risen competitor, while Chinese uses `新手`. Korean `풋내기` naturally conveys a dismissive novice, but may not retain the “newly risen” nuance. The current wording is plausible; hold rather than replace it without stronger contextual evidence. |

## Repeated Text and Structure

Ten exact-English duplicate groups cover 25 rows. Each group has identical
translations in all four languages. No reviewed row contains an embedded line
break, runtime placeholder, or detected markup.

The remaining 78 IDs were retained after checking meaning, Korean
naturalness, and register against the same-ID sources. The asset's multiple
NPCs do not support assigning those lines a single speaker or normalizing
their voices.

## Complete Asset ID Set

`348`, `403`, `913`, `3266`, `3674`, `6156`, `6446`, `7717`, `8155`, `8310`,
`9788`, `9861`, `10051`, `10636`, `12021`, `12213`, `13123`, `15287`,
`15552`, `16933`, `17396`, `19932`, `20019`, `20259`, `20977`, `21509`,
`21694`, `22361`, `22390`, `22639`, `24942`, `25070`, `28227`, `28455`,
`28842`, `28885`, `29524`, `30692`, `31069`, `31189`, `35072`, `35278`,
`36219`, `37210`, `38182`, `38891`, `39135`, `39174`, `39261`, `40509`,
`46208`, `50167`, `50424`, `50809`, `51242`, `52056`, `52378`, `52906`,
`53567`, `54043`, `54745`, `55011`, `55316`, `55412`, `55649`, `55676`,
`56103`, `57501`, `57986`, `58062`, `58327`, `58834`, `59142`, `60253`,
`62098`, `63192`, `63537`, `63764`, `63785`, `64159`, `64375`, `64726`,
and `64792`.

All 83 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These findings are candidates, not approval to edit the translation.
