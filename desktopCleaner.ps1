$path = 'D:\Desktop'
$targetPath = 'D:\Desktop\Photos\DesktopPhotos'
if (!(Test-Path $targetPath)){
    mkdir $targetPath
}
Get-ChildItem -Path $path -File  | ForEach-Object{
    if ($_.FullName -match '.jpg' -or $_.FullName -match '.png'){
        Move-Item -Path $_.FullName -Destination $targetPath
    }
}