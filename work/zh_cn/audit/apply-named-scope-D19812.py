#!/usr/bin/env python3
"""Apply exact D-19812 Firstsworn Hall and title-introduction corrections."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path(
    "/private/tmp/ko-translate-backups/20261013/"
    "before-named-scope-D19812/locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED = "08d0672c73d04878d6bbd4fb73e49a4749fe2be074d3b5a071730f41721c9b8e"
EDITS = {
    "33653": (
        "첫 서약자들의 전당",
        "퍼스트스원 전당(Hall of the Firstsworn)",
    ),
    "33722": (
        "불멸자들의 도구를 소개합니다. 죽음의 수수께끼 손, 전하이십니다.",
        "불멸자들의 도구, 존귀하신 죽음의 비밀스러운 손(Death's Cryptic Hand)을 소개합니다.",
    ),
}


def rows(blob):
    found = list(re.finditer(rb"(?m)^(\d+);", blob))
    return {
        match.group(1).decode(): blob[
            match.start():found[i + 1].start()
            if i + 1 < len(found)
            else len(blob)
        ]
        for i, match in enumerate(found)
    }


def main():
    before = CSV.read_bytes()
    assert hashlib.sha256(before).hexdigest() == EXPECTED
    assert not BACKUP.exists()
    original = rows(before)
    assert len(original) == 65135
    after = before
    for key, (old, new) in EDITS.items():
        assert original[key].count(old.encode()) == 1, key
        after = after.replace(
            original[key],
            original[key].replace(old.encode(), new.encode(), 1),
            1,
        )
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
        after.count(b"\r\n"), after.count(b"\n")
    )
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    BACKUP.write_bytes(before)
    assert BACKUP.read_bytes() == before
    CSV.write_bytes(after)
    assert CSV.read_bytes() == after
    print(hashlib.sha256(after).hexdigest())
    print(BACKUP)


if __name__ == "__main__":
    main()
