# Análise de Compartilhamento de Bicicletas Cyclistic

## 📌 Contexto

**Cyclistic** é uma empresa fictícia de compartilhamento de bicicletas com sede em Chicago. A empresa opera um sistema com mais de 5.800 bicicletas e 600 estações de ancoragem, permitindo que os usuários aluguem e devolvam bicicletas em qualquer estação dentro da rede. O modelo de negócios da empresa é baseado em três planos de preços: passes para viagens individuais, passes de dia inteiro e assinaturas anuais, sendo os membros anuais o segmento mais lucrativo.

O objetivo atual da Cyclistic é aumentar sua base de assinantes anuais, convertendo usuários casuais em membros. Meu objetivo é fornecer insights baseados em dados para informar estratégias de marketing focadas em conversão, com um componente chave sendo a análise e o relatório das variações comportamentais entre os grupos de usuários casuais e membros.

Os dados utilizados nesta análise provêm de dados históricos de viagens de bicicleta disponíveis publicamente, fornecidos pela Motivate International Inc. Embora o conjunto de dados tenha sido adaptado para o estudo de caso fictício da Cyclistic, ele é baseado em informações do mundo real de um sistema de compartilhamento de bicicletas. Devido a preocupações com a privacidade, informações de identificação pessoal foram removidas, garantindo a conformidade com os padrões de segurança e confidencialidade de dados.

## 🛠️ Ferramentas e Linguagens Utilizadas

Python - Google Colab

R - RStudio

SQL - BigQuery

Planilhas - Google Sheets

## 🧹 Limpeza e Preparação dos Dados

- Carreguei os dados no Google Sheets e criei uma [cópia](bike%20data.csv) para manter a versão original intacta.
- Ajustei a formatação centralizando os títulos e redimensionando as colunas para melhor visibilidade.
- Usei a função "Limpeza de Dados" do Google Sheets para remover registros duplicados e aparar espaços desnecessários.
- Extraí o dia e a hora de início e fim de 'started_at' e 'ended_at', criando as colunas `start_day`, `start_hour`, `end_day` e `end_hour`.
- Criei uma nova coluna chamada `weekday` usando a função "=DIA.DA.SEMANA()". Esta função retorna um número representando o dia da semana para uma determinada data.
- Baixei os novos dados e usei [Python](data_cleaning.ipynb) para realizar algumas limpezas adicionais.

## 📊 Análise


- A partir da tabela, criei uma tabela dinâmica com `member_casual` como colunas e `weekday` como linhas.


