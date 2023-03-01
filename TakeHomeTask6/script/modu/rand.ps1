function CheckKey {
try {
    $global:OKButton = [System.Windows.MessageBoxButton]::OK
    $global:InfoIcon = [System.Windows.MessageBoxImage]::Information
$Hello = Read-Host "Please enter HashKey" -AsSecureString
$Password = Get-Content "$RootPath\deps\pass.txt"| ConvertTo-SecureString 
#$Password|Out-File "C:\Users\EnricoDeLC\Downloads\ClassAfternoon-Toolbox-main\script\deps\pass.txt"
#$Rico1 = $Password| ConvertTo-SecureString -AsPlainText -Force
$ConvertedPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))
$EnteredPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Hello))
if ($ConvertedPass -ceq $EnteredPass) {
    [System.Windows.MessageBox]::Show("Hash Key Correct will now decrypt and proceed with the script","$($json.ToolName) $($json.ToolVersion)",$OKButton,$InfoIcon) | Out-Null
    XCryptDecrypt 
    } 
    else 
    {
        [System.Windows.MessageBox]::Show("Incorrect Hash Key, Will now Close","$($json.ToolName) $($json.ToolVersion)",$OKButton,$InfoIcon) | Out-Null
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
function global:Get-Kill {
    param (
        $Mode
    )
    if ($Mode -eq "Hard") {
        Clear-Content "$RootPath\deps\config.json"
        Set-Content "$RootPath\deps\config.json" 'ew0KICAgICJBbGlhc1ByZWZpeCI6ICAiR1JTXyIsDQogICAgIkRvbWFpbk5hbWUiOiAgInNvbHV0aW9uYXV0ZGV2Lm9ubWljcm9zb2Z0LmNvbSIsDQogICAgIkRpc3BsYXlOYW1lUHJlZml4IjogICJHUlMgIiwNCiAgICAiVG9vbE5hbWUiOiAgIk15VG9vbGJveCIsDQogICAgIlRvb2xWZXJzaW9uIjogICJ2MS4wLjAiLA0KICAgICJUb29sVUlCYWNrQ29sb3IiOiAgIiNlM2UzZTMiLA0KICAgICJUb29sVUlCYWNrQ29sb3JEYXJrIjogICIjQzBDMEMwIiwNCiAgICAiVG9vbFVJTGFiZWxDb2xvciI6ICAiI0ZGRkZGRiIsDQogICAgIlRvb2xVSUxhYmVsQ29sb3JEYXJrIjogICIjMDAwMDAwIiwNCiAgICAiVG9vbFVJQnRuQ29sb3IiOiAgIiNkMzA5MDkiLA0KICAgICJUb29sU2hvd1RPQSI6ICAiRmFsc2UiLA0KICAgICJUb29sVE9BVGV4dCI6ICAiVGhlIHNjcmlwdCBwcm92aWRlZCBoZXJldW5kZXIgaXMgcHJvdmlkZWQgb24gYW4gYXMgaXMgYmFzaXMsd2l0aG91dCBhbnkgd2FycmFudGllcyBvciByZXByZXNlbnRhdGlvbnMgZXhwcmVzcywgaW1wbGllZCBvciBzdGF0dXRvcnk7IGluY2x1ZGluZywgd2l0aG91dCBsaW1pdGF0aW9uLCB3YXJyYW50aWVzIG9mIHF1YWxpdHksIHBlcmZvcm1hbmNlLCBub25pbmZyaW5nZW1lbnQsIG1lcmNoYW50YWJpbGl0eSBvciBmaXRuZXNzIGZvciBhIHBhcnRpY3VsYXIgcHVycG9zZS4gTm9yIGFyZSB0aGVyZSBhbnkgd2FycmFudGllcyBjcmVhdGVkIGJ5IGEgY291cnNlIG9yIGRlYWxpbmcsIGNvdXJzZSBvZiBwZXJmb3JtYW5jZSBvciB0cmFkZSB1c2FnZS5CeSBjbGlja2luZyBbU3RhcnRdIHlvdSBhZ3JlZWQgdG8gdGhlIHN0YXRlbWVudCBtZW50aW9uZWQgYWJvdmUuIE90aGVyd2lzZSwgdGVybWluYXRlIHRoZSBQb3dlclNoZWxsIHNlc3Npb24gYXNhcC4iDQp9DQoNCg0KDQoNCg0KDQo='
        $e = $_.Exception.GetType().FullName
        $line = $_.InvocationInfo.ScriptLineNumber
        $msg = $_.Exception.Message
        Write-Output "$(Get-Date -Format "HH:mm")[Error]: Initialization failed at line [$line] due [$e] `n`nwith details `n`n[$msg]`n"   
        
        Write-Output "`n------------------END ROOT-------------------------"
        
        exit
    }else{
        Clear-Content "$RootPath\deps\config.json"
        Set-Content "$RootPath\deps\config.json" 'ew0KICAgICJBbGlhc1ByZWZpeCI6ICAiR1JTXyIsDQogICAgIkRvbWFpbk5hbWUiOiAgInNvbHV0aW9uYXV0ZGV2Lm9ubWljcm9zb2Z0LmNvbSIsDQogICAgIkRpc3BsYXlOYW1lUHJlZml4IjogICJHUlMgIiwNCiAgICAiVG9vbE5hbWUiOiAgIk15VG9vbGJveCIsDQogICAgIlRvb2xWZXJzaW9uIjogICJ2MS4wLjAiLA0KICAgICJUb29sVUlCYWNrQ29sb3IiOiAgIiNlM2UzZTMiLA0KICAgICJUb29sVUlCYWNrQ29sb3JEYXJrIjogICIjQzBDMEMwIiwNCiAgICAiVG9vbFVJTGFiZWxDb2xvciI6ICAiI0ZGRkZGRiIsDQogICAgIlRvb2xVSUxhYmVsQ29sb3JEYXJrIjogICIjMDAwMDAwIiwNCiAgICAiVG9vbFVJQnRuQ29sb3IiOiAgIiNkMzA5MDkiLA0KICAgICJUb29sU2hvd1RPQSI6ICAiRmFsc2UiLA0KICAgICJUb29sVE9BVGV4dCI6ICAiVGhlIHNjcmlwdCBwcm92aWRlZCBoZXJldW5kZXIgaXMgcHJvdmlkZWQgb24gYW4gYXMgaXMgYmFzaXMsd2l0aG91dCBhbnkgd2FycmFudGllcyBvciByZXByZXNlbnRhdGlvbnMgZXhwcmVzcywgaW1wbGllZCBvciBzdGF0dXRvcnk7IGluY2x1ZGluZywgd2l0aG91dCBsaW1pdGF0aW9uLCB3YXJyYW50aWVzIG9mIHF1YWxpdHksIHBlcmZvcm1hbmNlLCBub25pbmZyaW5nZW1lbnQsIG1lcmNoYW50YWJpbGl0eSBvciBmaXRuZXNzIGZvciBhIHBhcnRpY3VsYXIgcHVycG9zZS4gTm9yIGFyZSB0aGVyZSBhbnkgd2FycmFudGllcyBjcmVhdGVkIGJ5IGEgY291cnNlIG9yIGRlYWxpbmcsIGNvdXJzZSBvZiBwZXJmb3JtYW5jZSBvciB0cmFkZSB1c2FnZS5CeSBjbGlja2luZyBbU3RhcnRdIHlvdSBhZ3JlZWQgdG8gdGhlIHN0YXRlbWVudCBtZW50aW9uZWQgYWJvdmUuIE90aGVyd2lzZSwgdGVybWluYXRlIHRoZSBQb3dlclNoZWxsIHNlc3Npb24gYXNhcC4iDQp9DQoNCg0KDQoNCg0KDQo='
        Write-Output "`n------------------END ROOT-------------------------"
    
        exit
    }
    
}

function global:XCryptDecrypt {
    
    $Path = "$RootPath\deps\config.json"
    
    $encodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($(Get-Content -Path $Path)))
    Set-Content -Path $Path -value $encodedText
}   

