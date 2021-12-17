/*comentario em bloco*/
#PK = Primary Key
#FL = Foreign Key

#comentario em linha

#Permite criar um database
create database dbVideoLocadora20212;

#permite visualizar os databases exeistentes
show databases;

#permite apagar um database
drop database dbVideoLocadora20212;

#premite ativar o database que sera utilizado
use dbVideoLocadora20212;

#permite visualizar as tabelas existentes no database
show tables;

#premite visualizar a descrição (estutura) de uma tabela 
desc tblIdioma;

#Tabela de Classificação
create table tblClassificacao (
	idClassificacao int not null auto_increment,
    faixaEtaria varchar(6) not null,
    unique index(idClassificacao),
    primary key (idClassificacao)
);

/*Tabela de Filme*/
create table tblFilme(
	idFilme int not null auto_increment primary key,
    nome varchar(80) not null,
    dataLancamento date not null,
    sinopse text not null,
    duracao time not null,
    idClassificacao int not null,
    
    #nome do relacionamento
    constraint FK_Classificacao_Filme 
    #definição de quem será a FK nesta tabela
    foreign key(idClassificacao) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblClassificacao (idClassificacao),
    
    unique index (idFilme)
);


#Modificar um atributo da tabela
/*alter table tblClassificacao
	modify column faixaEtaria varchar(6) not null;
*/

/*Tabela de Genero*/
create table tblGenero(
	idGenero int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idGenero)
);
#Tabela de ligação entre genero e filme
create table tblFilmeGenero(
	idFilme_Genero int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeGenero
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idGenero int not null,
     #nome do relacionamento
    constraint FK_Genero_FilmeGenero 
    #definição de quem será a FK nesta tabela
    foreign key(idGenero) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblGenero (idGenero)
);




/*Tabela de Legenda*/
create table tblLegenda(
	idLegenda int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idLegenda)
);

#Tabela de ligação entre legenda e filme
create table tblFilmeLegenda(
	idFilme_Legenda int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeLegenda
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idLegenda int not null,
     #nome do relacionamento
    constraint FK_Legenda_FilmeLegenda
    #definição de quem será a FK nesta tabela
    foreign key(idLegenda) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblLegenda (idLegenda)
);

#tabela idioma
create table tblIdioma (
	idIdioma int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idIdioma)
);

#Tabela de ligação entre idioma e filme
create table tblFilmeIdioma(
	idFilme_Idioma int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeIdioma
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idIdioma int not null,
     #nome do relacionamento
    constraint FK_Idioma_FilmeIdioma 
    #definição de quem será a FK nesta tabela
    foreign key(idIdioma) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblIdioma (idIdioma)
);



#Alterar uma tabela para apagar uma constraint
alter table tblFilme drop foreign key FK_Classificacao_Filme;

#Alterar uma tabela para apagar um atributo
alter table tblFilme drop column idClassificacao;
#Alterar uma tabela para adicionar um novo atributo e adicionar esse atributo com uma constrantint
alter table tblFilme add column idClassificacao int not null, 
add constraint FK_Classificacao_Filme 
foreign key (idClassificacao) 
references tblClassificacao (idClassificacao);



/*Tabela de Sexo*/
create table tblSexo(
	idSexo int not null auto_increment primary key,
    nome varchar(15) not null,
    unique index(idSexo)
);

/*Tabela de Nacionalidade*/
create table tblNacionalidade(
	idNacionalidade int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idNacionalidade)
);

#Tabela Ator
create table tblAtor(
	idAtor int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    
	idSexo int not null,
    constraint FK_Sexo_Ator foreign key (idSexo) references tblSexo(idSexo)
);


#Tabela de ligação entre Ator e Nacionalidade
create table tblAtorNacionalidade(
	idAtor_Nacionalidade int not null auto_increment primary key,
    idAtor int not null,
     #nome do relacionamento
    constraint FK_Ator_AtorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idAtor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblAtor(idAtor),
    idNacionalidade int not null,
     #nome do relacionamento
    constraint FK_Nacionalidade_AtorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idNacionalidade) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblNacionalidade (idNacionalidade)
);

#Tabela de ligação entre ator e filme
create table tblFilmeAtor(
	idFilme_Ator int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idAtor int not null,
     #nome do relacionamento
    constraint FK_Ator_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idAtor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblAtor (idAtor)
);
show tables;

