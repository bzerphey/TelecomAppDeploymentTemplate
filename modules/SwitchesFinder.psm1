function SwitchesFinder {
    param (
        $name,
        $installfile,
        $switches,
        $setupfile
    )
    
    $logfile = "C:\Windows\Logs\" + "$(Get-Date -Format MMddHHmm).log"
    $fileLoc = '"' + "C:\TelecomRepo\" + $name + '\files\' + $installfile + '"' 


    if ($switches -eq ""){
        If (([System.IO.Path]::GetExtension($installfile) -eq ".exe") -or ([System.IO.Path]::GetExtension($installfile) -eq ".EXE")){
            $exeargs = @(
                "/s"
                "/qn"
            )
            If ($setupfile -ne ""){
                $ini = " /r .\files\" + $setupfile
                $exeargs.Add("/r")
                $exeargs.Add($ini)
            }
            $runcmd = "C:\TelecomRepo\$($name)\files\" + $installfile
            Start-Process $runcmd -Wait -ArgumentList $exeargs
        }elseif (([System.IO.Path]::GetExtension($installfile) -eq ".msi") -or ([System.IO.Path]::GetExtension($installfile) -eq ".MSI")) {
            $msiargs = @(
                "/i"
                "$($fileLoc)"
                "/qb"
                "/norestart"
            )
            Start-Process "msiexec.exe" -Wait -ArgumentList $msiargs
        }Else{
            $runcmd = "2"
        }
    }
}