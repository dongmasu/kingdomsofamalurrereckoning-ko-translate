#!/usr/bin/env python3
"""Apply the D-19798 decisions while preserving every non-target byte."""

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
CSV = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP = Path("/private/tmp/ko-translate-backups/20261013/"
              "before-named-scope-D19798/locatexts_zh_cn.koalocatext_default.csv")
EXPECTED = "e6b78039ed4ff6d6cf93a5d150ffef62d05769cecd142f372091927825cda52a"
EDITS = {
    "32300": ("문 캠프에서 한동안 일했는데", "달 야영지에서 한동안 일했는데"),
    "32317": ("애블리어가 임무에 관해", "아블리에가 임무에 관해"),
    "32330": ("장비에 덧붙이는 가죽 허리띠다.", "톱니바퀴에 연결하도록 만든 가죽 벨트다."),
}


def rows(blob):
    matches = list(re.finditer(rb"(?m)^(\d+);", blob))
    return {m.group(1).decode(): blob[m.start():matches[i + 1].start()
            if i + 1 < len(matches) else len(blob)]
            for i, m in enumerate(matches)}, matches


def main():
    before = CSV.read_bytes()
    assert hashlib.sha256(before).hexdigest() == EXPECTED
    assert not BACKUP.exists(), "Backup already exists; refusing to overwrite"
    original_rows, matches = rows(before)
    assert len(matches) == 65135
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    BACKUP.write_bytes(before)
    assert BACKUP.read_bytes() == before
    after = before
    for row_id, (old, new) in EDITS.items():
        old_bytes, new_bytes = old.encode(), new.encode()
        assert original_rows[row_id].count(old_bytes) == 1, row_id
        after = after.replace(original_rows[row_id],
                              original_rows[row_id].replace(old_bytes, new_bytes, 1), 1)
    assert after.startswith(b"\xef\xbb\xbf")
    for ending in (b"\r\n", b"\n"):
        assert before.count(ending) == after.count(ending)
    updated, updated_matches = rows(after)
    assert list(updated) == list(original_rows) and len(updated_matches) == len(matches)
    for row_id in original_rows:
        if row_id not in EDITS:
            assert updated[row_id] == original_rows[row_id], row_id
        else:
            old, new = EDITS[row_id]
            assert updated[row_id].replace(new.encode(), old.encode(), 1) == original_rows[row_id]
    CSV.write_bytes(after)
    assert CSV.read_bytes() == after
    print(hashlib.sha256(after).hexdigest())
    crlf = after.count(b"\r\n")
    print(f"CRLF={crlf} LF-only={after.count(bytes([10])) - crlf}")
    print(BACKUP)


if __name__ == "__main__":
    main()
