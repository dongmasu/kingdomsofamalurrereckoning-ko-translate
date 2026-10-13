#!/usr/bin/env python3
"""Normalize only the manual-backed Mitharu deity in ID 32556."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19801/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "299bcbb74586635683e0fc5f441bdeea8dd6d8432fe613b73a2673111d5365b3"


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
    old, new = "미타루".encode(), "미사루".encode()
    count = original["32556"].count(old)
    assert count >= 2
    after = before.replace(original["32556"], original["32556"].replace(old, new), 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key in original:
        if key == "32556":
            assert updated[key].replace(new, old) == original[key]
        else:
            assert updated[key] == original[key], key
    assert after.startswith(b"\xef\xbb\xbf")
    assert (before.count(b"\r\n"), before.count(b"\n")) == (
        after.count(b"\r\n"), after.count(b"\n"))
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    BACKUP.write_bytes(before)
    assert BACKUP.read_bytes() == before
    CSV.write_bytes(after)
    assert CSV.read_bytes() == after
    print(hashlib.sha256(after).hexdigest(), count)
    print(BACKUP)


if __name__ == "__main__":
    main()
