[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$dir
)
docker cp $(docker-compose ps|grep phpfpm|awk '{print $dir}'):/var/www/html/$dir src/
