./bin/cli chmod u+x bin/magento

docker-compose exec phpfpm /usr/local/bin/php ./bin/magento setup:install `
  --db-host=db `
  --db-name=magento `
  --db-user=magento `
  --db-password=magento `
  --base-url=http://magento2.test/ `
  --admin-firstname=John `
  --admin-lastname=Smith `
  --admin-email=john.smith@gmail.com `
  --admin-user=john.smith `
  --admin-password=password123 `
  --language=en_US `
  --currency=USD `
  --timezone=America/New_York `
  --use-rewrites=1

./bin/fixperms

echo "Turning on developer mode.."
./bin/magento deploy:mode:set developer

./bin/magento indexer:reindex

./bin/magento cache:enable
