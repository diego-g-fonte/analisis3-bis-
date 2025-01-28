# es mi intento de ver cuales temas eran más populares y menos en los puntos de inflección

doc.topic.matrix <- readRDS("tema2/doc.topic.matrix.rds")
sum(doc.topic.matrix[, 50])

# como la matriz no tiene ids de los textos tengo que ver de alguna manera si
# están en el orden que tiene el folder de "textos_ids"

t_a_consultar <- 1  # trabajo a consultar
grep(sort(doc.topic.matrix[t_a_consultar, ], decreasing = TRUE)[1], doc.topic.matrix[t_a_consultar, ])
plot(doc.topic.matrix[t_a_consultar, ], type = "h")

tac2 <- 12 # tema a consultar
grep(sort(doc.topic.matrix[, tac2], decreasing = TRUE)[1], doc.topic.matrix[, tac2])

textos_limpios <- readRDS("textos_limpios.rds")
id <- textos_limpios[, 1]   # id
