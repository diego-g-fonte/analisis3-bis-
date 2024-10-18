# Grafica las longitudes promedio anuales, las desviaciones tipicas anuales y
# la cantidad de trabajos anuales.

library(jsonlite)
data <- fromJSON("metadatos.json")
data$date <- as.numeric(data$date)

# Extraer solo los titulos y años
titulos_fechas <- l_titulos_fechas <- data[, 2:3]
titulos_fechas <- l_titulos_fechas <- data[, 2:3]

# Cantidad de trabajos publicados por año
trabajos_anuales <- aggregate(l_titulos_fechas$date,
    by = list(date = l_titulos_fechas$date), length)

# quitar el 2023
trabajos_anuales <- trabajos_anuales[1 : (nrow(trabajos_anuales) - 1), ]

trabajos_anuales <- data.frame(     # cambiar los nombers de las columnas
    fecha = trabajos_anuales$date,
    cantidad = trabajos_anuales$x
)

png("cantidad_publicaciones/cantidad_publicaciones_todo.png")
plot(trabajos_anuales, type = "h")
dev.off()