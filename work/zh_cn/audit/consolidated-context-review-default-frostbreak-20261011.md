# Consolidated Context Review: Frostbreak

- Date: 2026-10-11.
- Scope: exact-ID contextual review of the uncertain Frostbreak references at
  IDs 6172 and 31343, with a read-only comparison of all 38 English
  `default` rows containing `Frostbreak`.
- Sources: English, Japanese source and preserved Japanese-derived Korean,
  Chinese, and active Korean CSVs.
- English governs meaning; Japanese supplies voice and explicit sea context;
  Chinese is supporting evidence.

## Resolved Findings

| Decision | ID | Disposition | Evidence |
| --- | ---: | --- | --- |
| D-18247 | 6172 | Not an issue | English calls Dead Kel and his Hanged Men “masters of the Frostbreak.” Japanese explicitly says `フロストブレイク海の主` and identifies the Hanged Men as a pirate gang; Chinese also says they are masters of the Frostbreak Sea. The Korean `프로스트브레이크 해를 지배하지` preserves the sea and their mastery. D-18244 independently resolves the Hanged Men group identity. |
| D-18248 | 31343 | Not an issue | English's `rolling tides of the Frostbreak` is explicitly a sea image in Japanese (`フロストブレイク海のうねる波`) and Chinese (`霜断海翻滚的浪潮`). Korean `프로스트브레이크의 굽이치는 파도` preserves the sea/tide meaning without needing to append `해` to the proper name in this sentence. |

No CSV cell changed. These decisions do not select a global Korean spelling
for every Frostbreak occurrence. The dominant `프로스트브레이크 해` coexists
with other translations, and unresolved rows retain their separate issues:
ID 2480 also has the Rathir spelling conflict; 6076 has the Scavs taxonomy
question; 10593 has source and lore anomalies; 11833 has poster, faction, and
place-name questions; 35216 has a creature-category question; and 52626 uses
the distinct `서리단절해` form. Do not normalize these rows mechanically.

## Verification and Totals

- All 38 exact English-keyed occurrences were inspected for this term
  cluster; the two dispositioned IDs were compared in all five files.
- Active default SHA-256 before and after:
  `1aa595e9d3fd82767b4db2cf641daab1bf4e6b846a8573017feef8857bc95400`.
- Cross-resource totals through D-18248: 1,927 accepted, 23,082
  `not an issue`, and 13,513 uncertain (38,522 total); next D-18249.
- These are working dispositions, not independent final linguistic
  approval.
