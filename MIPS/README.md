# DesComp
# MIPS
Duda Bicalho, Giovanna Cabral, Mayra Peter

6º Semestre  
Engenharia da Computação Insper  
Design de Computadores

## Sumário

* [Introdução](#introdução)
  * [O MIPS](#o-mips)
  * [Single Cycle vs Pipeline](#single-cycle-vs-pipeline)
* [Arquitetura do Projeto](#arquitetura-do-projeto)
  * [Requisitos](#requisitos)
  * [Fluxo de Dados](#fluxo-de-dados)
  * [Unidade de Controle](#unidade-de-controle)
  * [Top-Level](#top-level)

## Introdução
### O MIPS

"O MIPS é uma arquitetura baseada em registrador, ou seja, a CPU usa apenas registradores para realizar as suas operações aritméticas e lógicas. O MIPS tem 32 registradores de 32-bits para propósitos gerais.O hardware MIPS não impõe um uso específico para os registradores de uso geral (exceto r0). Ou seja, onde um registrador é necessário, qualquer registrador funcionará. No entanto, a seguinte convenção, para o uso dos registradores, evoluiu como padrão para a programação MIPS. Ela é usada pela maioria das ferramentas, compiladores e sistemas operacionais: 
![Regs](https://github.com/mayrapeter/DesComp/blob/main/MIPS/regs.png)

O MIPS tem 3 formatos básicos de instruções e é utilizada uma plavra de 32 bits para a codificação delas:
* Tipo **R** 
*  Tipo **I** 
* Tipo **J** 

![estrutura](https://github.com/mayrapeter/DesComp/blob/main/MIPS/estrutura.png)

Esses campos podem ser agrupados dependendo do tipo de instrução. O significado dos nomes dos campos são:
* **Opcode**: Contém o código da instrução a ser executada;
* **Rs**:  O endereço (número em binário) do registrador com o primeiro operando da instrução definida em opcode;
* **Rt**: O endereço (número em binário) do registrador com o segundo operando da instrução definida em opcode;
* **Rd**: O endereço (número em binário) do registrador de destino para o resultado da instrução definida em opcode;
* **shamt**: Total de deslocamento (shift amount, número em binário), utilizado para as intruções de deslocamento e rotação;
* **funct**: Seleciona a operação que será aplicada aos operandos. O opcode só define que a instrução é do tipo R, deixando a definição da operação para o funct.

A execução das instruções é dividida em 5 ciclos:

* Instruction Fetch (IF): busca da próxima instrução, na memória de programa, a ser executada;
* Instruction Decode (ID): decodifica a instrução (UC) e faz a leitura dos registradores utilizados pela instrução;
* Execute (EX): executa a operação definida pela instrução. É sempre feita na ULA;
* Memory Acess (MEM): lê a memória ou escreve o resultado da execução na memória RAM;
* Write Back (WB): escreve o resultado da execução no banco de registradores.


### Single Cycle vs Pipeline

A principal diferença entre o MIPS Single Cycle e o Pipeline é o tempo de execução das instruções. O primeiro fica limitado ao tempo que a instrução mais demorada leva para ser executada, enquanto que no pipeline, a execução das instruções é sobreposta no tempo. Com isso, o tempo total de execução (latência) de cada instrução não se altera. Mas, depois que o pipeline estiver cheio com instruções, a taxa com que as instruções são iniciadas e terminadas (vazão ou throughput) é muito maior e, idealmente, teríamos um aumento na vazão equivalente ao número de etapas do pipeline.


## Arquitetura do Projeto
### Requisitos

Este projeto será a implementação de um processador RISC de 32 bits, compatível com o MIPS DLX, com as seguintes instruções:

**Grupo A**

Quanto aos dois grupos de instruções, o subgrupo "A" é formado pelas instruções abaixo:

As instruções de referência à memória:

* Carrega palavra (load word: lw);
* Armazena palavra (store word: sw).

As instruções lógico-aritméticas:

* Soma (add);
* Subtração (sub);
* E lógico (AND);
* OU lógico (OR);
* Comparação menor que (set if less than: slt).

As instruções de desvio:

* Desvio se igual (branch equal: beq);
* Salto incondicional (jump: j).

**Grupo B**

O subgrupo "B" possui as instruções do subgrupo "A" e adiciona as listadas abaixo:

A instrução de carga:

* Carrega imediato para 16 bits MSB (load upper immediate: lui).

As instruções lógico-aritméticas:

* Soma com imediato (addi);
* E lógico com imediato (ANDI);
* OU lógico com imediato (ORI);
* Comparação menor que imediato (set if less than: slti).

As instruções de desvio:

* Desvio se não igual (branch not equal: bne);
* Salto e conecta (jump and link: jal);
* Salto por registrador (jump register: jr).

### Fluxo de Dados
O Fluxo de Dados do projeto é responsável por todas as operações aritméticas e execução das instruções. Abaixo está representado o fluxo para as intruções do tipo A e B utilizadas no projeto, tanto o esquema como no RTL Viewer. 

![Fluxo de Dados](https://github.com/mayrapeter/DesComp/blob/main/MIPS/fluxo_dados.png)

![Fluxo de Dados](https://github.com/mayrapeter/DesComp/blob/main/MIPS/rtl_viewer.png)

### Unidade de Controle
A unidade de controle receberá o Opcode da instrução e retornará a palavra de controle do MIPS. A saída da UC é a palavra controle, que contém:
* BNE
* Seletor da ULA
* Habilita escrita registrador
* Seletor Mux1
* Seletor Mux2
* Seletor Mux3
* Seletor Mux4
* Habilita Leitura Memória
* Habilita Escrita Memória
* BEQ

![Unidade de Controle](https://github.com/mayrapeter/DesComp/blob/main/MIPS/unidade_controle.png)

### Top-Level
O Top-Level é responsável por juntar tanto o fluxo de dados quanto a unidade de controle, com o adicional de controlar os botões da placa e os displays de 7 segmentos. Além disso, é nele que são estabelecidos os sinais para a simulação no Waveform. É necessário criar novas entradas no fluxo de dados e passá-las para o Top-Level a fim de verificar as saídas na simulação.

![Top-level](https://github.com/mayrapeter/DesComp/blob/main/MIPS/top_level.png)
