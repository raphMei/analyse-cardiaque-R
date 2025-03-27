# scripts/nettoyage_donnees.R

# Chargement des bibliothèques nécessaires
if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr, dplyr, magrittr)

# 📁 Lire les données brutes
data <- read_csv("prevision_cardiaque.csv")

# 🧼 Nettoyage :
# 1. Supprimer les lignes avec au moins une valeur manquante
data_clean <- data %>%
  drop_na()

# 2. Supprimer les lignes incohérentes (valeurs extrêmes)
data_clean <- data_clean %>%
  filter(
    Age <= 100,
    `Blood Pressure` >= 50, `Blood Pressure` <= 250,
    `Cholesterol Level` <= 500,
    BMI >= 10, BMI <= 70
  )

# 💾 Sauvegarde du jeu de données propre
write_csv(data_clean, "prevision_cardiaque_nettoye.csv")

# Message pour confirmer
cat("✅ Données nettoyées et enregistrées dans prevision_cardiaque_nettoye.csv\n")