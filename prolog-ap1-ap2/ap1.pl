female('Grace').
female('Dede').
female('Gloria').
female('Barb').
female('Claire').
female('Haley').
female('Lily').
female('Pameron').
female('Alex').
female('Poppy').

male('Frank').
male('Jay').
male('Javier').
male('Merle').
male('Phil').
male('Mitchell').
male('Joe').
male('Manny').
male('Cameron').
male('Bo').
male('Calhoun').
male('Rexford').
male('Luke').
male('Dylan').
male('George').

parent('Grace', 'Phil').
parent('Frank', 'Phil').
parent('DeDe', 'Claire').
parent('DeDe', 'Mitchell').
parent('Jay', 'Claire').
parent('Jay', 'Mitchell').
parent('Jay', 'Joe').
parent('Gloria', 'Joe').
parent('Gloria', 'Manny').
parent('Javier', 'Manny').
parent('Barb', 'Cameron').
parent('Barb', 'Pameron').
parent('Merle', 'Cameron').
parent('Merle', 'Pameron').
parent('Phil', 'Haley').
parent('Phil', 'Alex').
parent('Phil', 'Luke').
parent('Claire', 'Haley').
parent('Claire', 'Alex').
parent('Claire', 'Luke').
parent('Dylan', 'George').
parent('Dylan', 'Poppy').
parent('Haley', 'George').
parent('Haley', 'Poppy').
parent('Mitchell', 'Lily').
parent('Mitchell', 'Rexford').
parent('Cameron', 'Lily').
parent('Cameron', 'Rexford').
parent('Pameron', 'Calhoun').
parent('Bo', 'Calhoun').

grandparent(X, Y):- parent(X, Z), parent(Z, Y).
father(X, Y):- male(X), parent(X, Y).
mother(X, Y):- female(X), parent(X, Y).
grandfather(X, Y):- male(X), grandparent(X, Y).
grandmother(X, Y):- female(X), grandparent(X, Y).
siblings(X, Y):- parent(A, X), parent(A, Y), parent(B, X), parent(B, Y), A \= B, X \= Y, X @< Y, A @< B.
halfSiblings(X, Y):- parent(A, X), parent(A, Y), parent(B, X), parent(C, Y), B \= A, C \= A, X \= Y, B \= C.
cousins(X, Y):- parent(A, X), parent(B, Y), siblings(A, B), \+ siblings(X, Y).
uncle(X, Y):- parent(A, Y), siblings(A, X), male(X).


leciona('Algoritmos', 'Adalberto').
leciona('Bases de Dados', 'Bernardete').
leciona('Compiladores', 'Capitolino').
leciona('Estatistica', 'Diogenes').
leciona('Redes', 'Ermelinda').

frequenta('Algoritmos', 'Alberto').
frequenta('Algoritmos', 'Bruna').
frequenta('Algoritmos', 'Cristina').
frequenta('Algoritmos', 'Diogo').
frequenta('Algoritmos', 'Eduarda').
frequenta('Bases de Dados', 'Antonio').
frequenta('Bases de Dados', 'Bruno').
frequenta('Bases de Dados', 'Cristina').
frequenta('Bases de Dados', 'Duarte').
frequenta('Bases de Dados', 'Eduardo').
frequenta('Compiladores', 'Alberto').
frequenta('Compiladores', 'Bernardo').
frequenta('Compiladores', 'Clara').
frequenta('Compiladores', 'Diana').
frequenta('Compiladores', 'Eurico').
frequenta('Estatistica', 'Antonio').
frequenta('Estatistica', 'Bruna').
frequenta('Estatistica', 'Claudio').
frequenta('Estatistica', 'Duarte').
frequenta('Estatistica', 'Eva').
frequenta('Redes', 'Alvaro').
frequenta('Redes', 'Beatriz').
frequenta('Redes', 'Claudio').
frequenta('Redes', 'Diana').
frequenta('Redes', 'Eduardo').


professorde(X,Y) :- frequenta(Z, Y), leciona(Z, X).
alunosde(Prof, Student) :- leciona(UC, Prof) , frequenta(UC, Student).
professorde(Student, Prof) :- leciona(UC, Prof) , frequenta(UC, Student).
aluno_comum(ProfX, ProfY, Aluno) :- professorde(ProfX, Aluno), professorde(ProfY, Aluno).
colega(Aluno1, Aluno2) :- frequenta(UC, Aluno1), frequenta(UC, Aluno2), Aluno1 \= Aluno2.
colega(X,Y):- leciona(_,X), leciona(_,Y) , X \= Y.
alunos_varias_uc(X):- frequenta(UC1,X), frequenta(UC2,X), UC1 \= UC2
