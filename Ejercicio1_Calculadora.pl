:- initialization(main).

main :-
    writeln('=== Calculadora en Prolog ==='),
    writeln('Operaciones disponibles: +, -, *, /'),
    calcular.


calcular :-
    catch(
        (
            write('Ingrese el primer número: '),
            read(Num1),
            (number(Num1) -> true ; throw(error(numero_invalido, Num1))),

            write('Ingrese el operador (+, -, *, /): '),
            read(Op),
            (member(Op, [+, -, *, /]) -> true ; throw(error(operador_invalido, Op))),

            write('Ingrese el segundo número: '),
            read(Num2),
            (number(Num2) -> true ; throw(error(numero_invalido, Num2))),

            resultado(Op, Num1, Num2, R),
            format('Resultado: ~w ~w ~w = ~w~n', [Num1, Op, Num2, R]),
            continuar
        ),
        Error,
        manejar_error(Error)
    ).

% Operaciones básicas
resultado(+, X, Y, R) :- R is X + Y.
resultado(-, X, Y, R) :- R is X - Y.
resultado(*, X, Y, R) :- R is X * Y.
resultado(/, _, 0, _) :- throw(error(division_por_cero, _)).
resultado(/, X, Y, R) :- R is X / Y.


manejar_error(error(numero_invalido, Valor)) :-
    format('❌ Error: "~w" no es un número válido.~n', [Valor]),
    calcular.

manejar_error(error(operador_invalido, Valor)) :-
    format('❌ Error: "~w" no es un operador válido.~n', [Valor]),
    calcular.

manejar_error(error(division_por_cero, _)) :-
    writeln('❌ Error: No se puede dividir entre cero.'),
    calcular.

manejar_error(Otro) :-
    format('❌ Error inesperado: ~w~n', [Otro]),
    calcular.


continuar :-
    write('¿Desea realizar otra operación? (s/n): '),
    read(Resp),
    (Resp == s -> calcular ; writeln('👋 Saliendo...')).