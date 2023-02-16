alter table regions add foreign key (name) references  region_areas(region_name);

ALTER TABLE t1 ADD FOREIGN KEY (t1_column_name) REFERENCES t2 (t2_column_name);

select population, name, year
from countries c 
join country_stats cs using (country_id)
where year = 1986;

update vips 
set vip_id = 8
where name = 'Eric'

select count(distinct name) 
from countries c;

select name, area ,country_id  from countries 
where name like 'a_u%'

select name, area ,country_id  from countries 
where area < 1000

select name, area ,country_id  from countries 
where area between  1000 and 1200;

select name, area ,country_id  from countries 
where area between  1000 and 1200 or 
name like 'c%';

select name, area ,country_id  from countries 
where not area between  1000 and 200 and 
name not like 'c%';

select name, area ,country_id  from countries 
where not area between  1000 and 200 
and name like 'c%' or name like'z%';

select *  from countries 
limit 5;

select name, population 
from countries 
left join country_stats 
using (country_id);   



/*again with these statements we have
to know and be able to apply mathematical
logic */

select c.name as name, max(cs.population) as highest_population ,cs.`year` 
from countries c 
left join country_stats cs
using (country_id) 
group by c.name; 

select c.name , l.`language` 
from country_languages cl
left join countries c 
using (country_id)
left join languages l 
using (language_id)
where cl.official = true
order by name asc

select c.name , count(l.`language`) as languaged_spoken
from country_languages cl
left join countries c 
using (country_id)
left join languages l 
using (language_id)
where cl.official = true
group by c.name 
order by name asc

select c.name , count(l.`language`) as languages_spoken
from country_languages cl
left join countries c 
using (country_id)
left join languages l 
using (language_id)
where cl.official = true 
group by c.name 
having languages_spoken > 1
order by name asc

select c.name , count(l.`language`) as languages_spoken
from country_languages cl
left join countries c 
using (country_id)
left join languages l 
using (language_id)
group by c.name 
order by languages_spoken desc

select * from countries c 
left join regions r
using (region_id)
left join continents co
using (continent_id)
order by co.name ,area  asc

select *  from vips v
union
select *  from guests g 












