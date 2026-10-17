#!/usr/bin/env python3
import csv
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
INVENTORY = Path("/private/tmp/proper-name-source-inventory.tsv")
GLOSSARY = ROOT / "work/zh_cn/audit/proper-name-glossary.tsv"


def read_table(path, delimiter):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return list(csv.reader(stream, delimiter=delimiter))


def source_rows(language, resource):
    path = ROOT / f"src/csv/{language}/locatexts_{language}.koalocatext_{resource}.csv"
    rows = {}
    for row in read_table(path, ";")[1:]:
        if not row:
            continue
        key = (row[0], row[1] if resource != "default" else "")
        rows[key] = row[-1]
    return rows


def work_rows(resource):
    path = ROOT / f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv"
    rows = {}
    for row in read_table(path, ";")[1:]:
        if not row:
            continue
        key = (row[0], row[1] if resource != "default" else "")
        rows[key] = row[-1]
    return rows


glossary = read_table(GLOSSARY, "\t")
person_rows = [row for row in glossary[1:] if row[0].startswith("person:")]
start = next(i for i, row in enumerate(person_rows) if row[1] == "Aara")
end = next(i for i, row in enumerate(person_rows) if row[1] == "Alisen")
people = person_rows[start : end + 1]
inventory = read_table(INVENTORY, "\t")

source_cache = {}
work_cache = {}
for resource in ("affix", "base", "default"):
    for language in ("en_us", "ja_jp", "zh_cn"):
        source_cache[(language, resource)] = source_rows(language, resource)
    work_cache[resource] = work_rows(resource)

counts = {row[0]: [0, 0, 0] for row in people}
details = "--summary" not in sys.argv
requested_entity = next(
    (arg.split("=", 1)[1] for arg in sys.argv if arg.startswith("--entity=")),
    None,
)
checks_only = "--checks" in sys.argv
mismatches_only = "--mismatches" in sys.argv
missing_only = "--missing" in sys.argv
if details:
    print("resource\tID_Linha\tTipo_Variante\tentity_key\tglossed\taligned\tEN\tJA\tZH\tKO")
for row in inventory[1:]:
    resource, row_id, variant, en_json, ja_json, zh, work = row[:7]
    english_texts = json.loads(en_json)
    japanese_texts = json.loads(ja_json)
    key = (row_id, variant if resource != "default" else "")
    en_actual = source_cache[("en_us", resource)].get(key, "")
    ja_actual = source_cache[("ja_jp", resource)].get(key, "")
    zh_actual = source_cache[("zh_cn", resource)].get(key, "")
    work_actual = work_cache[resource].get(key, "")
    for person in people:
        entity_key, english, _, korean, _, korean_variants, *_ = person
        if requested_entity and entity_key != requested_entity:
            continue
        pattern = re.compile(rf"(?<![A-Za-z]){re.escape(english)}(?![A-Za-z])", re.I)
        matches = [
            match
            for text in english_texts
            if isinstance(text, str)
            for match in pattern.finditer(text)
        ]
        if not matches:
            continue
        counts[entity_key][0] += len(matches)
        canonical_hangul = korean.split("(", 1)[0]
        bilingual_mentions = re.findall(
            r"([가-힣]+(?:\s+[가-힣]+)*)\(([^)]*)\)", work_actual
        )
        glossed = any(
            canonical_hangul in korean_part
            and re.search(rf"(?<![A-Za-z]){re.escape(english)}(?![A-Za-z])", english_part, re.I)
            for korean_part, english_part in bilingual_mentions
        )
        aligned = (
            en_actual in english_texts
            and ja_actual in japanese_texts
            and zh_actual == zh
            and work_actual == work
        )
        counts[entity_key][1] += int(glossed)
        counts[entity_key][2] += int(aligned)
        show_row = (
            not aligned
            if mismatches_only
            else not glossed
            if missing_only
            else (not glossed or not aligned)
            if checks_only
            else True
        )
        if details and show_row:
            matching_texts = [
                pattern.sub(f"[{english}]", text)
                for text in english_texts
                if isinstance(text, str) and pattern.search(text)
            ]
            snippet = " || ".join(matching_texts)
            print(
                f"{resource}\t{row_id}\t{variant}\t{entity_key}\t"
                f"{'yes' if glossed else 'no'}\t{'yes' if aligned else 'CHECK'}\t"
                f"{snippet}\t{ja_actual}\t{zh_actual}\t{work_actual}"
            )

print("\nSUMMARY")
for person in people:
    key = person[0]
    total, glossed, aligned = counts[key]
    print(f"{key}\toccurrences={total}\tbilingual={glossed}\trows_aligned={aligned}")
