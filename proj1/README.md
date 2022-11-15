Escolhemos representar um polinómio como uma lista de monómios. Foi considerada uma representação recursiva.
Um monómio é um tuplo constituido por um coeficiente, e uma lista de interminadas. Representação matricial era ineficiente em termos de espaço de memória, e todas as outras representações que considerámos falhavam com monómios multivariados.
Cada indeterminada é um tuplo que consiste numa variável (Char), e uma potência.
Considerámos outras possibilidades para representar a variável como alternativa a Char, mas acabámos por preferir a simplicidade e transparência dessa representação.



Deixando de parte a questão de como criar um polinómio normalizado, analizemos primeiro a questão de "manter" um polinómio normalizado.
Para os nossos polinómios consistentes de listas de monómios, manter o estado de normalização é simplesmente uma ordenação entre os monómios.

 - Durante o processo de derivação de um polinómio, se este estiver normalizado, a derivação pode muito facilmente manter esse estado de normalização, se assim o quisermos.
 - O mesmo se aplica à adição de dois polinómios normalizados, se percorrermos cada um obedecendo à mesma ordem, conseguimos manter o estado de normalização. Esta estratégia também serve como forma de tornar adição de polinómios numa operação O(n), percorrendo cada polinómio uma só vez, já que estamos essencialmente a unir duas listas ordenadas.
 - Multiplicação de polinómios é uma operação de adição de polinómios, polinómios esses que são simplesmente uma multiplicação entre um monómio e um polinómio. Já falámos de adição de polinómios, e esta nova operação de multiplicação de um monómio e um polinómio também muito facilmente pode ser desenhada para que a ordem normalizada do polinómio se mantenha.

Tendo analizado as 3 operações pedidas, apercebemo-nos que se a representação interna de um polinómio for a sua versão normalizada (algo que é pedido no enunciado), então a operação de normalização passa simplesmente a ser uma consequência da nossa representação.

Estamos a partir do princípio que já temos uma representação normalizada do polinómio, algo que facilmente poderia ser deixado para o parser, já que todos os polinómios passariam por esse processo de criação.
No entanto, ficámos sem tempo e não implementámos o parser, portanto criámos uma função de normalização.



Adição:
Como dito, os monómios obedecem sempre à mesma ordem, portanto só temos de iterar por cada polinómio e:
 - Caso as indeterminadas sejam iguais, adicionamos
 - Caso sejam diferentes deixamos o "menor" desses monómios para o inicio do que retornamos, e aplicamos a adição ao resto recursivamente.


Multiplicação:
Pegamos em cada monómio do primeiro polinómio, multiplicamos pelo segundo polinómio, e adicionamos todos os polinómios que obtemos dessa forma.

Derivação:
Aplicamos derivação a cada monómio. Derivação de cada monómio consiste em iterar por cada indeterminada, caso esta seja igual à variável dada, aplicamos a regra da potência.

Normalização:
Adicionamos cada monómio ao polinómio total que já temos. Como a nossa adição mantém o estado de normalização, e um polinómio vazio está normalizado, isto muito simplesmente garante normalização.




- Miguel Curval - up201105191 
- Tomás Macedo - up202008551
