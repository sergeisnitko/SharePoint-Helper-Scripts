# This commands script file exports all solutions in the farm
# Author: Sergei Snitko
# Blog: http://blog.cibpoint.ru/
# Last Update : 4/11/2014

function BackUpSolutions($BackupDirectory)
{
	$DateFolderName = Get-Date -format "yyyyMMddHHmmss"
	$FBackupDirectory = "$BackupDirectory\\$DateFolderName"
	New-Item -ItemType Directory -Force -Path "$BackupDirectory" | Out-Null
	
	
	Write-Host "$BackupDirectory - Export Started " -ForegroundColor Yellow
	foreach ($Solution in Get-SPSolution) 
	{ 
		$DeploymentState = $Solution.DeploymentState
		
		if (($DeploymentState -eq "GlobalDeployed") -or ($DeploymentState -eq "GlobalAndWebApplicationDeployed"))
		{
			$GlobalDirectory = "Global"
			$SubDirectory = "$FBackupDirectory\\$GlobalDirectory"
			New-Item -ItemType Directory -Force -Path "$SubDirectory" | Out-Null
		
			ExportSolution $Solution $SubDirectory
		}
		
		if (($DeploymentState -eq "WebApplicationDeployed") -or ($DeploymentState -eq "GlobalAndWebApplicationDeployed"))
		{
			$DeployedWebApplications = $Solution.DeployedWebApplications		
			
			foreach ($Application in $DeployedWebApplications)
			{
				$ApplicationName = $Application.DisplayName
				$SubSDirectory = "$FBackupDirectory\\$ApplicationName"
							
				New-Item -ItemType Directory -Force -Path "$SubSDirectory" | Out-Null
				
				ExportSolution $Solution $SubSDirectory
			}
		}
		
	}
}

function ExportSolution($Solution, $SubDirectory)
{
	$Id = $Solution.SolutionID 
	$Title = $Solution.Name 
	$Filename = $Solution.SolutionFile.Name

	try { 
		$Solution.SolutionFile.SaveAs("$SubDirectory\\$Filename")
		Write-Host "Directory: $SubDirectory , Solution: $Title - Exported" -ForegroundColor Green
	} 
	catch 
	{ 
		Write-Host "Directory: $SubDirectory , Solution: $Title - Error $_" -ForegroundColor Red
	} 		

}

BackUpSolutions "C:\\Temp\\wsp"