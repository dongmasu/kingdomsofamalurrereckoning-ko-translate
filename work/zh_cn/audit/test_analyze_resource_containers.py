import struct
import unittest

import analyze_resource_containers as CONTAINERS


def lua_payload():
    result = CONTAINERS.LUA_HEADER + struct.pack(">I", len(CONTAINERS.TYPE_NAMES))
    for index, name in enumerate(CONTAINERS.TYPE_NAMES):
        raw = name.encode("ascii") + b"\0"
        result += struct.pack(">II", index, len(raw)) + raw
    return result + b"opaque instructions"


def text(value):
    data = value.encode("utf-8")
    return struct.pack("<I", len(data)) + data


class ResourceContainerTests(unittest.TestCase):
    def test_batch_directory_consumes_file_exactly(self):
        raw = struct.pack("<IIIII", 2, 10, 3, 20, 2) + b"abcde"
        self.assertEqual(CONTAINERS.batch_records(raw), [(10, 20, 3), (20, 23, 2)])

    def test_batch_rejects_truncation_duplicate_ids_and_trailing_bytes(self):
        malformed = (
            b"",
            struct.pack("<I", 10),
            struct.pack("<III", 1, 1, 4) + b"x",
            struct.pack("<IIIII", 2, 1, 0, 1, 0),
            struct.pack("<I", 0) + b"x",
        )
        for raw in malformed:
            with self.subTest(raw=raw), self.assertRaises(ValueError):
                CONTAINERS.batch_records(raw)

    def test_type_table_is_big_endian_and_preserves_opaque_body(self):
        payload = lua_payload()
        self.assertEqual(CONTAINERS.lua_type_table(payload), 238)
        self.assertEqual(payload[238:], b"opaque instructions")

    def test_type_table_rejects_wrong_header_count_name_and_truncation(self):
        payload = lua_payload()
        malformed = (
            b"\x1bLua",
            b"x" + payload[1:],
            payload[:14] + struct.pack("<I", 13) + payload[18:],
            payload[:26] + b"x" + payload[27:],
            payload[:237],
        )
        for raw in malformed:
            with self.subTest(raw=raw[:30]), self.assertRaises(ValueError):
                CONTAINERS.lua_type_table(raw)

    def test_bxml_framing_records_offsets_and_does_not_decode_body(self):
        payload = lua_payload()
        envelope = b"\x02" + struct.pack("<I", len(payload)) + payload
        raw = b"prefix" + envelope + b"between" + envelope
        rows = CONTAINERS.bxml_lua_payloads(raw)
        self.assertEqual(rows, [(11, payload, 238), (11 + len(payload) + 12, payload, 238)])
        self.assertEqual(CONTAINERS.bxml_lua_payloads(b"nothing here"), [])

    def test_bxml_rejects_bad_tag_bad_length_and_nested_signatures(self):
        payload = lua_payload()
        malformed = (
            b"\x1bLua",
            b"\x03" + struct.pack("<I", len(payload)) + payload,
            b"\x02" + struct.pack("<I", len(payload) + 1) + payload,
        )
        for raw in malformed:
            with self.subTest(raw=raw[:20]), self.assertRaises(ValueError):
                CONTAINERS.bxml_lua_payloads(raw)
        inner = b"\x02" + struct.pack("<I", len(payload)) + payload
        outer = payload + inner
        with self.assertRaisesRegex(ValueError, "overlapping"):
            CONTAINERS.bxml_lua_payloads(b"\x02" + struct.pack("<I", len(outer)) + outer)

    def test_script_record_preserves_names_references_and_lua_offset(self):
        payload = lua_payload()
        prefix = text("RecordName") + struct.pack("<I", 2) + text("A.call") + text("B.call")
        raw = prefix + struct.pack("<I", len(payload)) + payload
        name, refs, offset, body = CONTAINERS.lua_script_record(raw)
        self.assertEqual(name, "RecordName")
        self.assertEqual(refs, ["A.call", "B.call"])
        self.assertEqual(offset, len(prefix) + 4)
        self.assertEqual(body, payload)

    def test_script_record_rejects_broken_strings_and_payload_size(self):
        payload = lua_payload()
        good = text("Name") + struct.pack("<II", 0, len(payload)) + payload
        malformed = (
            struct.pack("<I", 20) + b"x",
            text("Name\0") + struct.pack("<II", 0, len(payload)) + payload,
            text("Name") + struct.pack("<I", 1000),
            good[:-1],
            good + b"x",
        )
        for raw in malformed:
            with self.subTest(raw=raw[:20]), self.assertRaises(ValueError):
                CONTAINERS.lua_script_record(raw)

    def test_init_sequence_is_not_interleaved_or_inferred_from_name(self):
        raw = struct.pack("<IIIIII", 1, 2, 40, 50, 99, 98)
        self.assertEqual(CONTAINERS.init_ids(raw), [40, 50])
        with self.assertRaises(ValueError):
            CONTAINERS.init_ids(raw[:-1])
        with self.assertRaises(ValueError):
            CONTAINERS.init_ids(struct.pack("<II", 2, 0))

    def test_quest_script_lookup_uses_field_not_quest_name_or_adjacent_id(self):
        data = bytearray(32)
        struct.pack_into("<I", data, 8, 100)
        struct.pack_into("<I", data, 28, 555)
        script = (555, "other_name", "OtherName", "path", "lua.batch", 90, 200)
        rows = CONTAINERS.quest_script_rows(
            {"100.quest_bxml": (data, "hash")},
            {100: "quest_name"}, {555: "other_name"}, {555: "path"},
            {555: script},
        )
        self.assertEqual(rows[0][3:9], (555, "other_name", "path", "lua.batch", 90, 200))
        self.assertEqual(rows[0][10], "different")

    def test_quest_zero_script_field_stays_unlinked_and_unknown_id_fails(self):
        data = bytearray(32)
        struct.pack_into("<I", data, 8, 100)
        assets = {"100.quest_bxml": (data, "hash")}
        rows = CONTAINERS.quest_script_rows(assets, {100: "name"}, {}, {}, {})
        self.assertEqual(rows[0][3:6], (0, "", ""))
        struct.pack_into("<I", data, 28, 99)
        with self.assertRaisesRegex(ValueError, "Unresolved nonzero"):
            CONTAINERS.quest_script_rows(assets, {100: "name"}, {}, {}, {})
        struct.pack_into("<I", data, 8, 101)
        with self.assertRaisesRegex(ValueError, "disagrees"):
            CONTAINERS.quest_script_rows(assets, {100: "name"}, {}, {}, {})


if __name__ == "__main__":
    unittest.main()
