# Output Directory / Data Loading & reading


# 0. Clear environment & Load required packages
rm(list = ls())
gc()
options(
  stringsAsFactors = FALSE
)

library(tidyverse)
library(readxl)
library(writexl)


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

# 1.3 Define subfolders for future analyses
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

# 1.4 Create subfolders
dir.create(
  FIGURE_DIR,
  recursive = TRUE,
  showWarnings = FALSE
)

dir.create(
  TABLE_DIR,
  recursive = TRUE,
  showWarnings = FALSE
)

dir.create(
  CHECKPOINT_DIR,
  recursive = TRUE,
  showWarnings = FALSE
)

# 1.5 Confirm output directories
cat("Output directory:\n", OUTPUT_DIR, "\n\n")

cat("Figure directory:\n", FIGURE_DIR, "\n\n")

cat("Table directory:\n", TABLE_DIR, "\n\n")

cat("Checkpoint directory:\n", CHECKPOINT_DIR, "\n\n")


# 2. Define raw data file paths
# take protein, mRNA, and mechanisms as example. 
# Proteomics
PROTEOMICS_FILE <- paste0(
  "this/is/an/example/", 
  "please/replace/with/your/own.xlsx"
)

# Metabolomics
METABOLOMICS_FILE <- paste0(
  "this/is/an/example/",
  "please/replace/with/your/own.xlsx"
)

# Transcriptomics - if more than one excel
TRANSCRIPTOMICS_DIR <- paste0(
  "this/is/an/example/",
  "please/replace/"
)

TRANSCRIPTOMICS_FILES <- list(
  
  cds_stat = file.path(
    TRANSCRIPTOMICS_DIR,
    "with/your/own/1.xlsx"
  ),
  
  fpkm = file.path(
    TRANSCRIPTOMICS_DIR,
    "with/your/own/2.xlsx"
  ),
  
  map_stat = file.path(
    TRANSCRIPTOMICS_DIR,
    "with/your/own/3.xlsx"
  ),
  
  readcount = file.path(
    TRANSCRIPTOMICS_DIR,
    "with/your/own/4.xlsx"
  ),
  
  reads_quality = file.path(
    TRANSCRIPTOMICS_DIR,
    "with/your/own/5.xlsx"
  )
)

# Remember to check whether all files exist
ALL_INPUT_FILES <- c(
  Proteomics = PROTEOMICS_FILE,
  Metabolomics = METABOLOMICS_FILE,
  Transcriptomics_CDS = TRANSCRIPTOMICS_FILES$cds_stat,
  Transcriptomics_FPKM = TRANSCRIPTOMICS_FILES$fpkm,
  Transcriptomics_Mapping = TRANSCRIPTOMICS_FILES$map_stat,
  Transcriptomics_Readcount = TRANSCRIPTOMICS_FILES$readcount,
  Transcriptomics_ReadsQuality = TRANSCRIPTOMICS_FILES$reads_quality
)

cat("Checking input files...\n\n")

for (i in seq_along(ALL_INPUT_FILES)) {
  
  if (file.exists(ALL_INPUT_FILES[i])) {
    
    cat(
      "FOUND: ",
      names(ALL_INPUT_FILES)[i],
      "\n",
      ALL_INPUT_FILES[i],
      "\n\n",
      sep = ""
    )
    
  } else {
    
    stop(
      paste0(
        "FILE NOT FOUND:\n",
        names(ALL_INPUT_FILES)[i],
        "\n",
        ALL_INPUT_FILES[i]
      )
    )
  }
}


# 3. Read raw data

PROTEOMICS_RAW <- read_excel(
  PROTEOMICS_FILE
)

METABOLOMICS_RAW <- read_excel(
  METABOLOMICS_FILE
)

TRANSCRIPTOMICS_RAW <- list(
  
  cds_stat = read_excel(
    TRANSCRIPTOMICS_FILES$cds_stat
  ),
  
  fpkm = read_excel(
    TRANSCRIPTOMICS_FILES$fpkm
  ),
  
  map_stat = read_excel(
    TRANSCRIPTOMICS_FILES$map_stat
  ),
  
  readcount = read_excel(
    TRANSCRIPTOMICS_FILES$readcount
  ),
  
  reads_quality = read_excel(
    TRANSCRIPTOMICS_FILES$reads_quality
  )
)


# Almost there, 
# Yian
# 26.08.15 uploaded
