#змініть назву домену на свою
$domain = "net1"

$users = Get-ADReplAccount -All -Server "$($domain).local"
$users | ConvertTo-Json | Out-File ".\users.json"
