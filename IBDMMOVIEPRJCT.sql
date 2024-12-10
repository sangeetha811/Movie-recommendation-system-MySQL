create database moviesdb;
use moviesdb;
select * from imdbmoviedata;
create index ind on imdbmoviedata(title);
select count(distinct title) from imdbmoviedata;
select title ,count(title) as repeatency from imdbmoviedata group by title having count(title)>1;
select * from imdbmoviedata where title="the host";
select count(title) from imdbmoviedata ;
select * from imdbmoviedata where director in ("james cameron","luc besson","john woo");
select * from imdbmoviedata where director like "steven%";
 select * from (select title,rating, dense_rank() over( order by  rating  desc) as dn from imdbmoviedata ) temp where dn in(1,2,3);
 select * from (select title,revenue, dense_rank() over( order by  revenue desc) as dn from imdbmoviedata ) temp where dn in(1,2,3);
 select * from (select title,votes,year,dense_rank() over( order by  votes desc) as dn from imdbmoviedata )temp where  year=2007 limit 1;
 select * from imdbmoviedata where  director="robin swicord";
 select * from (select title,votes,director,revenue,year,dense_rank() over( order by  revenue desc) as dn from imdbmoviedata )temp limit 1;
 select * from imdbmoviedata  where metascore = (select max(metascore)  from imdbmoviedata);
 select * from  imdbmoviedata where metascore>90;
 select * from imdbmoviedata where year >=2015;
 select title,avg(revenue) as averagerevenue from imdbmoviedata group by title ;
 delimiter $
 create procedure descandactormovies(a varchar(50))
 begin
 select title,description,actors from imdbmoviedata  where title=a;
 end $
 delimiter ;
 call descandactormovies("Split")
 
 
 
 
 
 
 
 
 