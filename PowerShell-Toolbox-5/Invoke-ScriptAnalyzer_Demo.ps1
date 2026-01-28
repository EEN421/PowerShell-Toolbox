<#
.SYNOPSIS
  Demonstrates installing (if needed) and running PSScriptAnalyzer against a sample script,
  then presenting the analysis results in a readable console format.

.DESCRIPTION
  This script is a teaching utility designed to show how Invoke-ScriptAnalyzer can be used
  to detect common PowerShell style, correctness, and maintainability issues.

  It performs the following actions:
  - Verifies whether the PSScriptAnalyzer module is available and installs it if missing
  - Writes an intentionally problematic PowerShell script to a temporary file
  - Executes Invoke-ScriptAnalyzer against the generated script
  - Displays any findings (rule name, severity, line number, and message) in a table

  This pattern is directly applicable to:
  - CI/CD validation steps
  - Pre-commit linting
  - Code review automation
  - Standardization of scripts intended for production use

.PARAMETER ScriptPath
  Not parameterized in this example.
  The script writes a sample file to $env:TEMP\TestScript.ps1 by default.

.INPUTS
  None.

.OUTPUTS
  Console output summarizing Script Analyzer findings.
  Returns Script Analyzer result objects when issues are found.

.EXAMPLE
  Example 1: Run the Script Analyzer demonstration
  -----------------------------------------------
  PS> .\Invoke-ScriptAnalyzer-Demo.ps1

  Installs PSScriptAnalyzer (if required), generates a sample script in the TEMP directory,
  analyzes it, and prints the findings.

.NOTES
  Author  : DevSecOpsDad
  Version : 1.0

  Prerequisites:
  - PowerShellGet access to install modules (if PSScriptAnalyzer is not already installed)

  Behavior Notes:
  - Module installation is performed under the current user scope.
  - The generated sample script is intentionally non-compliant to produce analyzer output.
  - The TEMP file is overwritten if it already exists.

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
