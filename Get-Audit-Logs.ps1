Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionID "<your-subscription-id>"

$rg = Get-AzureRmResourceGroup | Out-GridView -PassThru 
Get-AzureRmLog -ResourceGroup $rg.ResourceGroupName -StartTime (Get-Date).AddMinutes(-60) -EndTime (Get-Date)