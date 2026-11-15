#!/usr/bin/env python3
"""Apply the scoped Fate/Destiny distinction to active Korean localization."""

import argparse
import csv
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
HELPER = ROOT / "tools/replace_text_preserve_eol.py"
DESTINY_WORD = re.compile(r"\bdestin(?:y|ies)\b", re.IGNORECASE)
FATE_FAMILY = re.compile(r"fate", re.IGNORECASE)
ALREADY_DISTINGUISHED = {"35295", "43931", "48728", "54424"}

MIXED_SOURCE_RULES = {
    "1369": [("모든 생물을 운명에 묶는", "모든 생물을 숙명에 묶는")],
    "2005": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "2064": [("운명의 자매들", "숙명의 자매들")],
    "4770": [("운명의 속박", "숙명의 속박")],
    "5514": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "6602": [("운명의 변덕", "숙명의 변덕")],
    "7042": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "10351": [("이 운명(Destiny)을 선택하면", "이 숙명(Destiny)을 선택하면")],
    "11329": [("운명 없는 최초의 필멸자", "숙명이 없는 최초의 필멸자")],
    "12526": [("운명의 서(Codex of Destiny)", "숙명의 서(Codex of Destiny)")],
    "17034": [("운명 자체를 정복할", "숙명 자체를 정복할")],
    "19649": [
        (
            "전설의 운명의 서(Codex of Destiny)",
            "전설적인 숙명의 서(Codex of Destiny)",
        )
    ],
    "22481": [("운명의 서(Codex of Destiny)", "숙명의 서(Codex of Destiny)")],
    "33922": [("운명이 너를 데리러 왔군", "숙명이 너를 데리러 왔군")],
    "38305": [("운명의 서(Codex of Destiny)", "숙명의 서(Codex of Destiny)")],
    "38591": [("운명", "숙명")],
    "39846": [("네 운명과 얽히지 않아", "네 숙명과 얽히지 않아")],
    "40865": [("내 운명을 의심하던", "내 숙명을 의심하던")],
    "43425": [("스스로 운명을 빚어내야만", "스스로 숙명을 빚어내야만")],
    "44413": [("계속 운명을 피해 가는", "계속 숙명을 피해 가는")],
    "47834": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "48215": [("운명이 빚어지는 세계", "숙명이 빚어지는 세계")],
    "48429": [("세계의 운명을 읽는 법", "세계의 숙명을 읽는 법")],
    "48917": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "52956": [("운명과 마찬가지로", "숙명과 마찬가지로")],
    "54803": [("이야기와 운명도", "이야기와 숙명도")],
    "54811": [("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)")],
    "55312": [("왕과 신의 운명까지", "왕과 신의 숙명까지")],
    "58097": [("될 운명은 아니라고", "될 숙명은 아니라고")],
    "59512": [("쓰러뜨린 적의 운명을 바꿀", "쓰러뜨린 적의 숙명을 바꿀")],
    "60101": [("동족의 운명을 바꾸는", "동족의 숙명을 바꾸는")],
    "60407": [
        ("운명의 돌(Destiny Stone)", "숙명의 돌(Destiny Stone)"),
        ("운명의 서(Codex of Destiny)", "숙명의 서(Codex of Destiny)"),
    ],
    "61101": [
        (
            "모든 콜로사이(Kollossae)의 운명을 빚어 낸",
            "모든 콜로사이(Kollossae)의 숙명을 빚어 낸",
        )
    ],
}


def read_table(path):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        rows = list(csv.DictReader(stream, delimiter=";"))
    if not rows:
        raise ValueError(f"empty localization table: {path}")
    return rows


def transform_mixed(row_id, text):
    rules = MIXED_SOURCE_RULES[row_id]
    result = text
    for old, new in rules:
        if row_id == "38591":
            old_count = result.count(old)
            new_count = result.count(new)
            if old_count == 7 and new_count == 0:
                result = result.replace(old, new)
            elif old_count == 0 and new_count == 7:
                continue
            else:
                raise ValueError(
                    f"unexpected Destiny wording count for default:{row_id}: "
                    f"old={old_count}, new={new_count}"
                )
            continue

        old_count = result.count(old)
        new_count = result.count(new)
        if old_count == 1 and new_count == 0:
            result = result.replace(old, new, 1)
        elif old_count == 0 and new_count == 1:
            continue
        else:
            raise ValueError(
                f"unexpected scoped wording for default:{row_id}: "
                f"{old!r} count={old_count}, {new!r} count={new_count}"
            )
    return result


