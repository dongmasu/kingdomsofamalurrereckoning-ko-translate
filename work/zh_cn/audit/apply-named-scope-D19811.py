#!/usr/bin/env python3
"""Apply exact D-19811 contextual wording corrections."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19811/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "b3ef6ac24c4dc34be5df204363bfac77cfefe5de2796ac93273ab2f37ab666de"
EDITS = {
    "33582": ("인공물과 자연이 빚어낸", "기술과 자연이 빚어낸"),
    "33589": ("론드 농장의 광기를 멈추고", "론드 농장을 덮친 광기를 잠재우고"),
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
