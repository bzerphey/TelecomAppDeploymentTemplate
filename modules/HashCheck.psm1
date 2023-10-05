function HashCheck {
    param (
        $installfile,
        $installerhash
    )
    
    $file = ".\" + $installfile

    $FileHash = Get-FileHash $file -Algorithm SHA256 

    $FileHash -eq $installerhash
}