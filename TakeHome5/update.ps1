function UpdateDL{
#Simply get dl and members to be added
try {
    $Result = GetDL -Identity $textBox2.Text | select DisplayName,PrimarySmtpAddress,Alias,GroupType | fl | Out-string
    if ($Result) {
        Get-Content -path $RootPath\memberlist.txt
        $memnum = import-csv .\memberlist.txt
       foreach ($data in $memnum){   
        UpDLMember -Identity $textBox2.Text -Member $data.Member
       }
       }
    else {
        [System.Windows.MessageBox]::Show("DL or Member was not found `n$Result","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
    }

}
catch {
    [System.Windows.MessageBox]::Show("DL not found kindly go to Create section `n$Result","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
    }

    }

    function CheckCreatememlist {
        $global:memtxt = Import-Csv -Path "$RootPath\memberlist.txt"
        if ($($memtxt.Member.Count) -gt 0) {
            
        }else{
            Write-Host "`n------------------OUTPUT($counter)-------------------------"
            Write-Host "$(Get-Date -Format "HH:mm")[Log]: Memberlist.txt is empty (~_^)" -foregroundcolor Yellow

            #popup method 2
            Write-Host "$(Get-Date -Format "HH:mm")[Debug]: Attempting to update [memberlist.txt]"
            $UpdateCmemlistResult = [System.Windows.MessageBox]::Show("Empty memberlist. Do you want to update [memberlist.txt] file?","$($json.ToolName) $($json.ToolVersion)",$YesNoButton,$QButton)

            If($UpdateCmemlistResult -eq "Yes")
            {

                Invoke-Item "$RootPath\memberlist.txt"
                Start-Sleep -s 15
                Write-Host "`n$(Get-Date -Format "HH:mm")[Debug]: Checking again [memberlist.txt]"
                [System.Windows.MessageBox]::Show("Checking again [memberlist.txt]","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
                CheckCreatememlist
            }else{
                [System.Windows.MessageBox]::Show("Goodbye!.","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
            }
   
        }
    }
   
    