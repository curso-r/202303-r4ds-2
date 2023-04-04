
is.numeric("abc")
is.character("abc")
is.na("abc")
is.na(123)
is.na(NA)

# Pode ser útil!
TRUE == 1
FALSE == 0

vetor <- c(1, 2, 3, 4, NA, 5, 6, NA, 7, NA)
sum(is.na(vetor)) # Contagem de TRUEs (ou seja, NAs)

TRUE & FALSE # FALSE

x <- 6
x > 5 & x < 20 # TRUE

x <- 4
x > 5 & x < 20 # FALSE

x <- 21
x > 5 & x < 20 # FALSE

# OU lógico (|): pessoas podem ser legais ou bonitas
# XOU lógico (xor): pessoas podem ser altas ou baixas

x <- c(1, 5, 10, 15)
x > 7

x <- 10
(x > 5) & (x < 20)

((1 + 1) * (2 + 2)) / (3 + 3)
(   2    * (2 + 2)) / (3 + 3)
(   2    *    4   ) / (3 + 3)
         8          / (3 + 3)
         8          /    6
                 1.33333

x <- 10
((x > 5) & (x < 20)) | (x < 0)
(  TRUE  & (x < 20)) | (x < 0)
(  TRUE  &   TRUE  ) | (x < 0)
        TRUE         | (x < 0)
        TRUE         |  FALSE
                   TRUE

x <- 10
if (is.numeric(x)) {
  x * 2
} else {
  print("ERRO! X não é numérico!")
}

# Loop infinito! Cuidado
x <- -1
while (x < 50) {
  x <- x * 2
}
x

vetor <- 1:3 # c(1, 2, 3)

i <- 1
while (i <= length(vetor)) {
  print(vetor[i])
  i <- i + 1
}

for (i in vetor) {
  print(i)
}


library(stringr)

nomes <- c("caio", "letícia", "eduardo", "vitor")
for (nome in nomes) {
  if (str_length(nome) > 6) {
    print("Nome comprido")
  } else {
    print("Nome curto")
  }
}

for (i in seq_along(nomes)) {
  nome <- nomes[i]

  if (str_length(nome) > 6) {
    print("Nome comprido")
  } else {
    print("Nome curto")
  }
}

# Quando faz sentido usar índices no for
vetor <- c(1, 5, 10, 15, 20, 25)
for (i in seq_along(vetor)) {
  if (vetor[i] > 15) {
    vetor[i] <- vetor[i] / 2
  }
}
vetor





x <- 1
imprime <- function(x) {
  y <- x
  print(y)
}

imprime(2) # Mascara o x de fora
y # Não existe

f <- function(x, y) {
  y <- x * 2
  x <- y * 3
  10
}
f(2, 3)

soma_com_inicio_e_fim <- function(ini, ..., fim) {
  print(ini)
  resultado <- sum(...)
  print(fim)
  resultado
}
soma_com_inicio_e_fim(
  "Começando!",
  1,
  2,
  3,
  1:6,
  c(-1, 0, -10),
  fim = "Terminei!"
)

# EXTRA: afetando o escopo externo

faz2coisas <- function(x, y) {
  list(
    salvar = x + y,
    retornar = x * y
  )
}
saida <- faz2coisas(4, 5)
SALVO <- saida$salvar
saida$retornar

faz2coisas <- function(x, y) {
  # Supondo que isso afete o escopo externo
  SALVO <- x + y
  x * y
}
SALVO <- 30
faz2coisas(4, 5) # SALVO vira 9 ou 30?
