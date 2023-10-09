function RunCleanup {
    param (
        $workingdir
    )
    
    Remove-Item -LiteralPath $workingdir -Force -Recurse

    If (Test-Path -Path $workingdir){
        Return 2
    }else {
        Return 0
    }
}