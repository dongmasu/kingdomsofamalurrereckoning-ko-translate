# Localization Markup and Variant Evidence

## Scope and Method

This read-only review checked the original localization binaries under
`src/lang/` against their corresponding extracted CSVs under `src/csv/` for
all eight available locales. It parsed each resource using its existing
resource layout and compared record IDs, variant bytes where present, and
text. It also reviewed the existing cross-language brace audit and the
available extracted-resource and Lua-analysis results.

No source assets, extracted assets, translation CSVs, or review ledgers were
changed. The binary-to-CSV checks confirm what is stored and how the current
unpacker represents it; they do not independently establish game-runtime
behavior.

## Confirmed Binary and CSV Facts

All 24 original localization binaries parsed to exactly the same records as
their corresponding source CSVs:

| Locale | `base` rows | `affix` rows | `default` rows | Exact binary/CSV match |
| --- | ---: | ---: | ---: | --- |
| `de_de` | 4,844 | 3,491 | 65,135 | Yes |
| `en_us` | 4,844 | 586 | 65,135 | Yes |
| `es_es` | 4,844 | 2,345 | 65,135 | Yes |
| `fr_fr` | 4,844 | 2,305 | 65,135 | Yes |
| `it_it` | 4,844 | 2,330 | 65,135 | Yes |
| `ja_jp` | 4,844 | 3,311 | 65,135 | Yes |
| `ru_ru` | 4,844 | 3,449 | 65,135 | Yes |
| `zh_cn` | 4,844 | 3,451 | 65,135 | Yes |

For `base` and `affix`, `Tipo_Variante` records a byte read at the start of a
variant's stored string record, rendered as two-digit hexadecimal. The codes
are actual per-record data, not inferred values. Available codes and variant
counts differ by locale; every English `affix` row uses `FF`.

The language data supports, but does not prove, a relationship between some
codes and grammatical forms:

- Spanish `affix:0` uses `11=motivador`, `12=motivadora`,
  `21=motivadores`, and `22=motivadoras`, a clear gender-and-number
  correspondence in this entry.
- German `affix:0` uses `14=Sammelndes`, a neuter-inflected form.
- Russian `base:174` uses variant `24` for `Лезвия Баронета` (plural
  “Baronett's Blades”); the same ID uses different codes in other locales.
- `base:1531` is a complete sentence tagged `14` in all eight locales. This
  shows that a code cannot always be read as a direct description of the
  visible word form.
- In the active Korean `affix` CSV, 573 IDs have multiple variants, and all
  variants within each of those IDs currently use the same Korean text. This
  is an observed translation choice, not proof that the game's variants are
  unnecessary.

Accordingly, singular/plural and gender interpretations remain hypotheses
for observed code families. No complete official code map, universal
masculine/feminine/neuter mapping, or runtime variant-selection rule was
found in the reviewed resources. `FF` remains unexplained.

The original `default` binaries also contain brace forms as literal text
bytes, and all eight parsed `default` resources exactly match their source
CSVs. The cross-language corpus contains numeric forms such as `{1}` and
`{2}`, asterisk-number forms such as `{*1...}`, and named forms such as
`{LINE_SPACE}`. Their presence and per-ID language differences are
verifiable; their execution semantics are not encoded in the CSV itself.

## Evidence-Based Interpretations and Limits

The examples and translations support these working hypotheses:

- `{1}`, `{2}`, and similar forms appear to be numbered substitution slots.
  Context can indicate a control label, number, name, or other value, but no
  universal parameter type or runtime lookup rule is established. Languages
  can reorder, repeat, or omit a slot; a difference alone does not prove an
  error.
- `{*N...}` often surrounds text translated in other locales, suggesting a
  rich-text or display-markup role. The exact meaning of `N`, the rendered
  style, and whether it defines a span or another operation are unresolved.
- `{LINE_...}` names and examples in the development/test string at
  `default:51803` suggest line or layout controls. Exact rendering,
  dimensions, accepted token names, and the behavior of rare forms such as
  `{LINE_INCIDENT}` remain unverified.
- A form such as `{*1{2}}` visibly nests one marker around another token in
  the stored string. The string structure can be described, but the runtime
  nesting behavior has not been tested.

The third-party instructions in `tools/loc_toolset/readme.txt` call
`{*1Text}` a translatable “rich text” tag. This is useful secondary guidance,
not an official engine specification. The cross-language markup audit also
records aligned examples and exceptions, but did not inspect a game parser or
verify rendering in-game:
[`default-brace-cross-language-20261105.md`](default-brace-cross-language-20261105.md).

The extracted-resource investigation did not establish a runtime parser for
these markers. The static Lua-corpus review found zero confirmed
Lua-to-localization links and zero supported static localization/display
call-site mappings:
[`lua-corpus-translation-review-20261115.md`](lua-corpus-translation-review-20261115.md).
This is a limit of the reviewed corpus and analysis, not proof that the
runtime has no such behavior.

## Conservative Translation Handling

Until runtime behavior is independently verified, treat these as opaque
markup rather than ordinary punctuation:

- Preserve variant bytes, IDs, and rows exactly.
- Preserve marker identity and nesting. Translate text inside a
  `{*N...}`-like form only when the corresponding text is translatable in
  context; do not infer a global meaning for `N`.
- Move a numbered slot only when the same-ID language evidence confirms which
  value it represents in the Korean sentence. Do not change its number or
  repetition merely to normalize another language.
- Preserve `{LINE_...}` forms by default. Do not mechanically synchronize
  them across locales or infer rendered layout from their names alone.
- Record uncertain or structurally irregular cases by ID and hold changes
  that depend on unverified runtime behavior.

These are conservative editing rules, not claims about the engine's exact
implementation.
