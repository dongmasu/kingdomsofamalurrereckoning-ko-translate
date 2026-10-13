# Consolidated Context Review: Caeled Coast, Godstorm, and Primos (D-19702)

- Date: 2026-10-12.
- Scope: `default` IDs 16111-16114, originally flagged together in D-5052.
- Compared exact English, Japanese, Chinese, and active Korean rows, then
  checked accepted corpus precedents. English anchors meaning; Japanese
  informs wording/register and Chinese supports the cross-check. The official
  Korean manual extraction was consulted for broad setting context; it does
  not resolve the title-specific wording. No PAK material was used.

## Decisions

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 16111 | `not an issue` | English/Japanese/Chinese all identify the same Caeled Coast and the speaker's readiness to tell its bright stories. Korean already uses the accepted source-paired `케일드 해안(Caeled Coast)` form from D-19592 and preserves the friend's address and storyteller's willingness. |
| 16112 | `not an issue` | `Blood and Steel: 1` is a short title/label. Korean `피와 강철: 1` preserves both title components and the number; Japanese and Chinese support the same contents despite spacing differences. |
| 16113 | `accepted` | English says completion is only days away, not merely that completion could happen within days. Japanese and Chinese explicitly say only a few days remain. Change `며칠 안에 완성할 수 있겠지만` to `완성까지 며칠밖에 안 남았지만`; retain the needed papers, definitive-work phrasing, and good-fortune statement. |
| 16114 | `not an issue` | English/Japanese say the speaker again failed to submit petitions to the Primos; Chinese paraphrases presentation to leaders. Korean preserves the repeated inability, petition, recipient, and tentative interpretation that the gods are signaling something, without inventing the Primos' rank. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 16113 | `신들의 폭풍(Godstorm)에 관한 결정판을 며칠 안에 완성할 수 있겠지만, 그 서류들이 필요해. 이렇게 운이 좋았던 적은 한 번도 없어.` | `신들의 폭풍(Godstorm)에 관한 결정판을 완성까지 며칠밖에 안 남았지만, 그 서류들이 필요해. 이렇게 운이 좋았던 적은 한 번도 없어.` |

## Integrity and Resume

- One evidence-backed correction and three `not an issue`; none remains
  uncertain in this group.
- Pre-edit default SHA-256:
  `75e945311d405d78924fb52ff3fe17417124ec34bbb6eee7cf3b89b4ea4d2e84`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-godstorm-petition-D19702/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `0e802bcf522324a1663156087c92a7d7961d301d73cc704a49c3b87f77b8055a`.
- The exact inverse of the single `Texto` substitution reproduces the backup
  byte-for-byte. The UTF-8 BOM, 72,011 CRLF endings, 73 existing bare-LF
  endings, row order, and every non-target byte are preserved.
- Updated totals: **3,361 accepted / 33,714 not an issue / 1,449 uncertain**
  (38,524).
- Next unresolved candidate: D-5054 / ID 16116. Default review remains
  incomplete.
