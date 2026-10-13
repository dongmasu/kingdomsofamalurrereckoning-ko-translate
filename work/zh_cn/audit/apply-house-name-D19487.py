"""Apply the one approved House of Ballads name edit without reserializing CSV."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-house-name-followup-D19487/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "b91de2555b9bf7afc7a076bc8465a0fd2d42b1247fed066e3c100abdfd8f3642"
)
old = "발라드의 전당으로".encode()
new = "발라드의 집(House of Ballads)으로".encode()
rows = [line for line in original.split(b"\r\n") if line.startswith(b"37088;")]
assert len(rows) == 1 and rows[0].count(old) == 1
assert original.count(rows[0] + b"\r\n") == 1
updated = original.replace(rows[0] + b"\r\n", rows[0].replace(old, new) + b"\r\n", 1)
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
assert updated.startswith(b"\xef\xbb\xbf")
active.write_bytes(updated)
print(sha256(active.read_bytes()).hexdigest())
