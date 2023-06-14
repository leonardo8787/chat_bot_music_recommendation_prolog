:- consult('dados.pl').

musica('Bohemian Rhapsody', 'Rock', 'happy', 'heavy').
musica('Shape of You', 'Pop', 'happy', 'slow').
musica('Despacito', 'Reggaeton', 'happy', 'slow').
musica('All of Me', 'Pop', 'sad', 'slow').
musica('Hotel California', 'Rock', 'sad', 'slow').
musica('Smooth', 'Latin', 'happy', 'slow').
musica('Hey Jude', 'Rock', 'happy', 'slow').
musica('Billie Jean', 'Pop', 'happy', 'slow').
musica('Havana', 'Latin', 'happy', 'slow').
musica('Sweet Child o\' Mine', 'Rock', 'happy', 'heavy').
musica('Thinking Out Loud', 'Pop', 'happy', 'slow').

mensagem_boas_vindas :-
    write('Bem-vindo ao MusicRecommendation!'),
    nl.

recomendar_musica(Genero, Mood, Intensity) :-
    findall(Musica, (musica(Musica, Genero, Mood, Intensity)), Musicas),
    random_member(MusicaRecomendada, Musicas),
    format('Recomendação: ~w (~w) - Mood: ~w, Intensity: ~w~n', [MusicaRecomendada, Genero, Mood, Intensity]).

interacao_usuario :-
    write('Qual é o seu gênero musical preferido?'),
    nl,
    read_line_to_codes(user_input, GeneroInput),
    atom_string(Genero, GeneroInput),
    write('Qual é o mood desejado? (happy/sad)'),
    nl,
    read_line_to_codes(user_input, MoodInput),
    atom_string(Mood, MoodInput),
    write('Qual é a intensidade desejada? (heavy/slow)'),
    nl,
    read_line_to_codes(user_input, IntensityInput),
    atom_string(Intensity, IntensityInput),
    (
        musica(_, Genero, _, _) ->
            recomendar_musica(Genero, Mood, Intensity),
            nl,
            write('Deseja receber mais recomendações? (s/n)'),
            nl,
            read_line_to_codes(user_input, RespostaInput),
            atom_string(Resposta, RespostaInput),
            (
                Resposta = 's' ->
                    interacao_usuario
                ;
                    write('Obrigado por usar o MusicRecommendation! Até mais!')
            )
        ;
            write('Gênero musical inválido. Tente novamente.'),
            nl,
            interacao_usuario
    ).

?- mensagem_boas_vindas.
?- interacao_usuario.
