<#
.SYNOPSIS
  Demonstrates nested progress bars in PowerShell using Write-Progress with -Id and -ParentId.

.DESCRIPTION
  This script simulates a two-level workload:
  - A parent loop representing batches (or phases/projects)
  - A child loop representing items (or files/tasks) within each batch

  It uses Write-Progress with:
  - -Id to uniquely identify each progress bar
  - -ParentId to nest the child bar under the parent bar
  - -Completed to properly clear progress bars on completion

  This pattern is useful when you want meaningful progress reporting for:
  - Multiple resource groups containing many resources
  - Multiple subscriptions containing many resource groups
  - Batch processing pipelines (stages -> per-stage tasks)

.INPUTS
  None.

.OUTPUTS
  Console-based nested progress indicators.
  Informational completion message.

.EXAMPLE
  PS> .\Write-Progress-NestedDemo.ps1

  Displays a parent progress bar for batches and a nested child progress bar for items per batch.

.NOTES
  Author  : <Your Name>
  Version : 1.0

  Behavior Notes:
  - Progress bar IDs must be stable and unique per bar.
  - Child bars reference the parent bar using -ParentId.
  - Always clear the child bar before advancing the parent bar to avoid stale display artifacts.

#>

# Simulation sizes (adjust to taste)
$totalBatches = 5
$itemsPerBatch = 12

# Progress bar IDs (arbitrary but must be consistent)
$parentId = 1
$childId  = 2

for ($batch = 1; $batch -le $totalBatches; $batch++) {

    # Parent progress: overall batch completion
    $parentPercent = [math]::Round(($batch / $totalBatches) * 100, 0)

    Write-Progress `
        -Id $parentId `
        -Activity "Overall work" `
        -Status "Batch $batch of $totalBatches" `
        -PercentComplete $parentPercent `
        -CurrentOperation "Preparing batch_$batch"

    for ($item = 1; $item -le $itemsPerBatch; $item++) {

        # Child progress: per-item completion within the current batch
        $childPercent = [math]::Round(($item / $itemsPerBatch) * 100, 0)

        # Simulate work
        Start-Sleep -Milliseconds 150

        Write-Progress `
            -Id $childId `
            -ParentId $parentId `
            -Activity "Processing items (Batch $batch)" `
            -Status "Item $item of $itemsPerBatch" `
            -PercentComplete $childPercent `
            -CurrentOperation "Working on batch_$batch`_item_$item"
    }

    # Clear child progress at the end of each batch
    Write-Progress -Id $childId -ParentId $parentId -Activity "Processing items (Batch $batch)" -Completed
}

# Clear parent progress at the end
Write-Progress -Id $parentId -Activity "Overall work" -Completed

Write-Host "✔ Completed $totalBatches batches ($($totalBatches * $itemsPerBatch) total items)." -ForegroundColor Green
