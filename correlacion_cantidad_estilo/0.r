# voy a intentar ver si hay una correlación entre la cantidad de textos publicados y la simiilitud del estilo

### CANTIDAD ###
raw <- readRDS("textos_con_puntuacion.rds")

años <- raw$año
t_años <- table(años)

### ESTILO ###
estilo <- readRDS("estilo_dpa.rds")

### CORRELACIÓN ###
# estandarizar [ESTO ES INNECESARIO. COR() YA HLO HACE]
años_e <- scale(t_años)
estilo_e <- scale(estilo)

# quitar 2020
años_e2 <- años_e[c(1:14, 16:18)]
estilo_e2 <- estilo_e[c(1:14, 16:18)]

# correlación
cor_pear <- cor(años_e, estilo_e)
cor_spea <- cor(años_e, estilo_e, method = "spearman")

# correlación2
cor_pear2 <- cor(años_e2, estilo_e2)
cor_spea2 <- cor(años_e2, estilo_e2, method = "spearman")

# correlación3 (para ver si cor() normaliza o no. sí normaliza)
t_años2 <- t_años[c(1:14, 16:18)]
estilo2 <- estilo[c(1:14, 16:18)]

cor_pear3 <- cor(t_años2, estilo2)
cor_spea3 <- cor(t_años2, estilo2, method = "spearman")

# sólo de 2011 a 2017
años1117 <- t_años[6:12]
estilo1117 <- estilo[6:12]

pear1117 <- cor(años1117, estilo1117)
spea1117 <- cor(años1117, estilo1117, method = "spearman")

png("correlacion_cantidad_estilo/correlación.png")
plot(años_e, estilo_e)
dev.off()

png("correlacion_cantidad_estilo/correlación2.png")
plot(años_e2, estilo_e2)
dev.off()

a <- scale(años1117)
e <- scale(estilo1117)
png("correlacion_cantidad_estilo/correlación1117.png")
plot(a, e)
dev.off()

# 2009 -2017
pear0917 <- cor(t_años[4:12], estilo[4:12])
spea0917 <- cor(t_años[4:12], estilo[4:12], method = "spearman")