# SharePoint 2013 PowerShell&Javascript helper scripts
This list of powershell and javascript scripts helps me to communicate with SharePoint with administrator tools
The main purpose of this project is to store scripts for my own use and for storing my code from blogs:
* http://blog.arvosys.ru


## PowerShell Scripts

**[SharePoint_Backup_Farm_Databases](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Backup_Farm_Databases.ps1)** - this script gets local farms databases, connects to SQL Server and backups farm databases into the structure of folders

**[ActiveDirectory_Create_Demo_Users](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/ActiveDirectory_Create_Demo_Users.ps1)** - this script creates a list of users in Active Directory by defined objects with properties

**[SharePoint_Download_Prerequisites](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Download_Prerequisites.ps1)** - this script is downloading SharePoint 2013 prerequisites to a folder for an offline instalation of SharePoint 2013

**[SharePoint_Export_Farm_Solutions](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Export_Farm_Solutions.ps1)** - this script gets all farm solutions (wsp) in current SharePoint 2013 farm and makes a structured copy in File System. It is very important like a part of backups in SharePoint

**[SharePoint_Retract_Install_Solution](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Retract_Install_Solution.ps1)** - this script retracts existed farm solution if it exists and installs the new version of solution.

**[SharePoint_Start_Install](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Start_Install.ps1)** - this script starts the installation of SharePoint with offline downloaded prerequisites

**[GAC_Retract_Install](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/GAC_Retract_Install.ps1)** - this script istalls library in to GAC and retracts it from GAC

**[SharePoint_Enable_CTag](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Enable_CTag.ps1)** - this script activates the property for automatic update of ctag for js files mapped through JSLink and other standard methods. This really helps to solve client cache problems. Thanks to [Anton Vishnyakov](https://github.com/avishnyakov) who found the solution

**[SharePoint_Enable-Disable_Document_Property_Promotion](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/SharePoint_Enable-Disable_Document_Property_Promotion.ps1)** - this script enables or disables promotion of document properties in both ways

## Javascript

**[SharePoint_Update_JSLink](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/Javascript/SharePoint_Update_JSLink.js)**- this script sets the value of JSLink for selected field in a list or a web

**[SharePoint_Publish_Files](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/Javascript/SharePoint_Publish_Files.js)**- this script publishes files in the library or folder in the library 
