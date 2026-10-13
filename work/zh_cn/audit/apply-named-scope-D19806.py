#!/usr/bin/env python3
"""Apply exact source-backed D-19806 pronoun and fragment corrections."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19806/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "54819732546b25ed1251b75b39b5bb3afd1d8fa0eb114b0edd46db6d4d0d2d19"
EDITS = {
    "33066": ("하지만 난 그 법황과 달라.", "하지만 난 그 사람과 달라."),
    "33105": ("난민을 받아들이지 않으니 감옥도 필요 없어요.",
              "난민을 받아들이지 않으니 그런 것도 필요 없어요."),
    "33143": ("평생에 가깝게 싸우고 나서야... 지금까지 내린 결정 중 가장 힘든 일 중 하나였어.",
              "거의 평생을 싸워 왔어. 그건 지금껏 해 온 일 중에서도 손꼽히게 힘들었지."),
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
