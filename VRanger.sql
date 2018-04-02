SELECT tv.Name AS 'Job Name', js.Name AS 'Job Status', k.VmName AS 'VM Name', ks.Name AS 'Task Status', k.StartTime AS 'Start Time', k.EndTime AS 'End Time', DATEDIFF(minute, k.StartTime, k.EndTime) AS 'Duration (min)', Replace(spt.Name,'None','Full') AS 'Backup Type', sp.SizeInMbOriginal AS 'Original Size (MB)', sp.SizeInMbStored AS 'Stored Size (MB)', (ISNULL(j.Error + ' ','') + ISNULL(k.Error,'')) AS 'Job/Task Error'
FROM Job j
INNER JOIN TemplateVersion tv ON j.TemplateVersionId = tv.TemplateVersionId

INNER JOIN JobStatus js ON j.JobStatusId = js.JobStatusId
LEFT JOIN Task k ON j.JobId = k.JobId
LEFT JOIN TaskStatus ks ON k.TaskStatusId = ks.TaskStatusId
LEFT JOIN BackupTask bk ON k.TaskId = bk.TaskId
LEFT JOIN SavePoint sp ON bk.SavePointId = sp.SavePointId
LEFT JOIN SpaceSavingType spt ON sp.SpaceSavingTypeId = spt.SpaceSavingTypeId
	
WHERE j.StartTime > GETDATE()-1
ORDER BY j.StartTime
