# Esto hace los objetos "doc.topic.matrix.rds" y "topic.words.m.rds"


library("mallet")
raw <- readRDS("textos_limpios.rds")
mallet.instances <- mallet.import(raw$doc_num,
                                  raw$texto,
                                  "tema2/stop_words.txt",
                                  TRUE)
topic.model <- MalletLDA(num.topics = 50)
topic.model$loadDocuments(mallet.instances)
topic.model$train(400)

# topic.words.m es un data frame en el que los renglones son temas y las
# columnas son palabras individuales. Las celdas tienen el peso de cada
# palabra para cada tema.
# normalized = TRUE quiere decir que los valores de cada renglón suman 1
# normalized = FALSE quiere decir que los valores de las celdas son el número
# de veces que una palabra fue asignada a un tema.
# smoothed no sé qué hace pero el Jockers lo deja true, tons lo dejo true yo

doc.topic.matrix <- mallet.doc.topics(topic.model, normalized = TRUE, smoothed = TRUE)
saveRDS(doc.topic.matrix, file = "tema2/doc.topic.matrix.rds")

topic.words.m <- mallet.topic.words(topic.model, smoothed = TRUE, normalized = TRUE)
colnames(topic.words.m) <- topic.model$getVocabulary()
saveRDS(topic.words.m, file = "tema2/topic.words.m.rds")
