# Grafica las longitudes promedio anuales, las desviaciones tipicas anuales y
# la cantidad de trabajos anuales.

library(jsonlite)
library(ggplot2)
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

# [el 2023 no está en los metadatos que extraje pero
# puedo contar manualmente. hay 31]
trabajos_anuales[59, ] <- c(2023, 31)

png("cantidad_publicaciones/cantidad_publicaciones_todo.png", width = 1000, height = 600)
ggplot(trabajos_anuales, aes(x = fecha, y = cantidad)) +
    geom_bar(stat = "identity", color = NA) + 
    scale_x_continuous(breaks = seq(1962, 2023, by = 5)) +  # Set ticks every 1 unit
    scale_y_continuous(breaks = seq(0, 35, by = 5)) +  # Set ticks every 1 unit
    theme(
        plot.title = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),  # Make x-axis tick labels bigger
        axis.text.y = element_text(size = 20),
        axis.title.x = element_text(size = 20),  # Make x-axis label bigger
        axis.title.y = element_text(size = 20),
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(color = "gray", size = 0.5),  # Horizontal grid lines
    ) +
    labs(title = "trabajos publicados anualmente", x = "año", y = "cantidad")
dev.off()

# graficar del 2006 al 2023 
ta_2006_2023 <- trabajos_anuales[42:59, ]

png("cantidad_publicaciones/cantidad_publicaciones_2006_2023.png", width = 1000, height = 600)
ggplot(ta_2006_2023, aes(x = fecha, y = cantidad)) +
    geom_bar(stat = "identity", color = NA) + 
    scale_x_continuous(breaks = seq(2006, 2023, by = 1)) +  # Set ticks every 1 unit
    scale_y_continuous(breaks = seq(0, 35, by = 5)) +  # Set ticks every 1 unit
    theme(
        plot.title = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 15),  # Make x-axis tick labels bigger
        axis.text.y = element_text(size = 15),
        axis.title.x = element_text(size = 16),  # Make x-axis label bigger
        axis.title.y = element_text(size = 16),
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(color = "gray", size = 0.5),  # Horizontal grid lines
    ) +
    labs(title = "trabajos publicados anualmente (2006-2023)", x = "año", y = "cantidad")
dev.off()