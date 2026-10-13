#!/usr/bin/env python3
"""Apply D-19800 manual-backed name correction without disturbing CSV bytes."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19800/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "7f010088753ff999da9c35f83db0d488f1e89e0867da26f3dfed5c0af1fe04f6"


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
    old, new = "브레이코르".encode(), "브래코르".encode()
    assert original["32494"].count(old) == 3
    after = before.replace(original["32494"], original["32494"].replace(old, new), 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key in original:
        if key == "32494":
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
    print(hashlib.sha256(after).hexdigest())
    print(BACKUP)


if __name__ == "__main__":
    main()
