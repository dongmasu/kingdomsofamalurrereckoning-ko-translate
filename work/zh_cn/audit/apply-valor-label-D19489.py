"""Apply the one remaining House of Valor label correction exactly."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-valor-label-D19489/locatexts_zh_cn.koalocatext_default.csv"
)
before = backup.read_bytes()
assert before == active.read_bytes()
assert sha256(before).hexdigest() == (
    "8a3beb7092fc2f329ae49ad6ac165765411a7d42e63052eb784445fe10859021"
)
rows = [r for r in before.split(b"\r\n") if r.startswith(b"7878;")]
assert len(rows) == 1
old = "용맹의 전당(House of Valor)".encode()
new = "용맹의 집(House of Valor)".encode()
assert rows[0] == b"7878;" + old
assert before.count(rows[0] + b"\r\n") == 1
after = before.replace(rows[0] + b"\r\n", b"7878;" + new + b"\r\n", 1)
assert after.count(b"\r\n") == before.count(b"\r\n")
assert after.count(b"\n") == before.count(b"\n")
assert after[:3] == before[:3] == b"\xef\xbb\xbf"
active.write_bytes(after)
assert active.read_bytes() == after
print(sha256(after).hexdigest())
