# This commands script file creates demo users in Active Directory
# Author: Sergei Snitko
# Blog: http://blog.cibpoint.ru/
# Last Update : 4/11/2014

cls


Import-Module ActiveDirectory

$users = @(
@{
	Name="demouser01"; 
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Витольд";
	LastName="Григорьев";
	Password="7ygvcft^"; 
	Email="demouser01@org.ru";
	Company="Организация";
	JobTitle="Генеральный директор";
	Department="Администрация";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser02"; 
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Антуан";
	LastName="Воронов";
	Password="7ygvcft^"; 
	Email="demouser02@org.ru";
	Company="Организация";
	JobTitle="Заместитель генерального директора";
	Department="Администрация";
	Manager="demouser01";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser03"; 
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Воислав";
	LastName="Шаров";
	Password="7ygvcft^"; 
	Email="demouser03@org.ru";
	Company="Организация";
	JobTitle="Администратор";
	Department="Административно-хозяйственный отдел";
	Manager="demouser02";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser04"; 
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Афанасий";
	LastName="Трофимов";
	Password="7ygvcft^"; 
	Email="demouser04@org.ru";
	Company="Организация";
	JobTitle="Администратор";
	Department="Административно-хозяйственный отдел";
	Manager="demouser02";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser05"; 
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Антонина";
	LastName="Боброва";
	Password="7ygvcft^"; 
	Email="demouser05@org.ru";
	Company="Организация";
	JobTitle="Финансовый директор";
	Department="Финансовая дирекция";
	Manager="demouser01";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser06"; 
	Email="demouser06@org.ru";	
	Manager="demouser05";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Мальвина";
	LastName="Быкова";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Секретарь-референт";
	Department="Финансовая дирекция";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser07"; 
	Email="demouser07@org.ru";	
	Manager="demouser05";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Альбина";
	LastName="Беляева";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Экономит";
	Department="Финансово-экономический отдел";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser08"; 
	Email="demouser08@org.ru";	
	Manager="demouser05";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Ибрагим";
	LastName="Громов";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Экономист";
	Department="Финансово-экономический отдел";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser09"; 
	Email="demouser09@org.ru";	
	Manager="demouser05";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Леонард";
	LastName="Гаскаров";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Экономист";
	Department="Финансово-экономический отдел";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser10"; 
	Email="demouser10@org.ru";	
	Manager="demouser05";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Владимир";
	LastName="Мясников";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Главный бухгалтер";
	Department="Бухгалтерия";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
},
@{
	Name="demouser11"; 
	Email="demouser11@org.ru";	
	Manager="demouser10";	
	Path="OU=Сотрудники,DC=organization,DC=ru"; 
	FirstName="Борислав";
	LastName="Большаков";
	Password="7ygvcft^"; 
	Company="Организация";
	JobTitle="Бухгалтер";
	Department="Отдел труда и заработной платы";
	HomePhone="123 45 67";
	Office="229";
	telephoneNumber="765 43 21";
	Fax="765 43 22";
	City="Санкт-Петербург";
	MobilePhone="+7 921 211 21 21";
	Birthday = "1983/09/14";
	WorkStarted = "1983/09/14";
	InnerPhone = "002";
	Address = "10-я Красноармейская д.15"
}
);


foreach ($user in $users){
    $Puser = "";
    $Login = $user.Name;
    $DisplayName = $user.FirstName+' '+$user.LastName;
    $ManagerLogin = $user.Manager;
    $NUser = Get-ADUser -Filter "(sAMAccountName -eq '$Login')";
    if ($ManagerLogin.length){
        $Puser = Get-ADUser -Filter "(sAMAccountName -eq '$ManagerLogin')";
        if ($Puser -ne $Null){
            $ManagerLogin = $Puser.distinguishedName;
        }
        
    }


    If ($NUser -eq $Null) {
        $NUser = New-ADUser -Name $DisplayName `
               -Path  $user.Path `
               -SamAccountName $Login `
               -DisplayName $DisplayName `
               -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
               -ChangePasswordAtLogon $false `
               -Enabled $true
        $NUser = Get-ADUser -Filter "(sAMAccountName -eq '$Login')";
    }

    $NUser.givenName = $user.FirstName;
    $NUser.sn = $user.LastName;
    $NUser.EmailAddress = $user.Email;
    $NUser.DisplayName = $DisplayName;
    $NUser.Company = $user.Company;
    $NUser.title = $user.JobTitle;
    $NUser.Department = $user.Department;
    
    
    $NUser.homePhone = $user.HomePhone;
    $NUser.physicalDeliveryOfficeName = $user.Office
    $NUser.telephoneNumber = $user.telephoneNumber;
    $NUser.facsimileTelephoneNumber = $user.Fax;
    $NUser.l = $user.City;
    $NUser.mobile = $user.MobilePhone;
    $NUser.msTSExpireDate3 = $user.Birthday;
    $NUser.msTSExpireDate4 = $user.WorkStarted;
    $NUser.pager = $user.InnerPhone;
    $NUser.streetAddress = $user.Address


    if ($ManagerLogin.length){
        $NUser.Manager = $ManagerLogin;
     }

    
    Set-ADUser -Instance $NUser;

    Write-Host $user.Name "Created Succesfully" -ForegroundColor Green

    
}