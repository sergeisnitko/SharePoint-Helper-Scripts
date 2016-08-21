# This commands script file executes PrerequisiteInstaller for SharePoint with Instalation files as params
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 4/11/2014

function StartInstall($Path){  
	Start-Process "$Path\PrerequisiteInstaller.exe" -ArgumentList "/SQLNCli:$Path\PrerequisiteInstallerFiles\sqlncli.msi /IDFX:$Path\PrerequisiteInstallerFiles\Windows6.1-KB974405-x64.msu /IDFX11:$Path\PrerequisiteInstallerFiles\MicrosoftIdentityExtensions-64.msi /Sync:$Path\PrerequisiteInstallerFiles\Synchronization.msi /AppFabric:$Path\PrerequisiteInstallerFiles\WindowsServerAppFabricSetup_x64.exe /KB2671763:$Path\PrerequisiteInstallerFiles\AppFabric1.1-RTM-KB2671763-x64-ENU.exe /MSIPCClient:$Path\PrerequisiteInstallerFiles\setup_msipc_x64.msi /WCFDataServices:$Path\PrerequisiteInstallerFiles\WcfDataServices.exe"
}

StartInstall "C:\distrib\04.04.2014\SW_DVD5_SharePoint_Server_2013_64Bit_Russian_MLF_X18-55512-st"