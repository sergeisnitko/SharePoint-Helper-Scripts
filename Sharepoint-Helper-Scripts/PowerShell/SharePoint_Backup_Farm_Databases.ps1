# This commands script file creates backups for all databases in SharePoint Farm
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 4/11/2014
Add-PSSnapIn -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

function BackUpSharePointBases($BackupDirectory)
{
	$DateFolderName = Get-Date -format "yyyyMMddHHmmss"
	$FBackupDirectory = "$BackupDirectory\\$DateFolderName"
	New-Item -ItemType Directory -Force -Path "$BackupDirectory" | Out-Null
	New-Item -ItemType Directory -Force -Path "$FBackupDirectory" | Out-Null
	
	Write-Host "$FBackupDirectory - Backup Databases Started " -ForegroundColor Yellow

	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null

	foreach($DataBase in Get-SPDatabase){	
		$DataBaseName = $DataBase.Name
		$ServerName = $DataBase.ServiceInstance.DisplayName
		$FFBackupDirectory = "$FBackupDirectory\\$ServerName"
		
		New-Item -ItemType Directory -Force -Path "$FFBackupDirectory" | Out-Null
	
		$file = "$FFBackupDirectory\\$DataBaseName"
		$CurrentStamp = Get-Date -format "HH:mm:ss"
		Write-Host "$CurrentStamp - $ServerName - $DataBaseName Started... " -ForegroundColor Blue
		
		$connection = New-Object "Microsoft.SqlServer.Management.Common.ServerConnection"		
		$connection.ServerInstance = $DataBase.ServiceInstance.DisplayName

		$server = New-Object "Microsoft.SqlServer.Management.Smo.Server" $connection
		$backup = New-Object "Microsoft.SqlServer.Management.Smo.backup"
		$backup.Action = 'Database'

		$device = New-Object ('Microsoft.SqlServer.Management.Smo.BackupDeviceItem') ($file, 'File')

		$backup.MediaDescription = "Disk"
		$backup.Database= $DataBase.Name
		$backup.Devices.Add($device)
		$backup.SqlBackup($server)
		$CurrentStamp = Get-Date -format "HH:mm:ss"
		Write-Host "$CurrentStamp - $ServerName - $DataBaseName Finished! " -ForegroundColor Green
	}
	Write-Host "All Backups Finished! " -ForegroundColor Blue
}

BackUpSharePointBases "\\my-server\backup\tmp\"