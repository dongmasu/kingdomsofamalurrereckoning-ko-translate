#!/usr/bin/env python3
"""Experimental, single-quest research probe; NOT a general Kore VM decoder.

Reads immutable assets, never executes Lua. Only the pinned FFQ35 snapshot
is accepted. Unknown metadata/trailers are retained without semantic claims.
Opcode names follow Kender2/amalur korevm.md at 314e878609f42e9f53cb407c5dab72564ad5fdeb.
Field extraction is corroborated by Jake-NotTheMuss/hksc lopcodes.h at
afa5ace6b2d11891b094ca637ccc772b9ef4ea59; its loader is not format-8 compatible.
"""

import argparse
from collections import Counter
import hashlib
from pathlib import Path
import struct

from analyze_resource_containers import (
    ASSET_DIR, batch_records, bxml_lua_payloads, lua_script_record, lua_type_table,
)


OUTPUT = Path(__file__).with_name("ffq35-lua-sample-20261115.disassembly.txt")
EXPECTED_HASHES = (
    "2b0ba91abe92a761ae7f28330f5765f74a1f45101cf879745a740b43697578b5",
    "604abfc9f55fdccb5b276b23de8027683f993f898e5907234a65bbfb5bbc69b4",
    "f3ac587da8ba1cbd92c34d054ff14c8a9776b10b042ecebc9d4bc2b4f9eaec12",
)
OPCODES = """GETFIELD TEST CALL_I CALL_C EQ EQ_BK GETGLOBAL MOVE SELF RETURN
GETTABLE_S GETTABLE_N GETTABLE LOADBOOL TFORLOOP SETFIELD SETTABLE_S
SETTABLE_S_BK SETTABLE_N SETTABLE_N_BK SETTABLE SETTABLE_BK TAILCALL_I
TAILCALL_C TAILCALL_M LOADK LOADNIL SETGLOBAL JMP CALL_M CALL TAILCALL
GETUPVAL SETUPVAL ADD ADD_BK SUB SUB_BK MUL MUL_BK DIV DIV_BK MOD MOD_BK
POW POW_BK NEWTABLE UNM NOT LEN LT LT_BK LE LE_BK CONCAT TESTSET FORPREP
FORLOOP SETLIST CLOSE CLOSURE VARARG TAILCALL_I_R1 CALL_I_R1 SETUPVAL_R1
TEST_R1 NOT_R1 GETFIELD_R1 SETFIELD_R1 NEWSTRUCT DATA SETSLOTN SETSLOTI
SETSLOT SETSLOTS SETSLOTMT CHECKTYPE CHECKTYPES GETSLOT GETSLOTMT SELFSLOT
SELFSLOTMT GETFIELD_MM CHECKTYPE_D GETSLOT_D GETGLOBAL_MEM""".split()
OBSERVED_OPS = {2, 4, 9, 13, 15, 25, 27, 28, 46, 60, 67, 68, 70, 85}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def fields(word):
    return (word >> 25, word & 255, (word >> 17) & 255,
            (word >> 8) & 511, (word >> 8) & 131071)


