SELECT TOP 1 [Severity], [ResolvedTime] FROM [DPMDB_HELPING_DPM].[dbo].[vw_DPM_Alerts] WHERE ResolvedTime IS NULL ORDER BY Severity ASC;
