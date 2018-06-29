if ($args.length -eq 0) {
    Write-Host "Please specify a CLI command (ex. ls)"
    exit
} else {
    docker-compose exec -u root phpfpm $args
}
