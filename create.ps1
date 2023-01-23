#-initialization
$CreateCSV = Import-csv -path "C:\Users\EnricoDeLC\OneDrive - FUJITSU\Desktop\PowerShellBootcamp\create.csv" 

#transform data
$PurposeItem = $CreateCSV | select-object -ExpandProperty Purpose
$ArrayMembersItem = ($CreateCSV | select -ExpandProperty Members) -split (',')
$Item = $CreateCSV | Select -ExpandProperty Name 
#subtransform
$TrimedItem = ($item.TrimEnd()).TrimStart()  #Removes white spaces
$NoCharsItem = $TrimedItem -replace '[\W]', ''  #Removes characters
$LowerCasedItem = $NoCharsItem.ToLower()
$AppendedItem = "GRS_" + $LowerCasedItem 
#Assembling

$AssembledObj = [PSCustomObject]@{
    Name = $NoCharsItem
    DisplayName = "GRS " +$NoCharsItem
    PrimarySmtpAddress = $AppendedItem + "@solutionautdev.onmicrosoft.com"
    Description = "`n Created at G07PHXNWES00293"+
    "`n Created by: be.fernandez"+
    "`n Created on: 10/18/2022 14:06:41"+
    "`n`n=========`n" + $PurposeItem 
}
#Output

Write-Host "`n`n Name:" -ForegroundColor Cyan
$AssembledObj.Name
Write-Host "`n`n DisplayName:" -ForegroundColor Cyan
$AssembledObj.DisplayName
Write-Host "`n`n PrimarySmtpAddress:" -ForegroundColor Cyan
$AssembledObj.PrimarySmtpAddress
Write-Host "`n`n Description:" -ForegroundColor Cyan
$AssembledObj.Description

Write-Host "`n`n Members:" -ForegroundColor Cyan
$ArrayMembersItem


