### TENGO QUE REHACER ESTO PORQUE LO CORRÍ DOS VECES SIN QUERER Y ESO FUE UN ERROR

# esto va a reescribir los textos_ids para que tengan el año de publicación antes: "06_0603306.txt"


setwd("/data/Documents/UNAM/titulacion/codigo/analisis3/")
textos_limpios <- readRDS("textos_limpios.rds")
id_a <- textos_limpios[, c(1, 4)]   # id_año
id_a_n <- id_a
id_a_n$numero <- c(1:492)

setwd("/data/Documents/UNAM/titulacion/codigo/analisis3/tema3/textos_a_id")
# List all .txt files in the directory
files1 <- list.files(pattern = "\\.txt$")
files <- substr(files1, 1, 7)

# Loop through each file and rename it
for (i in seq_along(files)) {
  año <- id_a[grep(files[i], id_a[, 1]), 2]
  
  # Construct the new file name
  new_name <- paste0(año, "_", files[i], ".txt")
  
  # Rename the file
  file.rename(files1[i], new_name)
}
