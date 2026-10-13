"""Correct the four supported House of Pride references by exact ID."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-pride-followup-D19491/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    20532: ("오만의 집", "긍지의 집(House of Pride)"),
    30259: ("프라이드 가문을", "긍지의 집(House of Pride)을"),
    34133: ("프라이드 가문에서", "긍지의 집(House of Pride)에서"),
    40733: ("오만의 가문은", "긍지의 집(House of Pride)은"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "635ac00a7c7bc8603cd6dae853c4426e231ff3ddf66e6a90bf63fefce76d880e"
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
assert updated.startswith(b"\xef\xbb\xbf")
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
