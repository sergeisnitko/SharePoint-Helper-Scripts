# This commands script file activates the property for automatic update of ctag for js files mapped through JSLink and other standard methods. This really helps to solve client cache problems
# Author: Sergei Snitko
# Blog: http://blog.arvosys.ru/
# Last Update : 10/14/2015

$webUrl = http://portal.domain.local/
$listTitle = "MyList";

$web = Get-SPWeb $webUrl;
$list = $web.Lists[$listTitle];
$list.NeedUpdateSiteClientTag = $true;
$list.Update();