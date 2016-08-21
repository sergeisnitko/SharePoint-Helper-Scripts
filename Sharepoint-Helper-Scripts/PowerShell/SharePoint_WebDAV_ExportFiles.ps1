# This commands script file exports files assets (files) from folders in SharePoint to file system with WebDAV
# Author: Andrew Koltyakov
# Blog: http://blog.arvosys.ru/
# Last Update : 8/21/2016

$CopyFrom = "\\demo.sharepoint.com\DavWWWRoot\"
$CopyTo = "C:\Users\demo_user\Downloads\Assets_backup_2016-05-13\"
$Folders = @(
    "SiteAssets\SPF",
    "Style Library\Platypus",
    "_catalogs\masterpage\Platypus",
    "_catalogs\masterpage\SPF_Assets",
    "_catalogs\masterpage\Display Templates"
)

function Create-Folder
{
    param( [string]$Folder )
    if (!(test-path $Folder)) { 
        new-item $Folder -type Directory 
    }
}

foreach ($Folder in $Folders) {
    $NewFolder = $CopyTo + $Folder
    Create-Folder $NewFolder
}

foreach ($Folder in $Folders) {
    $FromFolder = $CopyFrom + $Folder
    $ToFolder = $CopyTo + $Folder
    $ParentFolder = [string]::Join('\', $ToFolder.Split('\')[0..$($ToFolder.Split('\').Length-2)])
    Write-Host "Copying " + $FromFolder + " to " + $ParentFolder
    Copy-Item $FromFolder $ParentFolder -recurse -force
}