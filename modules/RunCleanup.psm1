function RunCleanup {
    param (
        $name
    )
    
    $workingdir = "C:\TelecomRepo\" + $name

    Remove-Item -LiteralPath $workingdir -Force -Recurse

    If (Test-Path -Path $workingdir){
        Return 2
    }else {
        Return 0
    }
}