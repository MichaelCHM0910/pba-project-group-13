# 01_get_data.R
# Download the Spotify Tracks Dataset and save a cleaned, one-row-per-track file.
# Run from the project root (open the RStudio project first).
#
# Source: "Spotify Tracks Dataset" by Maharshi Pandya, collected from the Spotify Web API.
#   Kaggle:       https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset
#   Hugging Face: https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset
# Codebook: data/codebook.md

library(tidyverse)

raw_url  <- "https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset/resolve/main/dataset.csv"
raw_path <- "data/raw/spotify_tracks.csv"

# 1. Download the raw file once (data/raw/ is git-ignored) -------------------
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
if (!file.exists(raw_path)) {
  download.file(raw_url, raw_path, mode = "wb")
}

tracks_raw <- read_csv(raw_path, show_col_types = FALSE)
nrow(tracks_raw)    # 114,000 rows: 1,000 tracks for each of 114 genres

# 2. Clean ---------------------------------------------------------------------
# The same track can be listed under several genres, so keep it once,
# under the first genre it appears with.
tracks <- tracks_raw |>
  distinct(track_id, .keep_all = TRUE) |>
  mutate(duration_min = duration_ms / 60000) |>
  select(track_id, track_name, artists, popularity, danceability, track_genre,
         energy, loudness, valence, tempo, duration_min, explicit)

nrow(tracks)        # 89,741 unique tracks

# 3. Save the cleaned file -----------------------------------------------------
write_csv(tracks, "data/spotify_tracks_clean.csv")
