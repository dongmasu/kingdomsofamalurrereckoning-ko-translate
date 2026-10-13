import pathlib
import unittest


SCRIPT = pathlib.Path(__file__).with_name("KoreanPatch.ps1").read_text(
    encoding="utf-8"
)
LAUNCHER = pathlib.Path(__file__).with_name("RunKoreanPatch.bat").read_text(
    encoding="ascii"
)


class ApplyScriptPromptOrderTests(unittest.TestCase):
    def test_double_click_launcher_runs_the_powershell_installer(self):
        self.assertIn(
            'powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0KoreanPatch.ps1"',
            LAUNCHER,
        )

    def test_script_text_is_ascii_for_windows_powershell_compatibility(self):
        self.assertTrue(SCRIPT.isascii())

    def test_elevation_happens_before_the_only_interactive_prompt(self):
        elevation_check = SCRIPT.index("if (-not $Principal.IsInRole")
        game_directory_prompt = SCRIPT.index(
            '$EnteredDirectory = Read-Host "Game folder'
        )

        self.assertLess(elevation_check, game_directory_prompt)
        self.assertEqual(SCRIPT.count("Read-Host"), 1)

    def test_elevated_relaunch_exits_parent_before_prompts(self):
        elevation_check = SCRIPT.index("if (-not $Principal.IsInRole")
        game_directory_prompt = SCRIPT.index(
            '$EnteredDirectory = Read-Host "Game folder'
        )
        elevation_block = SCRIPT[elevation_check:game_directory_prompt]

        self.assertIn('Start-Process -FilePath "powershell.exe" -Verb RunAs', elevation_block)
        self.assertIn("exit", elevation_block)

    def test_version_is_informational_not_a_separate_input(self):
        self.assertIn('$ExpectedVersion = "cs:15032"', SCRIPT)
        self.assertNotIn("$ConfirmedVersion", SCRIPT)
        self.assertEqual(SCRIPT.count("Read-Host"), 1)

    def test_game_path_is_the_only_confirmation(self):
        self.assertIn('$EnteredDirectory = Read-Host "Game folder', SCRIPT)
        self.assertNotIn("APPLY", SCRIPT)

    def test_payload_accepts_font_free_or_complete_font_set_without_common_override(self):
        self.assertIn("$PayloadFiles.Count -notin @(3, 32)", SCRIPT)
        self.assertIn("$PayloadFiles.Count -eq 32", SCRIPT)
        self.assertIn("$FontPages.Count -ne 28", SCRIPT)
        self.assertIn('"notosanscjksc_regular.font"', SCRIPT)
        self.assertIn('"fontlist_common.koafontlist"', SCRIPT)
        self.assertIn("must not be overridden", SCRIPT)
        self.assertNotIn('"fontlist_common.koafontlist",\n', SCRIPT)

    def test_ko_kr_experiment_adds_only_new_locale_files_and_preserves_zh_cn(self):
        self.assertIn('fontlist_ko_kr.koafontlist', SCRIPT)
        self.assertIn('$PayloadFiles.Count -ne 33', SCRIPT)
        self.assertIn('$AddedNames = @()', SCRIPT)
        self.assertIn('$AddedNames = @($RequiredNames)', SCRIPT)
        self.assertIn('$ExpectedFileCount = $OriginalFileCount + $AddedNames.Count', SCRIPT)
        self.assertIn('The ko_kr experiment unexpectedly changed $Name.', SCRIPT)
        self.assertIn('The ko_kr experiment is already installed:', SCRIPT)

    def test_completion_wait_runs_after_success_or_failure(self):
        self.assertIn('$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")', SCRIPT)
        self.assertIn(
            'Wait-ForCompletion "Installation complete. Press any key to close this window."',
            SCRIPT,
        )
        self.assertIn(
            'Wait-ForCompletion "Review the error above. Press any key to close this window."',
            SCRIPT,
        )

        finally_start = SCRIPT.rindex("finally {")
        finally_block = SCRIPT[finally_start:]
        self.assertIn("Wait-ForCompletion", finally_block)
        self.assertLess(SCRIPT.rindex("catch {", 0, finally_start), finally_start)
        self.assertEqual(SCRIPT.count("Read-Host"), 1)

    def test_original_is_backed_up_and_verified_before_replacement(self):
        original_hash = SCRIPT.index(
            '$OriginalPakHash = (Get-FileHash -LiteralPath $GamePak'
        )
        backup_copy = SCRIPT.index(
            'Copy-Item -LiteralPath $GamePak -Destination $BackupPak'
        )
        backup_hash_check = SCRIPT.index(
            'if ((Get-FileHash -LiteralPath $BackupPak'
        )
        original_move = SCRIPT.index(
            'Move-Item -LiteralPath $GamePak -Destination $DisplacedPak'
        )
        candidate_install = SCRIPT.index(
            'Move-Item -LiteralPath $CandidatePak -Destination $GamePak'
        )

        self.assertLess(original_hash, backup_copy)
        self.assertLess(backup_copy, backup_hash_check)
        self.assertLess(backup_hash_check, original_move)
        self.assertLess(original_move, candidate_install)

    def test_unpacker_gets_explicit_archive_action_and_output_arguments(self):
        self.assertIn(
            '$UnpackArguments = [string[]]@(".\\data\\patch_0.pak", "unpack", $UnpackedDirectory)',
            SCRIPT,
        )
        self.assertIn(
            "Invoke-CheckedNative -Executable $Unpacker -Arguments $UnpackArguments",
            SCRIPT,
        )
        self.assertIn(
            '$VerifyUnpackArguments = [string[]]@($CandidatePak, "unpack", $VerifyDirectory)',
            SCRIPT,
        )
        self.assertIn(
            "Invoke-CheckedNative -Executable $Unpacker -Arguments $VerifyUnpackArguments",
            SCRIPT,
        )

    def test_builder_gets_explicit_build_list_and_output_arguments(self):
        self.assertIn(
            '$BuildArguments = [string[]]@("-c", $BuildList, $CandidatePak)',
            SCRIPT,
        )
        self.assertIn(
            "Invoke-CheckedNative -Executable $Builder -Arguments $BuildArguments",
            SCRIPT,
        )


if __name__ == "__main__":
    unittest.main()
