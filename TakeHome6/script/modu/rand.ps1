function CheckKey {
try {
$Hello = Read-Host "Please enter HashKey" -AsSecureString
$Password = Get-Content "$RootPath\deps\pass.txt"| ConvertTo-SecureString 
#$Password|Out-File "C:\Users\EnricoDeLC\Downloads\ClassAfternoon-Toolbox-main\script\deps\pass.txt"
#$Rico1 = $Password| ConvertTo-SecureString -AsPlainText -Force
$ConvertedPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
$EnteredPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Hello))
if ($ConvertedPass -ceq $EnteredPass) {
    XCryptDecrypt 
    } 
    else 
    {
    Write-Host "**********Wrong Hash Key kindly reopen"************
    Write-Host "**********Wrong Hash Key kindly reopen"************
    Write-Host "**********Wrong Hash Key kindly reopen"************
    Write-Host "**********Wrong Hash Key kindly reopen"************
    Get-Kill -Mode Hard
    }
}
catch {
    Get-Kill -Mode Hard
}
    
}



