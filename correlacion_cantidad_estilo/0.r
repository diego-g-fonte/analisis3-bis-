# voy a intentar ver si hay una correlación entre la cantidad de textos publicados y la simiilitud del estilo

### CANTIDAD ###
raw <- readRDS("textos_con_puntuacion.rds")

años <- raw$año
t_años <- table(años)

### ESTILO ###
raw_txt <- readLines("estilo/table_with_frequencies.txt")
ids1 <- unlist(strsplit(raw_txt[1], " "))   # sacar los datos
ids2 <- gsub("\"primera_|\"segunda_", "", ids1) # borrar información innecesaria
ids <- substr(ids2, 1, nchar(ids2) - 1) # borrar información innecesaria

# obtener las frecuencias relativas
raw <- read.table("estilo/table_with_frequencies.txt")
freq1 <- raw
colnames(freq1) <- ids

freq <- freq1[1:150, ]      # sólo las 150 palabras más frecuentes
freq <- t(freq)

# dividir por año
metadatos1 <- readRDS("textos_con_puntuacion.rds")
metadatos <- data.frame(metadatos1$año, row.names = metadatos1$doc_num)

freqM1 <- merge(x = metadatos,                  # juntar los metadatos de año y doc_num con 'freq'. frequency + Metadatos
                y = freq,
                by = 0)

freqM2 <- freqM1[, 2:ncol(freqM1)]
colnames(freqM2)[1] <- "metadatosAño"
row.names(freqM2) <- freqM1[, 1]                # freqM2 tiene los doc_nums como row names y los años de publicación como la primera columna

## 17 VARIABLES PARA 17 AÑOS ##
a2006 <- freqM2[which(grepl("2006", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2007 <- freqM2[which(grepl("2007", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2008 <- freqM2[which(grepl("2008", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2009 <- freqM2[which(grepl("2009", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2010 <- freqM2[which(grepl("2010", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2011 <- freqM2[which(grepl("2011", freqM2$metadatosAño)), 2:ncol(freqM2)]
# limpiar un trabajo que no limpié bien y mueve todo
a2011 <- a2011[-grep("0674722", row.names(a2011)), ]
a2012 <- freqM2[which(grepl("2012", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2013 <- freqM2[which(grepl("2013", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2014 <- freqM2[which(grepl("2014", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2015 <- freqM2[which(grepl("2015", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2016 <- freqM2[which(grepl("2016", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2017 <- freqM2[which(grepl("2017", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2018 <- freqM2[which(grepl("2018", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2019 <- freqM2[which(grepl("2019", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2020 <- freqM2[which(grepl("2020", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2021 <- freqM2[which(grepl("2021", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2022 <- freqM2[which(grepl("2022", freqM2$metadatosAño)), 2:ncol(freqM2)]
a2023 <- freqM2[which(grepl("2023", freqM2$metadatosAño)), 2:ncol(freqM2)]

### CALCULAR DISTANCIAS ###
d06 <- dist(a2006)
d07 <- dist(a2007)
d08 <- dist(a2008)
d09 <- dist(a2009)
d10 <- dist(a2010)
d11 <- dist(a2011)
d12 <- dist(a2012)
d13 <- dist(a2013)
d14 <- dist(a2014)
d15 <- dist(a2015)
d16 <- dist(a2016)
d17 <- dist(a2017)
d18 <- dist(a2018)
d19 <- dist(a2019)
d20 <- dist(a2020)
d21 <- dist(a2021)
d22 <- dist(a2022)
d23 <- dist(a2023)

# promedios (mean)
m06 <- mean(d06)
m07 <- mean(d07)
m08 <- mean(d08)
m09 <- mean(d09)
m10 <- mean(d10)
m11 <- mean(d11)
m12 <- mean(d12)
m13 <- mean(d13)
m14 <- mean(d14)
m15 <- mean(d15)
m16 <- mean(d16)
m17 <- mean(d17)
m18 <- mean(d18)
m19 <- mean(d19)
m20 <- mean(d20)
m21 <- mean(d21)
m22 <- mean(d22)
m23 <- mean(d23)

# graficar
juntos <- c(m06, m07, m08, m09, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23)

### CORRELACIÓN ###
# estandarizar [ESTO ES INNECESARIO. COR() YA HLO HACE]
años_e <- scale(t_años)
estilo_e <- scale(juntos)

# quitar 2020
años_e2 <- años_e[c(1:14, 16:18)]
estilo_e2 <- estilo_e[c(1:14, 16:18)]

# correlación
cor_pear <- cor(años_e, estilo_e)
cor_spea <- cor(años_e, estilo_e, method = "spearman")

# correlación2
cor_pear2 <- cor(años_e2, estilo_e2)
cor_spea2 <- cor(años_e2, estilo_e2, method = "spearman")

# correlación3
t_años2 <- t_años[c(1:14, 16:18)]
juntos2 <- juntos[c(1:14, 16:18)]

cor_pear3 <- cor(t_años2, juntos2)
cor_spea3 <- cor(t_años2, juntos2, method = "spearman")

png("correlacion_cantidad_estilo/correlación.png")
plot(años_e, estilo_e)
dev.off()

png("correlacion_cantidad_estilo/correlación2.png")
plot(años_e2, estilo_e2)
dev.off()