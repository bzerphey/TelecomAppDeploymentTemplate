Import-Module .\modules\*

$THEvariable = Get-Content ./package.json | ConvertFrom-Json

$installedCheck = AppInstalled -name $THEvariable.name -version $THEvariable.version -vendor $THEvariable.vendor

If ($installedCheck -eq 1){
    if (HashCheck -eq $true) {
        #Run install
    }Elseif (HashCheck -eq $false){
        Write-Error "File hash does not match. Please clear files and try again."
        Exit
    }else {
        Write-Error "HashCheck module failed. See administrator."
    }
}Elseif ($installedCheck -eq 0){
    Write-Error "Program is already installed and on correct version."
}Elseif ($installedCheck -eq 2){
    Write-Error "Program found but is an older version. Run upgrade to complete installation."
}Elseif ($installedCheck -eq 3){
    Write-Error "Program found but is a newer version. Please uninstall program if you wish to proceed."
}Elseif ($installedCheck -eq 99){
    Write-Error "WMI object error. See administrator."
}Else {
    Write-Error "AppInstalled module failed. See administrator."
}
