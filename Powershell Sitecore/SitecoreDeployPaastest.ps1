$SCSDK="D:\AZURE-PAAS\SitecoreAzureToolkit2.0.1rev.171218\tools\Sitecore.Cloud.Cmdlets.psm1"
$SCTemplates="https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%209.0.1/XP"
$DeploymentId = "sitecoredeploytstnew3"
$ResourceGroup = "sitecoredeploytstnew3"
$LicenseFile = "C:\Sitecore\license\license.xml"
$CertificateFile = "D:\A1295DE35DBD1C629D41245EC5ACA1A416596682.pfx"
$SubscriptionId = "392ed28e-5c9a-46b8-8d7a-f67e480b9bf0"
$Location= "Brazil South"
$ParamFile="D:\AZURE-PAAS\XP\azuredeploy.parameters.json"
$Parameters = @{
"deploymentId"=$DeploymentId;
"authCertificateBlob" = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($CertificateFile))
}
Import-Module $SCSDK
Add-AzureRMAccount -UseDeviceAuthentication
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl $SCTemplates/azuredeploy.json -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -SetKeyValue $Parameters -Verbose
