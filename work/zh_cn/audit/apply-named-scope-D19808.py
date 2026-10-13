#!/usr/bin/env python3
"""Apply D-19808 supported formal titles and responsibility correction."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19808/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "be25951fc9044d0416d1d1212f0cf145e8177332083009327f0af481193cefd0"
EDITS = {
    "33273": ("- 학자 테오프링", "- 사반트 테오프링"),
    "33279": ("중급 영매 모르리그", "마스터 영매 모르리그(Master Medium Morlig)"),
    "33344": ("용맹의 집은 너희 종족이 만든 결과다.",
              "용맹의 집에 대한 책임은 너희 종족에게 있어."),
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
