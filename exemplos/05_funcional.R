
list(um = 1, dois = 2, tres = 3)
str(list(um = 1, dois = 2, tres = 3))

# Vetor nomeado
c(um = 1, dois = 2, tres = 3)

str(list(
  objeto = "abc",
  vetor = c(1, 2, 3),
  lista = list(TRUE, list("oi"))
))

l <- list(
  objeto = "abc",
  vetor = c(1, 2, 3),
  lista = list(TRUE, FALSE)
)

l[1]
# list(objeto = "abc")

l[[1]]
# "abc"

l[1]
l["objeto"]

l[2:3]
l[c("vetor", "lista")]
l[-1]

l[[1]]
l[["objeto"]]
l$objeto

l[[2]]
l[["vetor"]]
l$vetor

l[[3]]
l[["lista"]]
l$lista

l[[3]][1]
l[["lista"]][1]
l$lista[1]

l[[3]][[1]]
l[["lista"]][[1]]
l$lista[[1]]

# Em vetores, posição == elemento
l[[2]][2]
l[["vetor"]][2]
l$vetor[2]
l[[2]][[2]]
l[["vetor"]][[2]]
l$vetor[[2]]

l2 <- list(
  objeto = "abc",
  vetor = c(1, 2, 3),
  lista = list(ver = TRUE, fal = FALSE)
)
l2$lista$fal

l3 <- list(
  "abc",
  c(1, 2, 3),
  list(TRUE, FALSE)
)
l3[[3]][[2]]

library(tidyverse)

"materiais/dados/" |>
  list.files(full.names = TRUE) |>
  map(read_csv) |>
  list_rbind()

cria_coluna <- function(df) {
  mutate(df, autor = "Caio")
}
"materiais/dados/" |>
  list.files(full.names = TRUE) |>
  map(read_csv) |>
  map(cria_coluna) |>
  list_rbind()



frutas <- c("maçã", "banana", "morango")
letras <- c("A", "B", "C")
nomes <- c("Dexter", "Bacon", "Zip")

cola <- function(x) {
  x
}
map(frutas, cola)

cola2 <- function(x, y) {
  str_c(x, " ", y)
}
map2(frutas, letras, cola2)

cola3 <- function(x, y, z) {
  str_c(x, " ", y, " ", z)
}
map3(frutas, letras, nomes, cola3) # Não existe!
pmap(
  list(frutas, letras, nomes),
  cola3
)

cores <- c("vermelho", "azul", "amarelo")

cola4 <- function(x, y, z, a) {
  str_c(x, " ", y, " ", z, " ", a)
}
pmap(
  list(frutas, letras, nomes, cores),
  cola4
)

# Sempre o mesmo comprimento!
# "maçã"     "A"  "Dexter"   <- 1
# "banana"   "B"  "Bacon"    <- 2
# "morango"  "C"  "Zip"      <- 3
# "melão"                    <- 4???





cria_coluna <- function(df) {
  mutate(df, autor = "Caio")
}
\(df) mutate(df, autor = "Caio")

cola <- function(x) {
  x
}
\(x) x

cola2 <- function(x, y) {
  str_c(x, " ", y)
}
\(x, y) str_c(x, " ", y)

cola3 <- function(x, y, z) {
  str_c(x, " ", y, " ", z)
}
\(x, y, z) str_c(x, " ", y, " ", z)

cola4 <- function(x, y, z, a) {
  str_c(x, " ", y, " ", z, " ", a)
}
\(x, y, z, a) str_c(x, " ", y, " ", z, " ", a)

pmap(
  list(frutas, letras, nomes, cores),
  \(x, y, z, a) str_c(x, " ", y, " ", z, " ", a)
)

tibble(
  pg = 1:2,
  txt = c("Caio. Truzzi. Lente", "Bacon. Dexter. Zip")
) |>
  mutate(txt = str_split(txt, "\\. ?")) |>
  unnest(c(txt))
