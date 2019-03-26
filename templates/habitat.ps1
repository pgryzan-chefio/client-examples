Write-Host "Ensure that Habitat is on the Machine"
If (-Not (Get-Service Habitat -ErrorAction SilentlyContinue)) {
    Write-Host "Install Habitat"
    C:/ProgramData/chocolatey/choco install habitat -y

    Write-Host "Install the Habitat Windows Service"
    hab pkg install core/windows-service
    hab pkg exec core/windows-service install

    Write-Host "Set Habitat Environment Variables"
    [Environment]::SetEnvironmentVariable("HAB_ORIGIN", "${hab_origin}", "Machine")
    [Environment]::SetEnvironmentVariable("HAB_AUTH_TOKEN", "${hab_auth_token}", "Machine")

    Write-Host "Set the Habitat Run Flags"
    (Get-Content -Path "C:\hab\svc\windows-service\HabService.dll.config") | ForEach-Object {$_ -Replace "--no-color", "--no-color --auto-update"} | Set-Content -Path "C:\hab\svc\windows-service\HabService.dll.config"
}
  
Write-Host "Ensure Habitat is Running"
If ((Get-Service Habitat).Status -ne 'Running') {
    Write-Host "Start the Habitat Service"
    Start-Service -Name "Habitat"

    Write-Host "Wait for the Habitat Supervisor to Complete Startup"
    Start-Sleep -s 20
}