#Tabela Diretor
create table tblDiretor(
	idDiretor int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    
	idSexo int not null,
    constraint FK_Sexo_Diretor foreign key (idSexo) references tblSexo(idSexo)
);

#Tabela de ligação entre diretor e filme
create table tblFilmeDiretor(
	idFilme_Diretor int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeDiretor
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idDiretor int not null,
     #nome do relacionamento
    constraint FK_Diretor_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idDiretor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblDiretor (idDiretor)
);

#Tabela de ligação entre Diretor e Nacionalidade
create table tblDiretorNacionalidade(
	idDiretor_Nacionalidade int not null auto_increment primary key,
    idDiretor int not null,
     #nome do relacionamento
    constraint FK_Diretor_DiretorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idDiretor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblDiretor(idDiretor),
    idNacionalidade int not null,
     #nome do relacionamento
    constraint FK_Nacionalidade_DiretorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idNacionalidade) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblNacionalidade (idNacionalidade)
);


show tables;

insert into tblGenero (nome)values('Romantico'),
									('Comedia');
                                    
#Como deletar todos os dados da tabela
delete from tblAtor where idAtor=4;
	
insert into tblClassificacao (faixaEtaria)values('Livre'),
									('+10'),
                                    ('+12'),
                                    ('+14'),
                                    ('+16'),
                                    ('+18');

        
select * from tblGenero;

#MASCULINO E FEMININO NO SEXO
 insert into tblSexo (nome) values	('Masculino'),
									('Feminino');

#FILME PODEROSO CHEFÃO
insert into tblFilme (nome,
 dataLancamento,
 duracao,
 sinopse,
 idClassificacao) 
 values ('Forrest Gump - O Contador de Histórias',
 '1994-12-07',
 '02:20:00',
'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.',
3);
 #LIGAÇÃO DO FILME E GENERO
 select * from tblGenero;
  insert into tblFilmeGenero(idFilme, idGenero)
		values (4,13),
				(4,17),
                (4,18);

                                    
#IDIOMA DO FILME
	select * from tblFilmeIdioma;
    insert into tblFilmeIdioma (idFilme,idIdioma) values(4,1),(4,2),(4,3);
    
#Legenda    
insert into tblLegenda(nome)values	('inglês'),
									('português'),
                                    ('espanhol');
                                    
insert into tblFilmeLegenda(idLegenda, idFilme)values(1,4),
													(2,4),
                                                    (3,4);
    
    
