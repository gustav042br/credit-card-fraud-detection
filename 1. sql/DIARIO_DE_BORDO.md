# Fase 1: Entendimento da Base de Dados + Criação das Queries

No começo foi um pouco confuso. Embora eu tenha experiência com bases de dados voltadas para a área de prevenção à fraude e antifraude, este arquivo contém mais de 28 colunas com valores decimais (geralmente entre -3 e 3). Isso nada mais é do que os dados de cartões e informações pessoais dos clientes aos quais foi aplicada a técnica de PCA (Análise de Componentes Principais) para redução de dimensionalidade. Enfim, não vou entrar em tantos detalhes agora porque ainda não me aprofundei nessa parte, já que esses dados não foram o enfoque principal desta fase.

Como é possível deduzir, a etapa de entendimento da base é fundamental. É aqui que você compreende os dados para conseguir fazer as perguntas certas — e não qualquer pergunta, mas sim as mais assertivas. Essa parte também foi um pouco nebulosa para mim no início; por isso, precisei pesquisar e questionar até encontrar os problemas certos para estruturar as queries. 

Um fator essencial nesse processo é **entender o contexto**. No cenário de antifraude para cartão de crédito, o comportamento basilar do ofensor nos direciona a buscar transações com valores suspeitos ou, sendo mais direto: **encontrar a fraude**. Para nos ajudar, a base contava com a coluna `class`, que facilitou muito a nossa busca, já que ela identificava se a transação era uma fraude ou não por meio de um valor inteiro binário (0 = não fraude e 1 = fraude).

Com as transações fraudulentas já identificadas, as buscas ficaram mais fáceis, permitindo mapear outras questões estratégicas que derivavam dessa métrica principal:

* **Fraude por hora:** Utilização da coluna `time` organizada em horas para fazer um comparativo direto entre o total de transações gerais e o total de fraudes por hora.
* **Fraude por valor:** Uma visão facilitada sobre a quantidade de fraudes segmentada por faixas de valores (organizada a partir da coluna `amount`).
* **Média de ticket fraudulento por hora:** Novamente utilizando a coluna `time` classificada em horas, mas agora focando no valor médio de todos os tickets fraudulentos respectivos a cada horário.
* **Transações por hora:** Um mapeamento do comportamento regular da base (sem as fraudes), analisando a quantidade e a média de valor por hora.
* **Macros de fraude:** Uma visão geral do impacto financeiro das transações fraudulentas, consolidando a volumetria de tickets, a soma total dos prejuízos, a maior transação registrada e a média geral de valor dos golpes.

---

### Adendos Adicionais
* As queries segmentadas por hora foram ordenadas de forma decrescente pela volumetria de fraudes ou transações para colocar os picos de maior atividade em primeiro, facilitando a visualização.

* O PCA não é criptografia. É uma técnica matemática de redução de dimensionalidade que combina variáveis para reduzir o tamanho dos dados, tendo o anonimato como efeito colateral.
