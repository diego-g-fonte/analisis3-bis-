# Aquí voy a ver cuales son las palabras más y menos frecuentes en los puntos de inflección
freqM2 <- readRDS("freqM2.rds")

# 17 VARIABLES PARA 17 AÑOS ##
# para esto sólo necesito a2011 y a2017 pero no está de más tener todas
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

# populares 2011
p2011 <- unlist(lapply(a2011, mean))

# populares 2017
p2017 <- unlist(lapply(a2017, mean))

diferencias <- sort(abs(p2017 - p2011), decreasing = TRUE)
