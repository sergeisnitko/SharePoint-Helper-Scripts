# This commands script file enables or disables promotion of document properties in both ways
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 04/03/2016

cls
Add-PSSnapIn -Name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
$WebUrl = "http://portal.domain.local/"

$Web = Get-SPWeb $WebUrl;
## Set the ParserEnabled property to False to disable the document property promotion, True to enable
$web.ParserEnabled=$false
$web.Update()   