#!/usr/bin/env python3
"""Correct manual-backed Mitharu once inside the chicken treatise."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19810/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "04e7e1a64ecd05f2234ce26e1802ac8544050a7b4184225c26ca7fed97c8f5d8"


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
    old, new = "미타루의 실수".encode(), "미사루의 실수".encode()
    assert original["33479"].count(old) == 1
    after = before.replace(original["33479"], original["33479"].replace(old, new, 1), 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key, value in original.items():
        if key == "33479":
            assert updated[key].replace(new, old, 1) == value
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
