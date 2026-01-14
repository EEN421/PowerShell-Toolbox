<#
.SYNOPSIS
    Demonstration of Invoke-ScriptAnalyzer
.DESCRIPTION
    This example creates a sample PowerShell script filled with
    intentional "teachable moments" and then analyzes it using
    Script Analyzer.
#>

# Step 0 — Make sure PSScriptAnalyzer is available
if (-not (Get-Module -ListAvailable -Name PSScriptAnalyzer)) {
    Write-Host "Installing PSScriptAnalyzer..." -ForegroundColor Cyan
    Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser
}

# Step 1 — Create a bad example script
$ScriptPath = "$env:TEMP\TestScript.ps1"

@"
# This script intentionally contains several PowerShell sins 

param(\$inputParam)

Write-Host "Hello world"
if(\$inputParam -eq "test")
{
write-output "Running test..."
}
else
{
write-output "Done"
}
"@ | Set-Content -Path $ScriptPath

Write-Host "Created test script at $ScriptPath" -ForegroundColor Green

# Step 2 — Run the analyzer
Write-Host "`n🔍 Running Invoke-ScriptAnalyzer..." -ForegroundColor Yellow
$results = Invoke-ScriptAnalyzer -Path $ScriptPath

# Step 3 — Display results
if ($results) {
    Write-Host "`n⚠ Issues found:" -ForegroundColor Red
    $results | Format-Table RuleName, Severity, Line, Message -AutoSize
}
else {
    Write-Host "✔ No issues found — you're a PowerShell wizard." -ForegroundColor Green
}