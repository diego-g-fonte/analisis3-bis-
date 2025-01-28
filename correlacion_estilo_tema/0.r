# voy a intentar ver si hay una correlación entre la cantidad de textos publicados y la simiilitud del estilo

### CANTIDAD ###
raw <- readRDS("textos_con_puntuacion.rds")

años <- raw$año
t_años <- table(años)

# tema
tema <- readRDS("tema_dpa.rds")

# estilo
estilo <- readRDS("estilo_dpa.rds")

# cor estilo años
png("correlacion_estilo_tema/cor_años_tema.png")
plot(tema, t_años)
dev.off()

cor(tema, t_años,)
cor(tema, t_años, method = "spearman")

# cor estilo tema
png("correlacion_estilo_tema/cor_estilo_tema.png")
plot(tema, estilo)
dev.off()

cor(tema, estilo)
cor(tema, estilo, method = "spearman")

# estilo tema 2011-2017
cor(tema[6:12], estilo[6:12])
cor(tema[6:12], estilo[6:12], method = "spearman")

png("correlacion_estilo_tema/cor_estilo_tema1117.png")
plot(tema[6:12], estilo[6:12])
dev.off()

# tema publicaciones anuales 2011-2017
png("correlacion_estilo_tema/cor_años_tema117.png")
plot(tema[6:12], t_años[6:12])
dev.off()

cor(tema[6:12], t_años[6:12])
cor(tema[6:12], t_años[6:12], method = "spearman")
