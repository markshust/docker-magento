[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$enable_disable_xdebug
)
if ( "$enable_disable_xdebug" -eq "disable" ) {
  ./bin/cli sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
  Write-Host "Xdebug has been disabled."
} elseif ( "$enable_disable_xdebug" -eq "enable" ) {
  ./bin/cli sed -i -e 's/^\;zend_extension/zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
  Write-Host "Xdebug has been enabled."
} else {
  Write-Host "Please specify either 'enable' or 'disable' as an argument"
}
