"""Standardize three Preordained patrol/talisman references exactly."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-preordained-patrol-cluster-D19499/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    15020: ("예정자들 때문이지", "예정된 자들(Preordained) 때문이지"),
    15376: ("예정자들과 맞닥뜨렸겠지", "예정된 자들(Preordained)과 맞닥뜨렸겠지"),
    15422: ("예정자들은 모두", "예정된 자들(Preordained)은 모두"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "e84f9fdddcc1458c32512d61f2743a0475c869e9fb67d6764ecc191604f3a055"
)
updated = original
for key, (before, after) in edits.items():
    rows = [
        r for r in updated.split(b"\r\n") if r.startswith(f"{key};".encode())
    ]
    assert len(rows) == 1
    row = rows[0]
    assert row.count(before.encode()) == 1
    updated = updated.replace(
        row + b"\r\n", row.replace(before.encode(), after.encode(), 1) + b"\r\n", 1
    )
assert updated[:3] == original[:3] == b"\xef\xbb\xbf"
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
