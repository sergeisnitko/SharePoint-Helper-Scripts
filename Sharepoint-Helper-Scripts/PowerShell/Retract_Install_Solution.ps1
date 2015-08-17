# This commands script file retracts and installs custom solutions
# Author: Sergei Snitko
# Blog: http://blog.cibpoint.ru/
# Last Update : 4/11/2014

function RemoveSolution ($SolutionName){
    Write-Host "Removing solution $SolutionName" -ForegroundColor Yellow
    
    $Solution = Get-SPSolution -Identity $SolutionName -ErrorAction SilentlyContinue
    if($Solution -ne $null)
    {
		$SolutionDisplayName = $Solution.Name
        Write-Host "Solution found: $SolutionDisplayName" -ForegroundColor Yellow
        
        $DeploymentState = $Solution.DeploymentState
        
        Write-Host "$SolutionName was deployed as: $DeploymentState" -ForegroundColor Yellow
        
        if($DeploymentState -ne "NotDeployed")
        {
            if($DeploymentState -eq "GlobalDeployed" ){
                Uninstall-SPSolution -Identity $SolutionName -Confirm:$false
            }
            else{
                Uninstall-SPSolution -Identity $SolutionName -AllWebApplications -Confirm:$false
            }
            Write-Host -NoNewline "Retracting solution $SolutionName ..." -ForegroundColor Blue
            while($Solution.JobExists){
                Write-Host -NoNewline "..." -ForegroundColor Blue
                Start-Sleep -Seconds 3
            }
        }
		
		Write-Host ""
        Remove-SPSolution -Identity $SolutionName -Confirm:$false
        Write-Host "Removed: $SolutionName" -ForegroundColor Green
    }
	else
	{
		Write-Host "Solution $SolutionName not found" -ForegroundColor Red
	}
}

function AddSolution($WspPath, $WebApplication, $Retract)
{

	$SolutionName = GetWspNameByPath $WspPath 	
	if ($Retract)
	{
		try
		{
			RemoveSolution $SolutionName
		}
		catch{}
	}
	
	Write-Host "Installing solution $SolutionName" -ForegroundColor Yellow	
	
    $Solution = Get-SPSolution -Identity $SolutionName -ErrorAction SilentlyContinue
	
    if($Solution -eq $null)
    {
		Add-SPSolution -LiteralPath $WspPath | Out-Null
		$Solution = Get-SPSolution -Identity $SolutionName -ErrorAction SilentlyContinue
	}	
	
	$DeploymentState = $Solution.DeploymentState	
	if($DeploymentState -eq "NotDeployed")
	{
		$InstallKeys = ""
		if ($Solution.ContainsGlobalAssembly){ $InstallKeys += " -GACDeployment"}
		if ($Solution.ContainsWebApplicationResource){if ($WebApplication){$InstallKeys += " -WebApplication $WebApplication"}else{$InstallKeys += " -AllWebApplications"}}
		iex "Install-SPSolution -Identity $SolutionName $InstallKeys -Force"
		
		Write-Host -NoNewline "Installing solution $SolutionName ..." -ForegroundColor Blue
		while($Solution.JobExists){
			Write-Host -NoNewline "..." -ForegroundColor Blue
			Start-Sleep -Seconds 3
		}		
		Write-Host ""
        Write-Host "Installed: $SolutionName" -ForegroundColor Green		
	}
	else
	{
		Write-Host "Solution $SolutionName already intalled. Retract solution before install" -ForegroundColor Red		

	}	
	
}

function GetWspNameByPath($WspPath)
{
	$WspPathArr = $WspPath -split "\\"
	$WspName = $WspPathArr[$WspPathArr.length-1]
	return $WspName
}

AddSolution "C:\Temp\cib.ui.wsp" "" $true