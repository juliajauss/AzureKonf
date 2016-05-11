#Login to Azure Account
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionID "<your-subscription-id>"
Save-AzureRmProfile -Path .\juleProfile.json

#Neue Ressourcengruppe
$location = "WestEurope"
$resourceGroupName = "VConfStorageDemo"
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location 

#Storage Account Params
$name = "julevconfstorage"
$type = "Standard_LRS"
$amount = 10
$nums = (2..$amount)

#Define Function for creating a Storage Account
$ScriptBlock = {
    function NewStorageAccount 
    {
        param([String]$resourceGroupName, [String]$StorageAccountName, [String]$location, [String]$type)
        Select-AzureRmProfile -Path .\juleProfile.json
        New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName –StorageAccountName $StorageAccountName -Location $location -Type $type
    }
}

#Create #nums Storage Accounts! 
foreach ($num in $nums)
{
    $StorageAccountName = $name + $num
    Start-Process -FilePath powershell.exe -ArgumentList "-NoExit -Command & {$ScriptBlock NewStorageAccount $resourceGroupName $StorageAccountName $location $type}"
}




