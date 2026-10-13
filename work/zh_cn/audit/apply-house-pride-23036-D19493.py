"""Normalize the contextually explicit House of Pride reference at ID 23036."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-pride-23036-D19493/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "2782ca15fc2d9728df25979f40c35ae4bbef483fda91e4439474061c6f5e868c"
)
rows = [r for r in original.split(b"\r\n") if r.startswith(b"23036;")]
assert len(rows) == 1
old = "긍지의 가문 말인가?".encode()
new = "긍지의 집(House of Pride) 말인가?".encode()
assert rows[0].count(old) == 1
updated = original.replace(
    rows[0] + b"\r\n", rows[0].replace(old, new, 1) + b"\r\n", 1
)
assert updated[:3] == original[:3] == b"\xef\xbb\xbf"
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
