# install Chocolatey -- https://chocolatey.org
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install Go -- https://golang.org
choco install golang --yes --allow-multiple-versions --limit-output --version 1.15.1
