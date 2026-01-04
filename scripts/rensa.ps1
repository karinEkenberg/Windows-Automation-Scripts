# Vi skapar orden genom att kombinera bokstäver med deras specialtecken-ID
$stada = "St" + [char]228 + "dar"          # Städar
$for = "f" + [char]246 + "r"             # för
$fore = "f" + [char]246 + "re"             # före
$behovs = "beh" + [char]246 + "vs"         # behövs
$ar = [char]228 + "r"                      # är
$gronare = "gr" + [char]246 + "nare"       # grönare

# 1. Spara status före rensning
$StartDrive = Get-PSDrive C
$StartFree = $StartDrive.Free

Write-Host "--- STATUS $fore RENSNING ---" -ForegroundColor Cyan
Write-Host "Ledigt utrymme just nu: $([math]::round($StartFree / 1GB, 2)) GB"

Write-Host "`n$stada upp Windows..." -ForegroundColor Yellow

# 2. Rensar filer (samma logik som tidigare)
$TempFolders = @("$env:TEMP\*", "C:\Windows\Temp\*")
Remove-Item -Path $TempFolders -Recurse -ErrorAction SilentlyContinue
Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue
cleanmgr /sagerun:1

# 3. Beräkna resultat
$EndDrive = Get-PSDrive C
$EndFree = $EndDrive.Free
$TotalCleaned = $EndFree - $StartFree

Write-Host "`n--- STATUS EFTER RENSNING ---" -ForegroundColor Green
Write-Host "Nytt ledigt utrymme: $([math]::round($EndFree / 1GB, 2)) GB"

if ($TotalCleaned -gt 0) {
    $MB = [math]::round($TotalCleaned / 1MB, 2)
    Write-Host "Totalt rensat: $MB MB" -ForegroundColor White -BackgroundColor DarkGreen
} else {
    Write-Host "Inga filer $behovs rensas (systemet $ar redan rent)." -ForegroundColor Gray
}

Write-Host "`nWindows $ar nu lite renare och $gronare!"
Read-Host "Tryck Enter $for att avsluta"