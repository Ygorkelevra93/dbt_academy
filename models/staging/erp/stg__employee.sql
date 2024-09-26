with 
    fonte_funcionarios as (
        select *
        from {{source('erp_northwind','employee')}}
        -- where # colocar filtros se houver  necessidade

),  renomeacao as (
    select
    ID as pk_funcionario
    , cast (REPORTSTO as varchar) as fk_gerente
    , cast(concat(FIRSTNAME,' ',LASTNAME) as varchar) as nome_funcionario
    , cast (BIRTHDATE as date) as dt_nascimento_funcionario
    , cast (HIREDATE as date) as dt_contratacao
    , cast (TITLE as varchar) as cargo_funcionario
    , cast (CITY as varchar) as cidade_funcionario
    , cast (REGION as varchar) as regiao_funcionario
    , cast (COUNTRY as varchar) as pais_funcionario
    , cast (NOTES as varchar) as notas_funcionario
    
    --, cast (PHOTOPATH as ) as PHOTOPATH
    --, cast (LASTNAME as ) as LASTNAME
    --, cast (FIRSTNAME as ) as FIRSTNAME
    --, cast (TITLEOFCOURTESY as ) as TITLEOFCOURTESY
    --, cast (ADDRESS as ) as ADDRESS
    --, cast (HOMEPHONE as ) as HOMEPHONE
    --, cast (EXTENSION as ) as EXTENSION
    --, cast (PHOTO as ) as PHOTO
    --, cast (POSTALCODE as ) as POSTALCODE

    from fonte_funcionarios
)

select * 
from renomeacao
