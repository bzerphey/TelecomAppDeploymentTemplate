Import-Module .\modules\*

$THEvariable = Get-Content ./package.json | ConvertFrom-Json