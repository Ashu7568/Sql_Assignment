/*create table #TempTable(
maunfacturer varchar(80),
tailnum varchar(50)
);

insert into #TempTable(maunfacturer,tailnum)
select cast(manufacturer as varchar(80) ),cast(tailnum as varchar(50))
from planes;*/

--Q1. Which manufacturer's planes had most no of flights? And how many flights?
select t1.maunfacturer,max(t2.flight)as Maximum_Number_Flight--,t1.tailnum  
from #TempTable t1 
join flights t2 On t1.tailnum = CAST(t2.tailnum as varchar(50))
group by t1.maunfacturer


/*
drop table #TempTable1
create table #TempTable1(
tailnum varchar(50),
hours varchar(30)
);

insert into #TempTable1(tailnum,hours)
select cast(tailnum as varchar(50)),cast(hour as varchar(30))
from flights;

select * from #TempTable1;*/

--Q2. Which manufacturer's planes had most no of flying hours? And how many hours?

select t1.maunfacturer,max(t2.hours) as Maximum_hour_Flight
from #TempTable t1 
join #TempTable1 t2 On t1.tailnum = CAST(t2.tailnum as varchar(50))
group by t1.maunfacturer





--Q3. Which plane flew the most number of hours? And how many hours?
select t2.flight,max(t1.hours) as maximum_hours from #temptable1 t1
join flights t2 on t1.hours=cast(t2.hour as varchar (30))
group by flight;



/*create table #TempTable2(
tailnum varchar(50),
hours int,
[dep_time] varchar(50),
	[dep_delay]varchar(50),
	[arr_time] varchar(50),
	[arr_delay] varchar(50),
	[carrier] varchar(50),
	[origin] varchar(50),
	[dest] varchar(50),
	[air_time] varchar(50),
	[minute] varchar(50),
);
insert into #TempTable2(tailnum,hours,dep_time,dep_delay,arr_time,arr_delay,carrier,origin,dest
,air_time,minute)
select cast(tailnum as varchar(50)),cast(hour as varchar(30)),
cast([dep_time] as varchar(30)),cast([dep_delay] as varchar(30)),
cast([arr_time] as varchar(30)),cast([arr_delay] as varchar(30)),
cast([origin] as varchar(30)),cast([carrier] as varchar(30)),
cast([dest] as varchar(30)),cast([air_time] as varchar(30)),cast([minute] as varchar(30))
from flights*/

--Q4.Which destination had most delay in flights?
select t1.maunfacturer,max(t2.[arr_delay]) as Maximum_delays
from #TempTable t1 
join #TempTable2 t2 On t1.tailnum = CAST(t2.tailnum as varchar(50))
group by t1.maunfacturer


--Q5.Which manufactures planes had covered most distance? And how much distance?
select t1.maunfacturer,max(t2.distance) as Maximum_distance_Flight
from #TempTable t1 
join flights t2 On t1.tailnum = CAST(t2.tailnum as varchar(50))
group by t1.maunfacturer










