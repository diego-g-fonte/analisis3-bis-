# Aquí voy a ver cuales son las palabras más y menos frecuentes en los puntos de inflección

### HACER EL DATA FRAME DE FRECUENCIA RELATIVA X TRABAJO ###

# obtener los ids de los trabajos
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

# Sacar las más y menos frecuentes
t2011 <- lapply(a2011[, 1:150], mean)
