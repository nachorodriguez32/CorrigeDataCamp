library(openxlsx)
library(readxl)
library(stringr)

ficheros_puntos <- list.files("entregas", pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)
ficheros_pdfs <- list.files("entregas", pattern = "\\.pdf$", full.names = TRUE, recursive = TRUE)

evalua_df <- data.frame()

for (ruta in ficheros_puntos) {
  partes <- strsplit(ruta, "/")[[1]]
  nombre_alumno <- partes[2] 
}
  apellido <- strsplit(nombre_alumno, " ")[[1]][1]

