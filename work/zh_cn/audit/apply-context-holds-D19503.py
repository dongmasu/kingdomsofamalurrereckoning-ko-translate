from hashlib import sha256
from pathlib import Path
import re


csv_path = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
backup_path = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-context-holds-D19503/locatexts_zh_cn.koalocatext_default.csv"
)
expected_hash = (
    "8889003306398c02fe4aaab38d817071cae2f3f610613b82be1c465a0059a3e5"
)
original = backup_path.read_bytes()
current = csv_path.read_bytes()
assert current == original
assert sha256(current).hexdigest() == expected_hash
assert current.startswith(b"\xef\xbb\xbf")

edits = (
    (
        b"37797;",
        b"\n37798;",
        "운명에 정해진 자들의 활동이 열 배로 늘었다.".encode(),
        "예정된 자들(Preordained)의 활동이 열 배로 늘었다.".encode(),
    ),
    (
        b"57110;",
        b"\n57111;",
        "크로우 피크 어딘가에 있다고 해.".encode(),
        "혼돈의 차원문은 크로우 피크 어딘가에 있다고 해.".encode(),
    ),
)

updated = current
for row_prefix, row_end, old_text, new_text in edits:
    start = updated.index(row_prefix)
    end = updated.index(row_end, start)
    assert end != -1
    row = updated[start:end]
    assert row.count(old_text) == 1
    updated = updated[:start] + row.replace(old_text, new_text, 1) + updated[end:]

assert updated.count(b"\r\n") == current.count(b"\r\n")
assert updated.count(b"\n") == current.count(b"\n")
assert len(re.findall(rb"(?m)^(?:\xef\xbb\xbf)?\d+;", updated)) == 65135
assert re.findall(rb"(?m)^(?:\xef\xbb\xbf)?(\d+);", updated) == re.findall(
    rb"(?m)^(?:\xef\xbb\xbf)?(\d+);", current
)

reversed_bytes = updated
for row_prefix, row_end, old_text, new_text in reversed(edits):
    start = reversed_bytes.index(row_prefix)
    end = reversed_bytes.index(row_end, start)
    row = reversed_bytes[start:end]
    assert row.count(new_text) == 1
    reversed_bytes = (
        reversed_bytes[:start] + row.replace(new_text, old_text, 1)
        + reversed_bytes[end:]
    )
assert reversed_bytes == original

csv_path.write_bytes(updated)
print(f"pre-edit sha256: {expected_hash}")
print(f"post-edit sha256: {sha256(updated).hexdigest()}")
print("approved Texto edits: IDs 37797, 57110")
