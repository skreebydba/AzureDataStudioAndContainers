USE master;

SELECT percent_complete, estimated_completion_time
FROM sys.dm_exec_requests
WHERE percent_complete > 0;