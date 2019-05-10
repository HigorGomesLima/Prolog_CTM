has_subclass(thing,horario).
has_subclass(thing,local).
has_subclass(thing,pessoa_juridica).
has_subclass(thing,poder_de_policia).
has_subclass(poder_de_policia,licenca).
has_subclass(licenca,licenca_funcionamento).
has_subclass(licenca_funcionamento,local_licenca_funcionamento).
has_subclass(licenca_funcionamento,horario_licenca_funcionamento).
has_subclass(licenca_funcionamento,sujeito_licenca_funcionamento).
has_individual(horario,horario_normal).
has_individual(horario,horario_especial).
has_individual(local,local_fixo).
has_individual(local,local_variavel).
has_individual(pessoa_juridica,municipio).
has_individual(pessoa_juridica,ambulante).
has_individual(pessoa_juridica,comerciante).
has_individual(pessoa_juridica,industriais).
has_individual(pessoa_juridica,prestador_de_servico).
has_individual(pessoa_juridica,profissional_nao_liberal).
has_individual(local_licenca_funcionamento,local_fixo_licenca_funcionamento).
has_individual(horario_licenca_funcionamento,horario_licenca_funcionamento).
has_individual(sujeito_licenca_funcionamento,sujeito_passivo_licenca_funcionamento).
has_individual(sujeito_licenca_funcionamento,sujeito_ativo_licenca_funcionamento).
ser(sujeito_ativo_licenca_funcionamento,municipio).
ser(sujeito_passivo_licenca_funcionamento,ambulante).
ser(sujeito_passivo_licenca_funcionamento,comerciante).
ser(sujeito_passivo_licenca_funcionamento,industriais).
ser(sujeito_passivo_licenca_funcionamento,prestador_de_servico).
ser(sujeito_passivo_licenca_funcionamento,profissional_nao_liberal).
ser(horario_licenca_funcionamento,horario_normal).
ser(local_fixo_licenca_funcionamento,local_fixo).

count(What,N) :-
        findall(X, has_subclass(What,X), L),
        sort(L,S),
        length(S,N).

erro(What,V,X) :-
        count(What,S),
        Sub is V - S,
        Module is Sub * Sub,
        ModuleS is sqrt(Module^2),
        X is ModuleS.

similaridade_SQ(What,V,X) :-
        erro(What,V,E),
        T is E / V,
        F is T * V,
        D is T * F + 1,
        X is 100 / D.
