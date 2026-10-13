"""Standardize five reviewed Preordained references by exact source ID."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-preordained-core-terms-D19494/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    2667: ("정해진 자들(Preordained)", "예정된 자들(Preordained)"),
    2673: ("정해진 자들(Preordained)", "예정된 자들(Preordained)"),
    3142: ("정해진 자(Preordained)", "예정된 자(Preordained)"),
    7632: ("운명받은 자들(Preordained)", "예정된 자들(Preordained)"),
    7713: ("운명받은 자들(Preordained)", "예정된 자들(Preordained)"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "5a565312dd7cd6d84f37ca3474557351872db4ae9c8f434aa0c30479c8b27f02"
)
updated = original
for key, (before, after) in edits.items():
    rows = [
        row for row in updated.split(b"\r\n") if row.startswith(f"{key};".encode())
    ]
    assert len(rows) == 1
    row = rows[0]
    assert row.count(before.encode()) == 1
    updated = updated.replace(
        row + b"\r\n",
        row.replace(before.encode(), after.encode(), 1) + b"\r\n",
        1,
    )
assert updated[:3] == original[:3] == b"\xef\xbb\xbf"
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
