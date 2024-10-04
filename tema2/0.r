# Este es el primer paso para hacer word clouds. Lo que hace es producir
# "topic.model.rds", que es un archivo con el topic model. Lo separo del resto
# para no tener que estar corriendo MALLET cada vez.

library("mallet")
library("wordcloud")
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

options(java.parameters = "-Xmx1g")  # Adjust the value as needed
topic.words.m <- mallet.topic.words(topic.model, smoothed = TRUE, normalized = TRUE)
colnames(topic.words.m) <- topic.model$getVocabulary()

# wordcloud del primer tema
t1 <- mallet.top.words(topic.model, topic.words.m[1, ], 100)
wordcloud(t1$term, t1$weight, c(4, .8), rot.per = 0, random.order = F)

for (i in 1:50) {
    top.words <- mallet.top.words(topic.model, topic.words.m[i, ], 100)
    nombre.archivo <- paste("tema2/wordclouds/", i, ".png", sep = "")
    png(nombre.archivo)
    wordcloud(top.words$term, top.words$weight, c(4, .8), rot.per = 0, random.order = F)
    dev.off()
}
