# Define the file to store the current day count
$dayFile = "C:\users\layth\Desktop\daycount.txt"

# Check if the file exists, if not, create it with an initial value of 7
if (-not (Test-Path $dayFile)) {
    Set-Content -Path $dayFile -Value "7"
}

# Read the current day from the file
$currentDay = Get-Content -Path $dayFile

# Define your test webhook URL and the message content
$webhookUrl = "https://discord.com/api/webhooks/1282391223201562694/GJBv2dQfGo5VVCDiWyDWNR_NUFlyJz6h-SQ_zy0zw-9SPw_yX_7gJm_ADBzEIwhajiJI"
$message = "**# ACTIVITY CHECK**`n`nDay $currentDay`n`nGoal: 9 reacts`n`n@everyone"

# Prepare the JSON payload
$jsonPayload = @{
    content = $message
} | ConvertTo-Json

# Send the message to Discord
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType "application/json"

# Increment the day by 1
$newDay = [int]$currentDay + 1

# Update the file with the new day value
Set-Content -Path $dayFile -Value $newDay
