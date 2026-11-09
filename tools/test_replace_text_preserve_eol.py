import pathlib
import subprocess
import sys
import tempfile
import unittest


SCRIPT = pathlib.Path(__file__).with_name("replace_text_preserve_eol.py")
BOM = b"\xef\xbb\xbf"


def run_tool(original, *arguments):
    directory = tempfile.TemporaryDirectory()
    path = pathlib.Path(directory.name) / "resource.csv"
    path.write_bytes(original)
    result = subprocess.run(
        [sys.executable, str(SCRIPT), str(path), *arguments],
        capture_output=True,
        text=True,
    )
    return directory, path, result


class ReplaceTextPreserveEolTests(unittest.TestCase):
    def test_preserves_crlf_and_lf_in_a_mixed_text_file(self):
        original = b"\xef\xbb\xbfone\r\ntarget\r\nthree\n"
        directory, path, result = run_tool(
            original, "--old", "target", "--new", "updated"
        )
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), b"\xef\xbb\xbfone\r\nupdated\r\nthree\n")

    def test_preserves_lf_in_text_mode(self):
        original = b"one\ntarget\nthree\n"
        directory, path, result = run_tool(original, "--old", "target", "--new", "updated")
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), b"one\nupdated\nthree\n")

    def test_rejects_unexpected_text_match_count_without_modifying_file(self):
        original = b"target\r\ntarget\r\n"
        directory, path, result = run_tool(original, "--old", "target", "--new", "updated")
        with directory:
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("expected 1 match(es), found 2", result.stderr)
            self.assertEqual(path.read_bytes(), original)

    def test_rejects_line_breaks_in_text_mode_without_modifying_file(self):
        original = b"target\r\n"
        directory, path, result = run_tool(
            original, "--old", "target", "--new", "two\nlines"
        )
        with directory:
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(path.read_bytes(), original)

    def test_edits_only_the_requested_id_and_variant_in_a_mixed_csv(self):
        original = (
            BOM
            + b"ID_Linha;Tipo_Variante;Texto\r\n"
            + b"7;11;same\r\n"
            + b"7;12;same\n"
            + b"8;11;other\r\n"
        )
        expected = (
            BOM
            + b"ID_Linha;Tipo_Variante;Texto\r\n"
            + b"7;11;same\r\n"
            + b"7;12;updated\n"
            + b"8;11;other\r\n"
        )
        directory, path, result = run_tool(
            original,
            "--id",
            "7",
            "--variant",
            "12",
            "--old",
            "same",
            "--new",
            "updated",
        )
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), expected)
            self.assertEqual(path.read_bytes().count(b"\r\n"), original.count(b"\r\n"))
            self.assertEqual(
                path.read_bytes().count(b"\n") - path.read_bytes().count(b"\r\n"),
                original.count(b"\n") - original.count(b"\r\n"),
            )

    def test_variant_is_required_when_csv_has_variant_column(self):
        original = BOM + b"ID_Linha;Tipo_Variante;Texto\r\n7;11;same\r\n"
        directory, path, result = run_tool(
            original, "--id", "7", "--old", "same", "--new", "updated"
        )
        with directory:
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("--variant is required", result.stderr)
            self.assertEqual(path.read_bytes(), original)

    def test_stale_expected_text_aborts_without_modifying_file(self):
        original = BOM + b"ID_Linha;Texto\r\n7;current\r\n"
        directory, path, result = run_tool(
            original, "--id", "7", "--old", "stale", "--new", "updated"
        )
        with directory:
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("old text does not match", result.stderr)
            self.assertEqual(path.read_bytes(), original)

    def test_multiline_quoted_field_preserves_csv_structure_and_normalizes_inserted_eol(self):
        original = (
            BOM
            + b"ID_Linha;Texto\r\n"
            + b'7;"first; ""quoted""\nsecond"\r\n'
            + b"8;untouched\n"
        )
        expected = (
            BOM
            + b"ID_Linha;Texto\r\n"
            + b'7;"new; ""quoted""\r\nthird"\r\n'
            + b"8;untouched\n"
        )
        directory, path, result = run_tool(
            original,
            "--id",
            "7",
            "--old",
            'first; "quoted"\nsecond',
            "--new",
            'new; "quoted"\nthird',
        )
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), expected)

    def test_quotes_and_delimiters_in_new_value_are_encoded(self):
        original = BOM + b"ID_Linha;Texto\r\n7;plain\r\n"
        expected = BOM + b'ID_Linha;Texto\r\n7;"new; ""quoted"""\r\n'
        directory, path, result = run_tool(
            original,
            "--id",
            "7",
            "--old",
            "plain",
            "--new",
            'new; "quoted"',
        )
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), expected)

    def test_can_fill_an_empty_text_cell_by_id(self):
        original = BOM + b"ID_Linha;Texto\r\n7;\r\n"
        expected = BOM + b"ID_Linha;Texto\r\n7;filled\r\n"
        directory, path, result = run_tool(
            original, "--id", "7", "--old", "", "--new", "filled"
        )
        with directory:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(path.read_bytes(), expected)

    def test_rejects_duplicate_target_rows_without_modifying_file(self):
        original = BOM + b"ID_Linha;Texto\r\n7;same\r\n7;same\r\n"
        directory, path, result = run_tool(
            original, "--id", "7", "--old", "same", "--new", "updated"
        )
        with directory:
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("found 2", result.stderr)
            self.assertEqual(path.read_bytes(), original)


if __name__ == "__main__":
    unittest.main()
