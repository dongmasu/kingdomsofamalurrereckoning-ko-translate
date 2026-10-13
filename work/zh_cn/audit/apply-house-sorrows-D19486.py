"""Apply the three source-keyed House of Sorrows name corrections exactly once."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-sorrows-final-refs-D19486/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
expected = "83503852fe5b0f6be04a358bd91883235d5d001550464456a76ab5b1fc928d9d"
edits = {
    49422: ("슬픔의 집은", "비탄의 집(House of Sorrows)은"),
    57442: ("슬픔의 전당의", "비탄의 집(House of Sorrows)의"),
    65045: ("소로우의 집은", "비탄의 집(House of Sorrows)은"),
}

original = active.read_bytes()
assert original == backup.read_bytes(), "Backup must be byte-identical"
assert sha256(original).hexdigest() == expected, "Unexpected active CSV hash"
updated = original
for key, (before, after) in edits.items():
    start = f"{key};".encode()
    rows = [row for row in updated.split(b"\r\n") if row.startswith(start)]
    assert len(rows) == 1, f"Expected exactly one row for {key}"
    row = rows[0]
    old = before.encode()
    assert row.count(old) == 1, f"Expected exactly one old phrase for {key}"
    replacement = row.replace(old, after.encode(), 1)
    assert updated.count(row + b"\r\n") == 1, f"Row not unique for {key}"
    updated = updated.replace(row + b"\r\n", replacement + b"\r\n", 1)

assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
assert updated.startswith(b"\xef\xbb\xbf")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
