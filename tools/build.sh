#!/usr/bin/env bash
# Build the zh_cn test package and place it under dist/<timestamp>.
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$ROOT/work/zh_cn"
SOURCE="$ROOT/src/csv/zh_cn"
FONT_SOURCE="$ROOT/src/font"
TOOLSET="$ROOT/tools/loc_toolset"
TIMESTAMP="$(date '+%Y%m%d%H%M%S')"
DIST_DIR="$ROOT/dist/$TIMESTAMP"
ZIP_PATH="$DIST_DIR/KingdomsOfAmalur_Korean_zh_cn_TEST.zip"
TEMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/amalur-zhcn-build.XXXXXX")"
REPACK_DIR="$TEMP_DIR/repack"
PAYLOAD_DIR="$TEMP_DIR/package/payload"
ROUNDTRIP_DIR="$TEMP_DIR/roundtrip"
PACKAGE_DIR="$TEMP_DIR/package"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

for command in python3 zip unzip shasum rg; do
    command -v "$command" >/dev/null 2>&1 || fail "Required command not found: $command"
done

[[ -d "$WORK" ]] || fail "Missing work directory: $WORK"
[[ -d "$SOURCE" ]] || fail "Missing immutable zh_cn CSV references: $SOURCE"
[[ -d "$FONT_SOURCE" ]] || fail "Missing font directory: $FONT_SOURCE"
[[ -f "$ROOT/tools/KoreanPatch.ps1" ]] || fail "Missing Windows apply script."
[[ -f "$ROOT/tools/README-test-patch.txt" ]] || fail "Missing test-package instructions."
python3 "$ROOT/tools/test_apply_script.py"
[[ ! -e "$DIST_DIR" ]] || fail "Distribution timestamp directory already exists: $DIST_DIR"

mkdir -p "$REPACK_DIR" "$PAYLOAD_DIR" "$ROUNDTRIP_DIR" "$DIST_DIR"
cp "$WORK"/locatexts_zh_cn.koalocatext_{affix,base,default}.csv "$REPACK_DIR/"
cp "$WORK"/estrutura_hashes.bin "$WORK"/estrutura_hashes_flat.bin \
    "$WORK"/estrutura_hashes_stream.bin "$REPACK_DIR/"

python3 - "$ROOT" <<'PY'
import csv
import filecmp
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
work = root / "work" / "zh_cn"
source = root / "src" / "csv" / "zh_cn"
resources = ("affix", "base", "default")
sidecars = (
    "estrutura_hashes.bin",
    "estrutura_hashes_flat.bin",
    "estrutura_hashes_stream.bin",
)

def read_csv(path):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        if reader.fieldnames is None:
            raise ValueError(f"CSV has no header: {path}")
        return reader.fieldnames, list(reader)

def key(row, resource):
    return (row["ID_Linha"], row["Tipo_Variante"]) if resource == "affix" else (row["ID_Linha"],)

for resource in resources:
    name = f"locatexts_zh_cn.koalocatext_{resource}.csv"
    work_path = work / name
    source_path = source / name
    work_fields, work_rows = read_csv(work_path)
    source_fields, source_rows = read_csv(source_path)
    if work_fields != source_fields:
        raise SystemExit(f"Header mismatch: {name}")
    if [key(row, resource) for row in work_rows] != [key(row, resource) for row in source_rows]:
        raise SystemExit(f"ID/variant/order mismatch: {name}")
    for current, original in zip(work_rows, source_rows):
        if any(current[field] != original[field] for field in work_fields if field != "Texto"):
            raise SystemExit(f"Non-text field changed in {name}: {key(current, resource)}")
    if not work_path.read_bytes().startswith(b"\xef\xbb\xbf"):
        raise SystemExit(f"Expected UTF-8 BOM: {work_path}")
    print(f"Structure OK: {resource} ({len(work_rows)} rows)")

for name in sidecars:
    if not filecmp.cmp(work / name, source / name, shallow=False):
        raise SystemExit(f"Sidecar differs from zh_cn source: {name}")
print("All zh_cn sidecars match the immutable source.")
PY

for resource in affix base default; do
    csv_name="locatexts_zh_cn.koalocatext_${resource}.csv"
    (
        cd "$REPACK_DIR"
        python3 "$TOOLSET/repacker_${resource}.py" "$csv_name"
    )
    generated="$REPACK_DIR/${csv_name%.csv}_NOVO.bin"
    [[ -s "$generated" ]] || fail "Repacker did not create a non-empty binary for $resource."
    cp "$generated" "$PAYLOAD_DIR/${csv_name%.csv}"
done