![Image](https://github.com/user-attachments/assets/2367be7e-316d-40eb-a630-004c4c91c1bf)


**Sexta** é o dia mais movimentado.

**Quinta** possui a menor atividade.

- Usei Python para ver algumas [estatísticas](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/different%20statistics.ipynb) básicas por tipo de usuário.

Decidi analisar a distribuição de usuários casuais e membros ao longo do dia. Fiz isso dividindo o dia em quatro períodos de 6 horas: manhã, tarde, noite e madrugada, usando a fórmula `=COUNTIFS('202411-divvy-tripdata.csv'!$E$2:$E,">=06:00:00.00",'202411-divvy-tripdata.csv'!$E$2:$E,"<12:00:00.000",'202411-divvy-tripdata.csv'!$Q$2:$Q,"casual",'202411-divvy-tripdata.csv'!$R$2:$R,1)` variando os intervalos de tempo e o tipo de usuário.

![Image](https://github.com/user-attachments/assets/212eece8-c53a-45ef-b9e7-5ed6b57e92e2)


![Image](https://github.com/user-attachments/assets/6838ce32-5448-4593-bc9b-5fa652f2e198)


![Image](https://github.com/user-attachments/assets/bb259383-30f6-4faf-be94-c649f5ef5ca9)


![Image](https://github.com/user-attachments/assets/f3e1992e-9ae7-41a2-9fdb-2fea4b1bcbea)

Analisando o comportamento dos usuários, é possível identificar um padrão de uso em que os períodos da tarde são os mais movimentados, seguidos pela manhã, noite e madrugada, tanto para casuais quanto para membros.

Eu criei um [mapa de calor](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/heatmap.R) para fornecer uma representação visual diferente da distribuição de tempo.


![Image](https://github.com/user-attachments/assets/ac7397fa-cc0e-4a7a-b6ff-fad69cfce6a4)


Membros usam bicicletas por um período geral significativamente maior do que usuários casuais, principalmente devido ao seu maior número. No entanto, usuários casuais têm um tempo médio de uso por viagem mais alto.

A análise de dados mostra que usuários casuais usam bicicletas principalmente nos fins de semana e nas sextas-feiras, enquanto membros pedalam de forma mais consistente ao longo da semana. Isso sugere que membros usam bicicletas principalmente para deslocamento e exercício, enquanto usuários casuais as usam para lazer. O período da noite geralmente tem a menor atividade, exceto nas sextas-feiras, quando usuários casuais pedalam mais à noite do que de manhã — provavelmente porque é o último dia útil da semana. Aos domingos, o uso noturno cai acentuadamente à medida que as pessoas se preparam para a semana de trabalho que se inicia.

Eu queria ver se havia uma preferência por tipo de bicicleta, clássica ou elétrica, entre os tipos de usuários e a hora do dia.


### Casuais:

![Image](https://github.com/user-attachments/assets/91b2f3fd-e87e-45fd-b56f-d9eb8bd82031)

![Image](https://github.com/user-attachments/assets/8b825857-9414-43d7-8fbe-9fb9f1673ad0)

![Image](https://github.com/user-attachments/assets/e4bf83f0-6578-4dc4-89c4-1ec0c13bcf81)

![Image](https://github.com/user-attachments/assets/cf14bca7-45cb-4475-9468-7fe0356568d2)

### Membros:

![Image](https://github.com/user-attachments/assets/7c9f8f3b-a5fe-4d05-966c-1cef9c33b53f)

![Image](https://github.com/user-attachments/assets/e2038bbf-c750-4043-8e16-e721b21933d6)

![Image](https://github.com/user-attachments/assets/2ba0ee2f-39c7-45db-bab4-7b8fbf216058)

![Image](https://github.com/user-attachments/assets/08764377-5b06-4b2b-a678-6a43542c48b8)

Apesar de formatos de gráficos semelhantes entre os tipos de bicicletas, as bicicletas elétricas mostram uma preferência notável. Ciclistas casuais as usam 10,89% mais do que bicicletas clássicas, e membros 11,01% mais, sugerindo conforto e conveniência como fatores-chave. Esta observação é corroborada pelas formações de gráficos análogas para diferentes tipos de bicicletas, com os gráficos de bicicletas elétricas demonstrando consistentemente uma tendência ascendente, significando valores mais altos.

Uma análise final que realizei foi identificar as estações de [inicio](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20code.SQL) e [fim](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20code.SQL) mais frequentemente utilizadas entre membros e usuários casuais, usando SQL. A análise revela as três estações de início e fim mais populares, segmentadas por tipo de usuário. Observamos uma concentração significativa de atividade de membros na estação Kingsbury St & Kinzie St, enquanto usuários casuais utilizam intensamente a estação Streeter Dr & Grand Ave.

### Resultado completo:

- [Estações mais utilizada para inicio de corrida](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20result.csv)
- [Estações mais utilizada para fim de corrida](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20result.csv)

  ## 💡 Insights

  - Dada a alta concentração de passageiros casuais nas estações `Streeter Dr & Grand Ave`, `DuSable Lake Shore Dr & Monroe St` e `Millennium Park`, implementar campanhas de marketing geolocalizadas e adaptadas aos usuários casuais pode aumentar significativamente as taxas de conversão de membros.
    
  - Embora os passageiros casuais constituam apenas 27% do total de usuários, eles apresentam uma duração média de viagem maior do que os membros. Oferecer um desconto especial de teste de associação para passageiros casuais que concluem um certo número de viagens em um mês pode efetivamente gerar interesse em associações anuais.
    
  - O uso casual dos serviços Cyclistic por ciclistas atinge seu ponto mais alto nos fins de semana e sextas-feiras, especificamente das 10h às 16h. Oferecer campanhas promocionais e descontos durante esses horários pode efetivamente atrair novos membros.