#DIRETOR DO FILME PODEROSO CHEFÃO
insert into tblNacionalidade (nome) values ('Brasileiro');
 insert into tblDiretor(nome, nomeArtistico,dataNascimento,dataFalecimento,biografia,idSexo)
 values(' Robert Lee Zemeckis','ROBERT ZEMECKIS','1952-05-14',null,
'- Especialista em efeitos especiais, Robert Zemeckis é um dos partidários dos filmes do também diretor Steven Spielberg, que já produziu vários de seus filmes;

- Trabalhando geralmente com seu parceiro de roteiros Bob Gale, os primeiros filmes de Robert apresentou ao público seu talento para comédias tipo pastelão, como Tudo por uma Esmeralda (1984); 1941 - Uma Guerra Muito Louca (1979) e, acrescentando efeitos muito especiais em Uma Cilada para Roger Rabbit (1988) e De Volta para o Futuro (1985);

- Apesar destes filmes terem sidos feitos meramente para o puro entretenimento, com raros desenvolvimentos dos personagens ou mesmo com uma trama cuidadosa, eles são diversão na certa;

- Seus filmes posteriores no entanto, se tornaram mais sérios e reflexivos, como o enormemente bem sucedido filme estrelado por Tom Hanks Forrest Gump (1994) e o filme estrelado por Jodie Foster Contato (1997), ambos aclamados pela crítica e novamente reunindo atordoantes efeitos especiais;

- Em 2000 o diretor retorna ao trabalho com mais dois filmes: Revelação, com Michelle Pfeiffer e Harrison Ford, e Náufrago, em que retoma a parceria com Tom Hanks;

- Com isso, ao longo de sua carreira Robert tem provado que pode trabalhar em uma trama séria cercada de efeitos especiais, façanha esta que muitos diretores não conseguem realizar, e também conquistar crítica e público alternando os mais variados estilos de filmes;

- Seus filmes quase sempre são produzidos por Steven Spielberg;

- Tem Bob Gale como companheiro de escrita nos roteiros;

- Adora fazer citações a cenas famosas de outros filmes;

- É formado na Escola de Cinema da Universidade de Southern California',1);
 select * from tblDiretor;
 #LIGAÇÃO DO FILME E DIRETOR
 insert tblFilmeDiretor(idFilme, idDiretor)values(4,4);
 select * from tblFilmeDiretor;
 delete from tblDiretorNacionalidade where idDiretor_Nacionalidade=2;
 #LIGAÇÃO DO NACIONALIDADE E DIRETOR
 insert tblDiretorNacionalidade(idDiretor, idNacionalidade) values(4,1);
select * from tblDiretorNacionalidade;


#atores
 insert into tblAtor(nome,nomeArtistico,dataNascimento,dataFalecimento,biografia,idSexo)
 values('Thomas Jeffrey Hanks','TOM HANKS','1956-07-09',null,
'Tom Hanks iniciou a carreira no cinema aos 24 anos, com um papel no filme de baixo orçamento Trilha de Corpos. Logo migrou para a TV, onde estrelou por dois anos a série Bosom Buddies. Nela passou a trabalhar com comédia, algo com o qual não estava habituado, rendendo convites para pequenas participações nas séries Táxi, Caras & Caretas e Happy Days.

Em 1984, veio seu primeiro sucesso no cinema: a comédia Splash - Uma Sereia em Minha Vida, na qual era dirigido por Ron Howard e contracenava com Daryl Hannah. Em seguida vieram várias comédias, entre elas A Última Festa de Solteiro (1984), Um Dia a Casa Cai (1986) e Dragnet - Desafiando o Perigo (1987), tornando-o conhecido do grande público.

Com Quero Ser Grande (1988) Hanks obteve sua primeira indicação ao Oscar de melhor ator. Apesar de consagrado como comediante, aos poucos passou a experimentar outros gêneros. Em 1993 surpreendeu em Filadélfia como um advogado homossexual que luta na justiça contra sua demissão, motivada por preconceito devido a ele ser portador do vírus da AIDS. Pelo papel conquistou seu primeiro Oscar.

Já no ano seguinte Hanks ganharia sua segunda estatueta dourada, repetindo um feito apenas obtido por Spencer Tracy, quase 60 anos antes. Forrest Gump - O Contador de Histórias foi sucesso de público e crítica, ganhando seis Oscar.

Estabelecido como um dos maiores astros de Hollywood, Hanks passou a emendar um sucesso atrás do outro: Apollo 13 - Do Desastre ao Triunfo (1995), Toy Story (1995), O Resgate do Soldado Ryan (1998), Mens@gem Para Você (1998), Toy Story 2 (1999), À Espera de um Milagre (1999), Náufrago (2000), Prenda-me Se For Capaz (2002) e Estrada para Perdição (2002).

Em 1996, resolveu se dedicar à sua estreia na direção. O resultado foi The Wonders - O Sonho Não Acabou, divertida comédia que rendeu a contagiante música "That Thing You Do!". Hanks voltaria a trabalhar como diretor em episódios das séries de TV Da Terra à Lua (1998) e Band of Brothers (2001) e também na comédia romântica Larry Crowne - O Amor Está de Volta (2011).

Em 2004, o ator encampou a ideia de interpretar vários personagens na animação O Expresso Polar, dirigida pelo colega Robert Zemeckis. Usando o método de captura de movimento, Hanks interpretou seis personagens de idades variadas.

Um de seus personagens mais famosos é o simbologista Robert Langdon, criado pelo autor Dan Brown. Hanks o interpretou em dois filmes, O Código Da Vinci (2006) e Anjos e Demônios (2009).',
 1);
 
 #LIGAÇÃO DE ATOR E NACIONALIDADE
insert into tblAtorNacionalidade(idAtor,idNacionalidade)values(9,1);
select * from tblFilmeAtor;
delete from tblFilmeAtor where idFilme_Ator=6;
#LIGAÇÃO DE ATOR E NACIONALIDADE
insert into tblFilmeAtor(idFilme, idAtor)values(4,9);


show databases;
 

#Alterar a escrita de uma atributo ou modificar o tipo de dados
alter table tblFilme change column dataLancamento data_Lancamento date not null;

#Modifica apenas a estrutura do atributo
alter table tblFilme modify column data_lancamento varchar(10) not null;

#mudar o nome da tabela filme com update
update tblFilme set nome = 'Rei Leão' where idFilme=2;

desc tblFilme;


