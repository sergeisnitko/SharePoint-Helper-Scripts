# This commands script file downloads Files from several directories. This script is designed for SharePoint Prerequisites
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 4/11/2014

# Important: URLs of prerequisite files can be changed at Microsoft's site - check for new links http://technet.microsoft.com/en-us/library/cc262485(v=office.15).aspx and update the array down.
$FilesList = ( 
		"http://download.microsoft.com/download/9/1/3/9138773A-505D-43E2-AC08-9A77E1E0490B/1033/x64/sqlncli.msi", # SQL Server 2008 R2 SP1 Native Client
		"http://download.microsoft.com/download/8/F/9/8F93DBBD-896B-4760-AC81-646F61363A6D/WcfDataServices.exe", # Microsoft WCF Data Services 5.0
		"http://download.microsoft.com/download/9/1/D/91DA8796-BE1D-46AF-8489-663AB7811517/setup_msipc_x64.msi", # Microsoft Information Protection and Control Client (MSIPC)
		"http://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi", # Microsoft Sync Framework Runtime v1.0 SP1 (x64) 
		"http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/r2/MicrosoftIdentityExtensions-64.msi", # Windows Identity Extensions
		"http://download.microsoft.com/download/D/7/2/D72FD747-69B6-40B7-875B-C2B40A6B2BDD/Windows6.1-KB974405-x64.msu", # Windows Identity Foundation (KB974405)
		"http://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe", #Windows Server AppFabric
		"http://download.microsoft.com/download/7/B/5/7B51D8D1-20FD-4BF0-87C7-4714F5A1C313/AppFabric1.1-RTM-KB2671763-x64-ENU.exe" # CU 1 for AppFabric 1.1 (KB2671763)
             )

function DownloadPrerequisites($FilesDirectory)
{
	$DateFolderName = Get-Date -format "yyyyMMddHHmmss"
	$FFilesDirectory = "$FilesDirectory\\$DateFolderName"
	New-Item -ItemType Directory -Force -Path "$FilesDirectory" | Out-Null
	New-Item -ItemType Directory -Force -Path "$FFilesDirectory" | Out-Null

	Import-Module BitsTransfer
	Write-Host "Downloading Module is loaded" -ForegroundColor Yellow
	Write-Host "Download started..." -ForegroundColor Yellow

	ForEach ($FileUrl in $FilesList)
	{
		$DestFileName = $FileUrl.Split('/')[-1]
	
		Try
		{	
			Write-Host -NoNewline "Downloading $DestFileName..." -ForegroundColor Green		
			If (!(Test-Path "$FFilesDirectory\$DestFileName"))
			{
				Start-BitsTransfer -Source $FileUrl -Destination $FFilesDirectory\$DestFileName -Priority High -ErrorVariable err
				If (!$err) {
					Write-Host -NoNewline "Done!" -ForegroundColor Green
					Write-Host ""
				}
			}
			Else
			{
				Write-Host -NoNewline "Skipping. File exists" -ForegroundColor Blue
				Write-Host ""
			}
		}
		Catch
		{
				Write-Host -NoNewline "Error" -ForegroundColor Red
				Write-Host ""
		}
	}
}

DownloadPrerequisites "C:\\Temp\\p"