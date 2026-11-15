# Dialogue Context Translation Edit Batch: IDs `21750`-`21999`

- Date: 2026-11-14.
- Rechecked the range's candidate rows against the current English, Japanese,
  Chinese, and Korean. English established meaning, Japanese was primary for
  voice/register, and Chinese was supporting evidence.
- Adjudicated all 14 candidates in the range: 13 supported corrections were
  applied; `21922` already contained the approved Khamazandu wording from the
  preceding batch.
- Applied five linked terminology corrections outside the range. No speaker
  or playback order was inferred.
- Preserved the evidence-limited holds at `21814` and `21937`.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `21761` | Corrected the five recruits from five squads to five people and made clear they deserted; retained the recovered Bogstaunch medicine. |
| `21777`, `36993`, `63303`, `64287` | Paired the established spelling `미스로리스(Mithroliths)` where missing and corrected the spelling variant at `36993`. |
| `21795` | Changed `작품` to `연구` for `my work` / Japanese `研究`, and made the sarcastic opening more natural while retaining polite speech. |
| `21829` | Restructured the repeated “right thing” wording into natural plain-style dialogue without changing the invitation or hiding-place details. |
| `21872` | Changed `권위(Authority)` to the established divine name `권능(Authority)`. |
| `21891` | Rendered the `logbook` as an `항해 일지` per Japanese `航海日誌`; described the last master's arbitration cases without asserting specific rulings. |
| `21909` | Used the established short faction form `성약단(The Testament)`, supported by the English, Japanese, and Chinese references. This was an ID-scoped correction, not a global replacement of `Testament`. |
| `21914` | Changed the mismatched “Why?” to the brief response `응?`, matching English `Yes?` and Japanese `ん？`. |
| `21956` | Added the English pairing to the named lore identity `먼지의 자손(Child of Dust)`. |
| `21961` | Distinguished `ritual of penitence` as `참회의 의식`, matching `default:4616`; shortened the repeated Anokatos reference to `그에 따르면`. The distinct `ritual of atonement` remains `속죄 의식`. |
| `21973` | Removed stacked near-synonymous modifiers, expressed Mallion's illness naturally, and retained the deferential register and honorific forms. |
| `21983` | Aligned both titled mentions to `마스터 벨른(Master Belne)` while retaining the separate un-titled `벨른(Belne)` mention and objective sequence. |
| `21986` | Removed the duplicate size description while retaining the warning's casual tone and the gnomes' vicious response. |
| `36993`, `48675`, `64922` | Standardized the named era as `깊은 황혼(Deep Gloam)` and adjusted `시대` to each sentence. At `36993`, also applied the Mithroliths correction above. |

## Retained Or Held

- `21922` already used the corrected “instrument” wording; the prior
  `19500`-`19749` batch checked all seven copies, including this ID. No
  duplicate edit was made.
- `21814` remains held because `your lady` does not establish the relationship.
- `21937` remains held for the unresolved source/register discrepancy.
- Existing exact short-form uses such as `21745` already use
  `성약단(The Testament)`; no repeat edit was needed.

## Verification

- The 18 edited IDs' previous fingerprints were reconstructed from the exact
  prior Korean text and matched their existing ledger fingerprints. Only
  those 18 `source_fingerprint` values were refreshed; all other ledger
  fields and rows were preserved.
- The ledger validates all 65,135 IDs against the four current language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only record endings.
- The 11 CSV-preservation tests, nine context-index tests, and
  `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `d3f4ee9a35b2a400680ee66a68608ae7143341ed61c826feb06f6f94fb66796d`.
- Current ledger SHA-256:
  `ee468b638c585f919aa04716c31c20917043219d4bb637ddd0febea846374154`.

The next sequential candidate range is `22000`-`22249`.
