

-- get stats for the last hour
-- run on instance
select * from sys.dm_db_resource_stats


-- must run on 'master'
select * from sys.resource_stats
order by start_time



