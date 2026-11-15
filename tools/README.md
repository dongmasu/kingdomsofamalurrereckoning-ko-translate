# Tools

This directory contains the scripts used to inspect and edit localization
resources, validate and package the Korean patch, and run its installer.
Unless a command says otherwise, run it from the repository root with Python 3
or the shell named in the command.

## Optional Lua Script Extraction

Lua extraction is not required for translation. It was investigated as
supplementary context, but no confirmed connection to localization IDs or
dialogue was found. If you have placed the game's unpacked files in
`references/data/unpacked/` and want to extract the recognized Lua-family
payloads, run this from the repository root:

```sh
python3 tools/extract_lua_scripts.py
```

The extracted files and manifest are written to
`work/zh_cn/audit/lua-script-extracted/`. They are generated from the local
unpacked game files, ignored by Git, and can be recreated by rerunning the
command. Generated full-review JSONL outputs are also excluded from Git,
regardless of size; the original review decisions remain tracked. The
extractor does not execute or decompile Lua bytecode and does not modify the
source corpus.

## Localization And Patch Tools

| Path | Purpose |
| --- | --- |
| `loc_toolset/` | Unpack and repack the `affix`, `base`, and `default` localization binaries. See [`loc_toolset/readme.txt`](loc_toolset/readme.txt) for its commands and required structural sidecars. |
| `replace_text_preserve_eol.py` | Apply a guarded, ID-specific text change while preserving unrelated CSV bytes, BOM, and line endings. Supply the expected old text; use the variant option where applicable. |
| `build.sh` | Validate and build the Korean `zh_cn` patch package. Use for releases or structural changes, not as a substitute for focused checks on a small text edit. |
| `RunKoreanPatch.bat`, `KoreanPatch.ps1` | Windows launcher and installer for applying a verified patch payload to the user's game installation. |
| `README-patch.txt` | Installation guide included with the patch package. |

The localization CSVs are structured data: preserve IDs, variants, row order,
tokens, multiline fields, BOM, and existing line endings. Keep `src/` and
`references/` read-only. Make translation changes only in the authorized
working files and follow [`TRANSLATION-ROLE.md`](../TRANSLATION-ROLE.md) and
[`PROJECT-AI.md`](../PROJECT-AI.md).

## Tests

Run all Python tests in this directory with:

```sh
python3 -m unittest discover -s tools -p 'test_*.py' -v
```

The suite covers the repository's utilities, Lua analysis and round-trip
invariants, CSV editing safeguards, and installer-script checks. Passing
static or script tests does not establish in-game correctness or verify a
Windows installation.

## Other Files

`modding/` contains the supplied PAK utility documentation and executables
used by the packaging/installation workflow. Treat game archives and the
unpacked reference corpus as source data; do not overwrite them during
analysis.
