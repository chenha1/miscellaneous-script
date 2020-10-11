$path = "D:\Desktop\Photos"
$squarePath = "${path}\Sqaure"
$phonePath = "${path}\Phone"
$laptopPath = "${path}\Laptop"
$wideScreenPath = "${path}\WideScreen"
$allPath = $path,$squarePath,$phonePath,$laptopPath,$wideScreenPath

for ($i = 1; $i -le 4; $i++){
    If(!(test-path $allPath[$i]))
    {
          New-Item -ItemType Directory -Force -Path $allPath[$i]
    }
}

Get-ChildItem -Path $path -File | ForEach-Object{
    $fullName = $_.FullName
    $pic =  New-Object System.Drawing.Bitmap $fullName
    $width = $pic.Width
    $height = $pic.Height
    if ($width * 1.2 -lt $height){
        Copy-Item -Path $fullName -Destination $phonePath
    } elseif ($width -gt $height * 2) {
        Copy-Item -Path $fullName -Destination $wideScreenPath
    } else {
        if ($width -lt $height){
            Copy-Item -Path $fullName -Destination $squarePath
        } else{
            Copy-Item -Path $fullName -Destination $laptopPath
        }
    }
}