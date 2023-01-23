$global:RootPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$json = Get-Content "$Rootpath\config.json" -Raw | ConvertFrom-Json
$CreateCSV = Import-Csv -Path "$Rootpath\create.csv"
Start-Transcript -Path "$Rootpath\Create_$(Get-Date -Format "MMddyyyyHHmm").txt"
$PurposeItem = $CreateCSV | Select -ExpandProperty Purpose
$ArrayMembersItem = ($CreateCSV | Select -ExpandProperty Members) -split (',')
$Name = ($CreateCSV | Select -ExpandProperty Name).TrimEnd().TrimStart() -replace '[\W]','' #Combined Trimmed and No Chars
$obj = [PSCustomObject]@{
    Name = $Name.ToLower()
    DisplayName = $json.DisplayNamePrefix + $Name
    PrimarySmtpAddress = $json.AliasPrefix + $Name.ToLower() + "@" + $json.DomainName
    Description = "`n Created at: " + $env:COMPUTERNAME + "`n Created by: " + $env:USERNAME + "`n Created on: "  + ($(Get-Date)) + "`n`n=========`n" + $PurposeItem
}
Write-Host "`n`n Name:" -ForegroundColor Cyan
$obj.Name
Write-Host "`n`n DisplayName:" -ForegroundColor Cyan
$obj.DisplayName
Write-Host "`n`n PrimarySmtpAddress:" -ForegroundColor Cyan
$obj.PrimarySmtpAddress
Write-Host "`n`n Description:" -ForegroundColor Cyan
$obj.Description
Write-Host "`n`n Members:" -ForegroundColor Cyan
$ArrayMembersItem
Stop-Transcript
