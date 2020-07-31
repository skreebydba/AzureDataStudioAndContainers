USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name = N'DatabaseBackup - USER_DATABASES - FULL', @name=N'Full Backup - Weekly', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20200730, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'DatabaseBackup - USER_DATABASES - DIFF', @name=N'Diff Backups - Daily, Except Sunday', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=126, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20200731, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO


USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name = N'DatabaseBackup - USER_DATABASES - LOG', @name=N'User Log Backup - Every 15 minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20200730, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name = N'DatabaseIntegrityCheck - USER_DATABASES', @name=N'User Integrity Check - Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20200730, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name = N'IndexOptimize - USER_DATABASES', @name=N'User Index Optimize - Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20200730, 
		@active_end_date=99991231, 
		@active_start_time=30000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

