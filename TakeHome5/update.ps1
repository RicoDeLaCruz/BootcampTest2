function UpdateDL{
#Simply get dl and members to be added
try {
    $Result = GetDL -Identity $textBox2.Text | select DisplayName,PrimarySmtpAddress,Alias,GroupType | fl | Out-string
    if ($Result) {
        Invoke-Item -path $RootPath\memberlist.txt
        Get-Content -path $RootPath\memberlist.txt
        $memnum = import-csv .\memberlist.txt
       foreach ($data in $memnum){   
        UpDLMember -Identity $textBox2.Text -Member $data.Member
       }
       }
    else {
        [System.Windows.MessageBox]::Show("Member was not found `n$Result","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
    }

}
catch {
    [System.Windows.MessageBox]::Show("DL not found kindly go to Create section `n$Result","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
    }

    }


   
    