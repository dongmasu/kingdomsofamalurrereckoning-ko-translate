#!/usr/bin/env python3
"""Apply D-19805 aligned UI payload, title and deity corrections."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19805/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "ae8f6a7f01c8373cdd67302b09c5243571660978460ac99c818d3ec555778202"
EDITS = {
    "32999": [("{*1slot}", "{*1슬롯}"),
              ("{*1abilities}을(를) 등록하려면", "{*1능력}을(를) 등록하려면"),
              ("{*1ability}을(를) 아래", "{*1능력}을(를) 아래")],
    "33022": [("공성전의 파괴자", "공성 파괴자(Siegebreaker)")],
    "33025": [("미타루와 화해해야", "미사루와 화해해야")],
}


def rows(blob):
    found = list(re.finditer(rb"(?m)^(\d+);", blob))
    return {m.group(1).decode(): blob[m.start():found[i + 1].start()
            if i + 1 < len(found) else len(blob)]
            for i, m in enumerate(found)}


def main():
    before = CSV.read_bytes()
    assert hashlib.sha256(before).hexdigest() == EXPECTED
    assert not BACKUP.exists()
    original = rows(before)
    assert len(original) == 65135
    after = before
    for key, replacements in EDITS.items():
        row = original[key]
        for old, new in replacements:
            assert row.count(old.encode()) == 1, (key, old)
            row = row.replace(old.encode(), new.encode(), 1)
        after = after.replace(original[key], row, 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key, value in original.items():
        if key in EDITS:
            row = updated[key]
            for old, new in reversed(EDITS[key]):
                assert row.count(new.encode()) == 1, (key, new)
                row = row.replace(new.encode(), old.encode(), 1)
            assert row == value, key
        else:
            assert updated[key] == value, key
    assert after.startswith(b"\xef\xbb\xbf")
    assert (before.count(b"\r\n"), before.count(b"\n")) == (
        after.count(b"\r\n"), after.count(b"\n"))
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    BACKUP.write_bytes(before)
    assert BACKUP.read_bytes() == before
    CSV.write_bytes(after)
    assert CSV.read_bytes() == after
    print(hashlib.sha256(after).hexdigest())
    print(BACKUP)


if __name__ == "__main__":
    main()
