# Pending Package Validation

Recorded 2026-10-14 from the user's notes. No original PAK, font binary, or
`PAK_DIFF.md` was inspected for this note. No in-game test was run.

## Noto Font Check

The user noted that the following files differ between the original and
Korean patch and asked whether their binary sizes are actually different.
It is also possible the original Noto Sans CJK SC resources already contain
the needed Korean glyphs; this remains a hypothesis, not a verified result.

Font-free test ZIP built on 2026-10-14:
`dist/20261014030408/KingdomsOfAmalur_Korean_zh_cn_20261014030408.zip`.
It contains only three zh_cn localization binaries in its payload; the
installer preserves the original game's font files. Structure, CSV round-trip,
checksums, and ZIP integrity passed. The user installed/tested it and reports
Korean text renders as runs of hyphens (`--------`) without the added Noto font
resources. On this setup, the font-free package is not usable for Korean.

Refreshed standard package built after recording this result and updating the
double-click installation instructions:
`dist/20261014031124/KingdomsOfAmalur_Korean_zh_cn_20261014031124.zip`.
It includes all 29 Noto font resources and `RunKoreanPatch.bat`. Build-time
structure, CSV round-trip, checksum generation, and ZIP integrity checks
passed; in-game retesting of this refreshed package remains pending.

Pending test:

1. Compare each original/Korean-patch pair's binary size.
2. Keep the 29 Noto font resources in the distributable package unless a
   different verified font solution is found. Comparing sizes is optional
   investigation and does not override the observed rendering failure.

## Hyphen Rendering and Nexus Report

The font-free test's hyphen output resembles the `---- ---` symptom discussed
in the Nexus PT-BR mod notes, but the symptom alone does not establish a shared
cause. That author attributed their report to localization ID/text-pointer
alignment. Here, removing the Noto resources is the observed difference
associated with the failure, so missing/unsupported glyph handling is a
plausible cause in this test. The two cases should not be treated as equivalent
without reproducing and isolating their respective conditions.

The filenames, as supplied by the user from
`references/data/PAK_DIFF.md`, are:

- `notosanscjksc_regular.font`
- `notosanscjksc_regularnotosanscjksc_regular_p00_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p01_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p02_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p03_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p04_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p05_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p06_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p07_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p08_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p09_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p10_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p11_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p12_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p13_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p14_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p15_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p16_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p17_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p18_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p19_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p20_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p21_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p22_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p23_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p24_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p25_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p26_00.ntx`
- `notosanscjksc_regularnotosanscjksc_regular_p27_00.ntx`

## Distribution Filename

`tools/build.sh` now produces
`KingdomsOfAmalur_Korean_zh_cn_yyyymmddHHMMSS.zip`, without `_TEST`.
The default includes the font resources; `tools/build.sh --without-font`
produces an experimental three-file payload that rendered Korean as hyphens
in the user's test and should not be used as the Korean package.
