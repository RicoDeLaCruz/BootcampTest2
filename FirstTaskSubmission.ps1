$global:RootPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$json = Get-Content "$Rootpath\config.json" -Raw | ConvertFrom-Json
$CreateCSV = Import-Csv -Path "$Rootpath\create.csv"
Start-Transcript -Path "$Rootpath\Create_$(Get-Date -Format "MMddyyyyHHmm").txt"
Write-Output "`n`n------------------BEGIN-------------------------" "$(Get-Date -Format "HH:mm")[Log]: Starting init"
$PurposeItem = $CreateCSV | Select -ExpandProperty Purpose 
$ArrayMembersItem = ($CreateCSV | Select -ExpandProperty Members) -split (',')
$Name = ($CreateCSV | Select -ExpandProperty Name).TrimEnd().TrimStart() -replace '[\W]','' 
Write-Output "$(Get-Date -Format "HH:mm")[Log]: Assembling output"
$AssembledObj = [PSCustomObject]@{
    Name = $Name.ToLower()
    DisplayName = $json.DisplayNamePrefix + $Name
    PrimarySmtpAddress = $json.AliasPrefix + $Name.ToLower() + "@" + $json.DomainName
    Description = "`n Created at: " + $env:COMPUTERNAME + "`n Created by: " + $env:USERNAME + "`n Created on: "  + ($(Get-Date)) + "`n`n=========`n" + $PurposeItem
}
Write-Output "`n------------------OUTPUT-------------------------"
Write-Host "`n`n Name:" -ForegroundColor Cyan
$AssembledObj.Name
Write-Host "`n`n DisplayName:" -ForegroundColor Cyan
$AssembledObj.DisplayName
Write-Host "`n`n PrimarySmtpAddress:" -ForegroundColor Cyan
$AssembledObj.PrimarySmtpAddress
Write-Host "`n`n Description:" -ForegroundColor Cyan
$AssembledObj.Description
Write-Host "`n`n Members:" -ForegroundColor Cyan
$ArrayMembersItem + "`n`n------------------END-------------------------"
Stop-Transcript