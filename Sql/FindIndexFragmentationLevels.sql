-- Source: Azure Support, April 2016
-- Find Index Fragmentation Levels, create commands to Update Stats and Rebuild indexes 
-- Run against database to check the current indexes fragmentation levels. This query will create the commands you need to run to update stats and defrag indexes
-- as a rule of thumb, run the ALTER INDEX commands against indexes with fragmentation levels of 30% or more. Do it sporadically, when needed.
-- run update statistics more often (now, and at least once a week), and for all the tables/indexes, not just the ones that are over 30% fragmented

SELECT 

 DB_NAME() AS DBName 
,OBJECT_NAME(ps.object_id) AS TableName 
,i.name AS IndexName 
,ips.index_type_desc 
,ips.avg_fragmentation_in_percent 

, 'ALTER INDEX [' + i.name + '] ON [' + OBJECT_NAME(ps.object_id) + '] REBUILD'  as Rebuild_Commands-- generate the commands to rebuild indexes

--,ips.*
--,'' spc
--,ps.*


FROM
 sys.dm_db_partition_stats ps 
 INNER JOIN sys.indexes i ON ps.object_id = i.object_id AND ps.index_id = i.index_id 
 CROSS APPLY sys.dm_db_index_physical_stats(DB_ID(), ps.object_id, ps.index_id, null, 'LIMITED') ips 

ORDER BY ips.avg_fragmentation_in_percent DESC 

