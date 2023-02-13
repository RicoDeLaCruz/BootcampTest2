function ReadDL {



try {
    
    $Result = GetDL -Identity $textBox.Text | select DisplayName,PrimarySmtpAddress,Alias,GroupType | fl | Out-String
    $Result2 = GetDLMember -Identity $textBox.Text | select Name,RecipientType | fl| Out-String
    if ($Result) {
        
        Write-Output "$Result"| Out-File -FilePath "$RootPath\reading.txt" -Append
        Write-Output "Members:" | Out-File -FilePath "$RootPath\reading.txt" -Append
        Write-Output "$Result2" | Out-File -FilePath "$RootPath\reading.txt" -Append
        

            Invoke-Item "$RootPath\reading.txt"
          
        [System.Windows.MessageBox]::Show("DL found generating DL info and members. `n`n","$($json.ToolName) $($json.ToolVersion)",$OKButton,$InfoIcon)
        
          
        
    }
    else {
        [System.Windows.MessageBox]::Show("DL not found kindly go to Create section `n$Result","$($json.ToolName) $($json.ToolVersion)",$OKButton,$WarningIcon)
    }
}
catch {
    Get-kill
}
  

}
    



