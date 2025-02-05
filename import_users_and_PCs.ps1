Import-Module ActiveDirectory
Import-Module DSInternals

$users = Get-Content ".\users.json" | ConvertFrom-Json

# Розділяємо користувачів та комп'ютери по значенню в реквізиті "DistinguishedName"
$userAccounts = $users | Where-Object { $_.DistinguishedName -match "CN=Users" }
$computerAccounts = $users | Where-Object { $_.DistinguishedName -match "CN=Computers" }

# Доменна структура (заменіть на свої дані)
$domain = "net1"
$ouUsers = "CN=Users,DC=$($domain),DC=local"
$ouComputers = "CN=Computers,DC=$($domain),DC=local"

# --- Створюємо користувачів ---
foreach ($user in $userAccounts) {
    New-ADUser -Name $user.DisplayName `
        -GivenName $user.GivenName `
        -Surname $user.Surname `
        -UserPrincipalName $user.UserPrincipalName `
        -SamAccountName $user.SamAccountName `
        -Path $ouUsers `
        -Enabled $true `
        -PasswordNeverExpires $true `
        -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force)
}

# --- Створюємо комп'ютерів ---
foreach ($computer in $computerAccounts) {
    New-ADComputer -Name $computer.SamAccountName `
        -SamAccountName $computer.SamAccountName `
        -Path $ouComputers `
        -Enabled $true
}

# --- Відновлюємо хеші паролів користувачам ---
foreach ($user in $userAccounts) {
    Set-SamAccountPasswordHash -SamAccountName $user.SamAccountName -NtHash $user.NTHash -Domain $domain
}
