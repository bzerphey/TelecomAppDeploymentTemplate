function SwitchesFinder {
    param (
        $installfile,
        $switches,
        $setupfile
    )
    
    if ($switches -eq $null){
        If (($installfile -contains ".exe") -or ($installfile -contains ".EXE")){
            $runcmd = $installfile + " /s /qn"
            If ($setupfile -ne $null){
                $runcmd = $runcmd + " /r ./files/" + $setupfile
            }
        }elseif (($installfile -contains ".msi") -or ($installfile -contains ".MSI")) {
            $runcmd = "msiexec /i " + $installfile + "quiet /qn /norestart /log C:\Windows\Log\$(Get-Date -Format "MMddyyyyHHmm").log"
        }
    }

    Return $runcmd
}