# Define your webhook URL and the message content
$webhookUrl = "https://discord.com/api/webhooks/1282390179981689064/U_QuvqQdGWdCA29tlsvg2Q5pK2pZNvWh1dbPeLLkryxrOFJ8BDR79ojicbbDxytJBSJ2"
$message = "**# ACTIVITY CHECK**`n`nDay 1`n`nGoal: 10 reacts`n`n@everyone"

# Prepare the JSON payload
$jsonPayload = @{
    content = $message
} | ConvertTo-Json

# Send the message to Discord
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType "application/json"
