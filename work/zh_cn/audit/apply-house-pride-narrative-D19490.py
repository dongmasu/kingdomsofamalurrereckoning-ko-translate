"""Normalize explicit House of Pride names on nine audited rows."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-pride-narrative-D19490/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    34370: ("프라이드 가문", "긍지의 집(House of Pride)", 1),
    34461: ("프라이드 가문", "긍지의 집(House of Pride)", 2),
    35512: ("하우스 오브 프라이드", "긍지의 집(House of Pride)", 1),
    45237: ("용맹의 가문", "긍지의 집(House of Pride)", 1),
    50020: ("하우스 오브 프라이드", "긍지의 집(House of Pride)", 1),
    50562: ("프라이드의 집(House of Pride)", "긍지의 집(House of Pride)", 1),
    52195: ("자긍심의 집(House of Pride)", "긍지의 집(House of Pride)", 1),
    54912: ("자부심의 집(House of Pride)", "긍지의 집(House of Pride)", 1),
    57691: ("긍지의 전당", "긍지의 집(House of Pride)", 1),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "bcf03c641fadd72441a42a1ca1c0abd491794cfada675bbe4e7d9176a9d843f2"
)
updated = original
for key, (before, after, count) in edits.items():
    rows = [
        row for row in updated.split(b"\r\n") if row.startswith(f"{key};".encode())
    ]
    assert len(rows) == 1
    row = rows[0]
    old = before.encode()
    assert row.count(old) == count and updated.count(row + b"\r\n") == 1
    changed = row.replace(old, after.encode())
    updated = updated.replace(row + b"\r\n", changed + b"\r\n", 1)

assert updated.startswith(b"\xef\xbb\xbf")
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
