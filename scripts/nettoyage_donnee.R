if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr, dplyr, magrittr)

data <- read_csv("prevision_cardiaque.csv")

data_clean <- data %>%
  drop_na()

data_clean <- data_clean %>%
  filter(
    Age <= 100,
    `Blood Pressure` >= 50, `Blood Pressure` <= 250,
    `Cholesterol Level` <= 500,
    BMI >= 10, BMI <= 70
  )

write_csv(data_clean, "prevision_cardiaque_nettoye.csv")
