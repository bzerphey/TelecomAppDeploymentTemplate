function AppInstalled {
    param (
        $name,
        $version,
        $vendor
    )
    
    $arrProgram = Get-WmiObject -Class Win32_Product | where vendor -eq $vendor | select Name, Version

    If ($arrProgram -eq $null){
        Write-Host "Program not found"
        Return 1
    }Elseif (($arrProgram.Name -eq $name) -and ($arrProgram.Version -eq $version)){
        Write-Host "Program is installed and is the correct version"
        Return 0
    }Elseif ($arrProgram.Version -lt $version) {
        Write-Host "Program is installed but is an older version."
        Return 2
    }Elseif ($arrProgram.Version -gt $version) {
        Write-Host "Program is installed but is a newer version."
        Return 3
    }Else {
        Write-Error "Catch"
        Return 99
    }
}