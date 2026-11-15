# Sequential `default` Revalidation: IDs `1750`-`1999`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `1750`-`1999`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 187 new IDs were reviewed and recorded. The other 63 IDs in this interval
  already had ledger records and were left unchanged.
- Ten correction candidates and one evidence-limited speech-level hold were
  identified. Candidates are proposals, not approved edits.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `1784` | Meaning / naturalness | `slay Remus and his team` is rendered `해치워야`, which can mean defeating or getting rid of them and softens the explicit lethal threat. Consider `레무스(Remus)와 그 팀이 날 죽이기 전에 내가 먼저 처치해야 해`. | Medium |
| `1791` | Format / title | The English `Maire, Queen of Cups` is parenthesized only as `(Maire)`. This exact English also occurs at ID `1590`; all 19 exact-English occurrences currently share the same Korean text. Keep the pair consistent and consider `컵의 여왕 메어(Maire, Queen of Cups)` at both IDs. | High |
| `1806` | Naturalness / format | The option text ends with `크리티컬 히트 대미지` after a conditional phrase, leaving the `+65%` stat relationship awkward. Consider `은신 상태에서 눈치채지 못한 적 공격 시 치명타 피해 +65%`. | High |
| `1860` | Format / title | The source label is `Again the Maid of Windemere`, but the parenthetical includes only `Maid of Windemere`. Consider preserving the full source label in the English pairing, e.g. `다시 돌아온 윈더미어의 시녀(Again the Maid of Windemere)`. | High |
| `1865` | Format / proper name | The parenthetical spells the name `Astor Colliane`; the English source is `Astor Colliani`. Correct the English spelling in the parenthetical without changing the Korean transliteration unless separately reviewed. | High |
| `1866` | Terminology / format | The six card names are rendered `에이스, 듀스, 쓰리, 포, 파이브, 헥스`, but only `Hex` has English in parentheses. Reconcile the full list with the already-reviewed card-name set (including IDs `15632`, `40020`, `62621`, and `1866`) so number words and naming style do not drift between prompts. | Medium |
| `1893` | Terminology | This is the numeric `Health` resource restored by sleeping. Korean uses `생명력`, while the established stat term is `체력`; consider `체력과 마나가 회복되었습니다`. | High |
| `1909` | Naturalness | `위대한 여성 선조` is understandable but stiff for `the mighty foremother`. Consider `위대한 여성 조상` or another natural rendering that retains the explicitly female ancestor. | Medium |
| `1936` | Terminology | The numeric `Max Health` stat is rendered `최대 생명력`; use the established stat term `최대 체력` for consistency. | High |
| `1988` | Format / terminology | `Witchknight` is rendered `마녀기사` without the English pairing. Consider `마녀기사(Witchknight)`, subject to the project's preferred spacing for this term. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `1941` | Speech level / honorifics | Korean uses polite deferential forms (`전혀 폐가 아닙니다`, `영광입니다`), while Japanese uses plain endings and the English has no explicit honorific marking. The asset index does not map this key to a speaker or relationship; retain the register question for contextual evidence rather than normalizing by guess. |

## Duplicate and Structural Checks

- Exact-English duplicate groups touching this range were checked across the
  full `default` corpus. The 19-row `Maire, Queen of Cups` group, including
  IDs `1590` and `1791`, has identical Korean text. The 17-row `Gardens of
  Ysa` group, the repeated quest-completion label, and all other matching
  groups likewise had identical Korean translations.
- The duplicate punctuation row IDs `1783` and `1914` both contain `.` in all
  languages.
- Line-break counts, numbered and named runtime placeholders, named-icon
  markers, and markup signatures matched across English, Japanese, Chinese,
  and Korean for all 187 newly recorded IDs.
- The 63 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links are evidence about containing files only; no
  per-key speaker or dialogue order was inferred.

## Newly Recorded IDs

The 187 new ledger rows are:

`1750`, `1751`, `1753`, `1754`, `1755`, `1757`, `1758`, `1759`, `1760`,
`1762`, `1763`, `1764`, `1765`, `1768`, `1770`, `1771`, `1772`, `1774`,
`1775`, `1776`, `1777`, `1778`, `1779`, `1781`, `1782`, `1783`, `1784`,
`1785`, `1786`, `1789`, `1791`, `1792`, `1795`, `1796`, `1797`, `1798`,
`1800`, `1801`, `1802`, `1803`, `1804`, `1805`, `1806`, `1808`, `1809`,
`1810`, `1811`, `1813`, `1814`, `1815`, `1816`, `1817`, `1818`, `1820`,
`1821`, `1822`, `1823`, `1824`, `1825`, `1826`, `1827`, `1828`, `1830`,
`1831`, `1832`, `1833`, `1834`, `1836`, `1837`, `1838`, `1839`, `1840`,
`1841`, `1842`, `1843`, `1845`, `1846`, `1847`, `1848`, `1849`, `1850`,
`1851`, `1855`, `1856`, `1857`, `1859`, `1860`, `1861`, `1863`, `1864`,
`1865`, `1866`, `1868`, `1871`, `1872`, `1875`, `1876`, `1877`, `1879`,
`1880`, `1881`, `1885`, `1886`, `1887`, `1888`, `1889`, `1890`, `1891`,
`1892`, `1893`, `1895`, `1896`, `1897`, `1898`, `1899`, `1900`, `1902`,
`1903`, `1906`, `1907`, `1909`, `1910`, `1911`, `1912`, `1913`, `1914`,
`1915`, `1916`, `1917`, `1919`, `1920`, `1922`, `1923`, `1924`, `1925`,
`1926`, `1927`, `1928`, `1929`, `1930`, `1931`, `1932`, `1935`, `1936`,
`1938`, `1939`, `1941`, `1942`, `1945`, `1946`, `1947`, `1948`, `1950`,
`1951`, `1952`, `1954`, `1955`, `1957`, `1958`, `1959`, `1960`, `1962`,
`1963`, `1965`, `1967`, `1970`, `1971`, `1972`, `1973`, `1974`, `1975`,
`1976`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1985`, `1987`,
`1988`, `1991`, `1993`, `1994`, `1997`, `1998`, `1999`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
