Write-Host "--- STATUS FÖRE RENSNING ---" -ForegroundColor Cyan
Get-PSDrive C | Select-Object Used, Free

Write-Host "`nStädar upp Windows..." -ForegroundColor Yellow

# 1. Rensar Windows temporära filer
$TempFolders = @("$env:TEMP\*", "C:\Windows\Temp\*")
Remove-Item -Path $TempFolders -Recurse -ErrorAction SilentlyContinue

# 2. Rensar papperskorgen
Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue

# 3. Startar Windows inbyggda diskrensning (tyst läge)
cleanmgr /sagerun:1

Write-Host "`n--- STATUS EFTER RENSNING ---" -ForegroundColor Green
Get-PSDrive C | Select-Object Used, Free

Write-Host "`nWindows är nu lite renare och grönare!"
pause