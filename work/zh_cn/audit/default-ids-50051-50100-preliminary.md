# Preliminary Language Scan: `default` IDs 50051-50100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 50051-50100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 50059 | King of Sorrows / `비탄의 왕`; “they” / `그들` | Preserve the source's unspecified referent for “they”; do not import a more specific faction without context. | Korean retains an unspecified plural referent, matching English. Japanese is also general, while Chinese explicitly says rebels. Historical notes identify this divergence. | High |
| 50060 | Godstorm / `신의 폭풍`; Withering War / `시드는 전쟁` | Confirm both formal event names and standardize Withering War against existing Korean variants such as `쇠락의 전쟁`. | Korean translates the Godstorm and Withering War rather than transliterating them. Historical notes flag both event names; the Korean corpus already contains several Withering War forms. | Medium |
| 50067 | true codex / `진짜 대계` | Confirm whether Codex is a named book/artifact and use its established Korean term rather than a potentially doctrinal reading of `대계`. | English contrasts a true codex with an item not meeting that expectation. Korean's `대계` can mean a grand scheme/doctrine; other reviewed rows use several generic or book-like Codex translations. Historical notes explicitly flag the meaning. | Medium |
| 50073 | special litanies / `특별한 기도문`; shrine / `성소` | Confirm whether litanies are prayer texts, rites, or a formal ritual category; preserve that the shrine's magic is depleted. | Korean interprets litanies as prayer texts and retains the exhausted-magic statement. Japanese/Chinese also suggest prayer texts; historical notes keep the text-versus-rite question open. | Medium |
| 50075 | Revival / `리바이벌` | Confirm whether Revival is the proper name of a place/camp or a generic greeting/event label. | Korean transliterates the capitalized name, matching Japanese; Chinese expands it to “Revival Camp.” Historical notes explicitly flag the location/event distinction. | Medium |
| 50081 | Cape Solace / `케이프 솔라스` | Standardize the recurring place-name spelling; this differs from the active Korean `케이프 솔러스` at ID 49724. | English and Japanese identify the same place; the two recent Korean rows use different vowel spellings. Chinese translates the phrase semantically. | High |
| 50085 | Rattlesnake / `라틀스네이크`; Desert Runner / `사막의 질주자` | Confirm the fable's canonical creature/name forms and preserve the threat to the Desert Runner's children and the final cause-and-effect explanation. | Korean retains the full fable and the threat. English, Japanese, and Chinese use different forms for both names; historical notes flag the imagery and terminology. All four locales preserve five line breaks. | Medium |
| 50090 | Stealth / `은신`; `{1}` | Preserve that investing in Stealth and pressing the runtime button lets the player sneak around enemies. | Korean keeps the skill/action relationship and `{1}` identity and placement. The marker sequence matches across all locales. | High |
| 50094 | Aggressive mode / `공격 모드`; crime spree / `범죄를 저질러 봐` | Confirm the official UI label and preserve that enabling the mode initiates repeated criminal activity, not just one crime. | Korean's `공격 모드` matches a prior reviewed rendering, but “crime spree” becomes a generic singular crime. The historical entry explicitly flags the UI label. | Medium |
| 50097 | Fate Shrine / `운명의 성소` | Confirm the formal shrine name and preserve the repair-completion and effectiveness-test sequence. | Korean retains Nard Caloss, the damaged shrine, completed repair, and test objective. Japanese/Chinese use different shrine terms; historical notes flag Fate Shrine. | Medium |
| 50100 | Goodbye / `잘 가` | Preserve the short farewell and speaker register. | Korean gives a natural informal goodbye; other locales also use a brief farewell. This is the batch endpoint and boundary row. | Low |

Other names and recurring terms in this range, including Caeled Coast,
House of Ballads, Savant Aethan Engar, Crownhold, House and Heartbreak,
King of Sorrows, Siobhan Reen, Red Marches, Telogrus, Rathir, Aodh, Skald,
Fateless One, Unbound, Warsworn, Cape Solace, Ljosalfar, Varani, Emaire,
Galenun Hegem, Adessa, Jakin, Valor Arena, Embereyes, Caer Elatha,
Crossing, Cliff Barghest, Nard Caloss, Fate Shrine, and Rattlesnake/
Desert Runner remain subject to corpus-wide terminology and bilingual-name
consistency review. Existing Korean forms were preserved.

IDs 50051-50058, 50061-50066, 50068-50072, 50074, 50076-50080,
50082-50084, 50086-50089, 50091-50093, 50095-50096, 50098-50099 generally
retain the English meaning on this first reading. Names, idioms, UI labels,
and lore terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed entry for IDs 50050-50149. This batch's
  relevant open questions are the unspecified “they” in the King of Sorrows
  account (50059), Godstorm/Withering War (50060), “true codex” (50067),
  litanies (50073), Revival (50075), the Rattlesnake/Desert Runner fable
  (50085), Aggressive mode (50094), and Fate Shrine (50097).
- ID 50085 preserves the five historical line breaks in all four locales.
  ID 50050 is the preceding batch's endpoint; ID 50100 is this batch's
  endpoint. Each row is counted once.
- Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 50051-50100 once
  and in identical ascending order.
- ID 50085 has five line breaks in each locale. ID 50090 preserves `{1}`;
  no other line-break differences, runtime-token discrepancies, or hidden
  format/control characters were found.
- The active Korean spelling for Cape Solace differs between IDs 49724 and
  50081; this is recorded as a terminology consistency candidate.
- No translation CSV edit was made.

## Batch Status

IDs 50051-50100 received an initial preliminary reading and subsequent
working disposition in
[`disposition-batch-default-50051-50100-20261010.md`](disposition-batch-default-50051-50100-20261010.md).
The codex and crime-spree wording were corrected; lore/name candidates
remain provisional, not independent final linguistic approval. Continue
at `default` ID 50101.
