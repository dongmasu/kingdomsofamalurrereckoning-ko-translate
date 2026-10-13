"""Apply four source-keyed Scholia Arcana name alignments."""

from hashlib import sha256
from pathlib import Path

active = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-scholia-arcana-cluster-D19495/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
edits = {
    53028: [("아르카나 학회(Scholia Arcana) 사람들과", "스콜리아 아르카나(Scholia Arcana) 사람들과")],
    53580: [("아르카나 학회(Scholia Arcana)의", "스콜리아 아르카나(Scholia Arcana)의")],
    55994: [
        ("아르카나 학회(Scholia Arcana)의", "스콜리아 아르카나(Scholia Arcana)의"),
        ("학회 부지의 본관(Main Hall)", "스콜리아 아르카나 부지의 본관(Main Hall)"),
    ],
    56039: [("아르카나 학회 계급", "스콜리아 아르카나 계급")],
}
original = active.read_bytes()
assert original == backup.read_bytes()
assert sha256(original).hexdigest() == (
    "ad5e090f104ed53d2931de62d2b92eb5c66aa888df8536bc9d6bee9896077b8d"
)
updated = original
for key, replacements in edits.items():
    rows = [
        row for row in updated.split(b"\r\n") if row.startswith(f"{key};".encode())
    ]
    assert len(rows) == 1
    row = rows[0]
    for before, after in replacements:
        assert row.count(before.encode()) == 1
        row = row.replace(before.encode(), after.encode(), 1)
    updated = updated.replace(
        next(r for r in updated.split(b"\r\n") if r.startswith(f"{key};".encode()))
        + b"\r\n",
        row + b"\r\n",
        1,
    )
assert updated[:3] == original[:3] == b"\xef\xbb\xbf"
assert updated.count(b"\r\n") == original.count(b"\r\n")
assert updated.count(b"\n") == original.count(b"\n")
active.write_bytes(updated)
assert active.read_bytes() == updated
print(sha256(updated).hexdigest())
