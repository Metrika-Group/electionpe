## code to prepare `DATASET` dataset goes here

library(data.table)
metadata_r1 <- readxl::read_xlsx("data-raw/Resultados_1era_vuelta_version_ONPE-2021/Diccionario_EleccionesPresidenciales_2021_1raVuelta.xlsx")
data_r1 <- data.table::fread("data-raw/Resultados_1era_vuelta_version_ONPE-2021/Resultados_1ra_vuelta_Version_PCM.csv",fill = TRUE)

metadata_r2 <- readxl::read_xlsx("data-raw/Resultados_2da_vuelta_Version_ONPE-2021/Diccionario_EleccionesPresidenciales_2021_2daVuelta_ONPE.xlsx")
data_r2 <- data.table::fread("data-raw/Resultados_2da_vuelta_version_ONPE-2021/Resultados_2da_vuelta_Version_PCM .csv",fill = TRUE)

ele2021 <- create_election(
                year = 2021, 
                type ="pre",
                metadata_r1 =  metadata_r1,
                data_r1 = data_r1,
                metadata_r2 = metadata_r2,
                data_r2 = data_r2
            )

electionpe <- ele2021

usethis::use_data(electionpe,overwrite = TRUE)

#En caso tener más eleccionar, construimos de la siguiente forma:
# elec2021 <- electionpe
# elec2022 <- electionpe
# electionpe2 <- list(elec2021,elec2022)
# usethis::use_data(electionpe,overwrite = TRUE)


