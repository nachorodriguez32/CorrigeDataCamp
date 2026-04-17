library(openxlsx)
library(readxl)
library(stringr)

ficheros_puntos <- list.files("entregas", pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)
ficheros_pdfs <- list.files("entregas", pattern = "\\.pdf$", full.names = TRUE, recursive = TRUE)

evalua_df <- data.frame()

for (ruta in ficheros_puntos) {
  partes <- strsplit(ruta, "/")[[1]]
  nombre_alumno <- partes[2] 

  apellido <- strsplit(nombre_alumno, " ")[[1]][1]

  contenido <- readLines(ruta, warn = FALSE)
  puntos_valor <- as.numeric(contenido)
  
  fila <- data.frame(
    apellidos = apellido,
    puntos = puntos_valor,
    NomFile = basename(ruta),
    Puntos = contenido,
    stringsAsFactors = FALSE
  )
  evalua_df <- rbind(evalua_df, fila)
}

evalua_df <- evalua_df[order(evalua_df$apellidos), ]


alumnos_clase <- read.csv("AlumnosTD25_26.xlsx - Hoja1.csv")

AlumnosNotas <- merge(alumnos_clase, evalua_df, by.x = "Apellido.s.", by.y = "apellidos", all.x = TRUE)

write.xlsx(evalua_df, "NotasRIntermedio.xlsx")
write.xlsx(AlumnosNotas, "AlumnosNotas.xlsx")

print("Archivos generados correctamente.")