class Reader:
    def __init__(self, data):
        self.data = data
        self.pos = lua_type_table(data)

    def take(self, length):
        require(0 <= length <= len(self.data) - self.pos,
                f"Truncated range at {self.pos}: {length}")
        result = self.data[self.pos:self.pos + length]
        self.pos += length
        return result

    def uint(self):
        return struct.unpack(">I", self.take(4))[0]

    def count(self, minimum_bytes):
        count = self.uint()
        require(count <= (len(self.data) - self.pos) // minimum_bytes,
                f"Impossible count at {self.pos - 4}: {count}")
        return count

    def constant(self):
        tag = self.take(1)[0]
        if tag == 0:
            return None
        if tag == 1:
            value = self.take(1)[0]
            require(value in (0, 1), "Invalid boolean constant")
            return bool(value)
        if tag == 3:
            # This snapshot's header has number-size=4, integral-number flag=1.
            return struct.unpack(">i", self.take(4))[0]
        if tag == 4:
            raw = self.take(self.count(1))
            require(raw.endswith(b"\0"), "Unterminated string constant")
            return raw[:-1].decode("utf-8")
        raise ValueError(f"Unsupported sample constant tag {tag} at {self.pos - 1}")

    def function(self, depth=0):
        require(depth <= 1, "Unexpected function depth outside sample scope")
        start = self.pos
        prefix = [self.uint() for _ in range(4)]
        require(prefix[:2] == [0, 0], "Unknown nonzero prefix metadata")
        nups, params = self.uint(), self.uint()
        vararg = self.take(1)[0]
        stack = self.uint()
        require(nups == 0 and params <= stack <= 255 and vararg in (0, 2),
                "Unexpected sample function header")
        count = self.count(4)
        code_start = self.pos
        code = [self.uint() for _ in range(count)]
        constants = [self.constant() for _ in range(self.count(1))]
        children = [self.function(depth + 1) for _ in range(self.count(49))]
        suffix = [self.uint() for _ in range(3)]
        require(suffix == [0, 0, 0], "Unknown nonzero suffix metadata")
        fn = dict(start=start, end=self.pos, prefix=prefix, nups=nups,
                  params=params, vararg=vararg, stack=stack, code_start=code_start,
                  code=code, constants=constants, children=children, suffix=suffix)
        validate(fn)
        return fn


def validate(fn):
    code, constants = fn["code"], fn["constants"]

    def constant(index):
        require(index < len(constants), f"Out-of-range constant: {index}")

    for pc, word in enumerate(code):
        op, a, b, c, bx = fields(word)
        require(op in OBSERVED_OPS, f"Unmodeled opcode {op} at PC {pc}")
        if op == 70:
            continue  # DATA words are cache operands, not register operations.
        require(a < fn["stack"], f"Register A outside stack at PC {pc}")
        if op in (25, 27, 85):
            constant(bx)
        if op in (67,):
            require(b < fn["stack"], f"Register B outside stack at PC {pc}")
            constant(c)
            require([w >> 25 for w in code[pc + 1:pc + 3]] == [70, 70],
                    f"GETFIELD_R1 cache words missing at PC {pc}")
        if op in (15, 68):
            constant(b)
            if c >= 256:
                constant(c - 256)
        if op == 4:
            require(b < fn["stack"], f"EQ register B outside stack at PC {pc}")
            if c >= 256:
                constant(c - 256)
            else:
                require(c < fn["stack"], f"EQ register C outside stack at PC {pc}")
        if op == 2 and b:
            require(a + b <= fn["stack"], f"Call arguments outside stack at PC {pc}")
        if op == 85:
            require(pc + 1 < len(code) and code[pc + 1] >> 25 == 70,
                    f"GETGLOBAL_MEM cache word missing at PC {pc}")
        if op == 28:
            target = pc + 1 + bx - 65535
            require(0 <= target < len(code) and code[target] >> 25 != 70,
                    f"Invalid jump target at PC {pc}: {target}")
        if op == 60:
            require(bx < len(fn["children"]), f"Invalid closure child: {bx}")
    require(code and code[-1] >> 25 == 9, "Missing final RETURN")


def parse(payload):
    reader = Reader(payload)
    root = reader.function()
    trailer = reader.take(8)
    require(trailer.hex() == "0000000100000000", "Unknown sample trailer")
    require(reader.pos == len(payload), "Trailing bytes after sample trailer")
    return root


def samples():
    batch = (ASSET_DIR / "134230570_klua.batch").read_bytes()
    record = next(row for row in batch_records(batch) if row[0] == 1164041)
    _, offset, length = record
    name, refs, relative, payload = lua_script_record(batch[offset:offset + length])
    require(name == "FFQ35" and refs == [], "Unexpected script record")
    results = [("FFQ35 script 1164041", offset + relative, payload)]
    asset = (ASSET_DIR / "1164038.quest_bxml").read_bytes()
    require(struct.unpack_from("<I", asset, 28)[0] == 1164041, "Quest link changed")
    results += [(f"1164038.quest_bxml payload {index}", pos, body)
                for index, (pos, body, _) in enumerate(bxml_lua_payloads(asset))]
    require(len(results) == len(EXPECTED_HASHES), "Unexpected payload count")
    for (_, _, body), expected in zip(results, EXPECTED_HASHES):
        require(hashlib.sha256(body).hexdigest() == expected, "Sample hash changed")
    return results


