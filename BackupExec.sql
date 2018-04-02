SELECT TOP 10 [AlertMessage], [AlertTitle], [AlertDate] FROM [BEDB].[dbo].[Alert] where SourceType = 196608
ORDER BY AlertDate DESC

SELECT TOP 35 [Endtime], [JobName], [IsJobActive], [FinalJobStatus], [FinalErrorCode] FROM [BEDB].[dbo].vwJobHistory
ORDER BY EndTime DESC
