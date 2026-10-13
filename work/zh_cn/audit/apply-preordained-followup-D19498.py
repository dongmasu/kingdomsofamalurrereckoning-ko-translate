"""Standardize the standalone Preordained label at exact ID 10679."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-preordained-followup-D19498/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "afea9f795834c46e5de9c4dbeec443df96a836bd5f1a792ae6d5eabb4506b60b"
)
rows = [r for r in original.split(b"\r\n") if r.startswith(b"10679;")]
assert len(rows) == 1 and rows[0] == "10679;미리 정해진 자".encode()
updated = original.replace(
    rows[0] + b"\r\n",
    "10679;예정된 자(Preordained)\r\n".encode(),
    1,
)
assert updated[:3] == original[:3] == b"\xef\xbb\xbf"
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
