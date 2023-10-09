$ghURL = ""
$ghRepoName = ""
$conghpackage = "/archive/refs/heads/main.zip"

$webreq = $ghURL + $ghRepoName + $conghpackage
$destpath = "C:\TelecomRepo\"
$dest = $destpath +  $ghRepoName + ".zip"

Invoke-WebRequest $webreq -OutFile $dest

Expand-Archive $dest -DestinationPath $destpath

dir | Rename-Item -NewName {$_.Name -replace "-main", ""}



