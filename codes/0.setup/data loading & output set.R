# Data Loading / Output Directory & Color Scheme


# 0. Clear environment
rm(list = ls())
gc()
options(
  stringsAsFactors = FALSE
)


# 1. Set output directory
# 1.1 Main output directory
OUTPUT_DIR <- "this/is/an/example/please/replace/with/your/own"

# 1.2 Create output directory if it does not exist
if (!dir.exists(OUTPUT_DIR)) {
  dir.create(
    OUTPUT_DIR,
    recursive = TRUE
  )
}

# Define subfolders for future analyses
FIGURE_DIR <- file.path(
  OUTPUT_DIR,
  "Figures"
)

TABLE_DIR <- file.path(
  OUTPUT_DIR,
  "Tables"
)

CHECKPOINT_DIR <- file.path(
  OUTPUT_DIR,
  "Checkpoints"
)
