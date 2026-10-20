# D-21871: Foreman Vire Spelling Residual

Date: 2026-10-20

At `default:60337`, English self-introduction explicitly names Foreman Vire.
Japanese 現場監督のヴィール and Chinese 工头维莱 corroborate the foreman.
Correct only `비레(Foreman Vire)` to `비르(Foreman Vire)`, reusing the
existing person:vire canonical spelling. Retain 현장 감독, the complete
English pairing, Motus Mining, and every other part of the introduction.

D-20571 retained this atomic English pairing but left the spelling variant
unchanged. This finding supersedes only that Korean spelling, not the
person identity, atomic-pairing decision or other source-row judgments.
No entity, alias, occurrence key or status is added or changed. The two
existing person/company index rows have only their Korean context snapshots
updated.

## Rejected Heuristic Hits

- Eagonn/default:42993: Korean 이건 is the ordinary demonstrative, while the actual personal name already reads 이곤(Eagonn). Preserve D-20390.
- Varen Seawine: the existing complete-name entity deliberately uses 바렌 시와인; do not replace its first name with the short-name entity's 베런.
- Odwig site labels: preserve the existing site-versus-person distinctions, including the registered 오드윅 shrine label.
- Magnus/default:15137 and 51049: family and complete item-title scopes are not reopened as personal-name spelling issues.
- Bayala/default:45445: retain the prior separate title-scope exclusion.
- Minn/default:551: 웃는 민 preserves the epithet meaning; no clear error justifies changing it merely to match 웃음꾼 민.
- The Widow/default:28076: the ordinary widow reference remains excluded from any forced proper-name normalization.

## Verification

Exact cell and sources: `proper-name-edits-D21871.tsv`.
The existing byte-preserving editor passed structural, token, newline,
non-target-byte and inverse checks for the one default cell. Index inverse
serialization matches its backup; only two Korean context fields change.

- Default pre-edit SHA-256: `6cd0a8ff589eac93351f3da593bfd5c08df026d8656ff78236b79ca0c79b15df`.
- Default post-edit SHA-256: `4318b215658f12816c1e764b14f1cd4f4362e5738958640a21ceeee87026de7b`.
- Index post-edit SHA-256: `0ca768ff6f18cfc99a416613cfbd0042ad296d1b8e069d4365689f200b73714f`.
- Backups: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21871`.

Consolidated D-21868-D-21871 verification also passed against the D-21868
pre-edit backup: nine Texto cells changed across 65,135 ordered rows,
with all other CSV bytes preserved and exact inverse reconstruction.
All 48,484 index rows retain order, keys, statuses and evidence; exactly
ten Korean context snapshots change, and their inverse matches the original
index bytes. Affix and base hashes remain unchanged.

No global residual/bilingual audit, inventory rebuild, build, release change
or in-game test. Continue bounded content-first verification; do not rerun
these rejected hits without new evidence.
