docker-compose up -d

echo "Initiating bi-directional sync between host & containers..."
bin/copydirall
echo "All containers have started successfully."
