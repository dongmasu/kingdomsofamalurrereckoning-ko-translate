#!/usr/bin/env python3
"""Align three Castellan titles in the source-paired office roster."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19804/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "a1df3fba64af463e81e97d0e4465d2706d3f51456c58fc388c698212e150be08"


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
    old, new = "성채 관리관".encode(), "성주".encode()
    assert original["32891"].count(old) == 3
    after = before.replace(original["32891"], original["32891"].replace(old, new), 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key, value in original.items():
        if key == "32891":
            assert updated[key].replace(new, old) == value
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
