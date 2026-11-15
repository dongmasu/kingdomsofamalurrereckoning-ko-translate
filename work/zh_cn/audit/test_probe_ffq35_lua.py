import struct
import unittest

import probe_ffq35_lua as PROBE


class FFQ35ProbeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.payload = PROBE.samples()[0][2]
        cls.root = PROBE.parse(cls.payload)

    def changed_word(self, offset, word):
        data = bytearray(self.payload)
        struct.pack_into(">I", data, offset, word)
        return data

    def test_pinned_sample_names_and_total_word_counts(self):
        names = PROBE.child_names(self.root)
        self.assertEqual(len(names), 22)
        self.assertEqual(names[10], "on_dialog_line_1164038_204596_0")
        self.assertEqual(names[20], "on_dialog_line_1164038_622331_1")
        self.assertEqual(len(self.root["children"][20]["code"]), 1)
        _, summary = PROBE.render()
        self.assertEqual(
            summary, "data_words=220 functions=27 instruction_words=687 operations=467",
        )

    def test_rejects_truncation_and_extra_bytes(self):
        for data in (self.payload[:238], self.payload[:580], self.payload[:-1],
                     self.payload + b"\0"):
            with self.subTest(size=len(data)), self.assertRaises(ValueError):
                PROBE.parse(data)

    def test_rejects_unmodeled_opcode(self):
        offset = self.root["code_start"]
        with self.assertRaisesRegex(ValueError, "Unmodeled opcode"):
            PROBE.parse(self.changed_word(offset, 127 << 25))

    def test_rejects_invalid_constant_and_closure_indexes(self):
        offset = self.root["code_start"]
        with self.assertRaisesRegex(ValueError, "Out-of-range constant"):
            PROBE.parse(self.changed_word(offset, (85 << 25) | (1000 << 8)))
        with self.assertRaisesRegex(ValueError, "Invalid closure child"):
            PROBE.parse(self.changed_word(offset + 32 * 4, (60 << 25) | (1000 << 8)))

    def test_rejects_invalid_jump_and_register(self):
        fn = self.root["children"][0]
        offset = fn["code_start"]
        with self.assertRaisesRegex(ValueError, "Invalid jump target"):
            PROBE.parse(self.changed_word(offset + 8 * 4, 28 << 25))
        original = fn["code"][0]
        with self.assertRaisesRegex(ValueError, "Register A outside stack"):
            PROBE.parse(self.changed_word(offset, (original & ~255) | 255))

    def test_rejects_missing_cache_and_nonzero_opaque_metadata(self):
        offset = self.root["code_start"]
        with self.assertRaisesRegex(ValueError, "cache word missing"):
            PROBE.parse(self.changed_word(offset + 4, 9 << 25))
        with self.assertRaisesRegex(ValueError, "nonzero prefix"):
            PROBE.parse(self.changed_word(self.root["start"], 1))


if __name__ == "__main__":
    unittest.main()
