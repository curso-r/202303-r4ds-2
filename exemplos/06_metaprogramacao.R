tidyverse # Dá erro
library(tidyverse)

soma <- function(a, b) {
  a + b
}

seis # Dá erro
soma(3, seis) # Também dá erro!

# ----------------------------------------

summarise_mean <- function(df, col) {
  summarise(df, media = mean(col))
}

mtcars |>
  summarise(media = mean(cyl))

mtcars |>
  summarise_mean(cyl)

# Agrupando e sumarizando com mean() de uma vez
summarise_by <- function(df, by, col) {
  df |>
    group_by({{ by }}) |>
    summarise({{ col }} := mean({{ col }}))
}

mtcars |>
  summarise_by(gear, cyl)

# Usuário(a) passa todas as expressões que quiser
summarise_by2 <- function(df, by, ...) {
  df |>
    group_by({{ by }}) |>
    summarise(...)
}

mtcars |>
  summarise_by2(
    gear,
    cyl_mean = mean(cyl),
    cyl_sd = sd(cyl)
  )

# Usuário(a) passa todas as colunas para mean()
summarise_by3 <- function(df, by, ...) {
  df |>
    group_by({{ by }}) |>
    summarise(across(c(...), mean))
}

mtcars |>
  summarise_by3(gear, cyl, carb)
