# Seelie and Unseelie English Pairing - November 10, 2026

Compared English `Seelie`/`Unseelie` source entries with the active Korean
`base`, `default`, and `affix` resources. The English `base` and `affix`
resources contain no matching entries. In `default`, added missing English
pairings at these 16 IDs:

- `19400`: `셀리(Seelie)`
- `19536`: `운시엘리(Unseelie)`
- `25280`: `운실리(Unseelie)`
- `25462`: `안실리(Unseelie)`
- `30187`: `시일리(Seelie)` for the later `Seelie bards` mention; the earlier
  `Seelie Fae` mention was already paired
- `31067`: `실리(Seelie)` and `언실리(Unseelie)`
- `32595`: `운시엘리(Unseelie)`
- `33938`: `언실리(Unseelie)`
- `34549`: `실리 마법사(Seelie Sorcerer)`
- `34805`: `시일리(Seelie)`
- `41537`: `실리 전사(Seelie Warrior)`
- `42831`: `운시일리(Unseelie)`
- `45868`: `언실리 경비병(Unseelie Guard)`
- `48185`: `시일리(Seelie)`
- `57472`: `실리(Seelie)`
- `58722`: `언실리(Unseelie)`

Compared the affected source wording with Japanese and Chinese references as
supporting checks. This pass adds English annotations only: it does not
standardize the existing Korean transliteration variants or otherwise revise
sentence meaning, register, or layout.

The active `default` CSV retains 65,135 records, ID order, its UTF-8 BOM, and
the existing mixed line endings (71,846 CRLF; 244 LF-only). Embedded line
breaks in the edited entries were preserved. The byte-preserving editor's 11
regression tests and a CRLF-aware diff check passed. A scoped re-search found no
remaining unpaired Korean Seelie/Unseelie forms matching the English source
entries.
