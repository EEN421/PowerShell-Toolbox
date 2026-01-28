<#
.SYNOPSIS
  Demonstrates the use of Write-Progress to display real-time progress
  during iterative PowerShell operations.

.DESCRIPTION
  This script simulates the processing of a fixed number of items and
  uses Write-Progress to render a dynamic progress bar in the console.

  It illustrates:
  - How to calculate percent completion for a loop
  - How to update Activity, Status, PercentComplete, and CurrentOperation
  - How to properly clear the progress bar upon completion

  Although the script simulates work using Start-Sleep, the pattern shown
  is directly applicable to real-world scenarios such as:
  - File processing
  - Resource enumeration
  - Long-running administrative tasks
  - Data collection or transformation loops

.INPUTS
  None.

.OUTPUTS
  Console-based progress indicator.
  Informational completion message.

.EXAMPLE
  Example 1: Run the progress demonstration
  ----------------------------------------
  PS> .\Write-Progress-Demo.ps1

  Displays a progress bar while simulating the processing of multiple items.

.NOTES
  Author  : DevSecOpsDad
  Version : 1.0

  Behavior Notes:
  - Progress is updated once per loop iteration.
  - The progress bar is explicitly cleared using the -Completed switch.
  - Timing is simulated using Start-Sleep for demonstration purposes only.

#>

# Define how many files to simulate
$totalFiles = 10

# Start the main loop
for ($i = 1; $i -le $totalFiles; $i++) {

    # Calculate percentage completion
    $percentComplete = [math]::Round(($i / $totalFiles) * 100, 0)

    # Simulate "processing" by waiting a short time
    Start-Sleep -Milliseconds 500

    # Display the progress bar
    Write-Progress `
        -Activity "Processing files..." `               # Main task name
        -Status "Processing file $i of $totalFiles" `   # Current status line
        -PercentComplete $percentComplete `             # Percent progress
        -CurrentOperation "Working on file_$i.txt"      # More detailed info
}

# Once the loop completes, clear the progress bar
Write-Progress -Activity "Processing files..." -Completed

# Optional: Confirm completion

Write-Host "✔ All $totalFiles files have been processed successfully!"

