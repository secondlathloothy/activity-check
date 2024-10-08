# Define the file path to store the current day count (relative path in the root directory)
$dayFile = "daycount.txt"

# Check if the file exists, if not, create it with an initial value of 1
if (-not (Test-Path $dayFile)) {
    Write-Host "Day count file not found, initializing with day 1."
    Set-Content -Path $dayFile -Value "1"
}

# Read the current day from the file and trim any extra spaces or newlines
$currentDay = (Get-Content -Path $dayFile).Trim()

# Convert the current day to an integer
$currentDay = [int]$currentDay

# Define your new Discord webhook URL
$webhookUrl = "https://discord.com/api/webhooks/1282385517505413130/TGq0D8bCLakjRfke0a2k6eYP7GubdQ4mp-7NdTHybf5GMCCoyMx2jfoR6eu1b8yLK7Wy"

# Define the message content, using the current day value
$message = "**# ACTIVITY CHECK**`n`nDay $currentDay`n`nGoal: 9 reacts`n`n@everyone"

# Log the current day and the message for debugging purposes
Write-Host "Current Day: $currentDay"
Write-Host "Message: $message"

# Prepare the JSON payload
$jsonPayload = @{
    content = $message
} | ConvertTo-Json

# Send the message to Discord
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType "application/json"

# Increment the day by 1 for the next run
$newDay = $currentDay + 1

# Update the day count in the file
Set-Content -Path $dayFile -Value $newDay

# Log the new day for verification
Write-Host "New Day: $newDay"
