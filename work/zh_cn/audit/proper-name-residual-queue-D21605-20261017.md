# D-21605 Residual Queue

Snapshot: after verified D-21604, 2026-10-17.
**Discovery candidates, not new translation dispositions or a completion claim.**

## Current Disposition Of This Snapshot

Superseded by D-21605/D-21606. All 30 listed labels were checked against
the active CSV again on 2026-10-17: 25 now have their exact complete
English name paired. Five retain the already registered source-spelling
normalizations: Astor Colliani at 1865 maps to Astor Colliane; Britt Hagni
at 9710/12186/64596 maps to Brit Hagni; Agnur Farhol at 61522 maps to the
place Agnur Farhal. These aliases are recorded in the existing glossary;
they are not five pending corrections or five new people.

The two Eyrie Peak/Eryie Peak labels below remain unclassified discovery
holds. Use `proper-name-residual-queue-D21614-20261017.md` for the next
concrete discovery scope, not the historical resume instruction below.

## Historical Resume Instruction

Resume at D-21605, default:1865, with the partial/full-name annotation
comparison below. This is not a sequential default restart: review through
default ID 65134 is complete. Read each candidate's full English/Japanese/
Chinese source scope and existing entity/row decisions before proposing edits.
Resolve the existing glossary owner first; do not register a full name as a
second person when its given name or title already owns the same identity.
Do not blindly rerun `review-proper-name-people-continuation-next.rb`.

The following 30 distinct default keys were found by a read-only scan:
English is an entire two/three-word capitalized label, Japanese is a
katakana label with a middle dot, Chinese contains a name separator, and
the Korean label has parentheses but no exact complete English name.
This heuristic deliberately excludes unpaired labels, single words,
titles outside this shape and other entity categories; it is not exhaustive.
Existing source-local aliases, spelling variants and deliberate partial
annotations may explain some candidates. Do not assume all 30 are errors,
unreviewed indexed keys or separate people. In particular, inspect the
Astor/Britt/Agnur source spellings before changing their parentheses.

| Default ID | Exact English Label | Current Korean Label |
| --- | --- | --- |
| 1865 | Astor Colliani | 애스터 콜리앤(Astor Colliane) |
| 8724 | Borri Kura | 보리 쿠라(Kura) |
| 9710 | Britt Hagni | 브릿 하그니(Brit Hagni) |
| 12186 | Britt Hagni | 브릿 하그니(Brit Hagni) |
| 15196 | Aryn Kest | 아린 케스트(Kest) |
| 15216 | Erion Raff | 에리온(Erion) 라프 |
| 15482 | Lenero Faust | 레네로(Lenero) 파우스트 |
| 19166 | Eselette Rier | 에셀레트(Eselette) 리어 |
| 19546 | Edwin Leodwald | 에드윈 레오드월드(Leodwald) |
| 19625 | Lanus Davril | 라누스(Lanus) 다브릴(Davril) |
| 26285 | Molly Janick | 몰리 재닉(Janick) |
| 29860 | Arny Schnegar | 아니(Arny) 슈네거(Schnegar) |
| 29982 | Edwin Leodwald | 에드윈 레오드월드(Leodwald) |
| 30837 | Molly Janick | 몰리 재닉(Janick) |
| 30930 | Fridi Edstar | 프리디(Fridi) 에드스타(Edstar) |
| 33735 | Remy Kallas | 레미 칼라스(Kallas) |
| 35798 | Jeibir Calurin | 제이버(Jeibir) 칼루린 |
| 35880 | Idwa Widfrond | 이드와(Idwa) 위드프론드 |
| 41024 | Vulgar Donnoh | 불가 도노(Donnoh) |
| 41633 | Jokull Fangard | 조컬(Jokull) 팽가드 |
| 42321 | Idwa Widfrond | 이드와(Idwa) 위드프론드 |
| 42847 | Cyf Cadyr | 시프(Cyf) 카디르 |
| 43298 | Jokull Fangard | 조컬(Jokull) 팽가드 |
| 44015 | Tynri Kalt | 틴리 칼트(Kalt) |
| 44802 | Idwa Widfrond | 이드와(Idwa) 위드프론드 |
| 47468 | Einar Longnose | 아이너(Einar) 롱노즈 |
| 49830 | Erion Rheidarn | 에리온(Erion) 레이다른 |
| 50141 | Hautren Kalt | 호트렌 칼트(Kalt) |
| 61522 | Agnur Farhol | 아그누르 파르할(Agnur Farhal) |
| 64596 | Britt Hagni | 브릿 하그니(Brit Hagni) |

## Unclassified Label Hold

| Default ID | English | Japanese | Chinese | Current Korean |
| --- | --- | --- | --- | --- |
| 5973 | Eyrie Peak | エイリー・ピーク | 艾瑞·匹克 | 에어리 봉우리(Eyrie Peak) |
| 58845 | Eryie Peak | エイリー・ピーク | 艾瑞耶·匹克 | 에리예 봉우리 |

Exact full-name searches across affix/base/default find only these two
labels, one per English spelling. There is no source sentence identifying
either as a person or place, or establishing that they are the same referent.
Japanese uses the same phonetic form, while Chinese differs slightly.
That is insufficient to treat Peak as a personal surname or to merge the
two English spellings. Preserve both CSV cells pending stronger contextual
or in-game evidence. Generic/pteryx `eyrie` and `Western Peak` quest text
does not establish either label's identity.

These are two documented discovery-label holds outside the existing
96 indexed uncertain matches in 93 rows. They have not been assigned a
new entity, disposition or global tally count. Do not misstate the indexed
96 holds as the complete universe of residual work.

## Verified Baseline

Latest verified batch: D-21604. Next batch: D-21605.
See `proper-name-validation-D21599-D21604-20261017.md`.

- Default SHA-256: `197b76ed7f8cae0aafeaa77958c3800551e7457b98ceb4ae2bfd4d5d7014504c`.
- Last actual default edit backup: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21604/locatexts_zh_cn.koalocatext_default.csv`.
- All three resources were searched. No source CSV, PAK, generated game binary,
  release ZIP, root `README.md` or GitHub release was changed.
- Back up the then-current active CSV byte-for-byte immediately before any
  next edit; do not use an older backup as if it matched a later active file.