font_count="$(find "$FONT_SOURCE" -maxdepth 1 -type f | wc -l | tr -d '[:space:]')"
[[ "$font_count" == "29" ]] || fail "Expected 29 Noto font resources; found $font_count."
cp -R "$FONT_SOURCE/." "$PAYLOAD_DIR/"
[[ ! -e "$PAYLOAD_DIR/fontlist_common.koafontlist" ]] \
    || fail "The common font list must not be overridden for the zh_cn package."

payload_count="$(find "$PAYLOAD_DIR" -maxdepth 1 -type f | wc -l | tr -d '[:space:]')"
[[ "$payload_count" == "32" ]] || fail "Expected 32 payload files; found $payload_count."
[[ ! -e "$PAYLOAD_DIR/locatexts_en_us.characterset" ]] || fail "characterset must be omitted from this test package."

for resource in affix base default; do
    binary_name="locatexts_zh_cn.koalocatext_${resource}"
    roundtrip="$ROUNDTRIP_DIR/$resource"
    mkdir -p "$roundtrip"
    cp "$PAYLOAD_DIR/$binary_name" "$roundtrip/"
    (
        cd "$roundtrip"
        python3 "$TOOLSET/unpacker_${resource}.py" "$roundtrip/$binary_name"
    )
    [[ -s "$roundtrip/$binary_name.csv" ]] || fail "Round-trip extraction failed for $resource."
done

python3 - "$WORK" "$ROUNDTRIP_DIR" <<'PY'
import csv
import pathlib
import sys

work = pathlib.Path(sys.argv[1])
roundtrip = pathlib.Path(sys.argv[2])
for resource in ("affix", "base", "default"):
    name = f"locatexts_zh_cn.koalocatext_{resource}"
    with (work / f"{name}.csv").open(encoding="utf-8-sig", newline="") as stream:
        expected_reader = csv.DictReader(stream, delimiter=";")
        expected_fields = expected_reader.fieldnames
        expected_rows = list(expected_reader)
    with (roundtrip / resource / f"{name}.csv").open(encoding="utf-8-sig", newline="") as stream:
        actual_reader = csv.DictReader(stream, delimiter=";")
        actual_fields = actual_reader.fieldnames
        actual_rows = list(actual_reader)
    normalize = lambda value: value.replace("\r\n", "\n").replace("\r", "\n")
    expected_normalized = [
        {field: normalize(value) for field, value in row.items()}
        for row in expected_rows
    ]
    actual_normalized = [
        {field: normalize(value) for field, value in row.items()}
        for row in actual_rows
    ]
    if expected_fields != actual_fields or expected_normalized != actual_normalized:
        raise SystemExit(f"Round-trip content mismatch: {resource}")
    print(f"Round-trip OK: {resource} ({len(actual_rows)} rows)")
PY

cp "$ROOT/tools/KoreanPatch.ps1" "$PACKAGE_DIR/"
cp "$ROOT/tools/README-test-patch.txt" "$PACKAGE_DIR/README.txt"
(
    cd "$PAYLOAD_DIR"
    shasum -a 256 * > "$PACKAGE_DIR/SHA256SUMS.txt"
)

(
    cd "$PACKAGE_DIR"
    zip -qr "$ZIP_PATH" payload KoreanPatch.ps1 README.txt SHA256SUMS.txt
)
unzip -tq "$ZIP_PATH" >/dev/null
zip_entries="$(unzip -Z1 "$ZIP_PATH")"
entry_count="$(printf '%s\n' "$zip_entries" | wc -l | tr -d '[:space:]')"
[[ "$entry_count" == "36" ]] || fail "Expected 36 ZIP entries; found $entry_count."
printf '%s\n' "$zip_entries" | rg -q '^payload/locatexts_zh_cn\.koalocatext_affix$' \
    || fail "ZIP is missing the affix payload at its expected relative path."
printf '%s\n' "$zip_entries" | rg -q '^KoreanPatch\.ps1$' \
    || fail "ZIP is missing the Windows apply script."
printf '%s\n' "$zip_entries" | rg -q '^payload/fontlist_common\.koafontlist$' \
    && fail "ZIP unexpectedly contains fontlist_common.koafontlist."
printf '%s\n' "$zip_entries" | rg -q 'locatexts_en_us\.characterset' \
    && fail "ZIP unexpectedly contains locatexts_en_us.characterset."

printf '\nPackage created and ZIP integrity check passed:\n%s\n' "$ZIP_PATH"
printf 'Payload: 3 zh_cn localization binaries + %s Noto font resources; common font list and characterset omitted.\n' "$font_count"
