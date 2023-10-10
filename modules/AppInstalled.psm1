function AppInstalled {
    param (
        $name,
        $prettyname,
        $version,
        $vendor
    )
    
    $arrProgram = Get-WmiObject -Class Win32_Product | where vendor -eq $vendor | select Name, Version
   
    If ($arrProgram -eq $null){
        Return 1
    }Elseif (($arrProgram.Name -like $prettyname) -and ($arrProgram.Version -eq $version)){
        Write-Error "Program is installed and is the correct version"
        Return 0
    }Elseif ($arrProgram.Version -lt $version) {
        Write-Error "Program is installed but is an older version."
        Return 2
    }Elseif ($arrProgram.Version -gt $version) {
        Write-Error "Program is installed but is a newer version."
        Return 3
    }Else {
        Write-Error "Catch"
        Return 99
    }
}