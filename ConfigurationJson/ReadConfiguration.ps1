$Config = Get-Content -Path "Config.json" -Raw | ConvertFrom-Json

$ServerList = $Config.ServerList

foreach ($Server in $ServerList) {
    $ServerName = $Server.ServerName
    $Customer = $Server.Customer
    $Shared = $Server.Shared
    $CustomerSelection = $Server.CustomerSelection

    Write-Host "Processing server: $($ServerName)"
    Write-Host "Customer: $($Customer)"
    Write-Host "Shared: $($Shared)"

    if (($Shared -eq $true) -and ($CustomerSelection.Count -gt 0)) {
        Write-Host "Customer Selection:"
        foreach ($Selection in $CustomerSelection) {
            Write-Host "  - Condition: $($Selection.Condition), Pattern: $($Selection.Pattern), Customer: $($Selection.Customer)"
        }   
    }

    Write-Host "-----------------------------------"
}