def child_names(fn):
    names = {}
    for pc, word in enumerate(fn["code"][:-1]):
        op, a, _, _, bx = fields(word)
        if op != 60:
            continue
        nxt_op, nxt_a, _, _, nxt_bx = fields(fn["code"][pc + 1])
        if nxt_op == 27 and a == nxt_a:
            require(bx not in names, "Duplicate closure assignment")
            names[bx] = fn["constants"][nxt_bx]
    return names


def render():
    lines = [
        "FFQ35 single-quest static disassembly experiment (2026-11-15)",
        "NOT original Lua source; NOT runtime-tested; NOT a general decoder.",
        "All offsets are payload-relative unless marked container_offset.",
        "PC is zero-based; DATA is an auxiliary cache word.",
        "A/B/C are raw fields; ABx and AsBx annotations use combined Bx.",
        "Metadata prefix/suffix and final 8 bytes have no asserted semantics.",
        "",
    ]
    counts = Counter()
    for label, offset, body in samples():
        root = parse(body)
        names = child_names(root)
        if label.startswith("FFQ35"):
            require(len(root["children"]) == len(names) == 22,
                    "Not all 22 script functions were named by closure assignment")
        lines += [f"SAMPLE {label}", f"container_offset={offset} bytes={len(body)}",
                  f"sha256={hashlib.sha256(body).hexdigest()}",
                  f"trailer_at={len(body) - 8} opaque_hex={body[-8:].hex()}", ""]
        for index, fn in [(-1, root), *enumerate(root["children"])]:
            name = names.get(index, "<main>" if index == -1 else f"<child {index}>")
            counts["functions"] += 1
            counts["instruction_words"] += len(fn["code"])
            lines += [
                f"FUNCTION {name} range=[{fn['start']},{fn['end']})",
                f"prefix_words={fn['prefix']} nups={fn['nups']} params={fn['params']} "
                f"vararg={fn['vararg']} stack={fn['stack']} suffix_words={fn['suffix']}",
                "CONSTANTS (indexes are zero-based)",
            ]
            lines += [f"  K[{i}]={value!r}" for i, value in enumerate(fn["constants"])]
            lines.append("CODE: PC offset raw_word opcode A B C annotation")
            for pc, word in enumerate(fn["code"]):
                op, a, b, c, bx = fields(word)
                counts["data_words" if op == 70 else "operations"] += 1
                annotation = ""
                if op in (25, 27, 85):
                    annotation = f"K[{bx}]={fn['constants'][bx]!r}"
                elif op == 67:
                    annotation = f"field K[{c}]={fn['constants'][c]!r}"
                elif op in (15, 68):
                    annotation = f"field K[{b}]={fn['constants'][b]!r}"
                elif op == 28:
                    annotation = f"target_PC={pc + 1 + bx - 65535}"
                elif op == 60:
                    annotation = f"child={bx} name={names.get(bx, '<unnamed>')}"
                lines.append(f"{pc:03} {fn['code_start'] + pc * 4:04x} {word:08x} "
                             f"{OPCODES[op]:18} {a:3} {b:3} {c:3} {annotation}".rstrip())
            lines.append("")
    summary = " ".join(f"{key}={value}" for key, value in sorted(counts.items()))
    lines.append("TOTAL " + summary)
    return "\n".join(lines) + "\n", summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--write", action="store_true", help="write research disassembly")
    group.add_argument("--check", action="store_true", help="compare research disassembly")
    args = parser.parse_args()
    output, summary = render()
    if args.write:
        OUTPUT.write_text(output, encoding="utf-8")
    elif args.check:
        require(OUTPUT.read_text(encoding="utf-8") == output, "Disassembly is stale")
    print(summary)


if __name__ == "__main__":
    main()
