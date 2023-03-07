library(tidyverse)

# Queremos pivotar em "duas etapas"
musicas <- tibble::tribble(
  ~musica, ~pos_sem1, ~pos_sem2, ~num_sem1, ~num_sem2,
  "A"    ,  50      ,  60      ,  10      , 8        ,
  "B"    ,  20      ,  30      ,  50      , 40
)

# Legal!
musicas |>
  pivot_longer(
    cols = -musica,
    names_to = c(".value", "semana"),
    names_pattern = "(pos|num)_sem([0-9])"
  )

# Isso aqui cria repetições
musicas |>
  pivot_longer(
    cols = starts_with("pos"),
    names_to = "semana",
    values_to = "posicao"
  ) |>
  pivot_longer(
    cols = starts_with("num"),
    names_to = "semana2",
    values_to = "numero"
  )

# Selecionando com vírgula
alunos |>
  select(2, 3, 4, 5, ...)

# Aqui precisamos do c() para não confundir os args
alunos |>
  mutate(across(
    # Nota1:Nota9
    # -Aluno
    # starts_with("Nota")
    c(2, 3, 4, 5, ...)
  ))

media_limpa <- function(x) {
  mean(x, na.rm = TRUE)
}
starwars |>
  select(where(is.numeric)) |>
  lapply(media_limpa) |>
  as_tibble()

starwars |>
  summarise(
    across()...
    across(where(is.numeric), media_limpa)
  )
