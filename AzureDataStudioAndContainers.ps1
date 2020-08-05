docker pull mcr.microsoft.com/mssql/server:2019-latest

$password = 'JuanS0t022';
$containername = 'sqlserver2019';
$port = 1436;
$image = 'mcr.microsoft.com/mssql/server:2019-latest';
docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$password" -e MSSQL_AGENT_ENABLED=True --name $containername -p "$port`:1433" -d $image;

docker exec sqlserver2019 mkdir /var/opt/mssql/backup
docker cp wwi.bak sqlserver2019:/var/opt/mssql/backup

$cred = Get-Credential -UserName sa -Message "Enter the password for the sa account."
Invoke-Sqlcmd -ServerInstance "localhost,1436" -Database master -Credential $cred -Query "SELECT @@VERSION;" | Out-GridView;

$cred = Get-Credential -UserName sa -Message "Enter Password"; 
<# Restore WideWorldImporters using Invoke-Sqlcmd #>
$query = @"
USE [master]
RESTORE DATABASE [WideWorldImporters] 
FROM  DISK = N'/var/opt/mssql/backup/wwi.bak' 
WITH  FILE = 1,  
MOVE N'WWI_Primary' TO N'/var/opt/mssql/data/WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'/var/opt/mssql/data/WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'/var/opt/mssql/data/WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1' TO N'/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',  
NOUNLOAD,  
REPLACE,
STATS = 5;
"@

Invoke-Sqlcmd -ServerInstance "localhost,1436" -Database master -Credential $cred -Query $query;

$cred = Get-Credential -UserName sa -Message "Enter the password for the sa account"
Invoke-Sqlcmd -ServerInstance "localhost,1436" -Database master -Credential $cred -InputFile "C:\Users\fgill\Documents\GitHub\AzureDataStudioAndContainers\MaintenanceSolution.sql";

$cred = Get-Credential -UserName sa -Message "Enter the password for the sa account"
Invoke-Sqlcmd -ServerInstance "localhost,1436" -Database master -Credential $cred -InputFile "C:\Users\fgill\Documents\GitHub\AzureDataStudioAndContainers\ScheduleMaintenanceSolution.sql";