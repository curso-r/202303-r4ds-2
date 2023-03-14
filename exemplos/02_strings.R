
"Uma string"
"Uma string com "aspas"." # erro!
'Uma string com "aspas".'
"Uma string com \"aspas\"."

# \ é top
cat("texto com 'aspas simples'")
cat('texto com "aspas duplas"')
cat("texto com 'aspas simples' e \"aspas duplas\"")

"Cachorro:\n\t- Dexter"
cat("Cachorro:\n\t- Dexter\n\t- Zip")

library(tidyverse)

str_sub("Dexter", 1, 3)
str_sub("Dexter", -3, -1)

ns <- c(1, 5, 10, 100, 500)
strings <- str_c("arquivo_", ns)

str_sort(strings)

ns2 <- str_pad(ns, 3, "left", "0")
strings2 <- str_c("arquivo_", ns2)

str_sort(strings2)

names(mtcars) <- str_to_upper(names(mtcars))
mtcars

mtcars <- mtcars |>
  rename_with(str_to_lower)

## Ver a aula!
# \" ---> "
# \t ---> tab
# \n ---> nova linha
# \\ ---> \

## Ver a aula!
# regex: .  (coringa)
# regex: \. (literal ponto-final)
# r    : \. (HÃ????)
# r    : \\. ---> \. (regex entende)

cat("\.") # erro!
cat("\\.")

# Não precisa re-escapar o \n e o \t
str_extract(
  "Cachorros:\n\t- Dexter\n\t- Zip",
  pattern = ":\n\t."
) |> cat()

# \n e \t são 1 caractere só
str_length("1\n3")

r"(Usando "aspas duplas".)"
r"{Usando "(aspas em parênteses)"}"

str_extract("strings.", "s\\.")
str_extract("strings.", r"{s\.}")

# NO R
" -> abre strings
n -> caractere n
t -> caractere t
\ -> escape

\" -> caractere "
\n -> nova linha
\t -> tab
\\ -> caractere \

# NO REGEX
b -> caractere b
. -> coringa

\b -> fronteira
\. -> caractere .

# NO R
\. -> não é nada!
\b -> não é nada!

# NO R          NO REGEX
  \\.  -> \. -> caractere .
  .    -> .  -> coringa

# CONCLUSÃO: Escapar meta-caracteres
# no regex dentro do R precisa de \\

[a-z]
[A-Z]
[A-Za-z]
[A-Za-z0-9]
[aeiou]

str_replace(
  string = "9123405678",
  pattern = "0",
  replacement = "-"
)

str_replace(
  string = "9012304567",
  pattern = "0",
  replacement = "-"
)

str_replace(
  string = "9012304567",
  pattern = "([0-9]{5})0([0-9]{4})",
  replacement = "\\1-\\2"
)

str_extract(c("a", "ab", "abb"), "ab")
str_extract(c("a", "ab", "abb", "ac", "acc"), "ab?")
str_extract(c("a", "ab", "abb", "ac", "acc"), "a.")
str_extract(c("a", "ab", "abb", "ac", "acc"), "a.?")
