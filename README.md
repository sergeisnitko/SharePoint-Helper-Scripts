# SharePoint 2013 PowerShell&Javascript helper scripts
This list of powershell and javascript scripts helps me to communicate with SharePoint with administrator tools
The main purpose of this project is to store scripts for my own use and for storing my code from blogs:
* http://blog.cibpoint.ru
* http://blog.snits.ru


## PowerShell Scripts

**[Backup_Farm_Databases](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Backup_Farm_Databases.ps1)** - this script gets local farms databases, connects to SQL Server and backups farm databases into the structure of folders

**[Create_Demo_Users_AD](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Create_Demo_Users_AD.ps1)** - this script creates a list of users in Active Directory by defined objects with properties

**[Download_SharePoint_Prerequisites](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Download_SharePoint_Prerequisites.ps1)** - this script is downloading SharePoint 2013 prerequisites to a folder for an offline instalation of SharePoint 2013

**[Export_Farm_Solutions](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Export_Farm_Solutions.ps1)** - this script gets all farm solutions (wsp) in current SharePoint 2013 farm and makes a structured copy in File System. It is very important like a part of backups in SharePoint

**[Retract_Install_Solution](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Retract_Install_Solution.ps1)** - this script retracts existed farm solution if it exists and installs the new version of solution.

**[Start_Install](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/PowerShell/Start_Install.ps1)** - this script starts the installation of SharePoint with offline downloaded prerequisites


## Javascript

**[UpdateJSLink](https://github.com/sergeisnitko/SharePoint-Helper-Scripts/blob/master/Sharepoint-Helper-Scripts/Javascript/UpdateJSLink.js)**- this script sets the value of JSLink for selected field in a list or a web
