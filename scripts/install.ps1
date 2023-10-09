Import-Module ./modules/AppInstalled.psm1
Import-Module ./modules/HashCheck.psm1
Import-Module ./modules/RunCleanup.psm1
Import-Module ./modules/SwitchesFinder.psm1

$THEvariable = Get-Content ../package.json | ConvertFrom-Json

$installedCheck = AppInstalled -name $THEvariable.name -version $THEvariable.version -vendor $THEvariable.vendor

#Install Logic
If ($installedCheck -eq 1){
    if (HashCheck -eq $true) {
        Start-Process (SwitchesFinder -installfile $THEvariable.installfile -switches $THEvariable.switches -setupfile $THEvariable.setupfile) -NoNewWindow -Wait -PassThru $process.ExitCode
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

#Installation Check Logic
$installedCheck = AppInstalled -name $THEvariable.name -version $THEvariable.version -vendor $THEvariable.vendor

If ($installedCheck -eq 1){
    Write-Error "Program installation did not complete successfully. See administrator."
}Elseif ($installedCheck -eq 0){
    Write-Host "Program installtion complete."
    If ((RunCleanup -workingdir $THEvariable.workingdir) -eq 0){
        Write-Host "Cleanup complete."
    }Else{
        Write-Error "Cleanup failed."
    }
}Else {
    Write-Error "AppInstalled module failed. See administrator."
}