-- RESTA o DIFERENCIA
-- Tree different ways

-- EXCEPT
select
*
from
    (
        select 1
               union all
        select 2
               union all
        select 3
               union all
        select 4    
    ) as a

EXCEPT

select
*
from

    (
        select 1
               union all
        select 2
               union all
        select 3
    ) as b

-- NOT IN
-- A - B
select
      a.c1
from
    (
-- A
        select 1 c1
               union all
        select 2
               union all
        select 3
               union all
        select 4    
    ) a
where
     a.c1
         not in
        (        
-- B
            select 1 as col
                   union all
            select 2
                   union all
            select 3
        )


-- LEFT JOIN
select
a.cl as 'resultado resta'
from
    (
        select 1 as cl
               union all
        select 2
               union all
        select 3
               union all
        select 4    
    ) as a

left outer join 

    (
        select 1 as cl
               union all
        select 2
               union all
        select 3
    ) as b    
on 
   a.cl = b.cl
where 
      b.cl is null














