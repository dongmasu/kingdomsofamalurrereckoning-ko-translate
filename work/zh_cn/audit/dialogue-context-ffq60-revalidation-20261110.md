# FFQ60 / Brit Codgan Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 40 `default` keys found in `1491990.quest_bxml` (`FFQ60`).
- The user-approved correction at ID `64046` is now applied to the active
  Korean CSV; extracted game resources remain unchanged.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ60`, the asset-level symbol
`NPC_YSA_LJO_BritCodgan`, the `QuestItem_FFQ60_HonorBrand` symbol, and 20
serialized `dialog_line_*` handlers. Its text concerns Brit Codgan's
counterfeit and authentic Honor Brands, their components, and their sale in
Ysa.

All 40 exact-key matches were compared at the same ID across the active
Korean, English, Japanese, and Chinese `default` tables. The asset-level NPC
symbol does not map individual keys to Brit Codgan, other speakers,
callbacks, branches, addressees, or playback positions.

ID `8192` is a context outlier: its journal text explicitly names Brit Hagni,
not Brit Codgan. The exact key is present in the FFQ60 asset, but that
association is not proof that Brit Codgan speaks the line or that it belongs
to his dialogue. Brit Hagni is separately identified in the English text as
Azo Raemund's assumed identity. The active Korean accurately reflects the
English wording; no speaker attribution or translation change is proposed.

## Revalidation Findings and Applied Edit

ID `18796` remains a reviewer candidate. The user approved the ID `64046`
format correction, which was applied and rechecked against all three source
locales.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `18796` | Speech level / naturalness | This apparent player-choice line is `제안은 아직도 유효한가요?`, while the other apparent player choices in this group use informal endings (`금이 좀 필요해`, `부품은 어디서 구하지?`, `관심 없어`). English asks whether the offer is still available; Japanese uses plain style. If confirmed as the same choice-menu voice, consider `그 제안 아직도 유효해?` | Medium; choice/menu classification is content-based, not callback-mapped |
| `64046` | Format / terminology | Applied: `이사의 아너 브랜드(Honor Brands)(Ysa Honor Brands) 제작` → `이사의 아너 브랜드(Ysa Honor Brands) 제작`. This removes the nested duplicate while preserving the established `아너 브랜드` form and pairing the complete Ysa-qualified title once. | High |

The four occurrences of the exact English source `Here's what I have.`
(`18415`, `21735`, `23911`, `26924`) have identical Korean, Japanese, and
Chinese translations. No other exact English duplicate group occurs among
these 40 keys.

No embedded line breaks, runtime brace tokens, or markup were found in any
of the 40 rows across the four locales. Apart from the remaining candidate
at `18796`, the other rows showed no clearly supported meaning, Korean
naturalness, register, address, honorific, terminology, or formatting defect
in this pass.
Singular `Honor Brand` and plural `Honor Brands` are represented consistently
with the established `아너 브랜드(Honor Brand[s])` glossary forms; ordinary
`Faeblade(s)` references use the established `페이블레이드` rendering.

## Coverage and Limits

All 40 asset-linked IDs were reviewed for content type, meaning, Korean
naturalness, speech level, address, honorifics, terminology, and format as
applicable. The findings and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Only ID `64046` was changed in the Korean CSV at the user's request; no
extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`4514`, `6822`, `6867`, `7305`, `8192`, `13795`, `15508`, `16843`, `18415`,
`18796`, `19041`, `19980`, `20237`, `21735`, `23179`, `23911`, `24445`,
`25305`, `25923`, `26924`, `29859`, `30032`, `31118`, `33012`, `35799`,
`37744`, `39356`, `42365`, `45484`, `50180`, `50931`, `52704`, `53489`,
`60985`, `61237`, `61506`, `61802`, `62514`, `63513`, `64046`.