def build_plan():
    plans = []
    for resource in ("default", "base"):
        english_path = ROOT / f"src/csv/en_us/locatexts_en_us.koalocatext_{resource}.csv"
        target_path = ROOT / f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv"
        english = read_table(english_path)
        target = read_table(target_path)
        by_target = {
            (row["ID_Linha"], row.get("Tipo_Variante", "")): row
            for row in target
        }
        destiny_rows = [
            row for row in english if DESTINY_WORD.search(row["Texto"])
        ]
        if resource == "default" and len(destiny_rows) != 166:
            raise ValueError(f"expected 166 English default Destiny keys, got {len(destiny_rows)}")
        if resource == "base" and len(destiny_rows) != 5:
            raise ValueError(f"expected 5 English base Destiny keys, got {len(destiny_rows)}")

        for source in destiny_rows:
            row_id = source["ID_Linha"]
            variants = [source.get("Tipo_Variante", "")]
            for variant in variants:
                current_row = by_target.get((row_id, variant))
                if current_row is None:
                    raise ValueError(f"missing target row {resource}:{row_id}:{variant}")
                current = current_row["Texto"]
                source_text = source["Texto"]

                if resource == "default" and FATE_FAMILY.search(source_text):
                    if row_id in ALREADY_DISTINGUISHED:
                        if row_id == "35295":
                            if "숙명이다" not in current or "운명 없는 자(Fateless One)" not in current:
                                raise ValueError("default:35295 no longer keeps the approved term distinction")
                        elif row_id == "43931":
                            if "운명과 숙명" not in current or "운명 없는 자(Fateless One)" not in current:
                                raise ValueError("default:43931 no longer keeps the approved term distinction")
                        elif row_id == "48728":
                            if "운명" not in current or "숙명" not in current:
                                raise ValueError("default:48728 no longer keeps the approved term distinction")
                        elif row_id == "54424":
                            if "운명이라" not in current or "숙명이라" not in current:
                                raise ValueError("default:54424 no longer keeps the approved term distinction")
                        continue
                    if row_id not in MIXED_SOURCE_RULES:
                        raise ValueError(f"missing mixed-source rule for default:{row_id}")
                    updated = transform_mixed(row_id, current)
                    if row_id in {"33922", "35295", "43931", "54803"} and (
                        "운명 없는 자(Fateless One)" not in updated
                    ):
                        raise ValueError(f"Fateless One wording changed at default:{row_id}")
                else:
                    if FATE_FAMILY.search(source_text):
                        raise ValueError(f"unexpected non-default mixed source: {resource}:{row_id}")
                    updated = current.replace("운명", "숙명").replace("데스티니", "숙명")

                if updated != current:
                    plans.append((resource, row_id, variant, current, updated, target_path))

    affix_en = read_table(ROOT / "src/csv/en_us/locatexts_en_us.koalocatext_affix.csv")
    affix_ko_path = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_affix.csv"
    affix_ko = read_table(affix_ko_path)
    affix_source = [
        row for row in affix_en
        if row["ID_Linha"] == "304" and DESTINY_WORD.search(row["Texto"])
    ]
    if len(affix_source) != 1 or affix_source[0]["Texto"] != "of Destiny":
        raise ValueError("unexpected affix:304 English source")
    affix_rows = [row for row in affix_ko if row["ID_Linha"] == "304"]
    if [row["Tipo_Variante"] for row in affix_rows] != ["11", "12", "14", "21", "22", "24"]:
        raise ValueError("unexpected active affix:304 variant set")
    for row in affix_rows:
        current = row["Texto"]
        if current == "*운명*":
            updated = "*숙명*"
        elif current == "*숙명*":
            continue
        else:
            raise ValueError(f"unexpected affix:304:{row['Tipo_Variante']} text {current!r}")
        plans.append(("affix", "304", row["Tipo_Variante"], current, updated, affix_ko_path))

    return plans


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="apply preflighted edits")
    args = parser.parse_args()
    plan = build_plan()
    counts = {}
    for resource, *_ in plan:
        counts[resource] = counts.get(resource, 0) + 1
    print(f"Planned text cells: {counts}")
    for resource, row_id, variant, old, new, path in plan:
        command = [
            sys.executable,
            str(HELPER),
            str(path),
            "--id",
            row_id,
            "--old",
            old,
            "--new",
            new,
        ]
        if variant:
            command.extend(["--variant", variant])
        if args.apply:
            subprocess.run(command, check=True)
        else:
            suffix = f":{variant}" if variant else ""
            print(f"{resource}:{row_id}{suffix}: {old!r} -> {new!r}")


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        raise SystemExit(str(error)) from error
