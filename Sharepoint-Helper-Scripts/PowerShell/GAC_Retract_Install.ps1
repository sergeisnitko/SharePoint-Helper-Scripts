# This commands script file adds or removes dll form GAC
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 4/11/2014

#Add a DLL to the GAC
Set-location "c:\Folder Path"            
[System.Reflection.Assembly]::Load("System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")            
$publish = New-Object System.EnterpriseServices.Internal.Publish            
$publish.GacInstall("c:\Folder Path\DLL.dll")            
iisreset

#Remove DLL to the GAC
Set-location "c:\Folder Path"            
[System.Reflection.Assembly]::Load("System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")            
$publish = New-Object System.EnterpriseServices.Internal.Publish            
$publish.GacRemove("c:\Folder Path\DLL.dll")            
iisreset