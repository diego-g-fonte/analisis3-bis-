# folders
- cantidad_publicaciones hace imágenes con las gráficas de las publicaciones anuales.
- correlacion_cantidad_estilo calcula la correlación entre la cantidad de publicaciones anuales y el estilo y además saca gráficas que visualizan esas correlaciones.
- correlacion_estilo_tema calcula las correlaciones entre cada par de los tres vectores, cantidad de publicaciones anuales, estilo y tema, y además saca gráficas que visualizan esas correlaciones.
- estilo hace las gráficas de estilo con ggplot para hacerlas más grandes.
- tema hace las gráficas de tema con ggplot para hacerlas más grandes.
- tema2 hace las wordclouds de los 50 temas que le pedí a MALLET
- tema3 creo que es un intento fallido de hacer una base de datos que tenga los IDs de los trabajos de titulación y los IDs de los temas que saca MALLET.

# archivos
- "tema_dps.rds" y "estilo_dps.rds" son las distancias promedio aunales de tema y estilo. Para no calcularlas cada vez.
- "freqM2.rds" es un data frame con las frecuencias relativas de las 150 palabras más frecuentes en cada trabajo con su id number y su año de publicación.