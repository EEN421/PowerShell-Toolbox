<#
.SYNOPSIS
  Exports HTML reports for all Group Policy Objects (GPOs) in the current domain.

.DESCRIPTION
  This script enumerates every Group Policy Object in the Active Directory domain
  and generates an individual HTML report for each one using Get-GPOReport.

  Reports are written to a specified output directory, which is created automatically
  if it does not already exist. GPO display names are sanitized to ensure valid
  filesystem-safe filenames.

  The resulting HTML files provide a complete, human-readable snapshot of GPO
  configuration, making this script suitable for:
  - Active Directory audits
  - Configuration reviews
  - Change documentation
  - Backup and compliance evidence

  Export failures for individual GPOs are handled gracefully and logged as warnings,
  allowing the script to continue processing remaining objects.

.INPUTS
  None.

.OUTPUTS
  HTML files containing Group Policy configuration reports.

.EXAMPLE
  Example 1: Export all GPOs to the default folder
  ----------------------------------------------
  PS> .\Export-GPOHtmlReports.ps1

  Creates C:\GPOReports (if missing) and exports one HTML report per GPO.

.NOTES
  Author  : DevSecOpsDad
  Version : 1.0

  Prerequisites:
  - GroupPolicy PowerShell module
  - Domain-joined system or equivalent administrative access
  - Permissions to read all GPOs in the domain

  Behavior Notes:
  - Invalid filename characters in GPO display names are replaced with underscores.
  - Existing report files are overwritten.
  - Script continues execution if individual GPO exports fail.

#>
$reportFolder = "C:\GPOReports"
if (-not (Test-Path $reportFolder)) {
    New-Item -Path $reportFolder -ItemType Directory | Out-Null
}
 
$GPOs = Get-GPO -All
foreach ($gpo in $GPOs) {
    try {
        $safeName = ($gpo.DisplayName -replace '[\\/:*?"<>|]', '_')
        $reportPath = "$reportFolder\$safeName.html"
        Get-GPOReport -Name $gpo.DisplayName -ReportType Html -Path $reportPath
    } catch {
        Write-Warning "Failed to export report for $($gpo.DisplayName): $_"
    }

}
