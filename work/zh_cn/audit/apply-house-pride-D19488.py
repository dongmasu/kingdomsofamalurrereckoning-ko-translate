"""Normalize the seven explicitly named House of Pride cells byte-for-byte."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-pride-cluster-D19488/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    31176: ("긍지의 가문은", "긍지의 집(House of Pride)은"),
    35174: ("긍지의 하우스", "긍지의 집(House of Pride)"),
    42956: ("긍지의 하우스 방어", "긍지의 집(House of Pride) 방어"),
    52864: ("자부심의 가문(House of Pride)", "긍지의 집(House of Pride)"),
    55762: ("프라이드의 집(House of Pride)", "긍지의 집(House of Pride)"),
    57486: ("긍지의 전당이", "긍지의 집(House of Pride)이"),
    58822: ("자부심의 가문", "긍지의 집(House of Pride)"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "ba22ef09faa03f98a7c511a1f57d7dea4f900c38bd1d342b89a82535e54c09fe"
)
updated = original
for key, (before, after) in edits.items():
    rows = [
        row for row in updated.split(b"\r\n") if row.startswith(f"{key};".encode())
    ]
    assert len(rows) == 1
    row = rows[0]
    old = before.encode()
    assert row.count(old) == 1 and updated.count(row + b"\r\n") == 1
    updated = updated.replace(
        row + b"\r\n", row.replace(old, after.encode()) + b"\r\n", 1
    )

assert updated.startswith(b"\xef\xbb\xbf")
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
