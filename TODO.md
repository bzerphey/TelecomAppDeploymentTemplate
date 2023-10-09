

build uninstall.ps1
build upgrade.ps1


find deployment method
pull - Invoke-WebRequest https://github.com/bzerphey/ZultysFaxDriver/archive/refs/heads/main.zip -OutFile C:\TelecomRepo\ZultysFaxDriver.zip
extract - Expand-Archive C:\TelecomRepo\ZultysFaxDriver.zip -DestinationPath C:\TelecomRepo
rename folder - dir | Rename-Item -NewName {$_.Name -replace "-main", ""}