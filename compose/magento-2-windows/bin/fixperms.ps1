Write-Host "Correcting filesystem permissions..."

./bin/rootcli chown -R app:app /var/www
./bin/rootcli find var vendor pub/static pub/media app/etc -type f -exec chmod u+w `{`} `;
./bin/rootcli find var vendor pub/static pub/media app/etc -type d -exec chmod u+w `{`} `;
./bin/rootcli chmod u+x bin/magento

Write-Host "Filesystem permissions corrected."
