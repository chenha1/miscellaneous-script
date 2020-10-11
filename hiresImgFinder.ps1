$destPath = "D:\Desktop\Photos\Hires"
$sourcePath = "D:\Desktop\Photos"
If(!(test-path $destPath))
{
    New-Item -ItemType Directory -Force -Path $destPath
}


Get-ChildItem -Path $sourcePath -File | ForEach-Object{
    $fullName = $_.FullName
    $pic =  New-Object System.Drawing.Bitmap $fullName
    $width = $pic.Width
    $height = $pic.Height
    if (($width -ge 3440) -and ($height -ge 1440)){
        Copy-Item -Path $fullName -Destination $destPath
    }
}