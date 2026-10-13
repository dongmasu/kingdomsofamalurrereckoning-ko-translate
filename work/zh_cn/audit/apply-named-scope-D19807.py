#!/usr/bin/env python3
"""Apply source-title and official-institution corrections D-19807."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19807/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "5866ab2698f4e6684e5a991d0b8b7a2c43f547ce784eba439a86b2bafdec6527"
EDITS = {
    "33161": ("전차를 모는 자로서 네 노래는", "전차(Chariot)로서 네 노래는"),
    "33212": ("슈콜리아 아르카나의 학자", "스콜리아 아르카나의 사반트"),
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
    for key, (old, new) in EDITS.items():
        assert original[key].count(old.encode()) == 1, key
        after = after.replace(original[key], original[key].replace(old.encode(), new.encode(), 1), 1)
    updated = rows(after)
    assert list(original) == list(updated)
    for key, value in original.items():
        if key in EDITS:
            old, new = EDITS[key]
            assert updated[key].replace(new.encode(), old.encode(), 1) == value
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
