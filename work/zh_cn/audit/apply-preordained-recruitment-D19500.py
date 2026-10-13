"""Normalize eight Preordained references by exact ID."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-preordained-recruitment-D19500/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    25290: ("선결된 자들", "예정된 자들(Preordained)"),
    29692: ("운명 예정자들", "예정된 자들(Preordained)"),
    30611: ("선택받은 자들에게", "예정된 자들(Preordained)에게"),
    33030: ("선견자들이", "예정된 자들(Preordained)이"),
    33365: ("선견자들이 원한", "예정된 자들(Preordained)이 원한"),
    34684: ("미리 정해진 운명과 요정은", "예정된 자들(Preordained)과 요정은"),
    35076: ("정해진 자들을 도우면", "예정된 자들(Preordained)을 도우면"),
    35709: ("정해진 자", "예정된 자(Preordained)"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "ea225f81c75115f74f88623b7937b829bc0560925595c734694bbf4df5235600"
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
