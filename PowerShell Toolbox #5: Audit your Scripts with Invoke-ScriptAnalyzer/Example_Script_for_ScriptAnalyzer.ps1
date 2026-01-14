# ----------------------------------------------------------------------
# Example: Demonstrate Write-Progress in PowerShell
# Description: Simulates processing 10 files with progress updates.
# ----------------------------------------------------------------------

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