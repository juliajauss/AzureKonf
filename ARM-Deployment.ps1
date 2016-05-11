Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionID "<your-subscription-id>"

$deplName = "VConfDemoARMStorage"
$ressourceGroupName = "VConfARMStorageDemo"

New-AzureRmResourceGroup -Name $ressourceGroupName -Location "westeurope" -force
New-AzureRmResourceGroupDeployment -Name $deplName -ResourceGroupName $ressourceGroupName -TemplateFile "https://github.com/rjmax/ArmExamples/blob/master/existingStorageAccount.json"