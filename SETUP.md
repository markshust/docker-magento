# Setup

## New Magento 2 Project (macOS/Linux)

1. Create the project template by going to the place you want the new project (ex. cd ~/Sites/magento2), then run
	- `curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2`

2. Extract the contents of your current Magento site to the `src` folder, or download a fresh copy of the Magento source code for starting a new project with:
    - `bin/download 2.3.0`

3. Add an entry to your local hosts file with your custom domain. Assuming the domain you want to setup is `magento2.test`, enter the below. Be sure to use a `.test` tld, as `.localhost` and `.dev` will present issues with domain resolution.
    - `echo "127.0.0.1 magento2.test" | sudo tee -a /etc/hosts`

4. Start your Docker containers with the provided helper script:
    - `bin/start`

5. For new projects: run Magento's setup install process with the below helper script. Feel free to edit this file to your liking; at the very least you will probably need to update the `base-url` value to the domain you setup in step 3. Also, be sure to setup [Composer Authentication](https://github.com/markoshust/docker-magento#composer-authentication) before initiating the setup script.
    - `bin/setup magento2.test`

6. You may now access your site! Check out whatever domain you setup from within a web browser.
    - `open http://magento2.test`

## New Magento 2 Project (Windows)

> **Windows Configurations**: The Windows configuration does not currently work and is in need of a contributor to get functional once again. Please see [issue 100](https://github.com/markoshust/docker-magento/issues/100) to contribute.

The following scripts are meant to run with Powershell. Note that the execution policy for scripts needs to be set accordingly [Execution policy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-executionpolicy?view=powershell-6).

1. Create the project template by going to the place you want the new project (ex. cd ~/Sites/magento2), then run
	- `curl -s https://raw.githubusercontent.com/markoshust/docker-magento/master/lib/template|bash -s -- magento-2-windows`

2. Extract the contents of your current Magento site to the `src` folder, or download a fresh copy of the Magento source code for starting a new project with the following line. Note that the default untar command is quite slow. If you want to speed that up install [7-Zip](http://www.7-zip.org/) and add it to your PATH. The script will automatically use 7-Zip if it is available:
    - `bin/download 2.3.0`

3. Copy magento into the docker container with `bin/copymagento`. This is needed because of permission restrictions of shared data in Windows (see [Troubleshooting Docker](https://docs.docker.com/docker-for-windows/troubleshoot/#permissions-errors-on-data-directories-for-shared-volumes)). The `app` folder will however be shared with Windows for ease of development. For this folder the default permission 755 works just fine.

4. Add an entry to `C:\Windows\System32\drivers\etc\hosts` with your custom domain: `127.0.0.1 magento2.test` (assuming the domain  you want to setup is `magento2.test`). Be sure to use a `.test` tld, as `.localhost` and `.dev` will present issues with domain resolution.

5. Start your Docker containers with the provided helper script:
    - `bin/start`

6. For new projects: run Magento's setup install process with the below helper script. Feel free to edit this file to your liking; at the very least you will probably need to update the `base-url` value to the domain you setup in step 4. Also, be sure to setup [Composer Authentication](https://github.com/markoshust/docker-magento#composer-authentication) before initiating the setup script.
    - `bin/setup magento2.test`

7. You may now access your site! Check out whatever domain you setup from within a web browser.
    - `open http://magento2.test`

