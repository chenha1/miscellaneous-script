$path = 'D:\BaiduYunDownload'

Get-ChildItem -Path $path -Directory | ForEach-Object{
    if ((Get-ChildItem -Path $_.FullName).count -eq 0){
        Write-Output $_.Name
        $item = Get-ChildItem $_.FullName
        Write-Output $item
    }
}