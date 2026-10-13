param(
    [string]$GameDirectory = "C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning"
)

$ErrorActionPreference = "Stop"
$ExpectedVersion = "cs:15032"
$PayloadDirectory = Join-Path $PSScriptRoot "payload"

function Invoke-CheckedNative {
    param(
        [string]$Executable,
        [string[]]$Arguments,
        [string]$Description
    )

    & $Executable @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Description failed with exit code $LASTEXITCODE."
    }
}

function Get-FileCount {
    param([string]$Directory)
    return @(Get-ChildItem -LiteralPath $Directory -File -Recurse -Force).Count
}

function Wait-ForCompletion {
    param([string]$Message = "Press any key to close this window...")

    Write-Host ""
    Write-Host $Message
    try {
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
    catch {
        $null = [Console]::ReadLine()
    }
}

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
if (-not $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $QuotedScript = '"' + $PSCommandPath + '"'
    $QuotedDirectory = '"' + $GameDirectory + '"'
    $RelaunchArguments = "-NoProfile -ExecutionPolicy Bypass -File $QuotedScript -GameDirectory $QuotedDirectory"
    Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList $RelaunchArguments
    exit
}

$ScriptExitCode = 0
$StageDirectory = $null
try {
$KoKrExperiment = Test-Path -LiteralPath (Join-Path $PayloadDirectory "fontlist_ko_kr.koafontlist") -PathType Leaf
$Locale = if ($KoKrExperiment) { "ko_kr" } else { "zh_cn" }
if ($KoKrExperiment) {
    Write-Host "EXPERIMENT: add a ko_kr locale. The game may not recognize it."
}
else {
    Write-Host "Korean zh_cn patch."
}
Write-Host "Supported game version: Version: $ExpectedVersion."
$EnteredDirectory = Read-Host "Game folder [$GameDirectory] (press Enter to use default)"
if (-not [string]::IsNullOrWhiteSpace($EnteredDirectory)) {
    $GameDirectory = $EnteredDirectory.Trim().Trim('"')
}

$GameDirectory = [System.IO.Path]::GetFullPath($GameDirectory)

if (-not (Test-Path -LiteralPath $PayloadDirectory -PathType Container)) {
    throw "The payload folder is missing. Extract the complete ZIP before running this script."
}

$PayloadFiles = @(Get-ChildItem -LiteralPath $PayloadDirectory -File)
if ($KoKrExperiment) {
    if ($PayloadFiles.Count -ne 33) {
        throw "Expected 3 ko_kr localization files, a ko_kr font list, and 29 Noto font files; found $($PayloadFiles.Count)."
    }
}
elseif ($PayloadFiles.Count -notin @(3, 32)) {
    throw "Expected 3 localization files, optionally with 29 Noto font files; found $($PayloadFiles.Count)."
}

$RequiredNames = @(
    "locatexts_${Locale}.koalocatext_affix",
    "locatexts_${Locale}.koalocatext_base",
    "locatexts_${Locale}.koalocatext_default"
)
if ($KoKrExperiment) {
    $RequiredNames += "fontlist_ko_kr.koafontlist"
}
foreach ($Name in $RequiredNames) {
    if (-not (Test-Path -LiteralPath (Join-Path $PayloadDirectory $Name) -PathType Leaf)) {
        throw "Required payload file is missing: $Name"
    }
}

if (Test-Path -LiteralPath (Join-Path $PayloadDirectory "fontlist_common.koafontlist") -PathType Leaf) {
    throw "The zh_cn common font list must not be overridden by this package."
}

$FontPages = @(
    Get-ChildItem -LiteralPath $PayloadDirectory -File |
        Where-Object { $_.Name -match '^notosanscjksc_regularnotosanscjksc_regular_p\d{2}_00\.ntx$' }
)
if ($PayloadFiles.Count -eq 32 -or $KoKrExperiment) {
    if (-not (Test-Path -LiteralPath (Join-Path $PayloadDirectory "notosanscjksc_regular.font") -PathType Leaf)) {
        throw "Required Noto font file is missing."
    }
    if ($FontPages.Count -ne 28) {
        throw "Expected 28 Noto font pages; found $($FontPages.Count)."
    }
}
elseif ($FontPages.Count -ne 0 -or
        (Test-Path -LiteralPath (Join-Path $PayloadDirectory "notosanscjksc_regular.font") -PathType Leaf)) {
    throw "Font-free package must not contain Noto font resources."
}

$ManifestPath = Join-Path $PSScriptRoot "SHA256SUMS.txt"
if (-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) {
    throw "SHA256SUMS.txt is missing."
}
$ManifestEntries = @{}
foreach ($Line in Get-Content -LiteralPath $ManifestPath) {
    if ($Line -notmatch '^([0-9a-fA-F]{64})\s+[* ]?(.+)$') {
        throw "Invalid checksum manifest line: $Line"
    }
    $ExpectedHash = $Matches[1].ToLowerInvariant()
    $Name = $Matches[2].Trim()
    if ($ManifestEntries.ContainsKey($Name)) {
        throw "Duplicate checksum manifest entry: $Name"
    }
    $PayloadPath = Join-Path $PayloadDirectory $Name
    if (-not (Test-Path -LiteralPath $PayloadPath -PathType Leaf)) {
        throw "Manifest payload file is missing: $Name"
    }
    $ActualHash = (Get-FileHash -LiteralPath $PayloadPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($ActualHash -ne $ExpectedHash) {
        throw "Checksum mismatch for payload file: $Name"
    }
    $ManifestEntries[$Name] = $true
}
if ($ManifestEntries.Count -ne $PayloadFiles.Count) {
    throw "Checksum manifest does not cover every payload file."
}
foreach ($PayloadFile in $PayloadFiles) {
    if (-not $ManifestEntries.ContainsKey($PayloadFile.Name)) {
        throw "Checksum manifest has no entry for $($PayloadFile.Name)."
    }
}

$GamePak = Join-Path $GameDirectory "data\patch_0.pak"
$ModdingDirectory = Join-Path $GameDirectory "modding"
$Unpacker = Join-Path $ModdingDirectory "pakfileunpacker.exe"
$Builder = Join-Path $ModdingDirectory "pakfilebuilder.exe"
foreach ($Path in @($GamePak, $Unpacker, $Builder)) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required game file was not found: $Path"
    }
}

$PayloadNames = @($PayloadFiles | ForEach-Object { $_.Name })
$AddedNames = @()
if ($KoKrExperiment) {
    $AddedNames = @($RequiredNames)
}
$Timestamp = Get-Date -Format "yyyyMMddHHmmss"
$StageDirectory = Join-Path $env:TEMP "Amalur-$Locale-$Timestamp"
$UnpackedDirectory = Join-Path $StageDirectory "patch_0_unpacked"
$VerifyDirectory = Join-Path $StageDirectory "verify"
$BuildList = Join-Path $StageDirectory "patch_0_build.txt"
$CandidatePak = Join-Path $StageDirectory "patch_0.pak"
New-Item -ItemType Directory -Path $UnpackedDirectory -Force | Out-Null

    Write-Host "Unpacking the original archive. This can take several minutes..."
    $UnpackArguments = [string[]]@(".\data\patch_0.pak", "unpack", $UnpackedDirectory)
    Push-Location -LiteralPath $GameDirectory
    try {
        Invoke-CheckedNative -Executable $Unpacker -Arguments $UnpackArguments -Description "PAK unpack"
    }
    finally {
        Pop-Location
    }
    $OriginalFileCount = Get-FileCount $UnpackedDirectory
    if ($OriginalFileCount -lt 1000) {
        throw "The unpacked archive has an unexpected file count: $OriginalFileCount"
    }

    foreach ($Name in $PayloadNames) {
        $Destination = Join-Path $UnpackedDirectory $Name
        if ($Name -in $AddedNames) {
            if (Test-Path -LiteralPath $Destination -PathType Leaf) {
                throw "The ko_kr experiment is already installed: $Name. Restore the original PAK before retrying."
            }
        }
        elseif (-not (Test-Path -LiteralPath $Destination -PathType Leaf)) {
            throw "The target archive does not contain expected file $Name. No files were installed."
        }
    }

    foreach ($PayloadFile in $PayloadFiles) {
        Copy-Item -LiteralPath $PayloadFile.FullName `
            -Destination (Join-Path $UnpackedDirectory $PayloadFile.Name) -Force
    }

    $FilesToPack = @(
        Get-ChildItem -LiteralPath $UnpackedDirectory -File -Recurse -Force |
            ForEach-Object { $_.FullName }
    )
    $ExpectedFileCount = $OriginalFileCount + $AddedNames.Count
    if ($FilesToPack.Count -ne $ExpectedFileCount) {
        throw "Overlay changed the archive file count unexpectedly."
    }
    [Array]::Sort($FilesToPack, [StringComparer]::OrdinalIgnoreCase)
    [System.IO.File]::WriteAllLines(
        $BuildList,
        [string[]]$FilesToPack,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "Building a separate candidate PAK..."
    $BuildArguments = [string[]]@("-c", $BuildList, $CandidatePak)
    Push-Location $ModdingDirectory
    try {
        Invoke-CheckedNative -Executable $Builder -Arguments $BuildArguments -Description "PAK build"
    }
    finally {
        Pop-Location
    }
    if (-not (Test-Path -LiteralPath $CandidatePak -PathType Leaf)) {
        throw "The builder did not create the candidate PAK."
    }

    New-Item -ItemType Directory -Path $VerifyDirectory -Force | Out-Null
    Write-Host "Re-unpacking the candidate PAK for verification..."
    $VerifyUnpackArguments = [string[]]@($CandidatePak, "unpack", $VerifyDirectory)
    Push-Location -LiteralPath $GameDirectory
    try {
        Invoke-CheckedNative -Executable $Unpacker -Arguments $VerifyUnpackArguments -Description "Candidate PAK verification"
    }
    finally {
        Pop-Location
    }
    if ((Get-FileCount $VerifyDirectory) -ne $ExpectedFileCount) {
        throw "Candidate PAK file count does not match the expected archive."
    }
    foreach ($Name in $PayloadNames) {
        $ExpectedPayload = Join-Path $PayloadDirectory $Name
        $VerifiedFile = Join-Path $VerifyDirectory $Name
        if (-not (Test-Path -LiteralPath $VerifiedFile -PathType Leaf)) {
            throw "Candidate PAK is missing $Name."
        }
        $ExpectedHash = (Get-FileHash -LiteralPath $ExpectedPayload -Algorithm SHA256).Hash
        $VerifiedHash = (Get-FileHash -LiteralPath $VerifiedFile -Algorithm SHA256).Hash
        if ($ExpectedHash -ne $VerifiedHash) {
            throw "Candidate PAK verification failed for $Name."
        }
    }
    if ($KoKrExperiment) {
        foreach ($Name in @(
            "locatexts_zh_cn.koalocatext_affix",
            "locatexts_zh_cn.koalocatext_base",
            "locatexts_zh_cn.koalocatext_default",
            "fontlist_zh_cn.koafontlist"
        )) {
            $OriginalFile = Join-Path $UnpackedDirectory $Name
            $VerifiedFile = Join-Path $VerifyDirectory $Name
            if (-not (Test-Path -LiteralPath $OriginalFile -PathType Leaf) -or
                -not (Test-Path -LiteralPath $VerifiedFile -PathType Leaf) -or
                (Get-FileHash -LiteralPath $OriginalFile -Algorithm SHA256).Hash -ne
                (Get-FileHash -LiteralPath $VerifiedFile -Algorithm SHA256).Hash) {
                throw "The ko_kr experiment unexpectedly changed $Name."
            }
        }
    }

    $BackupPak = "$GamePak.backup-$Timestamp"
    $DisplacedPak = "$GamePak.rollback-$Timestamp"
    if ((Test-Path -LiteralPath $BackupPak) -or (Test-Path -LiteralPath $DisplacedPak)) {
        throw "A backup already exists for this timestamp. Run the script again in a moment."
    }
    $OriginalPakHash = (Get-FileHash -LiteralPath $GamePak -Algorithm SHA256).Hash
    Copy-Item -LiteralPath $GamePak -Destination $BackupPak
    if ((Get-FileHash -LiteralPath $BackupPak -Algorithm SHA256).Hash -ne $OriginalPakHash) {
        throw "The original PAK backup failed verification. The game archive was not replaced."
    }
    $CandidateHash = (Get-FileHash -LiteralPath $CandidatePak -Algorithm SHA256).Hash
    Move-Item -LiteralPath $GamePak -Destination $DisplacedPak
    try {
        Move-Item -LiteralPath $CandidatePak -Destination $GamePak
        if ((Get-FileHash -LiteralPath $GamePak -Algorithm SHA256).Hash -ne $CandidateHash) {
            throw "Installed archive hash differs from the verified candidate."
        }
    }
    catch {
        if (Test-Path -LiteralPath $GamePak) {
            Remove-Item -LiteralPath $GamePak -Force
        }
        if (Test-Path -LiteralPath $DisplacedPak) {
            Move-Item -LiteralPath $DisplacedPak -Destination $GamePak
        }
        throw
    }
    try {
        Remove-Item -LiteralPath $DisplacedPak -Force
    }
    catch {
        Write-Warning "Install succeeded, but the temporary rollback copy remains: $DisplacedPak"
    }

    Remove-Item -LiteralPath $StageDirectory -Recurse -Force
    Write-Host "Installed. Original backup: $BackupPak"
    if ($KoKrExperiment) {
        Write-Host "Check whether the game offers Korean and uses the new ko_kr files."
        Write-Host "If Korean is unavailable, restore the backup; this is only an experiment."
    }
    else {
        Write-Host "Set the Steam game language to Chinese (Simplified), then launch the game."
    }
    Write-Host "If anything looks wrong, restore the backup shown above."
}
catch {
    $ScriptExitCode = 1
    Write-Host "Installation failed: $_" -ForegroundColor Red
    Write-Host "Original PAK has not been replaced unless the script reported a successful install."
    if ($StageDirectory) {
        Write-Host "Temporary files, if any, are at: $StageDirectory"
    }
}
finally {
    if ($ScriptExitCode -eq 0) {
        Wait-ForCompletion "Installation complete. Press any key to close this window."
    }
    else {
        Wait-ForCompletion "Review the error above. Press any key to close this window."
    }
}

if ($ScriptExitCode -ne 0) {
    exit 1
}
