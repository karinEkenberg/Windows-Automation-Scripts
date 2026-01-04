# Kontrollera att ett meddelande skickades med
if ($args.Count -eq 0) {
    Write-Host "Fel: Du maste skriva ett commit-meddelande inom citationstecken!" -ForegroundColor Red
    Write-Host "Exempel: .\push.ps1 'fix: uppdaterade readme'"
    exit
}

$msg = $args[0]

# Kör git-flödet
Write-Host "Puschar andringar till Github..." -ForegroundColor Cyan
git add .
git commit -m "$msg"
git push

Write-Host "Klart! Allt ar uppladdat." -ForegroundColor Green