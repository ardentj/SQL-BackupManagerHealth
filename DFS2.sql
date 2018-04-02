select mea.BaseManagedEntityId,MonitorId,MonitorName,IsAvailable,AvailabilityLastModified,
Path, healthstate, sv.LastModified from OperationsManager.dbo.ManagedEntityAvailabilityView mea
inner join OperationsManager.dbo.BaseManagedEntity b on mea.BaseManagedEntityId = b.BaseManagedEntityId
inner join OperationsManager.dbo.StateView sv on sv.BaseManagedEntityId = mea.BaseManagedEntityId
inner join OperationsManager.dbo.ManagedTypeView mtv on mtv.Id = b.BaseManagedTypeId
where mtv.Name = 'Microsoft.SystemCenter.HealthService' and MonitorName Like 'System.Health.%' and IsAvailable != 0
