USE HMS_Landing
GO
SELECT 
    fk.name AS ForeignKeyName,
    tp.name AS ReferencingTable,
    cp.name AS ReferencingColumn,
    tr.name AS ReferencedTable,
    cr.name AS ReferencedColumn,
	'ALTER TABLE '+ tp.name + ' DROP CONSTRAINT '+ fk.name AS DropConstraint,
	'ALTER TABLE WITH NOCHECK ' + tp.name + ' ADD CONSTRAINT '+ fk.name +' FOREIGN KEY ('+cp.name+') REFERENCES '+tr.name+'('+cr.name+')' AS AddConstraint
FROM 
    sys.foreign_key_columns AS fkc
    INNER JOIN sys.tables AS tp ON fkc.parent_object_id = tp.object_id
    INNER JOIN sys.columns AS cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
    INNER JOIN sys.tables AS tr ON fkc.referenced_object_id = tr.object_id
    INNER JOIN sys.columns AS cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id
    INNER JOIN sys.foreign_keys AS fk ON fkc.constraint_object_id = fk.object_id
WHERE 
    tr.name = 'Department' 
    AND cr.name = 'Department_ID';
