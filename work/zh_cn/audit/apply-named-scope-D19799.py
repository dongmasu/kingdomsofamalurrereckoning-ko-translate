#!/usr/bin/env python3
"""Apply approved D-19799 corrections with byte-exact validation."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19799/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "cb2610b06a6e3a13367896292888e0a8681bd0072a65f3d0543156e08ed36970"
EDITS = {
    "32373": ("장인의 자물쇠따개", "달인의 자물쇠따개(Master's Pick)"),
    "32390": ("미타루 교단", "미사루 교단"),
    "32399": ("미타루 교리", "미사루 교리"),
    "32403": ("정의의 신 위나돈", "정의의 신 이나돈"),
    "32437": ("페이의 빈터 바로 위", "페이 동굴 바로 위"),
    "32440": ("봉헌물이 나쁘냐고?", "봉헌 의식(Offering)이 나쁘냐고?"),
}


def rows(blob):
    matches = list(re.finditer(rb"(?m)^(\d+);", blob))
    return {m.group(1).decode(): blob[m.start():matches[i + 1].start()
            if i + 1 < len(matches) else len(blob)]
            for i, m in enumerate(matches)}


def main():
    before = CSV.read_bytes()
    assert hashlib.sha256(before).hexdigest() == EXPECTED
    assert not BACKUP.exists()
    previous = rows(before)
    assert len(previous) == 65135
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    BACKUP.write_bytes(before)
    assert BACKUP.read_bytes() == before
    after = before
    for row_id, (old, new) in EDITS.items():
        original = previous[row_id]
        assert original.count(old.encode()) == 1, row_id
        after = after.replace(original, original.replace(old.encode(), new.encode(), 1), 1)
    assert after.startswith(b"\xef\xbb\xbf")
    assert (after.count(b"\r\n"), after.count(b"\n")) == (
        before.count(b"\r\n"), before.count(b"\n"))
    updated = rows(after)
    assert list(previous) == list(updated)
    for row_id, original in previous.items():
        if row_id in EDITS:
            old, new = EDITS[row_id]
            assert updated[row_id].replace(new.encode(), old.encode(), 1) == original
        else:
            assert updated[row_id] == original
    CSV.write_bytes(after)
    assert CSV.read_bytes() == after
    print(hashlib.sha256(after).hexdigest())
    print(BACKUP)


if __name__ == "__main__":
    main()
