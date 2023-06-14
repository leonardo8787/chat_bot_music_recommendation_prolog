:- consult('dados.pl').

musica('Bohemian Rhapsody', 'Rock').
musica('Shape of You', 'Pop').
musica('Despacito', 'Reggaeton').
musica('All of Me', 'Pop').
musica('Hotel California', 'Rock').
musica('Smooth', 'Latin').

mensagem_boas_vindas :-
    write('Bem-vindo ao MusicRommendation!'),
    nl.

recomendar_musica(Genero) :-
    musica(Musica, Genero),
    format('Recomendação: ~w (~w)~n', [Musica, Genero]).

% Consultas
?- mensagem_boas_vindas.
?- recomendar_musica.
?- genero_musical.
?- caracteristica_musical.
?- favorito.
?- popularidade.