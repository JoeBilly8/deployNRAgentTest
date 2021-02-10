Write-Host "Deploying agent..."

$LICENSE_KEY = "5c30914d51ee4675aae1a34b10acdc6127b1cfbb"; `
(New-Object System.Net.WebClient).DownloadFile("https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi", "$env:TEMP\newrelic-infra.msi"); `
    msiexec.exe /qn /i "$env:TEMP\newrelic-infra.msi" GENERATE_CONFIG=true LICENSE_KEY="$LICENSE_KEY" | Out-Null; `
    net start newrelic-infra

Write-Host "Agent Deployed"
