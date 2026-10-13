"""Normalize the explicitly named House of Pride at default ID 9648."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-pride-9648-D19492/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "11dd816a5625e0e3275acdae800d7a5c8d5859dfc7cb0b97d897eb49d44f0a87"
)
rows = [r for r in original.split(b"\r\n") if r.startswith(b"9648;")]
assert len(rows) == 1
old = "자만의 집은".encode()
new = "긍지의 집(House of Pride)은".encode()
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
