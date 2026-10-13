# Consolidated Context Review: Maid Title Consistency

- Date: 2026-10-12.
- Decision: D-19476.
- Scope: `default` IDs 3570, 52457, 59005, 59334, and 62107.
- Compared English, Japanese source, Chinese source, preserved
  Japanese-derived Korean, active Korean, and accepted Maid terminology by
  `ID_Linha`.

## Decisions

| Decision | IDs | Disposition | Rationale |
| --- | --- | --- | --- |
| D-19476 | 59005 | accepted | Replace both `처녀` references with `시녀` in the tale title and synopsis. English names the recurring Maid of Windemere in both positions; D-18128/D-18140 establish the approved Korean title, and the parallel label at 59334 already uses `시녀`. Preserve the abduction and escape meaning. |
| D-19476 | 3570, 52457, 59334, 62107 | not an issue | Each English source is the standalone `Maid of Windemere` label. The active Korean retains the Windemere figure and uses the accepted `시녀` title; English/Japanese/Chinese source rows establish the same referent. Differences in characterization do not demonstrate a row-local translation defect. |

The exact English-label pool was reconciled to avoid duplicate decisions:
IDs 5229, 10363, 10400, 12891, 13302, 15333, 20547, 56762, and 57829 were
handled under D-19475; 54846 was already `not an issue` under D-16599;
63744 was already `not an issue` under D-18086. IDs 7411, 7424, and 8441
had no recorded uncertain disposition and are not newly counted here.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 59005 | `영웅과 처녀: 웬센 왕은 윈더미어의 처녀에게 납치되고, 그녀에게서 벗어나려 애쓴다.` | `영웅과 시녀: 웬센 왕은 윈더미어의 시녀에게 납치되고, 그녀에게서 벗어나려 애쓴다.` | D-19476 |

Four prior uncertainties were resolved as `not an issue`; one was accepted
and corrected.

## Verification

- The five IDs occur once and in the same order in active Korean, English,
  Japanese source, Chinese source, and the preserved Korean draft.
- Pre-edit SHA-256:
  `33138438fc84241984b61349c4e992cdf7480496186fc686538db3d736587628`.
- Post-edit SHA-256:
  `fc31e5ab140a22e2fb83774d3a941ac7e9605f69e6300c336806da6805c587f7`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-maid-title-pair-D19476/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the exact ID 59005 substitution reproduces the backup
  byte-for-byte. The UTF-8 BOM, 65,135 ordered records, 72,011 CRLF
  sequences, and 73 pre-existing bare-LF sequences are preserved.
- Totals after D-19476: **2,353 accepted / 25,124 not an issue / 11,047
  uncertain** (38,524). Resume at **D-19477**.

These are working dispositions, not independent final linguistic approval.
