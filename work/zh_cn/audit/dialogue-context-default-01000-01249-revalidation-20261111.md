# Sequential `default` Revalidation: IDs `1000`-`1249`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `1000`-`1249`; add only IDs that had no current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 184 new IDs were reviewed and recorded. The other 66 IDs in this range
  already had ledger records and were not duplicated.
- Ten correction candidates and seven evidence-limited holds were identified;
  ID `1041` appears in both groups.
- The pass checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and line breaks/runtime markers. UI, objective,
  item, book, and other non-dialogue text was judged according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approved edits:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `1002` | Meaning / terminology | English says “four nexus points”; Japanese describes four magical convergence points and Chinese uses hub nodes. `넥서스 지점` is awkwardly literal here. Consider `마력 집결점 네 곳`; this is an occurrence-level proposal, not a global decision for every `Nexus`. | Medium |
| `1018` | Format | The ensemble-name list gives English only for `Mithros`, `Colet`, and `the Fateless`; `Souls of Mithros` and `The Echoes` lack complete English parentheticals. Add the complete English names to the three group-name spans, e.g. `미스로스의 영혼(Souls of Mithros), 메아리들(The Echoes), 콜렛(Colet)과 운명 없는 자들(the Fateless)`. | High |
| `1041` | Naturalness | `아니면 너무 적게?` leaves the final comparison unusually incomplete. Preserve the rhetorical question while restoring the implied verb: `우리가 너무 많이 알아 버린 걸까, 아니면 너무 적게 알고 있었던 걸까?` | High |
| `1046` | Meaning | `다시는 다라로 돌아올 수 없네` adds “return” and makes Dara the destination. The English is elliptical, “Never to be Dara anymore”; consider the closer poetic reading `다시는 다라일 수 없으리`, subject to the poem's intended sense. | Medium |
| `1061` | Meaning | The English explicitly says “I knew all along,” which is absent in Korean. Restore the speaker's prior knowledge, e.g. `나는 줄곧 신들이 우리를 버린 적이 없다는 걸 알고 있었어.` | High |
| `1137` | Terminology | This is the numerical `Health` attribute (`+11% Health`), not general vitality. Use the established stat term: `+11% 체력`. | High |
| `1139` | Naturalness | `홀더인` is an awkward untranslated loanword for the sceptre's owner. Use `셉터의 주인인 잔느 야브(Jeanne Yave)`. | High |
| `1151` | Format | The ship's full English name is `The Maid of Fortune`; the current parenthetical omits the article. Use `행운의 시녀호(The Maid of Fortune)`. | High |
| `1214` | Naturalness | `신들이여!` reads as a direct vocative, while “By the gods!” is an exclamation/oath. Consider the natural Korean exclamation `맙소사!`; Japanese differs in nuance, so retain the English and Chinese evidence in final adjudication. | Medium |
| `1234` | Format | The named person appears as `이반 휴그` without the English name. Add `이반 휴그(Ivan Hugues)` for the project's name-bilingual format. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `1041` | Speech level | Japanese uses a casual feminine question, while Korean `-로군` is more marked and masculine-sounding. The linked asset contains many NPCs and does not map this key to a speaker; hold the voice question. |
| `1107` | Speech level | Korean `생각해 보겠소` uses marked deferential/archaic speech; Japanese is a plain `考えておこう`. The multi-NPC asset does not establish the speaker or relationship; hold. |
| `1125` | Speech level | Korean `-거요/-겠소` is more marked than the conversational Japanese endings. The linked quest asset has multiple NPCs and no key-level speaker mapping; hold. |
| `1135` | Speech level | Korean addresses the player politely (`찾으시나요`, `많답니다`), while Japanese is plain. A vendor/customer relationship could explain the difference, but the asset does not identify the speaker for this key; hold. |
| `1213` | Meaning | English “explain yourself” can ask for an explanation of one's conduct; Japanese says to disclose one's identity, which Korean follows. Chinese supports the broader “explain” reading, and the linked assets do not establish the scene; hold pending context. |
| `1216` | Speech level | Korean `누구시죠?` is polite, while Japanese is the short `あなたは？`. The linked multi-NPC asset does not identify the speaker or relationship; hold. |
| `1221` | Speech level | Japanese uses a feminine casual ending, while Korean `재미있군` is more masculine/marked. The linked asset has dialogue handlers but no NPC or key-level mapping; hold. |

## Source and Structural Checks

- The exact-English duplicate pair `1043` / `1174` has identical Korean
  translations.
- Line-break counts, runtime placeholders, layout tokens, display-wrapper
  indices, and markup signatures match across English, Japanese, Chinese, and
  Korean for all 184 newly recorded IDs.
- Existing records in this numeric range were preserved and not rewritten.

## Newly Recorded IDs

The 184 new ledger rows are:

`1000`, `1001`, `1002`, `1003`, `1004`, `1005`, `1006`, `1008`, `1009`,
`1010`, `1011`, `1013`, `1014`, `1015`, `1016`, `1018`, `1019`, `1020`,
`1021`, `1024`, `1025`, `1026`, `1027`, `1028`, `1029`, `1031`, `1032`,
`1033`, `1034`, `1035`, `1036`, `1038`, `1041`, `1042`, `1043`, `1044`,
`1045`, `1046`, `1048`, `1051`, `1052`, `1053`, `1054`, `1055`, `1057`,
`1058`, `1059`, `1060`, `1061`, `1062`, `1063`, `1064`, `1065`, `1066`,
`1069`, `1070`, `1071`, `1073`, `1075`, `1076`, `1077`, `1078`, `1079`,
`1080`, `1081`, `1082`, `1083`, `1084`, `1085`, `1086`, `1088`, `1089`,
`1090`, `1091`, `1092`, `1096`, `1097`, `1098`, `1099`, `1100`, `1101`,
`1102`, `1103`, `1104`, `1105`, `1106`, `1107`, `1109`, `1112`, `1113`,
`1116`, `1117`, `1118`, `1122`, `1123`, `1125`, `1127`, `1131`, `1134`,
`1135`, `1137`, `1138`, `1139`, `1140`, `1141`, `1142`, `1143`, `1144`,
`1145`, `1147`, `1148`, `1149`, `1150`, `1151`, `1152`, `1153`, `1155`,
`1157`, `1159`, `1160`, `1161`, `1163`, `1164`, `1165`, `1167`, `1168`,
`1169`, `1172`, `1174`, `1177`, `1178`, `1179`, `1180`, `1181`, `1182`,
`1183`, `1184`, `1186`, `1187`, `1189`, `1190`, `1192`, `1193`, `1194`,
`1195`, `1196`, `1197`, `1198`, `1199`, `1201`, `1203`, `1204`, `1205`,
`1209`, `1210`, `1211`, `1212`, `1213`, `1214`, `1215`, `1216`, `1219`,
`1221`, `1223`, `1225`, `1227`, `1228`, `1229`, `1230`, `1231`, `1232`,
`1234`, `1235`, `1238`, `1240`, `1241`, `1242`, `1243`, `1244`, `1245`,
`1246`, `1247`, `1248`, `1249`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
