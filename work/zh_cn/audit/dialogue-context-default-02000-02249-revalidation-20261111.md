# Sequential `default` Revalidation: IDs `2000`-`2249`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `2000`-`2249`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 184 new IDs were reviewed and recorded. The other 66 IDs in this interval
  already had ledger records and were left unchanged.
- Seven correction candidates and two evidence-limited holds were identified.
  Candidates are proposals, not approved edits.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `2005` | Terminology / meaning | `fate's weave` is rendered `운명의 태피스트리`. Because this line appears in the fate-weaving context, check whether the established `운명 엮기(Fateweaving)` terminology is intended here; do not replace the metaphor mechanically if the scene uses it descriptively. | Medium |
| `2018` | Format / title | The named item/title `The King's Thimble` appears only as `왕의 골무`. Consider adding the source name, e.g. `왕의 골무(The King's Thimble)`, if the text type follows the project's paired-name convention. | Medium |
| `2030` | Terminology / format | `Fateweaver` is rendered phonetically as `페이트위버(Fateweaver)`, so the Korean does not convey the role's meaning. Consider a consistent translated form such as `운명 엮는 자(Fateweaver)` after checking the project's fate-term glossary. | Medium |
| `2121` | Format / title | The title `Thyrdon's Charge` is rendered `사이르돈(Thyrdon)의 돌격`, pairing only the name and not the complete title. Consider `사이르돈의 돌격(Thyrdon's Charge)` if this is a named title rather than descriptive text. | Medium |
| `2202` | Format / title | The poem's source says `The Maid of Windemere`, while the parenthetical is `Maid of Windemere`. Preserve the article in the English pairing, e.g. `윈더미어의 시녀(The Maid of Windemere)`. The poem's line and stanza breaks otherwise match. | High |
| `2220` | Naturalness | `우리 가족이 칼과 화살에 맞지 않은 게 몇 번인지 셀 수도 없어` is understandable but awkward. Consider `이 덕분에 우리 가족은 칼과 화살의 위협에서 수없이 벗어났어` while preserving the speaker's relief. | Medium |
| `2224` | Meaning / naturalness | The opening image `the heaving breast of the sea` is reduced to `출렁이는 바다`, losing the source's personification also present in Japanese and Chinese. Consider restoring that image naturally (for example, `출렁이는 바다의 가슴`). | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `2024` | Meaning / source discrepancy | English and Chinese describe the potion's subtle fizzing/crackling when held to the ear; Japanese instead says it increases Primal attack damage. Korean follows English and Chinese. Preserve the current Korean pending stronger evidence about the Japanese row's mismatch. |
| `2116` | Meaning / terminology | English `tenders`, Japanese `番人` (guards/keepers), and Chinese `看护者` (caretakers) differ in role nuance; Korean `수행자들` is possible but not established. Hold the role term pending context. |

## Duplicate and Structural Checks

- Thirty-eight exact-English duplicate groups touching the range were checked
  across the full `default` corpus. Every group had identical Korean text,
  including the repeated book and item descriptions.
- Line-break counts, numbered and named runtime placeholders, named-icon
  markers, and markup signatures matched across English, Japanese, Chinese,
  and Korean for all 184 newly recorded IDs.
- IDs `2030` and `2202` also occur in exact-English duplicate groups; their
  Korean text matches the other occurrences.
- The 66 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links are evidence about containing files only; no
  per-key speaker or dialogue order was inferred.

## Newly Recorded IDs

The 184 new ledger rows are:

`2002`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`,
`2013`, `2014`, `2015`, `2016`, `2017`, `2018`, `2020`, `2021`, `2022`,
`2023`, `2024`, `2025`, `2027`, `2029`, `2030`, `2032`, `2034`, `2035`,
`2037`, `2040`, `2041`, `2042`, `2043`, `2045`, `2046`, `2047`, `2048`,
`2049`, `2050`, `2051`, `2052`, `2053`, `2054`, `2056`, `2058`, `2059`,
`2060`, `2062`, `2063`, `2065`, `2067`, `2068`, `2069`, `2070`, `2072`,
`2073`, `2075`, `2076`, `2078`, `2081`, `2082`, `2083`, `2084`, `2086`,
`2087`, `2088`, `2089`, `2090`, `2091`, `2093`, `2094`, `2095`, `2097`,
`2098`, `2099`, `2100`, `2101`, `2102`, `2103`, `2104`, `2106`, `2109`,
`2110`, `2113`, `2116`, `2117`, `2119`, `2120`, `2121`, `2124`, `2125`,
`2126`, `2127`, `2128`, `2129`, `2130`, `2132`, `2133`, `2134`, `2135`,
`2138`, `2139`, `2141`, `2142`, `2144`, `2146`, `2147`, `2148`, `2149`,
`2151`, `2152`, `2153`, `2154`, `2156`, `2157`, `2159`, `2164`, `2166`,
`2167`, `2168`, `2169`, `2170`, `2171`, `2172`, `2173`, `2176`, `2177`,
`2178`, `2179`, `2180`, `2181`, `2182`, `2183`, `2184`, `2185`, `2187`,
`2189`, `2190`, `2191`, `2193`, `2195`, `2197`, `2198`, `2199`, `2200`,
`2201`, `2202`, `2203`, `2205`, `2207`, `2209`, `2210`, `2212`, `2214`,
`2215`, `2216`, `2217`, `2218`, `2219`, `2220`, `2221`, `2222`, `2223`,
`2224`, `2225`, `2226`, `2227`, `2228`, `2229`, `2230`, `2231`, `2232`,
`2233`, `2235`, `2236`, `2237`, `2238`, `2239`, `2240`, `2242`, `2244`,
`2245`, `2246`, `2247`, `2249`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
