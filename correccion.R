library(openxlsx)
library(readxl)

ficheros_puntos <- list.files("entregas", pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)
ficheros_pdfs <- list.files("entregas", pattern = "\\.pdf$", full.names = TRUE, recursive = TRUE)