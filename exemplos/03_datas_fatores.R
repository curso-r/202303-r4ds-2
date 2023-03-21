library(tidyverse)

### DATAS ----------------------------

# Separadores não importam
dmy("20/03/2023")
dmy("20.03.2023")
ymd("2023/03/20")
ymd("2023-03-20")

# Atenção!
ymd("69-02-03") # 1969
ymd("68-02-03") # 2068

"arq_versao_20-03-2023"
"arq_versao_21-03-2022" # < na frente (alfabetico)

"arq_versao_2022-03-21" # < atrás (alfabetico iso)
"arq_versao_2023-03-20"

# O último dia da semana é sábado!
wday("2001-02-03", label = TRUE, locale = "pt_BR")

# Último dia do mês
rollforward(as_date("2001-02-03"))

# Primeiro dia do mês seguinte
rollforward(as_date("2001-02-03"), roll_to_first = TRUE)

# Extrair uma diferença em dias
dif <- dmy("01/02/2003") - dmy("03/02/2001")
as.numeric(dif)
as.period(dif) / days(1)

OlsonNames()

### FATORES ----------------------------

fct(c("G", "M", "M", "G", "P", "PP"), levels = c("PP", "P", "M", "G", "GG"))

# Igual a fct_c()!
c(
  fct(c("A", "B", "C")),
  fct(c("D", "E"))
)

# install.packages(dados)
library(dados)

casas |>
  count(geral_qualidade)

# entrada |> funcao(...)
# funcao(entrada, ...)

?fct_lump

fct_recode(
  fator,
  "Uni" = "South & West of Iowa State University",
  "DOT" = "Iowa DOT and Rail Road",
  "DOT" = "South Iowa DOT and Rail Road"
)
