[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$version
)
function Expand-Targz($tarFile, $dest) {
  if (Get-Command "7z.exe" -ErrorAction SilentlyContinue) {
    & cmd.exe "/C 7z x $tarFile.tar.gz -so | 7z x -aoa -si -ttar -o$dest"
    Remove-Item "$tarFile.tar.gz"
  }
  else {
    if (-not (Get-Command Expand-7Zip -ErrorAction Ignore)) {
      Install-Package -Scope CurrentUser -Force 7Zip4PowerShell > $null
    }
    Expand-7Zip "$tarFile.tar.gz" $dest
    Expand-7Zip "$tarFile.tar" $dest
    Remove-Item "$tarFile.tar.gz"
    Remove-Item "$tarFile.tar"
  }
}

If( -not (Test-Path -Path .\src) )
{
    mkdir .\src | Out-Null
}
Start-BitsTransfer "http://pubfiles.nexcess.net/magento/ce-packages/magento2-$version.tar.gz" ".\src\magento2-$version.tar.gz"
Expand-Targz ".\src\magento2-$version" ".\src"
