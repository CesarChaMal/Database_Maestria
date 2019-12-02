select DATEPART(yyyy, getdate())

SELECT "Month Number" = MONTH(getdate())
SELECT MONTH('03/12/1998') as "Month Number"
SELECT MONTH(getdate()), DAY(getdate()), YEAR(getdate())
SELECT DATEPART(m, getdate())+ DATEPART(d, getdate())+ DATEPART(yyyy, getdate())



SELECT DATEPART(yyyy,'10/03/2008') as  year
SELECT YEAR('10/03/2008') as  year
SELECT RIGHT('10/03/2008',4) as  year


select LEN(' IRIS ')
select LEN(LTRIM(' IRIS '))
select LEN(RTRIM(LTRIM(' IRIS ')))


select


RTRIM(LTRIM(

cast(
CASE 
	WHEN DAY(getdate())<10 THEN  '0' + convert ( char, DAY(GETDATE()))
	ELSE CONVERT(char,DAY(getdate()))
END 
as char) 
))

+ '/' +

RTRIM(LTRIM(

convert( char,
CASE 
	WHEN MONTH(getdate())<10 THEN '0'+ CAST (MONTH(getdate())AS char)
	ELSE CAST(MONTH(getdate()) as char)
END
)
))

+'/'+

RTRIM(LTRIM(
convert( char, YEAR(getdate()))
))




SELECT

RTRIM(LTRIM(
cast (
DAY( getdate() ) 
as char) 
))
+ ' de ' + 

RTRIM(LTRIM(
convert (char,
CASE MONTH(getdate()) 
     WHEN '1' THEN 'Enero' 
     WHEN '2' THEN 'Febrero' 
     WHEN '3' THEN 'Marzo' 
     WHEN '4' THEN 'Abril' 
     WHEN '5' THEN 'Mayo' 
     WHEN '6' THEN 'Junio' 
     WHEN '7' THEN 'Julio' 
     WHEN '8' THEN 'Agosto' 
     WHEN '9' THEN 'Septiembre' 
     WHEN '10' THEN 'Agosto' 
     WHEN '11' THEN 'Noviembre' 
     WHEN '12' THEN 'Diciembre' 
     ELSE '' 
END 
)
))

+ ' de '+ 

RTRIM(LTRIM(
CAST (
YEAR(getdate())
as char)
))

AS fecha_inicio_formateada2 


SELECT
CASE 
     WHEN MONTH(getdate())='5' THEN 'Abril' 
     WHEN 1=1 THEN 'true' 
     ELSE '' 
END 


-- tablas temporales

select 1 as c into ##usuario


select a.c1, a.c2, a.c3 into ##usuario from (
						select 1 as c1, 'sdss1' as c2, 3 as c3
						union all
						select 2 as c1, 'sdss2' as c2, 3 as c3
						union all
						select 3 as c1, 'sdss3' as c2, 3 as c3
					  ) a
select * from ##usuario


drop table ##usuario




-- tablas temporales

-- crear tabla al vuelo e insertar datos
select 1 as c1, 'sdss' as c2, 3 as c3 into ##tmp1 

-- crear tabla al vuelo e insertar datos
select a.c1, a.c2, a.c3 into ##tmp from (select 1 as c1, 'sdss' as c2, 3 as c3) a

-- crear tabla al vuelo sin insertar datos solo los campos
select a.c1, a.c2, a.c3 into ##tmp from (select 1 as c1, 'sdss' as c2, 3 as c3 where 1=0) a

-- crear tabla al vuelo sin insertar datos solo los campos
create table ##tmp(c1 int,c2 varchar(80), c3 int)

-- insertar datos en tabla ya existente
insert into ##tmp select 1, 'sdsd', 4

select * from ##tmp

drop table ##tmp

select a.id_usuario, a.nombre_usuario into ##tmp from usuario a
select * into ##tmp from usuario a

-- SELECT * FROM RECIBO WHERE FECHA_PROCESAMIENTO = CAST(REPLACE('2010-07-27','-','') AS DATETIME)


CREATE TABLE ##Pets
(
   Type VARCHAR(60),
   Store VARCHAR(60),
   Number int
)

insert into ##Pets(Type, Store, Number) 
select 'Dog', 'Miami',12
union all
select 'Cat', 'Miami',18
union all
select 'Turtle', 'Tampa',4
union all
select 'Dog', 'Tampa',14
union all
select 'Cat', 'Naples',9
union all
select 'Dog', 'Naples',5
union all
select 'Turtle', 'Naples',1


SELECT 
	Type , Store, SUM(Number) as Number
FROM 
	##Pets 
GROUP BY 
	type ,store 
WITH 
	CUBE

SELECT 
	Type , Store, SUM(Number) as Number
FROM 
	##Pets 
GROUP BY 
	type ,store 
WITH 
	ROLLUP

SELECT 
	Type , Store, Number
FROM 
	##Pets
ORDER BY 
	Store
COMPUTE SUM(Number) BY Store 

SELECT 
	Type , Store, Number
FROM 
	##Pets
ORDER BY 
	Type
COMPUTE SUM(Number) BY Type 

