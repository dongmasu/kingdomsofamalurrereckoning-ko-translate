import pathlib
import subprocess
import sys
import tempfile
import unittest


SCRIPT = pathlib.Path(__file__).with_name("replace_text_preserve_eol.py")


class ReplaceTextPreserveEolTests(unittest.TestCase):
    def test_preserves_crlf_and_lf_in_a_mixed_file(self):
        original = b"\xef\xbb\xbfone\r\ntarget\r\nthree\n"
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "mixed.txt"
            path.write_bytes(original)

            subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(path),
                    "--old",
                    "target",
                    "--new",
                    "updated",
                ],
                check=True,
                capture_output=True,
                text=True,
            )

            self.assertEqual(path.read_bytes(), b"\xef\xbb\xbfone\r\nupdated\r\nthree\n")

    def test_preserves_lf(self):
        original = b"one\ntarget\nthree\n"
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "lf.txt"
            path.write_bytes(original)

            subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(path),
                    "--old",
                    "target",
                    "--new",
                    "updated",
                ],
                check=True,
                capture_output=True,
                text=True,
            )

            self.assertEqual(path.read_bytes(), b"one\nupdated\nthree\n")

    def test_rejects_unexpected_match_count_without_modifying_file(self):
        original = b"target\r\ntarget\r\n"
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "duplicate.txt"
            path.write_bytes(original)

            result = subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(path),
                    "--old",
                    "target",
                    "--new",
                    "updated",
                ],
                capture_output=True,
                text=True,
            )

            self.assertNotEqual(result.returncode, 0)
            self.assertIn("expected 1 match(es), found 2", result.stderr)
            self.assertEqual(path.read_bytes(), original)

    def test_rejects_line_breaks_in_replacement_text(self):
        original = b"target\r\n"
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "line.txt"
            path.write_bytes(original)

            result = subprocess.run(
                [
                    sys.executable,
                    str(SCRIPT),
                    str(path),
                    "--old",
                    "target",
                    "--new",
                    "two\nlines",
                ],
                capture_output=True,
                text=True,
            )

            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(path.read_bytes(), original)


if __name__ == "__main__":
    unittest.main()
