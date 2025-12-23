Import-Module ActiveDirectory

$folderPath = "\\full\folder\path"
$outputFile = "output\file\path.csv"  

# Get folder list
$usersList = Get-ChildItem -Path $folderPath -Directory | Select-Object -ExpandProperty Name

$Results = @()

# Direcotry size
function Get-FolderSize($path) {
    try {
        $bytes = (Get-ChildItem -LiteralPath $path -Recurse -Force -ErrorAction SilentlyContinue |
                  Where-Object { -not $_.PSIsContainer } |
                  Measure-Object -Property Length -Sum).Sum
    }
    catch {
        return "ERR"
    }

    if (-not $bytes) { return "0 B" }

    switch ($bytes) {
        { $_ -gt 1GB } { return "{0:N2} GB" -f ($bytes / 1GB) }
        { $_ -gt 1MB } { return "{0:N2} MB" -f ($bytes / 1MB) }
        default        { return "$bytes B" }
    }
}


foreach ($sam in $usersList) {
    $currentFolder = Join-Path $folderPath $sam
    $size = Get-FolderSize $currentFolder

    try {
        $user = Get-ADUser -Server "domain_name.local" -Filter { SamAccountName -eq $sam } -Properties Name

        if ($user -eq $null) {
            $status = "NotFound"
        }
        elseif ($user.Name -match "_disabled") {
            $status = "Disabled"
        }
        else {
            $status = "Active"
        }
    }
    catch {
        $status = "NotFound"
    }

    $Results += [PSCustomObject]@{
        User       = $sam
        Name       = $user.Name
        FolderSize = $size
        Status     = $status
    }
}

# ---- Eksport do CSV ----
$Results | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8

Write-Host "`nCSV saved to: $outputFile" -ForegroundColor Cyan
