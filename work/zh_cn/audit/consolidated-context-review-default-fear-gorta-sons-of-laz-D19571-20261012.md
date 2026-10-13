# Fear Gorta and Sons of Laz Context Review (D-19571)

- Date: 2026-10-12.
- Scope: `default` ID 180, previously held as D-052.
- Disposition: accepted.
- Evidence: English is the meaning anchor; Japanese informs naming and
  context; Chinese, German, Spanish, French, and Italian are cross-checks.
  The full 11-page official Korean manual was read for setting and
  terminology context. No PAK or PAK-derived evidence was used.

## Finding

English ID 180 says the slain settlers were partially raised and became
`Fear Gorta` and `Sons of Laz`. The same English resource repeatedly names
the creature `Faer Gorta` (including IDs 1796 and 24618); `Fear Gorta` is
the sole spelling in this row. Japanese ID 180 phoneticizes the creature as
`フェア・ゴータ`, while Chinese calls it a skeleton soldier. German, Spanish,
French, and Italian use the established `Faer Gorta` name. Korean already
uses the established `페어 고르타`; correct only its parenthetical English
spelling to `Faer Gorta`.

The Korean `라즈의 자손(Sons of Laz)` preserves the second group name.
Japanese calls them Laz soldiers and Chinese uses “sons/children of Laz”;
German, Spanish, French, and Italian also preserve the sons/children
reading. English ID 45901, used only as read-only contextual support, calls
the name a crude epithet from an old rhyme and describes the creatures as
half-dead ex-soldiers. That context supports the existing Korean wording;
no change to it or to ID 45901 is authorized by this finding.

The official manual's printed pages 3-4 introduce the hero waking among
corpses in an isolated cave; pages 9-10 give general combat context; pages
17-18 describe factions. The manual does not name either `Faer Gorta` or
`Sons of Laz`. Its broad context was considered, but the absent exact names
do not create uncertainty.

The row otherwise preserves the murder-site investigation, partial
resurrection, the settlers' transformation, and the report to Rota. Close
D-052 as accepted; do not retain it as uncertain merely because the
Japanese and Chinese render `Sons of Laz` differently.

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 180 | `살인 현장을 조사하다가 죽은 자들을... 불완전하게 되살리는 무언가를 발견했다. 살해당한 정착민들은 페어 고르타(Fear Gorta)와 라즈의 자손(Sons of Laz)으로 변해 있었다. 야영지로 돌아가 로타(Rota)에게 보고해야 한다.` | `살인 현장을 조사하다가 죽은 자들을... 불완전하게 되살리는 무언가를 발견했다. 살해당한 정착민들은 페어 고르타(Faer Gorta)와 라즈의 자손(Sons of Laz)으로 변해 있었다. 야영지로 돌아가 로타(Rota)에게 보고해야 한다.` |

## Verification

- Only the approved `Texto` spelling at ID 180 changed.
- Pre-edit default SHA-256:
  `6b9d5d63ab5197057bcb30dc58cf5d35e2ee52bd91aa1cd737d1a7a6c2faedb6`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-fear-gorta-D19571/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `9b745401670abe1d2860e41e826a27f3482bad4338476b3e5549158023e7f432`.
- Reversing the exact row substitution reproduces the backup byte-for-byte.
  The UTF-8 BOM, row order, 72,011 CRLF endings, and 73 bare-LF endings are
  preserved; all bytes outside the approved `Texto` change are identical.
- Default totals: **2,491 accepted / 25,372 not an issue / 10,661
  uncertain** (38,524).
- Next active hold: **D-053, default ID 189**.

This closes D-052 only; it does not declare the wider default audit complete.
