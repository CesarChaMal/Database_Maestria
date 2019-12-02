-- INTERSECCION
-- R n S = R – (R - S)


-- R
select
      *
from
    (
        select 1 c
               union all
        select 2
               union all
        select 3
               union all
        select 4    
    ) a

where
    a.c   
    not in    
-- (R - S)
    (
    select
          a.c
    from
        (
            select 1 c
                   union all
            select 2
                   union all
            select 3
                   union all
            select 4    
        ) a
    where
         a.c
             not in
            (
                select 1 as c
                       union all
                select 2
                       union all
                select 3
            )
    )




