%Para conseguir acessar o acervo de músicas do arquivo dados.pl
:- consult('dados.pl').

%Acervo mais curto, só para testes
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

%mensagem para quando o usuário acessar o software
mensagem_boas_vindas :-
    write('Bem-vindo ao MusicRecommendation!'),
    nl.

%função para procurar música na base de dados com os seguintes atributos: gênero, modo e intensidade.
recomendar_musica(Genero, Mood, Intensity) :-
    findall(Musica, (musica(Musica, Genero, Mood, Intensity)), Musicas),
    random_member(MusicaRecomendada, Musicas),
    format('Recomendação: ~w (~w) - Mood: ~w, Intensity: ~w~n', [MusicaRecomendada, Genero, Mood, Intensity]).

%Iteração com o usuário é a parte onde entra num loop para continuar enquanto o usuário n quiser parar.
interacao_usuario :-
    write('Qual é o seu gênero musical preferido?'),
    nl,
    %faz a leitura do genênero musical
    read_line_to_codes(user_input, GeneroInput),
    atom_string(Genero, GeneroInput),
    write('Qual é o mood desejado? (happy/sad)'),
    nl,
    %faz a leitura do modo da música
    read_line_to_codes(user_input, MoodInput),
    atom_string(Mood, MoodInput),
    write('Qual é a intensidade desejada? (heavy/slow)'),
    nl,
    %faz a leitura da intensidade da música, se é mais pesada ou mais parada, tipo: happy/slow
    read_line_to_codes(user_input, IntensityInput),
    atom_string(Intensity, IntensityInput),
    (
        musica(_, Genero, _, _) ->
            recomendar_musica(Genero, Mood, Intensity),
            nl,
            write('Deseja receber mais recomendações? (s/n)'),
            nl,
            % Se 'S' continua, se 'N' para as iterações
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

% opções do programa para acessar no ambiente de iteração(terminal)
?- mensagem_boas_vindas.
?- interacao_usuario.
