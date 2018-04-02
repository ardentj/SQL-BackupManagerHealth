SELECT * FROM [OperationsManager].[dbo].[AlertView] WHERE TimeRaised is not NULL and ResolvedBy is NULL ORDER BY LastModified DESC;


select mea.BaseManagedEntityId,MonitorId,MonitorName,IsAvailable,AvailabilityLastModified,
Path, healthstate, sv.LastModified from ManagedEntityAvailabilityView mea
inner join BaseManagedEntity b on mea.BaseManagedEntityId = b.BaseManagedEntityId
inner join StateView sv on sv.BaseManagedEntityId = mea.BaseManagedEntityId
inner join ManagedTypeView mtv on mtv.Id = b.BaseManagedTypeId
where mtv.Name = 'Microsoft.SystemCenter.HealthService' and MonitorName Like 'System.Health.%' and IsAvailable != 0
