DECLARE @constraint_name VARCHAR(50)
SET @constraint_name = ''
SELECT @constraint_name = SysObjects.[Name]
      FROM SysObjects INNER JOIN (SELECT [Name],[ID] FROM SysObjects WHERE XType = 'U') AS Tab
      ON Tab.[ID] = Sysobjects.[Parent_Obj]
      INNER JOIN sysconstraints ON sysconstraints.Constid = Sysobjects.[ID]
      INNER JOIN SysColumns Col ON Col.[ColID] = sysconstraints.[ColID] AND Col.[ID] = Tab.[ID]
      WHERE Tab.[Name] = 'R_FIN_DS'
      AND Col.[Name] = 'RCCB_AFD_Option'
      ORDER BY Tab.[Name]

PRINT @constraint_name

IF @constraint_name <> ''
      EXEC ('ALTER TABLE R_FIN_DS DROP CONSTRAINT ' + @constraint_name)
