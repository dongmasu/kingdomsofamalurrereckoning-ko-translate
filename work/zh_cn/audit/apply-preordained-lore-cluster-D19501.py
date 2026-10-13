"""Align ten Preordained lore references to the reviewed canonical term."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-preordained-lore-cluster-D19501/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    37675: ("운명에 정해진 자들이", "예정된 자들(Preordained)이"),
    43123: ("선택받은 자들이", "예정된 자들(Preordained)이"),
    47120: ("선각자들의 야영지", "예정된 자들(Preordained)의 야영지"),
    50160: ("예정된 자", "예정된 자(Preordained)"),
    50598: ("불려온 자들(Preordained)", "예정된 자들(Preordained)"),
    52727: ("선재자들(Preordained)", "예정된 자들(Preordained)"),
    54148: ("선재자들(Preordained)", "예정된 자들(Preordained)"),
    54702: ("정해진 자들(Preordained)", "예정된 자들(Preordained)"),
    57717: ("미리 정해진 자들이", "예정된 자들(Preordained)이"),
    58256: ("미리 정해진 자", "예정된 자(Preordained)"),
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "095e9652f7683d40840bdcfd106a476d3779cb091af8877a13897f7413224ab2"
)
updated = original
for key, (before, after) in edits.items():
    rows = [r for r in updated.split(b"\r\n") if r.startswith(f"{key};".encode())]
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
