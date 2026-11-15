# Asset Revalidation: `565638.quest_bxml` (`HV02` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 105 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- Six correction-candidate IDs; no per-key speaker assignment is made.
- No translation CSV or extracted asset was changed. Proposed corrections
  require separate approval.

## Context Evidence and Limits

The asset has 50 `HV02`-prefixed dialogue handlers and 14 NPC symbols,
including the arena announcer, Jakin, Aesa, Helga, Bodine Borgue, and several
other combatants. These are asset-level clues only: they do not map each
localization ID to one NPC, branch, or playback order. The review groups the
rows under the Valor Arena / HV02 context without attributing a line to an
individual unless its text explicitly does so.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `22681` | Meaning / terminology | The same sentence uses `spell-casters` and `mages`, but Korean shifts from `주문술사` to `마법사`. The wording also says “a couple,” not an unspecified group. Consider `주문술사들을 상대하는 법을 알아 두는 게 좋을 거야. 데티어(Detyre)에서 온 마법사 두 명과 맞서야 하니까.` | Medium-high |
| `29204` | Format | Korean has `울프 팩(Wolf Pack)를`, but `팩` ends in a final consonant; the object particle must be `을`: `울프 팩(Wolf Pack)을 상대하게 될 거야!` | High |
| `30411` | Meaning | `cunning` here contrasts with arcane theory as a combat advantage; `교활함` implies malicious deceit. Consider `비전 이론이 기지와 경험을 이길 수 있을지 두고 보자!` | Medium-high |
| `34097` | Meaning / naturalness | English `Who are fighting?` is clarified by Japanese `対戦相手は？` and Chinese `我们的对手是谁？` as asking about the opponent, not who is fighting. Consider `상대가 누구지?` | High |
| `44005` | Speech level | One utterance shifts from `보이는군` to `달했어`. Japanese keeps both clauses in plain conversational style. Consider `놀라울 만큼 건강해 보이는군. 신체 능력도 절정에 달했군.` | High |
| `54074` | Terminology | `arcane` is rendered `신비학적인` here, while nearby arena lines use `비전` for the same arcane field (`14548`, `30431`, `42841`). Consider `비전술 면에서 넌 뭔가 특별해.` | High |

## Retained Decisions and Structural Checks

- The asset's NPC list and handler prefix do not establish individual
  speakers or dialogue order.
- Quest journal, objective, and arena-label rows were assessed as their own
  text type rather than spoken register.
- Exact-English duplicate groups and four-language line-break,
  runtime-token, and markup signatures are recorded by the validation pass
  accompanying this report.
- All linked IDs are listed below; each receives a four-language source
  fingerprint and an ID-level disposition in
  [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Complete Asset ID Set

`869`, `1236`, `1287`, `1363`, `1536`, `2627`, `3196`, `3281`, `3762`,
`5137`, `6784`, `8124`, `8335`, `8361`, `9620`, `11280`, `12568`, `12785`,
`12840`, `14548`, `15770`, `15912`, `18515`, `18561`, `19102`, `19525`,
`20009`, `21008`, `21365`, `21988`, `22681`, `24620`, `24889`, `25124`,
`25678`, `25831`, `26389`, `26558`, `26612`, `26703`, `28590`, `29162`,
`29204`, `29391`, `29430`, `30200`, `30411`, `30431`, `30908`, `31161`,
`31243`, `31972`, `33947`, `34097`, `34654`, `35046`, `35399`, `37652`,
`40263`, `40376`, `40549`, `40795`, `41448`, `42841`, `43059`, `44005`,
`44312`, `45485`, `46601`, `46659`, `47559`, `47594`, `48076`, `48944`,
`49392`, `50140`, `51024`, `52407`, `52711`, `53676`, `54035`, `54074`,
`54413`, `54679`, `54904`, `55884`, `56350`, `56860`, `57004`, `57183`,
`57707`, `58126`, `58475`, `58567`, `58898`, `58930`, `59036`, `60772`,
`61488`, `61843`, `61970`, `62057`, `62284`, `62590`, and `63832`.
