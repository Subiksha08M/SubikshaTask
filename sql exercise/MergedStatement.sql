DECLARE @json varchar(max)
SET  @json =
'[{"ProductId":"90","ProductName":"subi","Price":"30000"},
{"ProductId":"2","ProductName":"ram","Price":"2000"},
{"ProductId":"3","ProductName":"","Price":"30000"}]'
DROP table IF EXISTS #temp
select * into #temp FROM OPENJSON(@json)
with(
 productID int '$.ProductId',
 ProductName varchar(255) '$.ProductName',
 Price decimal(10,2) '$.Price'
);
select * from #temp

--from temp to sourcetable
MERGE into SourceProducts AS Target
    USING #temp AS Source
    ON Source.ProductId = Target.ProductId

        WHEN MATCHED THEN UPDATE SET
        Target.ProductName	= Source.ProductName,
        Target.Price		= Source.Price
    -- For Inserts
    WHEN NOT MATCHED BY Target THEN
        INSERT (ProductID,ProductName, Price) 
        VALUES (Source.ProductID,Source.ProductName, Source.Price)
  -- For Updates
		-- For Deletes
      WHEN NOT MATCHED BY Source THEN
    DELETE;

select * from SourceProducts
