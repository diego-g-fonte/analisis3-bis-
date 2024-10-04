# Aquí voy a contar la cantidad de trabajos que tengo por año

raw <- readRDS("textos_con_puntuacion.rds")

años <- raw$año
t_años <- table(años)

png("cantidad_publicaciones/cantidad_publicaciones.png")
plot(t_años, type = "l", main = "publicaciones anuales")
abline(v = 2011)
abline(v = 2017)
dev.off()

png("cantidad_publicaciones/cantidad_publicaciones_smooth.png")
scatter.smooth(t_años, type = "l", main = "publicaciones anuales", col = "#ADADAD", ylim = c(0, 37))
abline(v = 6)
abline(v = 12)
dev.off()