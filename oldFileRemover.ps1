$filePath = 'D:\Chrome Download'
$desktopPath = 'D:\Desktop'
Get-ChildItem -Path $filePath -File | ForEach-Object{
    if ($_.LastAccessTime -lt (Get-Date).AddDays(-600)){
        Remove-Item -Path $_.FullName
    }
}
Get-ChildItem -Path $desktopPath -File | ForEach-Object {
    if ($_.LastAccessTime -lt (Get-Date).AddDays(-600)) {
        Remove-Item -Path $_.FullName
    }
}