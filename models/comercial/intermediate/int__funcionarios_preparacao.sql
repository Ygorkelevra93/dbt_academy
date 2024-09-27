with funcionarios as (
    select *
    from {{ref("stg__employee")}}

)

, joined as (
    select 
     funcionarios.PK_FUNCIONARIO
    ,funcionarios.FK_GERENTE
    ,funcionarios.NOME_FUNCIONARIO
    , gerentes.nome_funcionario as nome_gerente_funcionario
    ,funcionarios.DT_NASCIMENTO_FUNCIONARIO
    ,funcionarios.DT_CONTRATACAO
    ,funcionarios.CARGO_FUNCIONARIO
    ,funcionarios.CIDADE_FUNCIONARIO
    ,funcionarios.REGIAO_FUNCIONARIO
    ,funcionarios.PAIS_FUNCIONARIO
    ,funcionarios.NOTAS_FUNCIONARIO

    from funcionarios
    left join funcionarios as gerentes
        on funcionarios.fk_gerente = gerentes.pk_funcionario
)

select * from joined